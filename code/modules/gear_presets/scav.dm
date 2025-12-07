/datum/equipment_preset/scav
	name = "Scavenger"
	languages = list(LANGUAGE_ENGLISH)
	flags = EQUIPMENT_PRESET_EXTRA
	faction = FACTION_SCAV
	faction_group = FACTION_LIST_SCAV
	skills = /datum/skills/scav
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
	scav_satchel(new_human)
	var/scav_weapon = rand(1,5)
	switch(scav_weapon)
		if(1)
			if(prob(50))
				new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre/wy(new_human), WEAR_IN_BACK)
			else
				new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre/hdr(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/vp70(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/vp70(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/vp70(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/vp70(new_human), WEAR_IN_BACK)
		if(2)
			if(prob(50))
				new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre/wy(new_human), WEAR_IN_BACK)
			else
				new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre/hdr(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/l54(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/l54(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/l54(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/l54(new_human), WEAR_IN_BACK)
		if(3)
			if(prob(50))
				new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre/wy(new_human), WEAR_IN_BACK)
			else
				new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre/hdr(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/holdout(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/holdout(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/holdout(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/holdout(new_human), WEAR_IN_BACK)
		if(4)
			if(prob(50))
				new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre/wy(new_human), WEAR_IN_BACK)
			else
				new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre/hdr(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/es4(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/es4(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/es4(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/es4(new_human), WEAR_IN_BACK)
		if(5)
			if(prob(50))
				new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre/wy(new_human), WEAR_IN_BACK)
			else
				new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre/hdr(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/b92fs(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/b92fs(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/b92fs(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pistol/b92fs(new_human), WEAR_IN_BACK)
	//face
	if(prob(40))
		scav_head(new_human)
	if(prob(30))
		scav_facewrap(new_human)
	if(prob(20))
		scav_eyes(new_human)
	//uniform
	scav_uniform(new_human)
	if(prob(30))
		scav_accessory_under(new_human)
	if(prob(50))
		scav_suit(new_human)
	//waist
	switch(scav_weapon)
		if(1)
			new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/pistol/vp70(new_human), WEAR_IN_BACK)
		if(2)
			new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/pistol/l54(new_human), WEAR_IN_BACK)
		if(3)
			new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/pistol/holdout(new_human), WEAR_IN_BACK)
		if(4)
			new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/pistol/es4(new_human), WEAR_IN_BACK)
		if(5)
			new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/pistol/b92fs(new_human), WEAR_IN_BACK)
	//boots
	scav_shoes(new_human)
	if(prob(20))
		scav_gloves(new_human)
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
	scav_backsatch(new_human)
	var/scav_weapon = rand(1,8)
	switch(scav_weapon)
		if(1)
			if(prob(50))
				new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre/wy(new_human), WEAR_IN_BACK)
			else
				new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre/hdr(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/mar40(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/mar40(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/mar40(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/mar40(new_human), WEAR_IN_BACK)
		if(2)
			if(prob(50))
				new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre/wy(new_human), WEAR_IN_BACK)
			else
				new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre/hdr(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/mar40(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/mar40(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/mar40(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/mar40(new_human), WEAR_IN_BACK)
		if(3)
			if(prob(50))
				new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre/wy(new_human), WEAR_IN_BACK)
			else
				new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre/hdr(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/mac15(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/mac15(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/mac15(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/mac15(new_human), WEAR_IN_BACK)
		if(4)
			if(prob(50))
				new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre/wy(new_human), WEAR_IN_BACK)
			else
				new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre/hdr(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/uzi(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/uzi(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/uzi(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/uzi(new_human), WEAR_IN_BACK)
		if(5)
			if(prob(50))
				new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre/wy(new_human), WEAR_IN_BACK)
			else
				new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre/hdr(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/mp5(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/mp5(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/mp5(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/mp5(new_human), WEAR_IN_BACK)
		if(6)
			if(prob(50))
				new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre/wy(new_human), WEAR_IN_BACK)
			else
				new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre/hdr(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/pps43(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/pps43(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/pps43(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/pps43(new_human), WEAR_IN_BACK)
		if(7)
			if(prob(50))
				new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre/wy(new_human), WEAR_IN_BACK)
			else
				new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre/hdr(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/ppsh(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/ppsh(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/ppsh(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/ppsh(new_human), WEAR_IN_BACK)
		if(8)
			if(prob(50))
				new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre/wy(new_human), WEAR_IN_BACK)
			else
				new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre/hdr(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/mp27(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/mp27(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/mp27(new_human), WEAR_IN_BACK)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/mp27(new_human), WEAR_IN_BACK)
	//face
	if(prob(60))
		scav_head(new_human)
	if(prob(50))
		scav_facewrap(new_human)
	if(prob(30))
		scav_eyes(new_human)
	//uniform
	scav_uniform(new_human)
	//helmet
	scav_head_helmet(new_human)
	//jacket
	scav_suit_armor(new_human)
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
		if(5)
			new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/smg/mp5(new_human), WEAR_J_STORE)
		if(6)
			new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/smg/pps43(new_human), WEAR_J_STORE)
		if(7)
			new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/smg/ppsh(new_human), WEAR_J_STORE)
		if(8)
			new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/smg/mp27(new_human), WEAR_J_STORE)
	//boots
	scav_shoes(new_human)
	if(prob(20))
		scav_gloves(new_human)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate, WEAR_L_STORE)

/datum/equipment_preset/scav/shotgun
	name = "Scav, Raider (Shotgun)"
	flags = EQUIPMENT_PRESET_EXTRA
	idtype = /obj/item/card/id/lanyard
	paygrades = list(PAY_SHORT_REB = JOB_PLAYTIME_TIER_0)
	access = list(ACCESS_LIST_CLF_BASE)

/datum/equipment_preset/scav/shotgun/get_assignment(mob/living/carbon/human/new_human)
	return "Class D Inhabitant"

/datum/equipment_preset/scav/shotgun/load_gear(mob/living/carbon/human/new_human)
	new_human.undershirt = "undershirt"
	//back
	scav_satchel(new_human)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/handful/shotgun/buckshot(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/handful/shotgun/slug(new_human), WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/handful/shotgun/slug(new_human), WEAR_IN_BACK)
	if(prob(50))
		new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre/wy(new_human), WEAR_IN_BACK)
	else
		new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre/hdr(new_human), WEAR_IN_BACK)
	//face
	if(prob(50))
		scav_facewrap(new_human)
	//uniform
	scav_uniform(new_human)
	//helmet
	scav_head_helmet(new_human)
	//jacket
	scav_suit_armor(new_human)
	//waist
	var/scav_weapon = rand(1,3)
	switch(scav_weapon)
		if(1)
			new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/shotgun/double(new_human), WEAR_J_STORE)
		if(2)
			new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/shotgun/double/sawn(new_human), WEAR_J_STORE)
		if(3)
			new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/shotgun/double/upp(new_human), WEAR_J_STORE)
	//boots
	scav_shoes(new_human)
	//gloves
	if(prob(20))
		scav_gloves(new_human)
	//pockets
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/firstaid/full/alternate, WEAR_L_STORE)

//////////ELITE SCAVS, AKA MARAUDERS///////////

/datum/equipment_preset/scav/rifle/elite
	name = "Scav, Marauder"
	flags = EQUIPMENT_PRESET_EXTRA
	idtype = /obj/item/card/id/lanyard
	paygrades = list(PAY_SHORT_REB = JOB_PLAYTIME_TIER_0)
	skills = /datum/skills/scav/marauder
	access = list(ACCESS_LIST_CLF_BASE)

/datum/equipment_preset/scav/rifle/elite/get_assignment(mob/living/carbon/human/new_human)
	return "Mercenary"

/datum/equipment_preset/scav/rifle/elite/load_gear(mob/living/carbon/human/new_human)
	new_human.undershirt = "undershirt"
	//back
	merc_backpack(new_human)
	if(prob(50))
		new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre/wy(new_human), WEAR_IN_BACK)
		new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/incendiary/molotov(new_human), WEAR_IN_BACK)
		new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/incendiary/molotov(new_human), WEAR_IN_BACK)
	else
		new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre/hdr(new_human), WEAR_IN_BACK)
		new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/high_explosive/stick(new_human), WEAR_IN_BACK)
		new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/high_explosive/stick(new_human), WEAR_IN_BACK)
	if(prob(30))
		merc_facewrap(new_human)
	// eyes
	merc_eyes(new_human)
	//uniform
	var/faction = rand(1,3)
	switch(faction)
		if(1)
			merc_uniform_ua(new_human)
		if(2)
			merc_uniform_upp(new_human)
		if(3)
			merc_uniform_other(new_human)
	//helmet
	switch(faction)
		if(1)
			merc_helmet_ua(new_human)
		if(2)
			merc_helmet_upp(new_human)
		if(3)
			merc_helmet_other(new_human)
	//jacket
	switch(faction)
		if(1)
			merc_suit_ua(new_human)
		if(2)
			merc_suit_upp(new_human)
		if(3)
			merc_suit_other(new_human)
	//boots
	switch(faction)
		if(1)
			merc_shoes_ua(new_human)
		if(2)
			merc_shoes_upp(new_human)
		if(3)
			merc_shoes_other(new_human)
	//waist
	var/scav_weapon = rand(1,5)
	switch(scav_weapon)
		if(1)
			new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine, WEAR_WAIST)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/ar10(new_human), WEAR_IN_BELT)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/ar10(new_human), WEAR_IN_BELT)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/ar10(new_human), WEAR_IN_BELT)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/ar10(new_human), WEAR_IN_BELT)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/ar10(new_human), WEAR_IN_BELT)
		if(2)
			new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine, WEAR_WAIST)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m16(new_human), WEAR_IN_BELT)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m16(new_human), WEAR_IN_BELT)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m16(new_human), WEAR_IN_BELT)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m16(new_human), WEAR_IN_BELT)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m16(new_human), WEAR_IN_BELT)
		if(3)
			new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine/rmc, WEAR_WAIST)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/rmc_f90(new_human), WEAR_IN_BELT)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/rmc_f90(new_human), WEAR_IN_BELT)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/rmc_f90(new_human), WEAR_IN_BELT)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/rmc_f90(new_human), WEAR_IN_BELT)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/rmc_f90(new_human), WEAR_IN_BELT)
		if(4)
			new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine, WEAR_WAIST)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m20a(new_human), WEAR_IN_BELT)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m20a(new_human), WEAR_IN_BELT)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m20a(new_human), WEAR_IN_BELT)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m20a(new_human), WEAR_IN_BELT)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m20a(new_human), WEAR_IN_BELT)
		if(5)
			new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine/upp, WEAR_WAIST)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/lw317(new_human), WEAR_IN_BELT)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/lw317(new_human), WEAR_IN_BELT)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/lw317(new_human), WEAR_IN_BELT)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/lw317(new_human), WEAR_IN_BELT)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/lw317(new_human), WEAR_IN_BELT)
	//weapon
	switch(scav_weapon)
		if(1)
			new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/ar10(new_human), WEAR_J_STORE)
		if(2)
			new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/m16(new_human), WEAR_J_STORE)
		if(3)
			new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/rmc_f90(new_human), WEAR_J_STORE)
		if(4)
			new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/m20a(new_human), WEAR_J_STORE)
		if(5)
			new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/lw317(new_human), WEAR_J_STORE)
	//gloves
	merc_gloves(new_human)
	//under accessory
	if(prob(10))
		merc_accessory_useful(new_human)
	if(prob(40))
		merc_accessory_cosmetic(new_human)
	//helmet accessory
	if(prob(30))
		merc_accessory_helmet(new_human)
	//pockets
	if(prob(80))
		new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/medical/full, WEAR_L_STORE)
	else
		new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/medkit/full_advanced, WEAR_L_STORE)

