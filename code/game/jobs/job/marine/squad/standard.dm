#define STANDARD_MARINE_TO_TOTAL_SPAWN_RATIO 0.4

#define CPL_VARIANT "Corporal"
#define LCPL_VARIANT "Lance Corporal"
#define PFC_VARIANT "Private First Class"
#define SR_PVT_VARIANT "Senior Private"
#define PVT_VARIANT "Private"

/datum/job/marine/standard
	title = JOB_SQUAD_MARINE
	total_positions = -1
	spawn_positions = -1
	flags_startup_parameters = ROLE_ADD_TO_DEFAULT|ROLE_ADD_TO_SQUAD
	gear_preset = /datum/equipment_preset/uscm/pfc
	gear_preset_secondary = /datum/equipment_preset/uscm/pfc/private
	gear_preset_tertiary = /datum/equipment_preset/uscm/pfc/lance_corporal
	job_options = list(PVT_VARIANT = "PVT", PFC_VARIANT = "PFC", LCPL_VARIANT = "LCPL")

/datum/job/marine/standard/on_config_load()
	entry_message_body = "You are a rank-and-file <a href='[CONFIG_GET(string/wikiarticleurl)]/[URL_WIKI_MARINE_QUICKSTART]'>Soldier of your standing army</a>, and that is your strength. What you lack alone, you gain standing shoulder to shoulder with the men and women of the platoon. Ooh-rah!<br><b>You remember that you've stored your personal gear and uniform are located in the dorm or locker rooms.</b>"
	return ..()

/datum/job/marine/standard/set_spawn_positions(count)
	spawn_positions = max((floor(count * STANDARD_MARINE_TO_TOTAL_SPAWN_RATIO)), 8)

/datum/job/marine/standard/handle_job_options(option)
	gear_preset = initial(gear_preset)
	if(option == PVT_VARIANT)
		gear_preset = gear_preset_secondary
	if(option == LCPL_VARIANT)
		gear_preset = gear_preset_tertiary

/datum/job/marine/standard/whiskey
	title = JOB_WO_SQUAD_MARINE
	flags_startup_parameters = ROLE_ADD_TO_SQUAD
	gear_preset = /datum/equipment_preset/wo/marine/pfc

/obj/effect/landmark/start/marine
	name = JOB_SQUAD_MARINE
	icon_state = "marine_spawn"
	job = /datum/job/marine/standard

/obj/effect/landmark/start/marine/alpha
	icon_state = "marine_spawn_alpha"
	squad = SQUAD_MARINE_1

/obj/effect/landmark/start/marine/bravo
	icon_state = "marine_spawn_bravo"
	squad = SQUAD_MARINE_2

/obj/effect/landmark/start/marine/charlie
	icon_state = "marine_spawn_charlie"
	squad = SQUAD_MARINE_3

/obj/effect/landmark/start/marine/delta
	icon_state = "marine_spawn_delta"
	squad = SQUAD_MARINE_4

/datum/job/marine/standard/ai
	total_positions = 4
	spawn_positions = 4

/datum/job/marine/standard/ai/set_spawn_positions(count)
	return spawn_positions

/datum/job/marine/standard/ai/upp
	title = JOB_SQUAD_MARINE_UPP
	gear_preset = /datum/equipment_preset/uscm/pfc/upp
	gear_preset_secondary = /datum/equipment_preset/uscm/pfc/upp/private
	job_options = list(PVT_VARIANT = "PVT", SR_PVT_VARIANT = "SrPVT")

/datum/job/marine/standard/ai/upp/handle_job_options(option)
	gear_preset = initial(gear_preset)
	if(option == PVT_VARIANT)
		gear_preset = gear_preset_secondary

/datum/job/marine/standard/ai/forecon
	title = JOB_SQUAD_MARINE_FORECON
	total_positions = 2
	spawn_positions = 2
	gear_preset = /datum/equipment_preset/uscm/pfc/forecon
	gear_preset_secondary = /datum/equipment_preset/uscm/pfc/forecon/pfc
	gear_preset_tertiary = /datum/equipment_preset/uscm/pfc/forecon/corporal
	job_options = list(PFC_VARIANT = "PFC", LCPL_VARIANT = "LCPL", CPL_VARIANT = "CPL")

/datum/job/marine/standard/ai/forecon/handle_job_options(option)
	gear_preset = initial(gear_preset)
	if(option == PFC_VARIANT)
		gear_preset = gear_preset_secondary
	if(option == CPL_VARIANT)
		gear_preset = gear_preset_tertiary

/datum/job/marine/standard/ai/rto
	total_positions = 1
	spawn_positions = 1
	title = JOB_SQUAD_RTO
	gear_preset = /datum/equipment_preset/uscm/rto
	gear_preset_secondary = /datum/equipment_preset/uscm/rto/lance_corporal
	gear_preset_quaternary = /datum/equipment_preset/uscm/rto/pfc
	job_options = list(PFC_VARIANT = "PFC", LCPL_VARIANT = "LCPL", CPL_VARIANT = "CPL")

/datum/job/marine/standard/ai/rto/handle_job_options(option)
	gear_preset = initial(gear_preset)
	if(option == PVT_VARIANT)
		gear_preset = gear_preset_tertiary
	if(option == LCPL_VARIANT)
		gear_preset = gear_preset_secondary

/obj/effect/landmark/start/marine/upp
	name = JOB_SQUAD_MARINE_UPP
	squad = SQUAD_UPP
	job = /datum/job/marine/standard/ai/upp


/datum/job/marine/standard/ai/pmc
	title = JOB_PMCPLAT_STANDARD
	gear_preset = /datum/equipment_preset/uscm/pmc
	job_options = null

/obj/effect/landmark/start/marine/pmc
	name = JOB_PMCPLAT_STANDARD
	squad = SQUAD_PMCPLT
	job = /datum/job/marine/standard/ai/pmc

/obj/effect/landmark/start/marine/forecon
	name = JOB_SQUAD_MARINE_FORECON
	squad = SQUAD_LRRP
	job = /datum/job/marine/standard/ai/forecon

/obj/effect/landmark/start/marine/rto
	name = JOB_SQUAD_RTO
	squad = SQUAD_LRRP
	job = /datum/job/marine/standard/ai/rto

#undef CPL_VARIANT
#undef LCPL_VARIANT
#undef PFC_VARIANT
#undef SR_PVT_VARIANT
#undef PVT_VARIANT
