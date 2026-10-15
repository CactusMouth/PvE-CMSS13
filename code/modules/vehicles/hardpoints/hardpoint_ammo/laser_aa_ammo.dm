/obj/item/ammo_magazine/hardpoint/twe_laser
	name = "L391 plasma cannon magazine"
	desc = "A rather large plasma cannon magazine built to hold several full-sized plasma cannon rounds, extremely volatile."
	icon = 'icons/obj/items/weapons/guns/ammo_by_faction/twe_ammo.dmi'
	caliber = "85mm"
	icon_state = "light_plasma_cannon_5"
	w_class = SIZE_LARGE
	default_ammo = /datum/ammo/energy/multilaser
	max_rounds = 1000
	gun_type = /obj/item/hardpoint/primary/laser_aa

/obj/item/ammo_magazine/hardpoint/twe_laser/update_icon()
	if(current_rounds > 0)
		icon_state = "ace_autocannon"
	else
		icon_state = "ace_autocannon_empty"