/datum/equipment_preset/scav/antitank
	name = "Scav, Marauder (Rocketeer)"
	flags = EQUIPMENT_PRESET_EXTRA
	idtype = /obj/item/card/id/lanyard
	skills = /datum/skills/scav/marauder
	paygrades = list(PAY_SHORT_REB = JOB_PLAYTIME_TIER_0)
	access = list(ACCESS_LIST_CLF_BASE)

/datum/equipment_preset/scav/antitank/get_assignment(mob/living/carbon/human/new_human)
	return "Mercenary"

/datum/equipment_preset/scav/antitank/load_gear(mob/living/carbon/human/new_human)
	new_human.undershirt = "undershirt"
	//back
	merc_backpack(new_human)
	if(prob(50))
		new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre/wy(new_human), WEAR_IN_BACK)
		new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/incendiary/molotov(new_human), WEAR_IN_BACK)
		new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/incendiary/molotov(new_human), WEAR_IN_BACK)
	else
		new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre/hdr(new_human), WEAR_IN_BACK)
		new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/high_explosive/stick(new_human), WEAR_IN_BACK)
		new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/high_explosive/stick(new_human), WEAR_IN_BACK)
	new_human.put_in_active_hand(new /obj/item/weapon/gun/launcher/rocket/anti_tank/disposable(new_human))
	if(prob(30))
		merc_facewrap(new_human)
	// eyes
	merc_eyes(new_human)
	//uniform
	var/faction = rand(1,3)
	switch(faction)
		if(1)
			merc_uniform_ua(new_human)
		if(2)
			merc_uniform_upp(new_human)
		if(3)
			merc_uniform_other(new_human)
	//helmet
	switch(faction)
		if(1)
			merc_helmet_ua(new_human)
		if(2)
			merc_helmet_upp(new_human)
		if(3)
			merc_helmet_other(new_human)
	//jacket
	switch(faction)
		if(1)
			merc_suit_ua(new_human)
		if(2)
			merc_suit_upp(new_human)
		if(3)
			merc_suit_other(new_human)
	//boots
	switch(faction)
		if(1)
			merc_shoes_ua(new_human)
		if(2)
			merc_shoes_upp(new_human)
		if(3)
			merc_shoes_other(new_human)
	//waist
	var/scav_weapon = rand(1,5)
	switch(scav_weapon)
		if(1)
			new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine, WEAR_WAIST)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/ar10(new_human), WEAR_IN_BELT)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/ar10(new_human), WEAR_IN_BELT)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/ar10(new_human), WEAR_IN_BELT)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/ar10(new_human), WEAR_IN_BELT)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/ar10(new_human), WEAR_IN_BELT)
		if(2)
			new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine, WEAR_WAIST)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m16(new_human), WEAR_IN_BELT)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m16(new_human), WEAR_IN_BELT)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m16(new_human), WEAR_IN_BELT)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m16(new_human), WEAR_IN_BELT)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m16(new_human), WEAR_IN_BELT)
		if(3)
			new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine/rmc, WEAR_WAIST)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/rmc_f90(new_human), WEAR_IN_BELT)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/rmc_f90(new_human), WEAR_IN_BELT)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/rmc_f90(new_human), WEAR_IN_BELT)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/rmc_f90(new_human), WEAR_IN_BELT)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/rmc_f90(new_human), WEAR_IN_BELT)
		if(4)
			new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine, WEAR_WAIST)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m20a(new_human), WEAR_IN_BELT)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m20a(new_human), WEAR_IN_BELT)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m20a(new_human), WEAR_IN_BELT)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m20a(new_human), WEAR_IN_BELT)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/m20a(new_human), WEAR_IN_BELT)
		if(5)
			new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine/upp, WEAR_WAIST)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/lw317(new_human), WEAR_IN_BELT)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/lw317(new_human), WEAR_IN_BELT)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/lw317(new_human), WEAR_IN_BELT)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/lw317(new_human), WEAR_IN_BELT)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/lw317(new_human), WEAR_IN_BELT)
	//weapon
	switch(scav_weapon)
		if(1)
			new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/ar10(new_human), WEAR_J_STORE)
		if(2)
			new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/m16(new_human), WEAR_J_STORE)
		if(3)
			new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/rmc_f90(new_human), WEAR_J_STORE)
		if(4)
			new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/m20a(new_human), WEAR_J_STORE)
		if(5)
			new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/lw317(new_human), WEAR_J_STORE)
	//boots
	var/scav_boots = rand(1,3)
	switch(scav_boots)
		if(1)
			add_rebel_ua_shoes(new_human)
		if(2)
			add_rebel_twe_shoes(new_human)
		if(3)
			new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/upp/guard/canc(new_human), WEAR_FEET)
	//gloves
	merc_gloves(new_human)
	//under accessory
	if(prob(10))
		merc_accessory_useful(new_human)
	if(prob(40))
		merc_accessory_cosmetic(new_human)
	//helmet accessory
	if(prob(30))
		merc_accessory_helmet(new_human)
	//pockets
	if(prob(80))
		new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/medical/full, WEAR_L_STORE)
	else
		new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/medkit/full_advanced, WEAR_L_STORE)

