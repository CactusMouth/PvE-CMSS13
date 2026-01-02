/datum/human_ai_squad_preset/scav
	faction = FACTION_SCAV

// scavs

/datum/human_ai_squad_preset/scav/scav_pistols
	name = "Scavs, Fireteam (Pistols)"
	desc = "Two poorly-equipped wandering scavs, each armed with a basic pistol."
	ai_to_spawn = list(
		/datum/equipment_preset/scav/pistol = 2
	)

/datum/human_ai_squad_preset/scav/scav_rifle
	name = "Scavs, Squad (Rifle & Pistols)"
	desc = "Three scavengers: one with a rifle, the other two armed with pistols."
	ai_to_spawn = list(
		/datum/equipment_preset/scav/rifle = 1,
		/datum/equipment_preset/scav/pistol = 2
	)

/datum/human_ai_squad_preset/scav/scav_shotgun
	name = "Scavs, Squad (Shotgun & Pistols)"
	desc = "Three scavengers: one with a shotgun and two with pistols."
	ai_to_spawn = list(
		/datum/equipment_preset/scav/shotgun = 1,
		/datum/equipment_preset/scav/pistol = 2
	)

// Marauder & scav mix

/datum/human_ai_squad_preset/scav/mix_rifles
	name = "Marauder & Scavs, Squad (Rifles)"
	desc = "A mixed group of one marauder and two scavs, all equipped with rifles."
	ai_to_spawn = list(
		/datum/equipment_preset/scav/rifle/elite = 1,
		/datum/equipment_preset/scav/rifle = 2
	)

/datum/human_ai_squad_preset/scav/mix_shotgun
	name = "Marauder & Scavs, Squad (Shotguns)"
	desc = "A mixed group of one marauder and two scavs, all armed with shotguns."
	ai_to_spawn = list(
		/datum/equipment_preset/scav/shotgun/elite = 1,
		/datum/equipment_preset/scav/shotgun = 2
	)

/datum/human_ai_squad_preset/scav/mix_antitank
	name = "Marauder & Scavs, Squad (AT)"
	desc = "A mixed three-man team: one marauder with a SADAR, one scav with a shotgun, and one scav with a rifle."
	ai_to_spawn = list(
		/datum/equipment_preset/scav/antitank = 1,
		/datum/equipment_preset/scav/shotgun = 1,
		/datum/equipment_preset/scav/rifle = 1
	)

// Marauders

/datum/human_ai_squad_preset/scav/marauder_rifles
	name = "Marauders, Fireteam (Rifle+)"
	desc = "A three-man marauder patrol, all equipped with advanced rifles."
	ai_to_spawn = list(
		/datum/equipment_preset/scav/rifle/elite = 3
	)

/datum/human_ai_squad_preset/scav/marauder_shotguns
	name = "Marauders, Fireteam (Shotguns+)"
	desc = "A three-man marauder patrol, all equipped with advanced shotguns."
	ai_to_spawn = list(
		/datum/equipment_preset/scav/shotgun/elite = 3
	)

/datum/human_ai_squad_preset/scav/marauder_rifles_shotgun
	name = "Marauders, Fireteam (Rifle+, Shotgun+)"
	desc = "A marauder fireteam with two advanced riflemen and one shotgunner."
	ai_to_spawn = list(
		/datum/equipment_preset/scav/rifle/elite = 2,
		/datum/equipment_preset/scav/shotgun/elite = 1,
	)

/datum/human_ai_squad_preset/scav/marauder_machinegun
	name = "Marauders, Heavy Weapon Fireteam (Heavy, Rifle+)"
	desc = "A marauder heavy squad: one machine gunner and two riflemen."
	ai_to_spawn = list(
		/datum/equipment_preset/scav/machinegun = 1,
		/datum/equipment_preset/scav/rifle/elite = 2,
	)

/datum/human_ai_squad_preset/scav/marauder_antitank
	name = "Marauders, Antitank Fireteam (SADAR, Rifle+)"
	desc = "A marauder team with one SADAR operator supported by two riflemen."
	ai_to_spawn = list(
		/datum/equipment_preset/scav/antitank = 1,
		/datum/equipment_preset/scav/rifle/elite = 2,
	)
