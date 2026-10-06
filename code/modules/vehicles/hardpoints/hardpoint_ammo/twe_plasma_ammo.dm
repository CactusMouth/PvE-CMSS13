/obj/item/ammo_magazine/hardpoint/twe_plasma
	name = "L558B 85mm light plasma cannon magazine"
	desc = "A rather large plasma cannon magazine built to hold several full-sized plasma cannon rounds, extremely volatile."
	icon = 'icons/obj/items/weapons/guns/ammo_by_faction/twe_ammo.dmi'
	caliber = "85mm"
	icon_state = "light_plasma_cannon_5"
	w_class = SIZE_LARGE
	default_ammo = /datum/ammo/energy/plasma
	max_rounds = 5
	gun_type = /obj/item/hardpoint/primary/cannon/light_plasma_cannon

/obj/item/ammo_magazine/hardpoint/plasmacannon/update_icon()
	icon_state = "light_plasma_cannon_[current_rounds]"