/datum/equipment_preset/scav/shotgun/elite
	name = "Scav, Marauder (Shotgun+)"
	flags = EQUIPMENT_PRESET_EXTRA
	idtype = /obj/item/card/id/lanyard
	skills = /datum/skills/scav/marauder
	paygrades = list(PAY_SHORT_REB = JOB_PLAYTIME_TIER_0)
	access = list(ACCESS_LIST_CLF_BASE)

/datum/equipment_preset/scav/shotgun/elite/get_assignment(mob/living/carbon/human/new_human)
	return "Mercenary"

/datum/equipment_preset/scav/shotgun/elite/load_gear(mob/living/carbon/human/new_human)
	new_human.undershirt = "undershirt"
	//back
	merc_backpack(new_human)
	if(prob(50))
		new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre/wy(new_human), WEAR_IN_BACK)
		new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/incendiary/molotov(new_human), WEAR_IN_BACK)
		new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/incendiary/molotov(new_human), WEAR_IN_BACK)
	else
		new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre/hdr(new_human), WEAR_IN_BACK)
		new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/high_explosive/stick(new_human), WEAR_IN_BACK)
		new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/high_explosive/stick(new_human), WEAR_IN_BACK)
	if(prob(30))
		merc_facewrap(new_human)
	// eyes
	merc_eyes(new_human)
	//uniform
	var/faction = rand(1,3)
	switch(faction)
		if(1)
			merc_uniform_ua(new_human)
		if(2)
			merc_uniform_upp(new_human)
		if(3)
			merc_uniform_other(new_human)
	//helmet
	switch(faction)
		if(1)
			merc_helmet_ua(new_human)
		if(2)
			merc_helmet_upp(new_human)
		if(3)
			merc_helmet_other(new_human)
	//jacket
	switch(faction)
		if(1)
			merc_suit_ua(new_human)
		if(2)
			merc_suit_upp(new_human)
		if(3)
			merc_suit_other(new_human)
	//boots
	switch(faction)
		if(1)
			merc_shoes_ua(new_human)
		if(2)
			merc_shoes_upp(new_human)
		if(3)
			merc_shoes_other(new_human)
	//waist
	var/scav_weapon = rand(1,3)
	switch(scav_weapon)
		if(1)
			new_human.equip_to_slot_or_del(new /obj/item/storage/belt/shotgun(new_human), WEAR_WAIST)
			new_human.equip_to_slot_or_del(new/obj/item/ammo_magazine/handful/shotgun/heavy/slug(new_human), WEAR_IN_BELT)
			new_human.equip_to_slot_or_del(new/obj/item/ammo_magazine/handful/shotgun/heavy/slug(new_human), WEAR_IN_BELT)
			new_human.equip_to_slot_or_del(new/obj/item/ammo_magazine/handful/shotgun/heavy/slug(new_human), WEAR_IN_BELT)
			new_human.equip_to_slot_or_del(new/obj/item/ammo_magazine/handful/shotgun/heavy/buckshot(new_human), WEAR_IN_BELT)
			new_human.equip_to_slot_or_del(new/obj/item/ammo_magazine/handful/shotgun/heavy/buckshot(new_human), WEAR_IN_BELT)
			new_human.equip_to_slot_or_del(new/obj/item/ammo_magazine/handful/shotgun/heavy/buckshot(new_human), WEAR_IN_BELT)
			if(prob(50))
				new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/shotgun/slug/heavy(new_human), WEAR_IN_BACK)
			else
				new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/shotgun/buckshot/heavy(new_human), WEAR_IN_BACK)
		else
			new_human.equip_to_slot_or_del(new /obj/item/storage/belt/shotgun(new_human), WEAR_WAIST)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/handful/shotgun/slug(new_human), WEAR_IN_BELT)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/handful/shotgun/slug(new_human), WEAR_IN_BELT)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/handful/shotgun/slug(new_human), WEAR_IN_BELT)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/handful/shotgun/buckshot(new_human), WEAR_IN_BELT)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/handful/shotgun/buckshot(new_human), WEAR_IN_BELT)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/handful/shotgun/buckshot(new_human), WEAR_IN_BELT)
			if(prob(50))
				new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/shotgun/slug(new_human), WEAR_IN_BACK)
			else
				new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/shotgun/buckshot(new_human), WEAR_IN_BACK)
	//weapon
	switch(scav_weapon)
		if(1)
			new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/shotgun/pump/type23(new_human), WEAR_J_STORE)
		if(2)
			new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/shotgun/pump(new_human), WEAR_J_STORE)
		if(3)
			new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/shotgun/combat(new_human), WEAR_J_STORE)
	//gloves
	merc_gloves(new_human)
	//under accessory
	if(prob(10))
		merc_accessory_useful(new_human)
	if(prob(40))
		merc_accessory_cosmetic(new_human)
	//helmet accessory
	if(prob(30))
		merc_accessory_helmet(new_human)
	//pockets
	if(prob(80))
		new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/medical/full, WEAR_L_STORE)
	else
		new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/medkit/full_advanced, WEAR_L_STORE)

