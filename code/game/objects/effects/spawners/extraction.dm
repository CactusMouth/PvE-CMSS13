// guns
/obj/effect/spawner/random/gun/extraction
	mags_max = 4
	mags_min = 2

/obj/effect/spawner/random/gun/extraction/pistol/tier1
	name = "extraction pistol spawner (t1)"
	guns = list(
		/obj/item/weapon/gun/pistol/vp70,
		/obj/item/weapon/gun/pistol/m4a3,
		/obj/item/weapon/gun/pistol/t73,
		/obj/item/weapon/gun/pistol/m1911,
		/obj/item/weapon/gun/pistol/es4,
		/obj/item/weapon/gun/pistol/holdout,
		/obj/item/weapon/gun/pistol/l54,
		/obj/item/weapon/gun/smg/nailgun
	)
	icon_state = "loot_pistol"

/obj/effect/spawner/random/gun/extraction/pistol/tier2
	name = "extraction pistol spawner (t2)"
	guns = list(
		/obj/item/weapon/gun/pistol/pa76,
		/obj/item/weapon/gun/pistol/vp78,
		/obj/item/weapon/gun/pistol/m1911/socom,
		/obj/item/weapon/gun/pistol/highpower,
		/obj/item/weapon/gun/pistol/highpower/automag,
		/obj/item/weapon/gun/pistol/b92fs
	)
	icon_state = "loot_pistol"

/obj/effect/spawner/random/gun/extraction/smg/civilian
	name = "extraction smg spawner (t1)"
	guns = list(
		/obj/item/weapon/gun/smg/mac15,
		/obj/item/weapon/gun/smg/mp27,
		/obj/item/weapon/gun/smg/mp5,
		/obj/item/weapon/gun/smg/p90,
		/obj/item/weapon/gun/smg/ppsh,
		/obj/item/weapon/gun/smg/uzi
	)
	icon_state = "loot_smg"

/obj/effect/spawner/random/gun/extraction/smg/military
	name = "extraction smg spawner (t2)"
	guns = list(
		/obj/item/weapon/gun/smg/m39,
		/obj/item/weapon/gun/smg/m39/forecon,
		/obj/item/weapon/gun/smg/pps43,
		/obj/item/weapon/gun/smg/fp9000,
		/obj/item/weapon/gun/smg/bizon,
		/obj/item/weapon/gun/smg/bizon/upp
	)
	icon_state = "loot_smg"

/obj/effect/spawner/random/gun/extraction/rifle/civilian
	name = "extraction rifle spawner (t1)"
	guns = list(
		/obj/item/weapon/gun/rifle/mar40,
		/obj/item/weapon/gun/rifle/mar40/carbine,
		/obj/item/weapon/gun/rifle/l42a,
		/obj/item/weapon/gun/rifle/l42a/abr40,
		/obj/item/weapon/gun/rifle/ar10,
		/obj/item/weapon/gun/boltaction,
		/obj/item/weapon/gun/lever_action/r4t
	)
	icon_state = "loot_rifle"

/obj/effect/spawner/random/gun/extraction/rifle/military
	name = "extraction rifle spawner (t2)"
	guns = list(
		/obj/item/weapon/gun/rifle/m16,
		/obj/item/weapon/gun/rifle/m20a,
		/obj/item/weapon/gun/rifle/m20a/merc,
		/obj/item/weapon/gun/rifle/rmc_f90,
		/obj/item/weapon/gun/rifle/type71,
		/obj/item/weapon/gun/rifle/m41a,
		/obj/item/weapon/gun/rifle/m41aMK1,
		/obj/item/weapon/gun/rifle/ag80,
		/obj/item/weapon/gun/rifle/fn107,
		/obj/item/weapon/gun/rifle/fpsa,
		/obj/item/weapon/gun/rifle/lw317,
		/obj/item/weapon/gun/rifle/nsg23/no_lock
	)
	icon_state = "loot_rifle"

/obj/effect/spawner/random/gun/extraction/shotgun/civilian
	name = "extraction shotgun spawner (t1)"
	guns = list(
		/obj/item/weapon/gun/shotgun/double,
		/obj/item/weapon/gun/shotgun/double/damaged,
		/obj/item/weapon/gun/shotgun/double/sawn
	)
	icon_state = "loot_shotgun"

/obj/effect/spawner/random/gun/extraction/shotgun/military
	name = "extraction shotgun spawner (t2)"
	guns = list(
		/obj/item/weapon/gun/shotgun/combat,
		/obj/item/weapon/gun/shotgun/pump,
		/obj/item/weapon/gun/shotgun/pump/dual_tube/cmb,
		/obj/item/weapon/gun/shotgun/pump/type23,
		/obj/item/weapon/gun/shotgun/type23
	)
	icon_state = "loot_shotgun"

