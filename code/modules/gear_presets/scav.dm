/datum/equipment_preset/scav
	name = "Scavenger"
	languages = list(LANGUAGE_ENGLISH)
	flags = EQUIPMENT_PRESET_EXTRA
	faction = FACTION_SCAV
	faction_group = FACTION_LIST_SCAV
	skills = /datum/skills/clf
	paygrades = list(PAY_SHORT_SCAV = JOB_PLAYTIME_TIER_0)
	origin_override = ORIGIN_CIVILIAN

/datum/equipment_preset/scav/New()
	. = ..()
	access = get_access(ACCESS_LIST_CLF_BASE)

/datum/equipment_preset/scav/pistol
	name = "Scav, Rookie"
	flags = EQUIPMENT_PRESET_EXTRA
	idtype = /obj/item/card/id/lanyard
	paygrades = list(PAY_SHORT_REB = JOB_PLAYTIME_TIER_0)
	access = list(ACCESS_LIST_CLF_BASE)

/datum/equipment_preset/scav/pistol/get_assignment(mob/living/carbon/human/new_human)
	return "Class D Inhabitant"

/datum/equipment_preset/scav/pistol/load_gear(mob/living/carbon/human/new_human)
	new_human.undershirt = "undershirt"
	//back
	add_random_satchel(new_human)
	var/scav_weapon = rand(1,3)
	switch(scav_weapon)
		if(1)
			new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre/wy(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/vp70(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/vp70(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/vp70(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/vp70(new_human), WEAR_IN_BACK)
		if(2)
			new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre/wy(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/l54(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/l54(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/l54(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/l54(new_human), WEAR_IN_BACK)
		if(3)
			new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre/wy(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/holdout(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/holdout(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/holdout(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/holdout(new_human), WEAR_IN_BACK)
	//face
	if(prob(20))
		add_facewrap(new_human)
	//uniform
	var/scav_uniform = rand(1,3)
	switch(scav_uniform)
		if(1)
			add_rebel_ua_uniform(new_human)
		if(2)
			add_rebel_twe_uniform(new_human)
		if(3)
			add_canc_uniform(new_human)
	//jacket
	var/scav_armor = rand(1,2)
	if(prob(20))
		switch(scav_armor)
			if(1)
				add_rebel_ua_suit(new_human)
			if(2)
				add_rebel_twe_suit(new_human)
	//waist
	switch(scav_weapon)
		if(1)
			new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/pistol/vp70(new_human), WEAR_IN_BACK)
		if(2)
			new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/pistol/l54(new_human), WEAR_IN_BACK)
		if(3)
			new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/pistol/holdout(new_human), WEAR_IN_BACK)
	//limbs
	var/scav_boots = rand(1,3)
	switch(scav_boots)
		if(1)
			add_rebel_ua_shoes(new_human)
		if(2)
			add_rebel_twe_shoes(new_human)
		if(3)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/upp/guard/canc(new_human), WEAR_FEET)

	//pockets
	if(prob(50))
		new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate, WEAR_L_STORE)

/datum/equipment_preset/scav/rifle
	name = "Scav, Raider"
	flags = EQUIPMENT_PRESET_EXTRA
	idtype = /obj/item/card/id/lanyard
	paygrades = list(PAY_SHORT_REB = JOB_PLAYTIME_TIER_0)
	access = list(ACCESS_LIST_CLF_BASE)

/datum/equipment_preset/scav/rifle/get_assignment(mob/living/carbon/human/new_human)
	return "Class D Inhabitant"

/datum/equipment_preset/scav/rifle/load_gear(mob/living/carbon/human/new_human)
	new_human.undershirt = "undershirt"
	//back
	add_random_satchel(new_human)
	var/scav_weapon = rand(1,4)
	switch(scav_weapon)
		if(1)
			new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre/wy(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/mar40(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/mar40(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/mar40(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/mar40(new_human), WEAR_IN_BACK)
		if(2)
			new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre/wy(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/mar40(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/mar40(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/mar40(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/mar40(new_human), WEAR_IN_BACK)
		if(3)
			new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre/wy(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/mac15(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/mac15(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/mac15(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/mac15(new_human), WEAR_IN_BACK)
		if(4)
			new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre/wy(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/uzi(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/uzi(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/uzi(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/uzi(new_human), WEAR_IN_BACK)
	//face
	if(prob(50))
		add_facewrap(new_human)
	//uniform
	var/scav_uniform = rand(1,3)
	switch(scav_uniform)
		if(1)
			add_rebel_ua_uniform(new_human)
		if(2)
			add_rebel_twe_uniform(new_human)
		if(3)
			add_canc_uniform(new_human)
	//helmet
	var/scav_helmet = rand(1,3)
	switch(scav_helmet)
		if(1)
			add_rebel_ua_helmet(new_human)
		if(2)
			add_rebel_twe_helmet(new_human)
		if(3)
			add_rebel_upp_helmet(new_human)
	//jacket
	var/scav_armor = rand(1,3)
	switch(scav_armor)
		if(1)
			add_rebel_ua_suit(new_human)
		if(2)
			add_rebel_twe_suit(new_human)
		if(3)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/marine/faction/UPP/CANC(new_human), WEAR_JACKET)
	//waist
	switch(scav_weapon)
		if(1)
			new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/mar40(new_human), WEAR_J_STORE)
		if(2)
			new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/mar40/carbine(new_human), WEAR_J_STORE)
		if(3)
			new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/smg/mac15(new_human), WEAR_J_STORE)
		if(4)
			new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/smg/uzi(new_human), WEAR_J_STORE)
	//limbs
	var/scav_boots = rand(1,3)
	switch(scav_boots)
		if(1)
			add_rebel_ua_shoes(new_human)
		if(2)
			add_rebel_twe_shoes(new_human)
		if(3)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/upp/guard/canc(new_human), WEAR_FEET)

	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate, WEAR_L_STORE)

/datum/equipment_preset/scav/shotgun
	name = "Scav, Psycho"
	flags = EQUIPMENT_PRESET_EXTRA
	idtype = /obj/item/card/id/lanyard
	paygrades = list(PAY_SHORT_REB = JOB_PLAYTIME_TIER_0)
	access = list(ACCESS_LIST_CLF_BASE)

/datum/equipment_preset/scav/shotgun/get_assignment(mob/living/carbon/human/new_human)
	return "Class D Inhabitant"

/datum/equipment_preset/scav/shotgun/load_gear(mob/living/carbon/human/new_human)
	new_human.undershirt = "undershirt"
	//back
	add_random_satchel(new_human)
	if(prob(80))
		new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre/wy(new_human), WEAR_IN_BACK)
		new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/handful/shotgun/beanbag(new_human), WEAR_IN_BACK)
		new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/handful/shotgun/beanbag(new_human), WEAR_IN_BACK)
		new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/handful/shotgun/beanbag(new_human), WEAR_IN_BACK)
		new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/handful/shotgun/beanbag(new_human), WEAR_IN_BACK)
	else
		new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre/wy(new_human), WEAR_IN_BACK)
		new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/handful/shotgun/buckshot(new_human), WEAR_IN_BACK)
		new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/handful/shotgun/buckshot(new_human), WEAR_IN_BACK)
		new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/handful/shotgun/slug(new_human), WEAR_IN_BACK)
		new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/handful/shotgun/slug(new_human), WEAR_IN_BACK)
	//face
	if(prob(50))
		add_facewrap(new_human)
	//uniform
	var/scav_uniform = rand(1,3)
	switch(scav_uniform)
		if(1)
			add_rebel_ua_uniform(new_human)
		if(2)
			add_rebel_twe_uniform(new_human)
		if(3)
			add_canc_uniform(new_human)
	//helmet
	var/scav_helmet = rand(1,3)
	switch(scav_helmet)
		if(1)
			add_rebel_ua_helmet(new_human)
		if(2)
			add_rebel_twe_helmet(new_human)
		if(3)
			add_rebel_upp_helmet(new_human)
	//jacket
	var/scav_armor = rand(1,3)
	switch(scav_armor)
		if(1)
			add_rebel_ua_suit(new_human)
		if(2)
			add_rebel_twe_suit(new_human)
		if(3)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/marine/faction/UPP/CANC(new_human), WEAR_JACKET)
	//waist
	var/scav_weapon = rand(1,3)
	switch(scav_weapon)
		if(1)
			new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/shotgun/double(new_human), WEAR_J_STORE)
		if(2)
			new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/shotgun/double/sawn(new_human), WEAR_J_STORE)
		if(3)
			new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/shotgun/pump(new_human), WEAR_J_STORE)
	//limbs
	var/scav_boots = rand(1,3)
	switch(scav_boots)
		if(1)
			add_rebel_ua_shoes(new_human)
		if(2)
			add_rebel_twe_shoes(new_human)
		if(3)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/upp/guard/canc(new_human), WEAR_FEET)

	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate, WEAR_L_STORE)