/datum/equipment_preset/scav/machinegun
	name = "Scav, Marauder (Heavy)"
	flags = EQUIPMENT_PRESET_EXTRA
	idtype = /obj/item/card/id/lanyard
	skills = /datum/skills/scav/marauder
	paygrades = list(PAY_SHORT_REB = JOB_PLAYTIME_TIER_0)
	access = list(ACCESS_LIST_CLF_BASE)

/datum/equipment_preset/scav/machinegun/get_assignment(mob/living/carbon/human/new_human)
	return "Mercenary"

/datum/equipment_preset/scav/machinegun/load_gear(mob/living/carbon/human/new_human)
	new_human.undershirt = "undershirt"
	//back
	merc_backpack(new_human)
	if(prob(50))
		new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre/wy(new_human), WEAR_IN_BACK)
		new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/incendiary/molotov(new_human), WEAR_IN_BACK)
		new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/incendiary/molotov(new_human), WEAR_IN_BACK)
	else
		new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre/hdr(new_human), WEAR_IN_BACK)
		new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/high_explosive/stick(new_human), WEAR_IN_BACK)
		new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/high_explosive/stick(new_human), WEAR_IN_BACK)
	if(prob(30))
		merc_facewrap(new_human)
	// eyes
	merc_eyes(new_human)
	//uniform
	var/faction = rand(1,3)
	switch(faction)
		if(1)
			merc_uniform_ua(new_human)
		if(2)
			merc_uniform_upp(new_human)
		if(3)
			merc_uniform_other(new_human)
	//helmet
	switch(faction)
		if(1)
			merc_helmet_ua(new_human)
		if(2)
			merc_helmet_upp(new_human)
		if(3)
			merc_helmet_other(new_human)
	//jacket
	switch(faction)
		if(1)
			merc_suit_ua(new_human)
		if(2)
			merc_suit_upp(new_human)
		if(3)
			merc_suit_other(new_human)
	//boots
	switch(faction)
		if(1)
			merc_shoes_ua(new_human)
		if(2)
			merc_shoes_upp(new_human)
		if(3)
			merc_shoes_other(new_human)
	//waist
	var/scav_weapon = rand(1,2)
	switch(scav_weapon)
		if(1)
			new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine, WEAR_WAIST)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pkp/standard_fmj(new_human), WEAR_IN_BELT)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pkp/standard_fmj(new_human), WEAR_IN_BELT)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pkp/standard_fmj(new_human), WEAR_IN_BELT)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pkp/standard_fmj(new_human), WEAR_IN_BELT)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/pkp/standard_fmj(new_human), WEAR_IN_BELT)
		if(2)
			new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine, WEAR_WAIST)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/m60(new_human), WEAR_IN_BELT)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/m60(new_human), WEAR_IN_BELT)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/m60(new_human), WEAR_IN_BELT)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/m60(new_human), WEAR_IN_BELT)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/m60(new_human), WEAR_IN_BELT)
	//weapon
	switch(scav_weapon)
		if(1)
			new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/pkp/standard_fmj(new_human), WEAR_J_STORE)
		if(2)
			new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/m60(new_human), WEAR_J_STORE)
	//gloves
	merc_gloves(new_human)
	//under accessory
	if(prob(10))
		merc_accessory_useful(new_human)
	if(prob(40))
		merc_accessory_cosmetic(new_human)
	//helmet accessory
	if(prob(30))
		merc_accessory_helmet(new_human)
	//pockets
	if(prob(80))
		new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/medical/full, WEAR_L_STORE)
	else
		new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/medkit/full_advanced, WEAR_L_STORE)