/obj/effect/spawner/random/gun/extraction/any/tier1
	name = "extraction gun spawner (t1)"
	guns = list(
		/obj/item/weapon/gun/pistol/vp70,
		/obj/item/weapon/gun/pistol/m4a3,
		/obj/item/weapon/gun/pistol/t73,
		/obj/item/weapon/gun/pistol/m1911,
		/obj/item/weapon/gun/pistol/es4,
		/obj/item/weapon/gun/pistol/holdout,
		/obj/item/weapon/gun/pistol/l54,
		/obj/item/weapon/gun/smg/nailgun,
		/obj/item/weapon/gun/smg/mac15,
		/obj/item/weapon/gun/smg/mp27,
		/obj/item/weapon/gun/smg/mp5,
		/obj/item/weapon/gun/smg/p90,
		/obj/item/weapon/gun/smg/ppsh,
		/obj/item/weapon/gun/smg/uzi,
		/obj/item/weapon/gun/rifle/mar40,
		/obj/item/weapon/gun/rifle/mar40/carbine,
		/obj/item/weapon/gun/rifle/l42a,
		/obj/item/weapon/gun/rifle/l42a/abr40,
		/obj/item/weapon/gun/rifle/ar10,
		/obj/item/weapon/gun/boltaction,
		/obj/item/weapon/gun/shotgun/double,
		/obj/item/weapon/gun/shotgun/double/damaged,
		/obj/item/weapon/gun/shotgun/double/sawn
	)
	icon_state = "ipool"

/obj/effect/spawner/random/gun/extraction/any/tier2
	name = "extraction gun spawner (t2)"
	guns = list(
		/obj/item/weapon/gun/pistol/pa76,
		/obj/item/weapon/gun/pistol/vp78,
		/obj/item/weapon/gun/pistol/m1911/socom,
		/obj/item/weapon/gun/pistol/highpower,
		/obj/item/weapon/gun/pistol/highpower/automag,
		/obj/item/weapon/gun/pistol/b92fs,
		/obj/item/weapon/gun/smg/m39,
		/obj/item/weapon/gun/smg/m39/forecon,
		/obj/item/weapon/gun/smg/pps43,
		/obj/item/weapon/gun/smg/fp9000,
		/obj/item/weapon/gun/smg/bizon,
		/obj/item/weapon/gun/rifle/m16,
		/obj/item/weapon/gun/rifle/m20a,
		/obj/item/weapon/gun/rifle/m20a/merc,
		/obj/item/weapon/gun/rifle/rmc_f90,
		/obj/item/weapon/gun/rifle/type71,
		/obj/item/weapon/gun/rifle/m41a,
		/obj/item/weapon/gun/rifle/m41aMK1,
		/obj/item/weapon/gun/rifle/ag80,
		/obj/item/weapon/gun/rifle/fn107,
		/obj/item/weapon/gun/rifle/fpsa,
		/obj/item/weapon/gun/rifle/lw317,
		/obj/item/weapon/gun/rifle/nsg23/no_lock,
		/obj/item/weapon/gun/shotgun/combat,
		/obj/item/weapon/gun/shotgun/pump,
		/obj/item/weapon/gun/shotgun/pump/dual_tube/cmb,
		/obj/item/weapon/gun/shotgun/pump/type23,
		/obj/item/weapon/gun/shotgun/type23
	)
	icon_state = "ipool"

// armor

/obj/effect/spawner/random/extraction/helmet/tier1
	name = "extraction helmet spawner (t1)"
	icon = 'icons/landmarks.dmi'
	icon_state = "loot_googles"

/obj/effect/spawner/random/extraction/helmet/tier1/item_to_spawn()
	return pick(/obj/item/clothing/head/helmet/construction,\
				/obj/item/clothing/head/helmet/marine/reporter,\
				/obj/item/clothing/head/militia/bucket,\
				/obj/item/clothing/head/militia,\
				/obj/item/clothing/head/hardhat,\
				/obj/item/clothing/head/hardhat/orange,\
				/obj/item/clothing/head/helmet/marine/veteran/pmc/corporate,\
				/obj/item/clothing/head/helmet/marine/veteran/pmc/corporate/hybrisa,\
				/obj/item/clothing/head/helmet/riot,\
				)

/obj/effect/spawner/random/extraction/helmet/tier2
	name = "extraction helmet spawner (t2)"
	icon = 'icons/landmarks.dmi'
	icon_state = "loot_googles"

