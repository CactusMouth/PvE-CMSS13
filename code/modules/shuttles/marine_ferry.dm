//marine_ferry.dm
//by MadSnailDisease 12/29/16
//This is essentially a heavy rewrite of standard shuttle/ferry code that allows for the new backend system in shuttle_backend.dm
//Front-end this should look exactly the same, save for a minor timing difference (about 1-3 deciseconds)
//Some of this code is ported from the previous shuttle system and modified for these purposes.

/datum/shuttle/ferry/marine
	var/shuttle_tag //Unique ID for finding which landmarks to use
	var/info_tag //Identifies which coord datums to copy
	var/list/info_datums = list()
	//For now it's just one location all around, but that can be adjusted.
	var/locs_dock = list()
	var/locs_move = list()
	var/list/locs_land = list()
	//Could be a list, but I don't see a reason considering shuttles aren't bloated with variables.
	var/sound_target = 136//Where the sound will originate from. Must be a list index, usually the center bottom (engines).
	var/sound/sound_takeoff = 'sound/effects/engine_startup.ogg'//Takeoff sounds.
	var/sound/sound_landing = 'sound/effects/engine_landing.ogg'//Landing sounds.
	var/sound/sound_moving //Movement sounds, usually not applicable.
	var/sound/sound_misc //Anything else, like escape pods.
	var/list/obj/structure/dropship_equipment/equipments = list()

	//Automated transport
/// Can the shuttle depart automatically?
	var/automated_launch = FALSE
/// How many seconds past shuttle cooldown for the shuttle to automatically depart (if possible)
	var/automated_launch_delay = DROPSHIP_MIN_AUTO_DELAY
	var/automated_launch_timer = TIMER_ID_NULL //Timer

	//Copy of about 650-700 lines down for elevators
	var/list/controls = list() //Used to announce failure
	var/list/main_doors = list() //Used to check failure
	var/fail_flavortext = "Could not launch the dropship due to blockage in the rear door."

	// The ship section of the almayer that the dropship is aiming to crash into. Random if null
	var/crash_target_section = null
	// Used during the jump crash to announce if the AA system threw the dropship off course
	var/true_crash_target_section = null


//Full documentation 650-700 lines down by the copy for elevators
/datum/shuttle/ferry/marine/preflight_checks()

	if(!LAZYLEN(locs_land))
		return TRUE

	if(!length(main_doors) && !length(controls))
		var/turf/T_src = pick(locs_dock)
		var/list/turfs = get_shuttle_turfs(T_src, info_datums)
		for(var/turf/T in turfs)
			for(var/obj/structure/machinery/M in T)
				if(istype(M, /obj/structure/machinery/computer/shuttle_control))
					controls += M
				else if(istype(M, /obj/structure/machinery/door/airlock/multi_tile/almayer/dropshiprear))
					main_doors += M

	for(var/obj/structure/machinery/door/airlock/multi_tile/almayer/dropshiprear/D in main_doors)
		for(var/obj/vehicle/multitile/M in D.loc)
			if(M) return 0

		for(var/turf/T in D.locs)
			for(var/obj/vehicle/multitile/M in T)
				if(M) return 0

		//No return 1 here in case future elevators have multiple multi_tile doors

	return 1


/datum/shuttle/ferry/marine/announce_preflight_failure()
	for(var/obj/structure/machinery/computer/shuttle_control/control in controls)
		playsound(control, 'sound/effects/adminhelp-error.ogg', 20) //Arbitrary notification sound
		control.visible_message(SPAN_WARNING(fail_flavortext))
		return //Kill it so as not to repeat

/datum/shuttle/ferry/marine/proc/set_automated_launch(bool_v)
	automated_launch = bool_v
	if(bool_v)
		if(recharging <= 0 && process_state == IDLE_STATE)
			prepare_automated_launch()
		//Else, the next automated launch will be prepared once the shuttle is ready
	else
		if(automated_launch_timer != TIMER_ID_NULL)
			deltimer(automated_launch_timer)
			automated_launch_timer = TIMER_ID_NULL

/datum/shuttle/ferry/marine/proc/prepare_automated_launch()
	ai_silent_announcement("The [name] will automatically depart in [automated_launch_delay * 0.1] seconds")
	automated_launch_timer = addtimer(CALLBACK(src, PROC_REF(automated_launch)), automated_launch_delay, TIMER_UNIQUE | TIMER_OVERRIDE | TIMER_STOPPABLE)