/datum/equipment_preset/scav/sniper
	name = "Scav, Marauder (Sniper)"
	flags = EQUIPMENT_PRESET_EXTRA
	idtype = /obj/item/card/id/lanyard
	skills = /datum/skills/scav/marauder
	paygrades = list(PAY_SHORT_REB = JOB_PLAYTIME_TIER_0)
	access = list(ACCESS_LIST_CLF_BASE)

/datum/equipment_preset/scav/sniper/get_assignment(mob/living/carbon/human/new_human)
	return "Mercenary"

/datum/equipment_preset/scav/sniper/load_gear(mob/living/carbon/human/new_human)
	new_human.undershirt = "undershirt"
	//back
	merc_backpack(new_human)
	if(prob(50))
		new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre/wy(new_human), WEAR_IN_BACK)
	else
		new_human.equip_to_slot_or_del(new /obj/item/storage/box/mre/hdr(new_human), WEAR_IN_BACK)
	if(prob(30))
		merc_facewrap(new_human)
	// eyes
	merc_eyes(new_human)
	//uniform
	var/faction = rand(1,3)
	switch(faction)
		if(1)
			merc_uniform_ua(new_human)
		if(2)
			merc_uniform_upp(new_human)
		if(3)
			merc_uniform_other(new_human)
	//helmet
	switch(faction)
		if(1)
			merc_helmet_ua(new_human)
		if(2)
			merc_helmet_upp(new_human)
		if(3)
			merc_helmet_other(new_human)
	//jacket
	switch(faction)
		if(1)
			merc_suit_ua(new_human)
		if(2)
			merc_suit_upp(new_human)
		if(3)
			merc_suit_other(new_human)
	//boots
	switch(faction)
		if(1)
			merc_shoes_ua(new_human)
		if(2)
			merc_shoes_upp(new_human)
		if(3)
			merc_shoes_other(new_human)
	//waist
	var/scav_weapon = rand(1,2)
	switch(scav_weapon)
		if(1)
			new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine, WEAR_WAIST)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/sniper(new_human), WEAR_IN_BELT)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/sniper(new_human), WEAR_IN_BELT)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/sniper(new_human), WEAR_IN_BELT)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/sniper(new_human), WEAR_IN_BELT)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/sniper(new_human), WEAR_IN_BELT)
		if(2)
			new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine, WEAR_WAIST)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/sniper/svd(new_human), WEAR_IN_BELT)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/sniper/svd(new_human), WEAR_IN_BELT)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/sniper/svd(new_human), WEAR_IN_BELT)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/sniper/svd(new_human), WEAR_IN_BELT)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/sniper/svd(new_human), WEAR_IN_BELT)
	//weapon
	switch(scav_weapon)
		if(1)
			new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/sniper/M42A(new_human), WEAR_J_STORE)
		if(2)
			new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/sniper/svd(new_human), WEAR_J_STORE)
	//gloves
	merc_gloves(new_human)
	//under accessory
	if(prob(10))
		merc_accessory_useful(new_human)
	if(prob(40))
		merc_accessory_cosmetic(new_human)
	//helmet accessory
	if(prob(30))
		merc_accessory_helmet(new_human)
	//pockets
	if(prob(80))
		new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/medical/full, WEAR_L_STORE)
	else
		new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/medkit/full_advanced, WEAR_L_STORE)
