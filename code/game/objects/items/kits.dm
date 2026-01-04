/obj/item/conversion_kit
	name = "null conversion kit - Coderbus Shine"
	desc = "A handheld kit that can be used to permanently convert a... thing... into another thing. Except this one is broken. Everything is broken. Oh, God. Oh, fuck."
	icon = 'icons/obj/items/items.dmi'
	icon_state = "kit_blank"

/obj/item/conversion_kit/attackby(obj/item/W as obj, mob/user as mob)
	if(istype(W,/obj/item/conversion_kit))
		new /obj/item/conversion_kit(get_turf(src))
		to_chat(user, "You apply the null kit to the null kit. You rejoice as the attackby proc functions as expected.")
		qdel(W)
		qdel(src)

/obj/item/conversion_kit/haywood
	name = "weapon conversion kit - Seventh Layer's Bellows"
	desc = "A handheld kit that can be used to permanently apply a custom paintjob to an <b>M120 combat shotgun<b>."
	icon_state = "kit_haywood"

/obj/item/conversion_kit/haywood/attackby(obj/item/W as obj, mob/user as mob)
	if(istype(W,/obj/item/weapon/gun/shotgun/combat))
		new /obj/item/weapon/gun/shotgun/combat/haywood(get_turf(src))
		to_chat(user, "You apply the conversion kit to the shotgun. The weapon blazes with heat, and you feel <b>powerful.<b>")
		qdel(W)
		qdel(src)

/obj/item/conversion_kit/evan
	name = "weapon conversion kit - Golden God"
	desc = "A handheld kit that can be used to permanently apply a custom paintjob to an <b>M41A-MK1 pulse rifle<b>."
	icon_state = "kit_evan"

/obj/item/conversion_kit/evan/attackby(obj/item/W as obj, mob/user as mob)
	if(istype(W,/obj/item/weapon/gun/rifle/m41aMK1))
		new /obj/item/weapon/gun/rifle/m41aMK1/evan(get_turf(src))
		to_chat(user, "You apply the conversion kit to the rifle. The weapon calls to you as you apply the finishing touches -- this thing was meant for <b>nothin' but war crimes.<b>")
		qdel(W)
		qdel(src)

/obj/item/conversion_kit/legendary_veteran
	name = "weapon conversion kit - Primeval Warrior"
	desc = "A handheld kit that can be used to permanently apply a custom paintjob to a <b>VP70 pistol<b>."
	icon_state = "kit_legendary_veteran"

/obj/item/conversion_kit/legendary_veteran/attackby(obj/item/W as obj, mob/user as mob)
	if(istype(W,/obj/item/weapon/gun/pistol/vp70))
		new /obj/item/weapon/gun/pistol/vp70/legendary_veteran(get_turf(src))
		to_chat(user, "You apply the conversion kit to the pistol. The weapon feels old and wise, like it's seen shit that you wouldn't believe. <b>You hold history in your hands, and in this moment, you are among giants.<b>")
		qdel(W)
		qdel(src)

/obj/item/conversion_kit/veteran
	name = "weapon conversion kit - Grizzled Veteran"
	desc = "A handheld kit that can be used to permanently apply a custom paintjob to a <b>VP70 pistol<b>."
	icon_state = "kit_veteran"

/obj/item/conversion_kit/veteran/attackby(obj/item/W as obj, mob/user as mob)
	if(istype(W,/obj/item/weapon/gun/pistol/vp70))
		new /obj/item/weapon/gun/pistol/vp70/veteran(get_turf(src))
		to_chat(user, "You apply the conversion kit to the pistol. The weapon feels like it's been through a lot. You feel <b>wise beyond your years.<b>")
		qdel(W)
		qdel(src)

/obj/item/conversion_kit/freelancecell_beret
	name = "armor conversion kit - Freelance Cell Beret"
	desc = "A handheld kit that can be used to permanently apply a custom paintjob to a <b>Y8 miner helmet<b>."
	icon_state = "kit_freelancecell"

/obj/item/conversion_kit/freelancecell_beret/attackby(obj/item/W as obj, mob/user as mob)
	if(istype(W,/obj/item/clothing/head/helmet/marine/veteran/mercenary/miner))
		new /obj/item/clothing/head/helmet/marine/veteran/mercenary/miner/freelancecell/beret(get_turf(src))
		to_chat(user, "You apply the conversion kit to the helmet. The headset crackles to life and you can hear a stream of angry russian coming from the other side.")
		qdel(W)
		qdel(src)

/obj/item/conversion_kit/freelancecell_helmet
	name = "armor conversion kit - Freelance Cell Helmet"
	desc = "A handheld kit that can be used to permanently apply a custom paintjob to a <b>Y8 miner helmet<b>."
	icon_state = "kit_freelancecell"

