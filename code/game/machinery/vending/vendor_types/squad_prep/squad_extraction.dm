/obj/item/storage/pouch/firstaid/full/tending/fill_preset_inventory()
	new /obj/item/storage/pill_bottle/packet/tramadol(src)
	new /obj/item/stack/medical/splint(src)
	new /obj/item/stack/medical/ointment(src)
	new /obj/item/stack/medical/bruise_pack(src)

GLOBAL_LIST_INIT(cm_vending_extraction, list(

		list("WEAPONS (CHOOSE 1)", 0, null, null, null),
		list("VP70 Handgun", 0, /obj/item/storage/box/guncase/vp70, MARINE_CAN_BUY_KIT, VENDOR_ITEM_RECOMMENDED),
		list("M4A3 Handgun", 0, /obj/item/storage/box/guncase/m4a3, MARINE_CAN_BUY_KIT, VENDOR_ITEM_REGULAR),
		list("M1911 Handgun", 0, /obj/item/storage/box/guncase/m1911, MARINE_CAN_BUY_KIT, VENDOR_ITEM_REGULAR),

		list("ARMOR (CHOOSE 1)", 0, null, null, null),
		list("Ballistic Vest", 0, list(/obj/item/clothing/suit/armor/vest/ballistic), MARINE_CAN_BUY_UNIFORM, VENDOR_ITEM_RECOMMENDED),
		list("Militia Hauberk & Utility Helmet", 0, list(/obj/item/clothing/suit/storage/militia, /obj/item/clothing/head/helmet/construction), MARINE_CAN_BUY_UNIFORM, VENDOR_ITEM_REGULAR),
		list("Shoulder-Mounted Lamp Harness", 0, list(/obj/item/clothing/suit/marine/lamp), MARINE_CAN_BUY_UNIFORM, VENDOR_ITEM_REGULAR),

		list("BACKPACK (CHOOSE 1)", 0, null, null, null),
		list("Satchel", 0, /obj/item/storage/backpack/marine/satchel, MARINE_CAN_BUY_BACKPACK, VENDOR_ITEM_RECOMMENDED),
		list("Chest Rig", 0, /obj/item/storage/backpack/marine/satchel/chestrig, MARINE_CAN_BUY_BACKPACK, VENDOR_ITEM_REGULAR),
		list("Technician Rig", 0, /obj/item/storage/backpack/marine/satchel/tech, MARINE_CAN_BUY_BACKPACK, VENDOR_ITEM_REGULAR),

		list("POUCHES (CHOOSE 2)", 0, null, null, null),
		list("First-Aid Pouch (Refillable Injectors)", 0, /obj/item/storage/pouch/firstaid/full, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_RECOMMENDED),
		list("First-Aid Pouch (Med-packs & Splints)", 0, /obj/item/storage/pouch/firstaid/full/tending, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_RECOMMENDED),
		list("First-Aid Pouch (Pill Packets)", 0, /obj/item/storage/pouch/firstaid/full/pills, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_RECOMMENDED),
		list("Small General Pouch", 0, /obj/item/storage/pouch/general, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Flare Pouch (Full)", 0, /obj/item/storage/pouch/flare/full, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Magazine Pouch", 0, /obj/item/storage/pouch/magazine, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Shotgun Shell Pouch", 0, /obj/item/storage/pouch/shotgun, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),

		list("LIGHTS (CHOOSE 1)", 0, null, null, null),
		list("Flashlight", 0, /obj/item/device/flashlight, MARINE_CAN_BUY_MRE, VENDOR_ITEM_RECOMMENDED),
		list("M94 Marking Flare Pack", 0, /obj/item/storage/box/flare, MARINE_CAN_BUY_MRE, VENDOR_ITEM_REGULAR),

		list("COSMETIC SPECIALIZATION KITS", 0, null, null, null),
		list("No Specialization", 5, /obj/item/pamphlet/skill/specialization, VENDOR_ITEM_REGULAR),
		list("Support Medic", 5, /obj/item/pamphlet/skill/specialization/supmed, VENDOR_ITEM_REGULAR),
		list("Vehicle Crew", 5, /obj/item/pamphlet/skill/specialization/vehcrew, VENDOR_ITEM_REGULAR),
		list("Combat Technician", 5, /obj/item/pamphlet/skill/specialization/comtech, VENDOR_ITEM_REGULAR),
		list("Pointman", 5, /obj/item/pamphlet/skill/specialization/pointman, VENDOR_ITEM_REGULAR),
		list("Assistant Squad Lead", 5, /obj/item/pamphlet/skill/specialization/astl, VENDOR_ITEM_REGULAR),
		list("Machine Gunner", 5, /obj/item/pamphlet/skill/specialization/machinegunner, VENDOR_ITEM_REGULAR),
		list("Sniper", 5, /obj/item/pamphlet/skill/specialization/sniper, VENDOR_ITEM_REGULAR),
	))

/obj/structure/machinery/cm_vending/gear/extraction
	name = "\improper ColMarTech Surplus Munitions Rack"
	desc = "An automated rack hooked up to an autofab of cheap, low-quality equipment."
	icon_state = "clothing"
	req_access = list()
	vendor_role = list()
//	vendor_role = list(JOB_SQUAD_MEDIC, JOB_SQUAD_LEADER, JOB_SQUAD_SMARTGUN, JOB_SQUAD_ENGI, JOB_SQUAD_TEAM_LEADER, JOB_SQUAD_MARINE)

/obj/structure/machinery/cm_vending/gear/extraction/get_listed_products(mob/user)
	return GLOB.cm_vending_extraction

// synth gear

GLOBAL_LIST_INIT(cm_vending_clothing_synth_extract, list(

		list("RADIO (TAKE ALL)", 0, null, null, null),
		list("Marine Radio Headset", 0, /obj/item/device/radio/headset/almayer/marine/solardevils, MARINE_CAN_BUY_EAR, VENDOR_ITEM_MANDATORY),

		list("WEAPONS (CHOOSE 1)", 0, null, null, null),
		list("K92 Maintenance Jack", 0, /obj/item/maintenance_jack, MARINE_CAN_BUY_KIT, VENDOR_ITEM_RECOMMENDED),
		list("M2132 Machete", 0, /obj/item/storage/large_holster/machete/full, MARINE_CAN_BUY_KIT, VENDOR_ITEM_REGULAR),
		list("M2100 Machete", 0, /obj/item/storage/large_holster/machete/arnold/weak, MARINE_CAN_BUY_KIT, VENDOR_ITEM_REGULAR),

		list("UNIFORM (CHOOSE 1)", 0, null, null, null),
		list("Uniform, Outdated Synth", 0, /obj/item/clothing/under/rank/synthetic/old, MARINE_CAN_BUY_UNIFORM, VENDOR_ITEM_REGULAR),
		list("Uniform, Standard Synth", 0, /obj/item/clothing/under/rank/synthetic, MARINE_CAN_BUY_UNIFORM, VENDOR_ITEM_MANDATORY),
		list("Uniform, Frontier Synth", 0, /obj/item/clothing/under/rank/synthetic/frontier, MARINE_CAN_BUY_UNIFORM, VENDOR_ITEM_REGULAR),
		list("Uniform, Seegson Synth", 0, /obj/item/clothing/under/rank/synthetic/joe, MARINE_CAN_BUY_UNIFORM, VENDOR_ITEM_REGULAR),
		list("Uniform, Seegson Hazmat", 0, /obj/item/clothing/under/rank/synthetic/joe/engi, MARINE_CAN_BUY_UNIFORM, VENDOR_ITEM_REGULAR),

		list("SHOES (CHOOSE 1)", 0, null, null, null),
		list("Boots", 0, /obj/item/clothing/shoes/marine/knife, MARINE_CAN_BUY_SHOES, VENDOR_ITEM_REGULAR),
		list("Shoes, White", 0, /obj/item/clothing/shoes/white, MARINE_CAN_BUY_SHOES, VENDOR_ITEM_RECOMMENDED),

		list("HELMET (CHOOSE 1)", 0, null, null, null),
		list("Expedition Cap", 0, /obj/item/clothing/head/cmcap/flap, MARINE_CAN_BUY_HELMET, VENDOR_ITEM_REGULAR),
		list("Hard Hat, Orange", 0, /obj/item/clothing/head/hardhat/orange, MARINE_CAN_BUY_HELMET, VENDOR_ITEM_REGULAR),
		list("Welding Helmet", 0, /obj/item/clothing/head/welding, MARINE_CAN_BUY_HELMET, VENDOR_ITEM_REGULAR),

		list("SUIT (CHOOSE 1)", 0, null, null, null),
		list("Militia Hauberk, Partial", 0, list(/obj/item/clothing/suit/storage/militia/partial), MARINE_CAN_BUY_ARMOR, VENDOR_ITEM_REGULAR),
		list("Militia Brace", 0, list(/obj/item/clothing/suit/storage/militia/brace), MARINE_CAN_BUY_ARMOR, VENDOR_ITEM_REGULAR),
		list("Shoulder-Mounted Lamp Harness", 0, list(/obj/item/clothing/suit/marine/lamp), MARINE_CAN_BUY_UNIFORM, VENDOR_ITEM_REGULAR),

		list("GLOVES (CHOOSE 1)", 0, null, null, null),
		list("Insulated Gloves", 0, /obj/item/clothing/gloves/yellow, MARINE_CAN_BUY_GLOVES, VENDOR_ITEM_RECOMMENDED),
		list("Latex Gloves", 0, /obj/item/clothing/gloves/latex, MARINE_CAN_BUY_GLOVES, VENDOR_ITEM_REGULAR),
		list("Seegson Hazmat Gloves", 0, /obj/item/clothing/gloves/marine/joe, MARINE_CAN_BUY_GLOVES, VENDOR_ITEM_REGULAR),

		list("BACKPACK (CHOOSE 1)", 0, null, null, null),
		list("Satchel", 0, /obj/item/storage/backpack/marine/satchel, MARINE_CAN_BUY_BACKPACK, VENDOR_ITEM_RECOMMENDED),
		list("Chest Rig", 0, /obj/item/storage/backpack/marine/satchel/chestrig, MARINE_CAN_BUY_BACKPACK, VENDOR_ITEM_REGULAR),
		list("Technician Rig", 0, /obj/item/storage/backpack/marine/satchel/tech, MARINE_CAN_BUY_BACKPACK, VENDOR_ITEM_REGULAR),

		list("POUCHES (CHOOSE 2)", 0, null, null, null),
		list("First-Aid Pouch (Refillable Injectors)", 0, /obj/item/storage/pouch/firstaid/full, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_RECOMMENDED),
		list("First-Aid Pouch (Med-packs & Splints)", 0, /obj/item/storage/pouch/firstaid/full/tending, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_RECOMMENDED),
		list("First-Aid Pouch (Pill Packets)", 0, /obj/item/storage/pouch/firstaid/full/pills, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_RECOMMENDED),
		list("Small General Pouch", 0, /obj/item/storage/pouch/general, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),
		list("Flare Pouch (Full)", 0, /obj/item/storage/pouch/flare/full, MARINE_CAN_BUY_POUCH, VENDOR_ITEM_REGULAR),

		list("MASK", 0, null, null, null),
		list("Sterile Mask", 0, /obj/item/clothing/mask/surgical, MARINE_CAN_BUY_MASK, VENDOR_ITEM_REGULAR)
	))

/obj/structure/machinery/cm_vending/clothing/synth/extraction
	name = "\improper ColMarTech Surplus Synthetic Equipment Rack"
	desc = "An automated rack hooked up to an autofab of cheap, low-quality equipment. This one can only be used by synthetics."
	req_access = list()
	vendor_role = list()

/obj/structure/machinery/cm_vending/clothing/synth/extraction/get_listed_products(mob/user)
	return GLOB.cm_vending_clothing_synth_extract