/datum/shuttle/ferry/marine/proc/automated_launch()
	if(!queen_locked)
		launch()
	else
		automated_launch = FALSE
	automated_launch_timer = TIMER_ID_NULL
	ai_silent_announcement("Dropship '[name]' departing.")
	log_ares_flight("Automated", "Dropship [name] launched on an automatic flight.")


/*
	Please ensure that long_jump() and short_jump() are only called from here. This applies to subtypes as well.
	Doing so will ensure that multiple jumps cannot be initiated in parallel.
*/

/datum/shuttle/ferry/marine/process()

	switch(process_state)
		if (WAIT_LAUNCH)
			if(!preflight_checks())
				announce_preflight_failure()
				if(automated_launch)
					ai_silent_announcement("Automated launch of [name] failed. New launch in [DROPSHIP_AUTO_RETRY_COOLDOWN] SECONDS.")
					automated_launch_timer = addtimer(CALLBACK(src, PROC_REF(automated_launch)), automated_launch_delay)

				process_state = IDLE_STATE
				in_use = null
				locked = 0
				return .
			if (skip_docking_checks() || docking_controller.can_launch())
				if (move_time) long_jump()
				else short_jump()

				process_state = WAIT_ARRIVE

		if (FORCE_LAUNCH)
			if (move_time) long_jump()
			else short_jump()

			process_state = WAIT_ARRIVE

		if (WAIT_ARRIVE)
			if (moving_status == SHUTTLE_IDLE)
				dock()
				in_use = null //release lock
				process_state = WAIT_FINISH

		if (WAIT_FINISH)
			if (skip_docking_checks() || docking_controller.docked() || world.time > last_dock_attempt_time + DOCK_ATTEMPT_TIMEOUT)
				process_state = IDLE_STATE
				arrived()