/obj/item/conversion_kit/freelancecell_helmet/attackby(obj/item/W as obj, mob/user as mob)
	if(istype(W,/obj/item/clothing/head/helmet/marine/veteran/mercenary/miner))
		new /obj/item/clothing/head/helmet/marine/veteran/mercenary/miner/freelancecell(get_turf(src))
		to_chat(user, "You apply the conversion kit to the helmet. The visor activates with a *bweee.*")
		qdel(W)
		qdel(src)

/obj/item/conversion_kit/freelancecell_helmet_heavy
	name = "armor conversion kit - Freelance Cell Juggernaut Helmet"
	desc = "A handheld kit that can be used to permanently apply a custom paintjob to a <b>K12 ceramic helmet<b>."
	icon_state = "kit_freelancecell"

/obj/item/conversion_kit/freelancecell_helmet_heavy/attackby(obj/item/W as obj, mob/user as mob)
	if(istype(W,/obj/item/clothing/head/helmet/marine/veteran/mercenary))
		new /obj/item/clothing/head/helmet/marine/veteran/mercenary/freelancecell(get_turf(src))
		to_chat(user, "You apply the conversion kit to the helmet. You admire the sheer power this thing radiates - nothing is getting through that.")
		qdel(W)
		qdel(src)

/obj/item/conversion_kit/freelancecell_armor
	name = "armor conversion kit - Freelance Cell Armor: Style Alpha"
	desc = "A handheld kit that can be used to permanently apply a custom paintjob to a <b>Y8 armored miner vest<b>."
	icon_state = "kit_freelancecell"

/obj/item/conversion_kit/freelancecell_armor/attackby(obj/item/W as obj, mob/user as mob)
	if(istype(W,/obj/item/clothing/suit/storage/marine/veteran/mercenary/miner))
		new /obj/item/clothing/suit/storage/marine/veteran/mercenary/miner/freelancecell(get_turf(src))
		to_chat(user, "You apply the conversion kit to the armor. You suddenly feel like taking the dirtiest contract imaginable.")
		qdel(W)
		qdel(src)

/obj/item/conversion_kit/freelancecell_armor_alt
	name = "armor conversion kit - Freelance Cell Armor: Style Sigma"
	desc = "A handheld kit that can be used to permanently apply a custom paintjob to a <b>Y8 armored miner vest<b>."
	icon_state = "kit_freelancecell"

/obj/item/conversion_kit/freelancecell_armor_alt/attackby(obj/item/W as obj, mob/user as mob)
	if(istype(W,/obj/item/clothing/suit/storage/marine/veteran/mercenary/miner))
		new /obj/item/clothing/suit/storage/marine/veteran/mercenary/miner/freelancecell/alt(get_turf(src))
		to_chat(user, "You apply the conversion kit to the helmet. You suddenly feel like taking the dirtiest contract imaginable.")
		qdel(W)
		qdel(src)

/obj/item/conversion_kit/freelancecell_armor_heavy
	name = "armor conversion kit - Freelance Cell Juggernaut Armor"
	desc = "A handheld kit that can be used to permanently apply a custom paintjob to a set of <b>K12 ceramic plated armor<b>."
	icon_state = "kit_freelancecell"

/obj/item/conversion_kit/freelancecell_armor_heavy/attackby(obj/item/W as obj, mob/user as mob)
	if(istype(W,/obj/item/clothing/suit/storage/marine/veteran/mercenary))
		new /obj/item/clothing/suit/storage/marine/veteran/mercenary/freelancecell(get_turf(src))
		to_chat(user, "You apply the conversion kit to the armor. You admire the sheer power this thing radiates - nothing is getting through that.")
		qdel(W)
		qdel(src)

/obj/item/conversion_kit/marauder
	name = "weapon conversion kit - Marauder"
	desc = "A handheld kit that can be used to permanently apply a custom paintjob to an <b>RXF-M5 EVA pistol<b>."
	icon_state = "kit_haywood"

/obj/item/conversion_kit/marauder/attackby(obj/item/W as obj, mob/user as mob)
	if(istype(W,/obj/item/weapon/gun/energy/rxfm5_eva))
		new /obj/item/weapon/gun/energy/rxfm5_eva/marauder(get_turf(src))
		to_chat(user, "You apply the conversion kit to the laser pistol. You suddenly feel like building better worlds.")
		qdel(W)
		qdel(src)

/obj/item/conversion_kit/commandate
	name = "armor conversion kit - Commandate"
	desc = "A handheld kit that can be used to permanently apply a custom paintjob to a set of <b>M3 pattern marine armor<b>."
	icon_state = "kit_commandate"

/obj/item/conversion_kit/commandate/attackby(obj/item/W as obj, mob/user as mob)
	if(istype(W,/obj/item/clothing/suit/marine))
		new /obj/item/clothing/suit/marine/commandate(get_turf(src))
		to_chat(user, "You apply the conversion kit to the armor. You feel like you're in charge.")
		qdel(W)
		qdel(src)