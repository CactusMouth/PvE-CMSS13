// Plasma cannon for twe tank, code stolen from Dimdim and Pandora's work
/obj/item/hardpoint/primary/cannon/light_plasma_cannon
	name = "L391 'Prakashah' Plasma Cannon"
	desc = "Advanced Plasma Cannon developed by the TWE as a lightweight anti-armour option. Operates in the 25mW range, fitted with a 8mW hydrogen fuel cell and loaded with Cadmium-Telluride pellets as plasma-mass (7 grams per pellet). The weapon is capable of defeating the frontal armour of light tanks, seriously threatening medium tanks and remains a potential threat against heavy-armour from side or rear attacks."
	desc_lore = "The L391 'Prakashah' (Sanskrit for 'Illumination' or 'Light') was developed in the TWE's memberstate/ex-nation of India through the viciously independent technology firm 'Loharah Innovations', who refused absorption into larger Megacorporate entities within the Empire. This was primarily achieved through flimsy Government contracts and security promises; contracts that nonetheless lead to fine weapon systems like the L391."

	icon = 'icons/obj/vehicles/hardpoints/twe_tank.dmi'
	icon_state = "light_plasma_cannon"
	disp_icon = "tank"
	disp_icon_state = "light_plasma_cannon"
	activation_sounds = list('sound/weapons/gun_xm99.ogg')

	health = 2000
	firing_arc = 60

	ammo = new /obj/item/ammo_magazine/hardpoint/twe_plasma
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
	fire_delay = 5.0 SECONDS

	var/obj/effect/ebeam/plasma_beam_type = /obj/effect/ebeam/laser/plasma
	///world.time value, to prevent a lightshow without actually firing
	var/beam_cooldown = 0
	///Delay before another beam can start again, in tenths of seconds
	var/beam_delay = 20

/obj/item/hardpoint/primary/cannon/light_plasma_cannon/handle_fire(atom/target, mob/living/user, /obj/vehicle/multitile/owner, params)

    var/datum/beam/plasma_beam
    if(!ammo.current_rounds)
        click_empty(owner)
        return
    plasma_beam = target.beam(owner, "light_beam", 'icons/effects/beam.dmi', time = 0.7 SECONDS, maxdistance = 30, beam_type = plasma_beam_type, always_turn = TRUE)
    animate(plasma_beam.visuals, alpha = 255, time = 0.7 SECONDS, color = COLOR_PURPLE, luminosity = 3 , easing = SINE_EASING|EASE_OUT)
    . = ..()