/datum/shuttle/ferry/marine/long_jump(area/departing, area/destination, area/interim, travel_time, direction)
	set waitfor = 0

	if(moving_status != SHUTTLE_IDLE) return

	moving_status = SHUTTLE_WARMUP
	if(transit_optimized)
		recharging = floor(recharge_time * SHUTTLE_OPTIMIZE_FACTOR_RECHARGE) //Optimized flight plan means less recharge time
	else
		recharging = recharge_time //Prevent the shuttle from moving again until it finishes recharging

	for(var/obj/structure/dropship_equipment/fuel/cooling_system/CS in equipments)
		recharging = floor(recharging * SHUTTLE_COOLING_FACTOR_RECHARGE) //cooling system reduces recharge time
		break

	//START: Heavy lifting backend

	//Simple pick() process for now, but this should be changed later.
	var/turf/T_src = pick(locs_dock)
	var/src_rot = locs_dock[T_src]
	var/turf/T_int = pick(locs_move)//int stands for interim
	var/int_rot = locs_move[T_int]
	var/turf/T_trg
	var/trg_rot
	if(!length(locs_land)) // We check here as well to make sure that the order of operations/lag/changing it after launch. Wont mess this up.
		transit_gun_mission = 1

	if(transit_gun_mission)//gun mission makes you land back where you started.
		T_trg = T_src
		trg_rot = src_rot
	else
		T_trg = pick(locs_land)
		trg_rot = locs_land[T_trg]
	if(!istype(T_src) || !istype(T_int) || !istype(T_trg))
		message_admins(SPAN_WARNING("Error with shuttles: Reference turfs not correctly instantiated. Code: MSD02.\n <font size=10>WARNING: DROPSHIP LAUNCH WILL FAIL</font>"))

	//Switch the landmarks, to swap docking and landing locs, so we can move back and forth.
	if(!transit_gun_mission) //gun mission makes you land back where you started. no need to swap dock and land turfs.
		locs_dock -= T_src
		locs_land -= T_trg
		locs_dock |= T_trg
		locs_land |= T_src

	//END: Heavy lifting backend

	if (moving_status != SHUTTLE_WARMUP)
		recharging = 0
		return //someone cancelled the launch

	if(transit_gun_mission)
		travel_time = move_time * 1.5 //fire missions not made shorter by optimization.
		for(var/X in equipments)
			var/obj/structure/dropship_equipment/E = X
			if(istype(E, /obj/structure/dropship_equipment/fuel/fuel_enhancer))
				travel_time  = floor(travel_time / SHUTTLE_FUEL_ENHANCE_FACTOR_TRAVEL) //fuel enhancer increases travel time
				break
	else
		if(transit_optimized)
			travel_time = move_time * SHUTTLE_OPTIMIZE_FACTOR_TRAVEL
		else
			travel_time = move_time

		for(var/X in equipments)
			var/obj/structure/dropship_equipment/E = X
			if(istype(E, /obj/structure/dropship_equipment/fuel/fuel_enhancer))
				travel_time  = floor(travel_time * SHUTTLE_FUEL_ENHANCE_FACTOR_TRAVEL) //fuel enhancer reduces travel time
				break

	//START: Heavy lifting backend

	var/list/turfs_src = get_shuttle_turfs(T_src, info_datums) //Which turfs are we moving?

	playsound(turfs_src[sound_target], sound_takeoff, 100, 0)

	sleep(warmup_time) //Warming up

	if(!queen_locked)
		for(var/turf/T in turfs_src)
			var/mob/living/carbon/xenomorph/X = locate(/mob/living/carbon/xenomorph) in T
			if(X && X.stat != DEAD)
				var/name = "Unidentified Lifesigns"
				var/input = "Unidentified lifesigns detected onboard. Recommendation: lockdown of exterior access ports, including ducting and ventilation."
				shipwide_ai_announcement(input, name, 'sound/AI/unidentified_lifesigns.ogg', ares_logging = ARES_LOG_SECURITY)
				set_security_level(SEC_LEVEL_RED)
				break

	moving_status = SHUTTLE_INTRANSIT

	for(var/X in equipments)
		var/obj/structure/dropship_equipment/E = X
		E.on_launch()

	close_doors(turfs_src) //Close the doors

	target_turf = T_int
	target_rotation = int_rot
	shuttle_turfs = turfs_src

	// Hand the move off to the shuttle_controller
	move_scheduled = 1

	// Wait for move to be completed
	while (move_scheduled)
		sleep(10)

	var/list/turfs_int = get_shuttle_turfs(T_int, info_datums) //Interim turfs
	var/list/turfs_trg = get_shuttle_turfs(T_trg, info_datums) //Final destination turfs <insert bad jokey reference here>

	close_doors(turfs_int) // adding this for safety.

	if(!(MODE_HAS_TOGGLEABLE_FLAG(MODE_DISABLE_INTRO_BLURB)))
		if(SSticker?.mode && !(SSticker.mode.flags_round_type & MODE_DS_LANDED)) //Launching on first drop.
			SSticker.mode.ds_first_drop()

	in_transit_time_left = travel_time
	while(in_transit_time_left>0)
		in_transit_time_left-=10
		sleep(10)

	in_transit_time_left = 0

	playsound_area(get_area(turfs_int[sound_target]), sound_landing, 100)
	playsound(turfs_trg[sound_target], sound_landing, 100)
	playsound_area(get_area(turfs_int[sound_target]), channel = SOUND_CHANNEL_AMBIENCE, status = SOUND_UPDATE)
	sleep(100) //Wait for it to finish.

	target_turf = T_trg
	target_rotation = trg_rot
	shuttle_turfs = turfs_int

	// Hand the move off to the shuttle_controller
	move_scheduled = 1

	// Wait for move to be completed
	while (move_scheduled)
		sleep(10)

	//Now that we've landed, assuming some rotation including 0, we need to make sure it doesn't fuck up when we go back
	locs_move[T_int] = -1*trg_rot
	if(!transit_gun_mission)
		locs_dock[T_trg] = src_rot
		locs_land[T_src] = trg_rot

	//We have to get these again so we can close the doors
	//We didn't need to do it before since they hadn't moved yet
	turfs_trg = get_shuttle_turfs(T_trg, info_datums)

	open_doors(turfs_trg) //And now open the doors

	//END: Heavy lifting backend

	if(SSticker?.mode && !(SSticker.mode.flags_round_type & MODE_DS_LANDED))
		if(!(MODE_HAS_TOGGLEABLE_FLAG(MODE_DISABLE_INTRO_BLURB)))
			SSticker.mode.ds_first_landed(src)
			SSticker.mode.flags_round_type |= MODE_DS_LANDED

	for(var/X in equipments)
		var/obj/structure/dropship_equipment/E = X
		E.on_arrival()

	moving_status = SHUTTLE_IDLE

	if(!transit_gun_mission) //we're back where we started, no location change.
		location = !location

	transit_optimized = 0 //De-optimize the flight plans

	//Simple, cheap ticker
	if(recharge_time)
		while(recharging > 0)
			recharging--
			sleep(1)

	//If the shuttle is set for automated departure, prepare for it
	if(automated_launch)
		prepare_automated_launch()

