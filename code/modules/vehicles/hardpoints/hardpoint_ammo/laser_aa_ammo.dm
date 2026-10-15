/obj/item/ammo_magazine/hardpoint/twe_laser
	name = "ADLW-2 laser cell magazine"
	desc = "A rather large laser cell, shaped more like a car battery than a magazine."
	icon = 'icons/obj/items/weapons/guns/ammo_by_faction/twe_ammo.dmi'
	caliber = "50mW"
	icon_state = "laser_aa_1"
	w_class = SIZE_LARGE
	default_ammo = /datum/ammo/energy/multilaser
	max_rounds = 1000
	gun_type = /obj/item/hardpoint/primary/laser_aa

/obj/item/ammo_magazine/hardpoint/twe_laser/update_icon()
	if(current_rounds > 0)
		icon_state = "laser_aa_1"
	else
		icon_state = "laser_aa_0"
