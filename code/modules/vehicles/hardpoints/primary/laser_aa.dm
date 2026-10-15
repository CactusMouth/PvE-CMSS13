/obj/item/hardpoint/primary/laser_aa
	name = "ADLW-2 'Jackrabbit' Laser Emitters"
	desc = "A pair of medium-spec high energy laser guns, designed for use by first-wave landing groups as a close-in point defence unit. Both guns operate in the 40-50mW range, but benefit from higher output at longer ranges than most others in their class, thanks to the expensive focusing-arrays built into the 'barrels'. This gives the Jackrabbit system a deceptively mundane appearance at range."

	icon = 'icons/obj/vehicles/hardpoints/twe_tank.dmi'
	icon_state = "laser_aa"
	disp_icon = "tank"
	disp_icon_state = "laser_aa"
	activation_sounds = list('sound/weapons/laser_blast.ogg')

	health = 2000
	firing_arc = 105

	ammo = new /obj/item/ammo_magazine/hardpoint/twe_laser
	max_clips = 4

	px_offsets = list(
		"1" = list(0, 0),
		"2" = list(0, 0),
		"4" = list(0, 0),
		"8" = list(0, 0)
	)

	use_muzzle_flash = FALSE
	muzzleflash_icon_state = "muzzle_flash_blue"

	muzzle_flash_pos = list(
		"1" = list(0, 0),
		"2" = list(-1, -0),
		"4" = list(0, -6),
		"8" = list(-0, -6)
	)

	scatter = 0
	gun_firemode = GUN_FIREMODE_AUTOMATIC
	gun_firemode_list = list(
		GUN_FIREMODE_AUTOMATIC,
	)
	fire_delay = 0.1 SECONDS

	var/obj/effect/ebeam/laser_beam_type = /obj/effect/ebeam/laser/intense
	///world.time value, to prevent a lightshow without actually firing
	var/beam_cooldown = 0
	///Delay before another beam can start again, in tenths of seconds
	var/beam_delay = 1

/obj/item/hardpoint/primary/laser_aa/handle_fire(atom/target, mob/living/user, /obj/vehicle/multitile/owner, params)

    var/datum/beam/laser_beam
    if(!ammo.current_rounds)
        click_empty(owner)
        return
    laser_beam = target.beam(owner, "light_beam_small", 'icons/effects/beam.dmi', time = 0.1 SECONDS, maxdistance = 30, beam_type = laser_beam_type, always_turn = TRUE)
    animate(laser_beam.visuals, alpha = 255, time = 0.1 SECONDS, color = COLOR_RED, luminosity = 3 , easing = SINE_EASING|EASE_OUT)
    . = ..()