//Starts out exactly the same as long_jump()
//Differs in the target selection and later things enough to merit it's own proc
//The backend for landmarks should be in it's own proc, but I use too many vars resulting from the backend to save much space
/datum/shuttle/ferry/marine/proc/long_jump_crash()
	set waitfor = 0

	if(moving_status != SHUTTLE_IDLE) return
	moving_status = SHUTTLE_WARMUP
	if(transit_optimized)
		recharging = floor(recharge_time * SHUTTLE_OPTIMIZE_FACTOR_RECHARGE) //Optimized flight plan means less recharge time
	else
		recharging = recharge_time //Prevent the shuttle from moving again until it finishes recharging

	//START: Heavy lifting backend
	var/turf/T_src = pick(locs_dock)
	var/src_rot = locs_dock[T_src]
	var/turf/T_int = pick(locs_move)//int stands for interim


	var/target_section = crash_target_section
	if(isnull(target_section))
		var/list/potential_crash_sections = GLOB.almayer_ship_sections.Copy()
		potential_crash_sections -= GLOB.almayer_aa_cannon.protecting_section
		target_section = pick(potential_crash_sections)

	var/turf/T_trg = pick(SSoldshuttle.shuttle_controller.locs_crash[target_section])

	for(var/X in equipments)
		var/obj/structure/dropship_equipment/E = X
		if(istype(E, /obj/structure/dropship_equipment/adv_comp/docking))
			var/list/crash_turfs = list()
			for(var/turf/TU in SSoldshuttle.shuttle_controller.locs_crash[target_section])
				if(istype(get_area(TU), /area/almayer/hallways/hangar))
					crash_turfs += TU
			if(length(crash_turfs)) T_trg = pick(crash_turfs)
			else message_admins("no crash turf found in Almayer Hangar, contact coders.")
			break

	if(!istype(T_src) || !istype(T_int) || !istype(T_trg))
		message_admins(SPAN_WARNING("Error with shuttles: Reference turfs not correctly instantiated. Code: MSD04.\n WARNING: DROPSHIP LAUNCH WILL FAIL"))

	SSoldshuttle.shuttle_controller.locs_crash[target_section] -= T_trg

	//END: Heavy lifting backend

	if (moving_status == SHUTTLE_IDLE)
		recharging = 0
		return //someone canceled the launch

	var/travel_time = 0
	travel_time = DROPSHIP_CRASH_TRANSIT_DURATION

	//START: Heavy lifting backend

	var/list/turfs_src = get_shuttle_turfs(T_src, info_datums) //Which turfs are we moving?
	playsound(turfs_src[sound_target], sound_takeoff, 100, 0)

	sleep(warmup_time) //Warming up

	moving_status = SHUTTLE_INTRANSIT

	for(var/X in equipments)
		var/obj/structure/dropship_equipment/E = X
		E.on_launch()

	close_doors(turfs_src) //Close the doors

	target_turf = T_int
	target_rotation = 0
	shuttle_turfs = turfs_src

	// Hand the move off to the shuttle_controller
	move_scheduled = 1

	// Wait for move to be completed
	while (move_scheduled)
		sleep(10)

	var/list/turfs_int = get_shuttle_turfs(T_int, info_datums) //Interim turfs

	close_doors(turfs_int) // adding this for safety.

	in_transit_time_left = travel_time
	while(in_transit_time_left > 0)
		// At halftime, we announce whether or not the AA forced the dropship to divert
		// The rounding is because transit time is decreased by 10 each loop. Travel time, however, might not be a multiple of 10
		if(in_transit_time_left == round(travel_time / 2, 10) && true_crash_target_section != crash_target_section)
			marine_announcement("A hostile aircraft on course for the [true_crash_target_section] has been successfully deterred.", "IX-50 MGAD System", logging = ARES_LOG_SECURITY)

			var/area/shuttle_area
			for(var/turf/T in turfs_int)
				if(!shuttle_area)
					shuttle_area = get_area(T)

				for(var/mob/M in T)
					to_chat(M, SPAN_DANGER("The ship jostles violently as explosions rock the ship!"))
					to_chat(M, SPAN_DANGER("You feel the ship turning sharply as it adjusts its course!"))
					shake_camera(M, 60, 2)

			playsound_area(shuttle_area, 'sound/effects/antiair_explosions.ogg')

		in_transit_time_left -= 10
		sleep(10)

	in_transit_time_left = 0

	//This is where things change and shit gets real

	marine_announcement("DROPSHIP ON COLLISION COURSE. CRASH IMMINENT." , "EMERGENCY", 'sound/AI/dropship_emergency.ogg', logging = ARES_LOG_SECURITY)

	for(var/mob/dead/observer/observer as anything in GLOB.observer_list)
		to_chat(observer, SPAN_DEADSAY(FONT_SIZE_LARGE("The dropship is about to impact [get_area_name(T_trg)]" + " [OBSERVER_JMP(observer, T_trg)]")))

	playsound_area(get_area(turfs_int[sound_target]), sound_landing, 100)
	playsound_area(get_area(turfs_int[sound_target]), channel = SOUND_CHANNEL_AMBIENCE, status = SOUND_UPDATE)

	sleep(85)

	if(GLOB.security_level < SEC_LEVEL_RED) //automatically set security level to red.
		set_security_level(SEC_LEVEL_RED, TRUE)

	shake_cameras(turfs_int) //shake for 1.5 seconds before crash, 0.5 after

	for(var/obj/structure/machinery/power/apc/A in GLOB.machines) //break APCs
		if(A.z != T_trg.z) continue
		if(prob(A.crash_break_probability))
			A.overload_lighting()
			A.set_broken()

	var/turf/sploded
	var/explonum = rand(10,15)
	for(var/j=0; j<explonum; j++)
		sploded = locate(T_trg.x + rand(-5, 15), T_trg.y + rand(-5, 25), T_trg.z)
		//Fucking. Kaboom.
		cell_explosion(sploded, 250, 10, EXPLOSION_FALLOFF_SHAPE_LINEAR, null, create_cause_data("dropship crash")) //Clears out walls
		sleep(3)

	// Break the ultra-reinforced windows.
	// Break the briefing windows.

	SEND_GLOBAL_SIGNAL(COMSIG_GLOB_HIJACK_IMPACTED)

	// Sleep while the explosions do their job
	var/explosion_alive = TRUE
	while(explosion_alive)
		explosion_alive = FALSE
		for(var/datum/automata_cell/explosion/E in GLOB.cellauto_cells)
			if(E.explosion_cause_data && E.explosion_cause_data.cause_name == "dropship crash")
				explosion_alive = TRUE
				break
		sleep(1)

	for(var/mob/living/carbon/affected_mob in (GLOB.alive_human_list + GLOB.living_xeno_list))
		if(affected_mob.z != T_trg.z)
			continue
		if(affected_mob.buckled)
			to_chat(affected_mob, SPAN_WARNING("You are jolted against [affected_mob.buckled]!"))
			shake_camera(affected_mob, 3, 1)
		else
			to_chat(affected_mob, SPAN_WARNING("The floor jolts under your feet!"))
			shake_camera(affected_mob, 10, 1)
			affected_mob.apply_effect(3, WEAKEN)

	addtimer(CALLBACK(src, PROC_REF(disable_latejoin)), 3 MINUTES) // latejoin cryorines have 3 minutes to get the hell out

	var/list/turfs_trg = get_shuttle_turfs(T_trg, info_datums) //Final destination turfs <insert bad jokey reference here>

	target_turf = T_trg
	target_rotation = src_rot
	shuttle_turfs = turfs_int

	// Hand the move off to the shuttle_controller
	move_scheduled = 1

	// Wait for move to be completed
	while (move_scheduled)
		sleep(10)

	//We have to get these again so we can close the doors
	//We didn't need to do it before since the hadn't moved yet
	turfs_trg = get_shuttle_turfs(T_trg, info_datums)

	for(var/X in equipments)
		var/obj/structure/dropship_equipment/E = X
		E.on_arrival()

	open_doors_crashed(turfs_trg) //And now open the doors


	for (var/obj/structure/machinery/door_display/research_cell/d in GLOB.machines)
		if(is_mainship_level(d.z) || is_reserved_level(d.z))
			d.ion_act() //Breaking xenos out of containment

	//Stolen from events.dm. WARNING: This code is old as hell
	for (var/obj/structure/machinery/power/apc/APC in GLOB.machines)
		if(is_mainship_level(APC.z) || is_reserved_level(APC.z))
			APC.ion_act()
	for (var/obj/structure/machinery/power/smes/SMES in GLOB.machines)
		if(is_mainship_level(SMES.z) || is_reserved_level(SMES.z))
			SMES.ion_act()

	//END: Heavy lifting backend

	sleep(100)
	moving_status = SHUTTLE_CRASHED

	if(SSticker.mode)
		SSticker.mode.is_in_endgame = TRUE
		SSticker.mode.force_end_at = world.time + 15000 // 25 mins
		if(istype(SSticker.mode, /datum/game_mode/colonialmarines))
			var/datum/game_mode/colonialmarines/colonial_marines = SSticker.mode
			colonial_marines.add_current_round_status_to_end_results("Hijack")