/obj/effect/spawner/random/extraction/helmet/tier2/item_to_spawn()
	return pick(/obj/item/clothing/head/helmet/marine,\
				/obj/item/clothing/head/helmet/marine/M3T,\
				/obj/item/clothing/head/helmet/marine/MP,\
				/obj/item/clothing/head/helmet/marine/covert,\
				/obj/item/clothing/head/helmet/marine/leader,\
				/obj/item/clothing/head/helmet/marine/medic,\
				/obj/item/clothing/head/helmet/marine/medic/white,\
				/obj/item/clothing/head/helmet/marine/rto,\
				/obj/item/clothing/head/helmet/marine/scout,\
				/obj/item/clothing/head/helmet/marine/veteran/mercenary/marauder,\
				/obj/item/clothing/head/helmet/marine/veteran/mercenary/marauder/miner,\
				/obj/item/clothing/head/helmet/marine/veteran/mercenary/marauder/support,\
				/obj/item/clothing/head/helmet/marine/veteran/pmc,\
				/obj/item/clothing/head/helmet/marine/veteran/pmc/gunner,\
				/obj/item/clothing/head/helmet/marine/veteran/pmc/gunner/rmc,\
				/obj/item/clothing/head/helmet/marine/veteran/royal_marine,\
				/obj/item/clothing/head/helmet/marine/veteran/canc,\
				/obj/item/clothing/head/helmet/marine/veteran/UPP/old,\
				/obj/item/clothing/head/helmet/marine/veteran/UPP,\
				/obj/item/clothing/head/helmet/marine/tech/tanker,\
				)

/obj/effect/spawner/random/extraction/armor/tier1
	name = "extraction suit spawner (t1)"
	icon = 'icons/landmarks.dmi'
	icon_state = "loot_googles"

/obj/effect/spawner/random/extraction/armor/tier1/item_to_spawn()
	return pick(/obj/item/clothing/suit/armor/riot,\
				/obj/item/clothing/suit/armor/vest,\
				/obj/item/clothing/suit/armor/vest/ballistic,\
				/obj/item/clothing/suit/armor/vest/hybrisa/cmb_vest,\
				/obj/item/clothing/suit/armor/vest/hybrisa/nspa_vest,\
				/obj/item/clothing/suit/armor/vest/pilot,\
				/obj/item/clothing/suit/armor/vest/security,\
				/obj/item/clothing/suit/marine/light,\
				/obj/item/clothing/suit/storage/marine/veteran/merc/light,\
				/obj/item/clothing/suit/storage/marine/veteran/fil/light,\
				/obj/item/clothing/suit/storage/marine/veteran/pmc/light,\
				)

/obj/effect/spawner/random/extraction/armor/tier2
	name = "extraction suit spawner (t2)"
	icon = 'icons/landmarks.dmi'
	icon_state = "loot_googles"

/obj/effect/spawner/random/extraction/armor/tier2/item_to_spawn()
	return pick(/obj/item/clothing/suit/marine,\
				/obj/item/clothing/suit/marine/faction/UPP,\
				/obj/item/clothing/suit/marine/faction/UPP/CANC,\
				/obj/item/clothing/suit/marine/rto,\
				/obj/item/clothing/suit/marine/smartgunner,\
				/obj/item/clothing/suit/marine/smartgunner/upp,\
				/obj/item/clothing/suit/marine/veteran/royal_marine,\
				/obj/item/clothing/suit/storage/marine/veteran/mercenary/marauder,\
				/obj/item/clothing/suit/storage/marine/veteran/mercenary/marauder/miner,\
				/obj/item/clothing/suit/storage/marine/veteran/mercenary/marauder/support,\
				/obj/item/clothing/head/helmet/marine/veteran/mercenary/marauder/miner,\
				/obj/item/clothing/head/helmet/marine/veteran/mercenary/marauder/support,\
				/obj/item/clothing/head/helmet/marine/veteran/pmc,\
				/obj/item/clothing/head/helmet/marine/veteran/pmc/gunner,\
				/obj/item/clothing/head/helmet/marine/veteran/pmc/gunner/rmc,\
				/obj/item/clothing/head/helmet/marine/veteran/royal_marine,\
				/obj/item/clothing/suit/marine/veteran/royal_marine/smartgun,\
				/obj/item/clothing/head/helmet/marine/veteran/canc,\
				/obj/item/clothing/head/helmet/marine/veteran/UPP/old,\
				/obj/item/clothing/head/helmet/marine/veteran/UPP,\
				/obj/item/clothing/head/helmet/marine/tech/tanker,\
				/obj/item/clothing/suit/storage/marine/veteran/merc,\
				/obj/item/clothing/suit/storage/marine/veteran/merc/heavy,\
				/obj/item/clothing/suit/storage/marine/veteran/fil,\
				/obj/item/clothing/suit/storage/marine/veteran/royal_marine_advanced,\
				/obj/item/clothing/suit/storage/marine/veteran/royal_marine_advanced/cargo,\
				/obj/item/clothing/suit/storage/marine/veteran/ua_riot,\
				/obj/item/clothing/suit/storage/marine/veteran/pmc,\
				/obj/item/clothing/suit/storage/marine/veteran/pmc/leader,\
				)