/datum/shuttle/ferry/marine/proc/disable_latejoin()
	GLOB.enter_allowed = FALSE


/datum/shuttle/ferry/marine/short_jump()

	if(moving_status != SHUTTLE_IDLE) return

	//START: Heavy lifting backend

	var/turf/T_src = pick(locs_dock)
	var/turf/T_trg = pick(locs_land)
	var/trg_rot = locs_land[T_trg]

	//Switch the landmarks so we can do this again
	if(!istype(T_src) || !istype(T_trg))
		message_admins(SPAN_WARNING("Error with shuttles: Ref turfs are null. Code: MSD15.\n WARNING: DROPSHIPS MAY NO LONGER BE OPERABLE"))
		return FALSE

	locs_dock -= T_src
	locs_land -= T_trg
	locs_dock |= T_trg
	locs_land |= T_src

	//END: Heavy lifting backend

	moving_status = SHUTTLE_WARMUP

	sleep(warmup_time)

	if (moving_status == SHUTTLE_IDLE)
		return //someone cancelled the launch

	moving_status = SHUTTLE_INTRANSIT //shouldn't matter but just to be safe

	for(var/X in equipments)
		var/obj/structure/dropship_equipment/E = X
		E.on_launch()

	var/list/turfs_src = get_shuttle_turfs(T_src, info_datums)
	move_shuttle_to(T_trg, null, turfs_src, 0, trg_rot, src)

	for(var/X in equipments)
		var/obj/structure/dropship_equipment/E = X
		E.on_arrival()

	moving_status = SHUTTLE_IDLE

	location = !location

/datum/shuttle/ferry/marine/close_doors(list/turf/L)
	for(var/turf/T in L) // For every turf
		for(var/obj/structure/machinery/door/D in T) // For every relevant door there
			if(!D.density && istype(D, /obj/structure/machinery/door/poddoor/shutters/transit))
				INVOKE_ASYNC(D, TYPE_PROC_REF(/obj/structure/machinery/door, close)) // Pod can't close if blocked
			if(iselevator && istype(D, /obj/structure/machinery/door/airlock)) // Just close. Why is this here though...?
				INVOKE_ASYNC(D, TYPE_PROC_REF(/obj/structure/machinery/door, close))
			else if(istype(D, /obj/structure/machinery/door/airlock/dropship_hatch) || istype(D, /obj/structure/machinery/door/airlock/multi_tile/almayer/dropshiprear))
				INVOKE_ASYNC(src, PROC_REF(force_close_launch), D) // The whole shabang

/datum/shuttle/ferry/marine/force_close_launch(obj/structure/machinery/door/AL)
	if(!iselevator)
		for(var/mob/living/M in AL.loc) // Bump all mobs outta the way for outside airlocks of shuttles
			to_chat(M, SPAN_HIGHDANGER("You get thrown back as the dropship doors slam shut!"))
			M.KnockDown(4)
			for(var/turf/T in orange(1, AL)) // Forcemove to a non shuttle turf
				if(!istype(T, /turf/open/shuttle) && !istype(T, /turf/closed/shuttle))
					M.forceMove(T)
					break
	return ..() // Sleeps

/datum/shuttle/ferry/marine/open_doors(list/L)
	var/i //iterator
	var/turf/T

	for(i in L)
		T = i
		if(!istype(T)) continue

		//Just so marines can't land with shutters down and turtle the rasputin
		for(var/obj/structure/machinery/door/poddoor/shutters/P in T)
			if(!istype(P)) continue
			if(P.density)
				INVOKE_ASYNC(P, TYPE_PROC_REF(/obj/structure/machinery/door, close))
				//No break since transit shutters are the same parent type

		if (iselevator)
			for(var/obj/structure/machinery/door/airlock/A in T)
				if(!istype(A)) continue
				if(A.locked)
					A.unlock()
				if(A.density)
					INVOKE_ASYNC(A, TYPE_PROC_REF(/obj/structure/machinery/door, close))
				break
		else
			for(var/obj/structure/machinery/door/airlock/dropship_hatch/M in T)
				M.unlock()

			for(var/obj/structure/machinery/door/airlock/multi_tile/almayer/dropshiprear/D in T)
				D.unlock()



/datum/shuttle/ferry/marine/proc/open_doors_crashed(list/L)

	var/i //iterator
	var/turf/T

	for(i in L)
		T = i
		if(!istype(T)) continue

		if(istype(T, /turf/closed/wall))
			var/turf/closed/wall/W = T
			if(prob(20)) W.thermitemelt()
			else if(prob(25)) W.take_damage(W.damage_cap) //It should leave a girder
			continue

		//Just so marines can't land with shutters down and turtle the rasputin
		for(var/obj/structure/machinery/door/poddoor/shutters/P in T)
			if(!istype(P)) continue
			if(P.density)
				spawn(0)
					P.open()
				//No break since transit shutters are the same parent type

		for(var/obj/structure/mineral_door/resin/R in T)
			if(istype(R))
				qdel(R) //This is all that it's dismantle() does so this is okay
				break

		for(var/obj/structure/machinery/door/airlock/dropship_hatch/M in T)
			qdel(M)

		for(var/obj/structure/machinery/door/airlock/multi_tile/almayer/dropshiprear/D in T)
			qdel(D)

/datum/shuttle/ferry/marine/proc/shake_cameras(list/L)

	var/i //iterator
	var/j
	var/turf/T
	var/mob/M

	for(i in L)
		T = i
		if(!istype(T)) continue

		for(j in T)
			M = j
			if(!istype(M)) continue
			shake_camera(M, 30, 1)

/* QUICK INHERITANCE THING FOR ELEVATORS
	NOTE: Elevators do NOT use the above system, they inherit from /datum/shuttle/ferry not /datum/shuttle/ferry/marine */

/datum/shuttle/ferry/elevator
	var/list/controls = list() //Used to announce failure
	var/list/main_doors = list() //Used to check failure
	var/fail_flavortext = "Could not move the elevator due to blockage in the main door."

/datum/shuttle/ferry/elevator/New()
	..()
	for(var/obj/structure/machinery/M in get_location_area(location))
		if(istype(M, /obj/structure/machinery/computer/shuttle_control))
			controls += M
		else if(istype(M, /obj/structure/machinery/door/airlock/multi_tile/elevator))
			main_doors += M

//Kinda messy proc, but the best solution to prevent shearing of multitile vehicles
//Alternatives include:
//1. A ticker that verifies that all multi_tile vics aren't out of wack
// -Two problems here, intersection of movement and verication would cause issues and this idea is dumb and expensive
//2. Somewhere in the shuttle_backend, every time you move a multi_tile vic hitbox or root, tell the vic to update when the move completes
// -Issues here are that this is not atomic at all and vics get left behind unless the entirety of them is on the shuttle/elevator,
// plus then part of the vic would be in space since elevators leave that behind
/datum/shuttle/ferry/elevator/preflight_checks()
	for(var/obj/structure/machinery/door/airlock/multi_tile/elevator/E in main_doors)
		//If there is part of a multitile vic in any of the turfs the door occupies, cancel
		//An argument can be made for tanks being allowed to block the door, but
		// that would make this already relatively expensive and inefficent even more so
		// --MadSnailDisease
		for(var/obj/vehicle/multitile/M in E.loc)
			if(M) return 0

		for(var/turf/T in E.locs) //For some reason elevators use different multidoor code, this should work though
			for(var/obj/vehicle/multitile/M in T)
				if(M) return 0

		//No return 1 here in case future elevators have multiple multi_tile doors

	return 1


/datum/shuttle/ferry/elevator/announce_preflight_failure()
	for(var/obj/structure/machinery/computer/shuttle_control/control in controls)
		playsound(control, 'sound/effects/adminhelp-error.ogg', 20) //Arbitrary notification sound
		control.visible_message(SPAN_WARNING(fail_flavortext))
		return //Kill it so as not to repeat
