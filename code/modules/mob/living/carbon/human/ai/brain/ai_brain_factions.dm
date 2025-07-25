/datum/human_ai_faction
	/// What actual faction is this faction tied to
	var/faction = FACTION_NEUTRAL
	/// If FALSE, the AI will not intentionally kill enemies. The enemies may still be killed by crossfire, explosives, etc.
	VAR_PROTECTED/shoot_to_kill = TRUE

	VAR_PROTECTED/list/enter_combat_lines = list()
	VAR_PROTECTED/list/exit_combat_lines = list()
	VAR_PROTECTED/list/squad_member_death_lines = list()
	VAR_PROTECTED/list/grenade_thrown_lines = list()
	VAR_PROTECTED/list/reload_lines = list()
	VAR_PROTECTED/list/reload_internal_mag_lines = list()
	VAR_PROTECTED/list/need_healing_lines = list()

	VAR_PROTECTED/list/friendly_factions = list()
	VAR_PROTECTED/list/neutral_factions = list()

/// Given an AI brain, apply all the faction's data to the AI.
/datum/human_ai_faction/proc/apply_faction_data(datum/human_ai_brain/brain)
	if(length(enter_combat_lines))
		brain.enter_combat_lines = enter_combat_lines

	if(length(exit_combat_lines))
		brain.exit_combat_lines = exit_combat_lines

	if(length(squad_member_death_lines))
		brain.squad_member_death_lines = squad_member_death_lines

	if(length(grenade_thrown_lines))
		brain.grenade_thrown_lines = grenade_thrown_lines

	if(length(reload_lines))
		brain.reload_lines = reload_lines

	if(length(reload_internal_mag_lines))
		brain.reload_internal_mag_lines = reload_internal_mag_lines

	if(length(need_healing_lines))
		brain.need_healing_lines = need_healing_lines

	brain.shoot_to_kill = shoot_to_kill
	brain.friendly_factions = friendly_factions
	brain.neutral_factions = neutral_factions

/// Reapplies the faction's data to all AI that belong to this faction
/datum/human_ai_faction/proc/reapply_faction_data()
	for(var/datum/human_ai_brain/brain in GLOB.human_ai_brains)
		if(brain.tied_human?.faction == faction)
			apply_faction_data(brain)

/// Given a faction string, makes this faction friendly to them.
/datum/human_ai_faction/proc/add_friendly_faction(faction)
	if(faction in friendly_factions)
		return
	friendly_factions += faction
	if(faction in neutral_factions)
		neutral_factions -= faction
	reapply_faction_data()

/// Given a faction string, makes this faction neutral to them.
/datum/human_ai_faction/proc/add_neutral_faction(faction)
	if(faction in neutral_factions)
		return
	neutral_factions += faction
	if(faction in friendly_factions)
		friendly_factions -= faction
	reapply_faction_data()

/// Given a faction string, removes a faction's friendly status, making them hostile instead.
/datum/human_ai_faction/proc/remove_friendly_faction(faction)
	if(!(faction in friendly_factions))
		return
	friendly_factions -= faction
	reapply_faction_data()

/// Given a faction string, removes a faction's neutral status, making them hostile instead.
/datum/human_ai_faction/proc/remove_neutral_faction(faction)
	if(!(faction in neutral_factions))
		return
	neutral_factions -= faction
	reapply_faction_data()

/// Getter for friendly_factions
/datum/human_ai_faction/proc/get_friendly_factions()
	return friendly_factions

/// Getter for neutral_factions
/datum/human_ai_faction/proc/get_neutral_factions()
	return neutral_factions

/// Setter for shoot_to_kill
/datum/human_ai_faction/proc/set_shoot_to_kill(new_kill = TRUE)
	shoot_to_kill = new_kill
	reapply_faction_data()

/// Getter for shoot_to_kill
/datum/human_ai_faction/proc/get_shoot_to_kill()
	return shoot_to_kill

/datum/human_ai_faction/colonist
	faction = FACTION_COLONIST
	friendly_factions = list(
		FACTION_SURVIVOR,
		FACTION_MARINE,
		FACTION_ARMY,
		FACTION_NAVY,
		FACTION_UPP,
		FACTION_MARSHAL,
		FACTION_UACG,
		FACTION_TWE,
		FACTION_WY,
		FACTION_PMC,
	)
	neutral_factions = list(
		FACTION_FREELANCER,
		FACTION_CONTRACTOR,
		FACTION_MERCENARY,
		FACTION_CANC,
		FACTION_TWE_REBEL,
		FACTION_UA_REBEL,
	)

/datum/human_ai_faction/contractor
	faction = FACTION_CONTRACTOR
	friendly_factions = list(
		FACTION_SURVIVOR,
		FACTION_MARINE,
		FACTION_ARMY,
		FACTION_NAVY,
		FACTION_UPP,
		FACTION_MARSHAL,
		FACTION_UACG,
		FACTION_TWE,
		FACTION_WY,
		FACTION_PMC,
	)
	neutral_factions = list(
		FACTION_FREELANCER,
		FACTION_MERCENARY,
		FACTION_CANC,
		FACTION_TWE_REBEL,
		FACTION_UA_REBEL,
	)

/datum/human_ai_faction/merc
	faction = FACTION_MERCENARY
	friendly_factions = list(
		FACTION_SURVIVOR,
		FACTION_MARINE,
		FACTION_ARMY,
		FACTION_NAVY,
		FACTION_UPP,
		FACTION_MARSHAL,
		FACTION_UACG,
		FACTION_TWE,
		FACTION_WY,
		FACTION_PMC,
	)
	neutral_factions = list(
		FACTION_FREELANCER,
		FACTION_CONTRACTOR,
		FACTION_CANC,
		FACTION_TWE_REBEL,
		FACTION_UA_REBEL,
	)

/datum/human_ai_faction/lancer
	faction = FACTION_FREELANCER
	friendly_factions = list(
		FACTION_SURVIVOR,
		FACTION_MARINE,
		FACTION_ARMY,
		FACTION_NAVY,
		FACTION_UPP,
		FACTION_MARSHAL,
		FACTION_UACG,
		FACTION_TWE,
		FACTION_WY,
		FACTION_PMC,
	)
	neutral_factions = list(
		FACTION_CONTRACTOR,
		FACTION_MERCENARY,
		FACTION_CANC,
		FACTION_TWE_REBEL,
		FACTION_UA_REBEL,
	)

/datum/human_ai_faction/twerebel
	faction = FACTION_TWE_REBEL
	friendly_factions = list(
		FACTION_COLONIST,
	)
	neutral_factions = list(
		FACTION_SURVIVOR,
	)
	enter_combat_lines = list(
		"Look alive!",
		"There!",
		"Over there!",
		"OPEN FIRE!",
		"Open fire!",
		"ENGAGE!",
		"Engage!",
		"Cut them down!",
		"*warcry",
		"Push them back!",
		"PUSH THEM BACK!",
		"FOR THE PEOPLE'S REVOLUTION!",
		"FOR OUR FRIENDS AND FAMILIES!",
		"FOR THE OPPRESSED MASSES!",
		"FIGHT TO THE LAST!",
		"POWER TO THE PEOPLE!",
		"POWER TO THE PROLITARIAT!",
		"DEFEND THE DREAM!",
		"DEFEND THE REVOLUTION!",
		"Attack!",
		"ATTACK!",
		"Charge!",
		"CHARGE!",
		"NO MERCY!",
		"No mercy!",
		"NO QUARTER!",
		"No quarter!",
		"Die!",
		"Give up!",
		"YOU'VE ALREADY LOST!",
		"WHILE WE STILL DRAW BREATH, WE WILL FIGHT!",
	)
	exit_combat_lines = list(
		"STOP SHOOTING!",
		"Cease fire!",
		"Cease your fire!",
		"Hold your fire!",
		"HOLD FIRE!",
		"We're clear!",
		"Are we clear?",
		"Looks clear!",
		"CLEAR!",
		"Stay vigilant!",
		"There may be more- stay vigilant.",
	)
	squad_member_death_lines = list(
		"FUCK!",
		"SHIT!",
		"CRAP!",
		"MOTHERFUCKER!",
		"DAMN IT!",
		"WE'RE HURT!",
		"THEY GOT THEM-- IT WON'T GO UNPAID FOR!",
		"YOU'LL PAY, MOTHERFUCKER!",
		"YOU'LL PAY, ASSHOLE!",
		"THEY'RE DOWN!",
		"THEY'RE DEAD!",
		"THEY GOT THEM!",
		"NO!",
		"No!",
		"IT WON'T HAVE BEEN IN VAIN, COMRADE!",
		"NOT IN VAIN, COMRADE!",
		"COMRADE!",
	)
	grenade_thrown_lines = list(
		"EAT THIS!",
		"GRENADE BEING THROWN!",
		"THROWING A GRENADE!",
		"PUSH THEM BACK!",
		"FOR THE PEOPLE'S REVOLUTION!",
		"FOR OUR FRIENDS AND FAMILIES!",
		"FOR THE OPPRESSED MASSES!",
		"FIGHT TO THE LAST!",
		"POWER TO THE PEOPLE!",
		"POWER TO THE PROLITARIAT!",
		"DEFEND THE DREAM!",
		"DEFEND THE REVOLUTION!",
	)
	reload_lines = list(
		"RELOADING!",
		"Reloading!",
		"Swapping magazines!",
		"Swapping mags!",
		"Changing magazines!",
		"Changing mags!",
		"Cover me, reloading!",
		"NEED COVERING FIRE!",
		"COVER ME!",
		"I HAVE TO RELOAD!",
	)
	reload_internal_mag_lines = list(
		"RELOADING!",
		"Reloading!",
		"Cover me, reloading!",
		"NEED COVERING FIRE!",
		"COVER ME, RELOADING!",
		"COVER ME!",
		"I HAVE TO RELOAD!",
	)
/datum/human_ai_faction/uarebels
	faction = FACTION_UA_REBEL
	friendly_factions = list(
		FACTION_COLONIST,
	)
	neutral_factions = list(
		FACTION_SURVIVOR,
	)
	enter_combat_lines = list(
		"CONTACT!",
		"Contact!",
		"I GOT CONTACT!",
		"SHIT- CONTACT!",
		"CONTACT, FRONT!",
		"WE GOT CONTACT!",
		"Look alive!",
		"GUNS UP!",
		"There!",
		"Over there!",
		"OPEN FIRE!",
		"Open fire!",
		"ENGAGE!",
		"Engage!",
		"Weapons free!",
		"WEAPONS FREE!",
		"Weapons hot!",
		"Wipe 'em out!",
		"Light 'em up!",
		"Drop 'em!",
		"Cut 'em down!",
		"Bring 'em down!",
		"Fuck 'em up!",
		"WASTE THE MOTHERFUCKERS!",
		"Kill that fucker!",
		"Ice that fucker!",
		"Eat shit!",
		"Die, you son of a bitch!",
		"Get some!",
		"GET SOME!",
		"GET SOME, MOTHERFUCKER!",
		"*warcry",
		"KILL! KILL! KILL!",
		"KILL!",
		"COME AND GET SOME, MOTHERFUCKER!",
		"Let's rock!",
		"LET'S ROCK!",
		"ROCK OUT, MOTHERFUCKERS!",
		"X-RAY!",
		"X-RAY SPOTTED!",
		"TANGO!",
		"TANGO SPOTTED!",
		"Bring it!",
		"BRING IT!",
		"Bring it on, BRING IT ON!",
		"ENEMY ON APPROACH!",
		"MAKE MY DAY, BITCH!",
		"MAKE MY DAY, MOTHERFUCKER!",
		"ACTIVITY!",
		"Company!",
		"COMPANY!",
		"Sic Semper Tyrannis!",
		"SIC SEMPER TYRANNIS!",
		"TRAITORS!",
		"COWARDS!",
		"YOU FUCKIN' PIGS!",
		"YOU FUCKIN' DOGS!",
		"YOU FUCKIN' SWINE!",
		"YOU FUCKIN' COWARDS!",
		"YOU FUCKIN' JACKBOOTS!",
		"YOU FUCKIN' TRAITORS!",
		"YOU FUCKIN' LACKEYS!",
		"LIBERTY!",
		"LIBERTY FOREVER!",
		"LIBERTY, MOTHERFUCKER!",
		"FREEDOM, MOTHERFUCKER!",
		"FREEDOM!",
		"FREEDOM FOREVER!",
		"THUS ALWAYS TO TYRANTS!",
		"ALL THREATS; FOREIGN *AND* DOMESTIC!",
	)
	exit_combat_lines = list(
		"CEASE FIRE!",
		"Cease fire!",
		"Cease your fire!",
		"Hold your fire!",
		"HOLD FIRE!",
		"We're clear!",
		"We clear?",
		"Looks clear!",
		"CLEAR!",
		"Clear!",
		"Keep your eyes peeled!",
		"Might be more- Keep your eyes peeled.",
		"Might be more- Don't get too comfortable.",
		"Stay quiet.",
		"Stay sharp.",
		"Stay sharp!",
		"Check your vitals.",
		"We're clear! Take a breather!",
		"We're clear! Sound off!",
		"Oorah.",
		"Oo- fuckin'- 'rah.",
		"Hooah.",
		"Hoo'- fuckin' -ah.",
		"I got mine...",
		"And that's how you water the tree of liberty.",
		"I need a break...",
		"Need a fuckin' smoke after that...",
		"Need a fuckin' cigarette after that...",
		"Need a fuckin' shot after that...",
		"Save the United States, serve the people... what are we even doin'...?",
		"Free the United States, destroy the corporations... what are we even doin'...?",
		"Make them leave, get our jobs back... what are we even doin'...?",
		"Uncover the agenda, save the United Americas... what are we even doin'...?",
		"Uncover the agenda, save the United States... what are we even doin'...?",
		"SNAFU...",
		"Situation normal; all fucked up...",
		"This, is fucking FUBAR, man...",
		"Never gets easier...",
		"Never gets old...",
		"Holy Mary, mother of God pray for us sinners...",
		"Hail Mary, full of grace...",
		"Our Father, who art in heaven...",
		"I need my medication...",
		"I can't see straight...",
		"Vision is getting a little blurry...",
		"Man up. Just, man up...",
	)
	squad_member_death_lines = list(
		"FUCK!",
		"SHIT!",
		"CRAP!",
		"MOTHERFUCKER!",
		"DAMN IT!",
		"WE'RE HURT!",
		"THEY GOT THEM-- IT GO UNPAID FOR!",
		"YOU'LL PAY, MOTHERFUCKER!",
		"YOU'LL PAY, ASSHOLE!",
		"THEY'RE DOWN!",
		"THEY'RE DEAD!",
		"THEY GOT THEM!",
		"NO!",
		"No!",
		"IT WON'T HAVE BEEN IN VAIN, COMRADE!",
		"NOT IN VAIN, COMRADE!",
		"COMRADE!",
	)
	grenade_thrown_lines = list(
		"EAT THIS!",
		"GRENADE BEING THROWN!",
		"THROWING A GRENADE!",
		"PUSH THEM BACK!",
		"MAKE MY DAY, MOTHERFUCKER!",
		"SIC SEMPER TYRANNIS!",
		"TRAITORS!",
		"COWARDS!",
		"YOU FUCKIN' PIGS!",
		"YOU FUCKIN' DOGS!",
		"YOU FUCKIN' SWINE!",
		"YOU FUCKIN' COWARDS!",
		"YOU FUCKIN' JACKBOOTS!",
		"YOU FUCKIN' TRAITORS!",
		"YOU FUCKIN' LACKEYS!",
		"LIBERTY!",
		"LIBERTY FOREVER!",
		"LIBERTY, MOTHERFUCKER!",
		"FREEDOM, MOTHERFUCKER!",
		"FREEDOM!",
		"FREEDOM FOREVER!",
		"THUS ALWAYS TO TYRANTS!",
		"THUS ALWAYS, COCKSUCKERS!",
		"ALL THREATS; FOREIGN *AND* DOMESTIC!",
	)

/datum/human_ai_faction/ua_colonial_forces //CMB & UACG mostly
	faction = FACTION_MARSHAL
	friendly_factions = list(
		FACTION_ARMY,
		FACTION_NAVY,
		FACTION_COLONIST,
		FACTION_MARINE,
		FACTION_WY,
		FACTION_UACG,
	)
	neutral_factions = list(
		FACTION_FREELANCER,
		FACTION_CONTRACTOR,
		FACTION_TWE,
		FACTION_PMC,
		FACTION_MERCENARY,
		FACTION_SURVIVOR,
	)
	enter_combat_lines = list(
		"Woah, woah!",
		"Taking fire!",
		"Shots fired!",
		"Unit taking fire!",
		"Don't do it!",
		"Shit! Shots fired!",
		"Gun! Gun!",
		"Time to cowboy up!",
		"You're gonna wish you stayed at home.",
		"Never should have come here!",
	)
	exit_combat_lines = list(
		"Sweep and clear.",
		"Stay sharp.",
		"Make sure that's the last of them",
		"Stay sharp!",
		"Glad that's done with...",
		"I need a smoke...",
		"Is that all of them?",
		"What the hell am I doing here...",
		"Clear? We clear? Sound off!",
		"Jesus Christ...",
		"Put 'em on safe and let them hang, guys.",
	)
	squad_member_death_lines = list(
		"Man down!",
		"We got a man down here!",
		"Shit! They're wasted!",
		"Oh shit, shit, shit...",
		"Get back! Get back!",
		"I got a bad feeling about this...",
		"Shit! This can't be happening...",
		"They're down, get a medic up here now!",
		"Oh fuck! It's fucked!",
		"This was just supposed to be civil disturbances!",
		"Jesus, I didn't sign up for this!",
		"Oh god... What am I gonna tell their family..?",
	)
	reload_lines = list(
		"Reloading!",
		"I'm out!",
		"Cover me, down to harsh language here!",
		"New mag going in.",
		"Changing mag!",
		"I'm dry! Reloading!",
		"Reloadi- Oops, dropped my mag there.",
		"Dammit, I'm dry!",
		"Should've spent more time on the range..!",
	)
	grenade_thrown_lines = list(
		"Grenade!",
		"Throwing grenade!",
		"Frag, frag!",
		"Banger, out!",
		"Suck on this!",
		"Hope I don't blow myself up with this!",
	)

/datum/human_ai_faction/uscm
	faction = FACTION_MARINE
	friendly_factions = list(
		FACTION_ARMY,
		FACTION_NAVY,
		FACTION_COLONIST,
		FACTION_MARSHAL,
		FACTION_UACG,
	)
	neutral_factions = list(
		FACTION_TWE,
		FACTION_WY,
		FACTION_PMC,
		FACTION_FREELANCER,
		FACTION_CONTRACTOR,
		FACTION_MERCENARY,
		FACTION_SURVIVOR,
	)
	enter_combat_lines = list(
		"CONTACT!",
		"Contact!",
		"I GOT CONTACT!",
		"SHIT- CONTACT!",
		"CONTACT, FRONT!",
		"WE GOT CONTACT!",
		"Look alive!",
		"GUNS UP!",
		"There!",
		"Over there!",
		"OPEN FIRE!",
		"Open fire!",
		"ENGAGE!",
		"Engage!",
		"Weapons free!",
		"WEAPONS FREE!",
		"Weapons hot!",
		"Wipe 'em out!",
		"Light 'em up!",
		"Drop 'em!",
		"Cut 'em down!",
		"Bring 'em down!",
		"Fuck 'em up!",
		"WASTE THE MOTHERFUCKERS!",
		"Kill that fucker!",
		"Ice that fucker!",
		"Eat shit!",
		"Get some!",
		"GET SOME!",
		"GET SOME, MOTHERFUCKER!",
		"*warcry",
		"KILL! KILL! KILL!",
		"KILL!",
		"COME AND GET SOME, MOTHERFUCKER!",
		"Let's rock!",
		"LET'S ROCK!",
		"ROCK OUT, MOTHERFUCKERS!",
		"X-RAY!",
		"X-RAY SPOTTED!",
		"TANGO!",
		"TANGO SPOTTED!",
		"Bring it!",
		"BRING IT!",
		"Bring it on, BRING IT ON!",
		"ENEMY ON APPROACH!",
		"MAKE MY DAY, BITCH!",
		"MAKE MY DAY, MOTHERFUCKER!",
		"ACTIVITY!",
		"Company!",
		"COMPANY!",
	)
	exit_combat_lines = list(
		"CEASE FIRE!",
		"Cease fire!",
		"Cease your fire!",
		"Hold your fire!",
		"HOLD FIRE!",
		"We're clear!",
		"We clear?",
		"Looks clear!",
		"CLEAR!",
		"Clear!",
		"Keep your eyes peeled!",
		"Might be more- Keep your eyes peeled.",
		"Might be more- Don't get too comfortable.",
		"Stay quiet.",
		"Stay sharp.",
		"Stay sharp!",
		"Check your vitals.",
		"We're clear! Take a breather!",
		"We're clear! Sound off!",
		"Oorah.",
		"Oo- fuckin'- 'rah.",
		"I got mine...",
		"Another day in the Corps...",
		"I need a break...",
		"Need a fuckin' smoke after that...",
		"Need a fuckin' cigarette after that...",
		"Need a fuckin' shot after that...",
		"See the universe they said, meet interesting people...",
		"SNAFU...",
		"Situation normal; all fucked up...",
		"This, is fucking FUBAR, man...",
		"Never gets easier...",
		"Holy Mary, mother of God pray for us sinners...",
		"Hail Mary, full of grace...",
		"Our Father, who art in heaven...",
	)
	squad_member_death_lines = list(
		"FUCK!",
		"SHIT!",
		"CRAP!",
		"MOTHERFUCKER!",
		"GOD DAMN IT!",
		"WE'RE TAKING HITS HERE!",
		"THEY GOT THEM-- RETURN THE FUCKING FAVOUR!",
		"YOU'LL FUCKIN' PAY, MOTHERFUCKER!",
		"YOU'LL FUCKIN' PAY, ASSHOLE!",
		"THEY'RE DOWN!",
		"THEY'RE DEAD!",
		"THEY GOT THEM!",
		"THEY'RE HIT BAD!",
		"THEY'RE FUCKIN' DEAD, MAN! THEY'RE FUCKIN' DEAD!",
		"GOD DAMN IT, WHY YOU?",
		"CORPSMAN, GET THE FUCK OVER HERE!",
		"GET DOC OVER HERE!",
		"DOC!",
		"CORPSMAN!",
		"DEVIL DOG DOWN!",
		"MARINE DOWN!",
		"MERCIFUL CHRIST!",
		"SWEET JESUS!",
		"MARY, MOTHER OF GOD!",
		"JESUS CHRIST!",
		"NO- NO, NOT LIKE THIS, MAN!",
		"DON'T YOU FUCKIN' DIE ON ME, MOTHERFUCKER- STAY ALIVE!",
		"THEY FUCKIN' KILLED THEM!",
		"FUBAR, MAN!",
	)
	reload_lines = list(
		"RELOADING!",
		"Reloading!",
		"Swapping magazines!",
		"Swapping mags!",
		"Changing magazines!",
		"Changing mags!",
		"Cover me, reloading!",
		"NEED COVERING FIRE!",
		"COVER ME!",
		"RED! RED!-- GREEN!",
		"I'M RED!",
		"RED!",
	)
	reload_internal_mag_lines = list(
		"RELOADING!",
		"Reloading!",
		"Cover me, reloading!",
		"NEED COVERING FIRE!",
		"COVER MY FUCKIN' ASS, RELOADING!",
		"COVER ME!",
		"RED! RED!-- GREEN!",
		"I'M RED!",
		"I NEED A FUCKING SPEEDLOADER- CHRIST!",
		"RED!",
	)
	grenade_thrown_lines = list(
		"GRENADE!",
		"THROWING GRENADE!",
		"GRENADE, GET CLEAR!",
		"GRENADE OUT!",
		"CLEAR OUT, GRENADE!",
		"'NADE OUT!",
		"TOSSIN' A NADE!",
		"TOSSIN' A GRENADE!",
		"EAT IT, FUCKER!",
		"RETURN TO SENDER!",
		"DELIVERY, MOTHERFUCKER!",
		"*warcry",
	)
	need_healing_lines = list(
		"FUCK ME!",
		"FUCK!",
		"SHIT!",
		"CRAP!",
		"MOTHERFUCKER!",
		"GOD DAMN IT!",
		"JESUS CHRIST!",
		"BLEEDING!",
		"MOTHER OF GOD-- NO!",
		"I'M TAKING HITS HERE!",
		"I'M HIT!",
		"I'M HURT!",
		"INJECTOR GOING IN!",
		"INJECTOR IN!",
		"I NEED GAUZE!",
		"SOMEONE PATCH THIS FUCKING HOLE!",
		"NEED MORPHINE!",
		"NEED MORPHINE!",
		"CORPSMAN, GET THE FUCK OVER HERE!",
		"GET DOC OVER HERE!",
		"DOC!",
		"CORPSMAN!",
		"I'M FUBAR, MAN!",
	)

/datum/human_ai_faction/usa
	faction = FACTION_ARMY
	friendly_factions = list(
		FACTION_MARINE,
		FACTION_NAVY,
		FACTION_COLONIST,
		FACTION_MARSHAL,
		FACTION_UACG,
	)
	neutral_factions = list(
		FACTION_TWE,
		FACTION_WY,
		FACTION_PMC,
		FACTION_FREELANCER,
		FACTION_CONTRACTOR,
		FACTION_MERCENARY,
		FACTION_SURVIVOR,
	)
	enter_combat_lines = list(
		"CONTACT!",
		"Contact!",
		"I GOT CONTACT!",
		"SHIT- CONTACT!",
		"CONTACT, FRONT!",
		"WE GOT CONTACT!",
		"Look alive!",
		"GUNS UP!",
		"There!",
		"Over there!",
		"OPEN FIRE!",
		"Open fire!",
		"ENGAGE!",
		"Engage!",
		"Weapons free!",
		"WEAPONS FREE!",
		"Weapons hot!",
		"Wipe 'em out!",
		"Light 'em up!",
		"Drop 'em!",
		"Cut 'em down!",
		"Bring 'em down!",
		"Fuck 'em up!",
		"WASTE THE MOTHERFUCKERS!",
		"Kill that fucker!",
		"Ice that fucker!",
		"Eat shit!",
		"Get some!",
		"GET SOME!",
		"GET SOME, MOTHERFUCKER!",
		"*warcry",
		"KILL! KILL! KILL!",
		"KILL!",
		"COME AND GET SOME, MOTHERFUCKER!",
		"Let's rock!",
		"LET'S ROCK!",
		"ROCK OUT, MOTHERFUCKERS!",
		"X-RAY!",
		"X-RAY SPOTTED!",
		"TANGO!",
		"TANGO SPOTTED!",
		"Bring it!",
		"BRING IT!",
		"Bring it on, BRING IT ON!",
		"ENEMY ON APPROACH!",
		"MAKE MY DAY, BITCH!",
		"MAKE MY DAY, MOTHERFUCKER!",
		"ACTIVITY!",
		"Company!",
		"COMPANY!",
	)
	exit_combat_lines = list(
		"CEASE FIRE!",
		"Cease fire!",
		"Cease your fire!",
		"Hold your fire!",
		"HOLD FIRE!",
		"We're clear!",
		"We clear?",
		"Looks clear!",
		"CLEAR!",
		"Clear!",
		"Keep your eyes peeled!",
		"Might be more- Keep your eyes peeled.",
		"Might be more- Don't get too comfortable.",
		"Stay quiet.",
		"Stay sharp.",
		"Stay sharp!",
		"Check your vitals.",
		"We're clear! Take a breather!",
		"We're clear! Sound off!",
		"Hooah.",
		"Hoo- fuckin'- 'ah.",
		"I got mine...",
		"Another day in the Uncle Sam's service...",
		"I need a break...",
		"Need a fuckin' smoke after that...",
		"Need a fuckin' cigarette after that...",
		"Need a fuckin' shot after that...",
		"See the universe they said, meet interesting people...",
		"SNAFU...",
		"Situation normal; all fucked up...",
		"This, is fucking FUBAR, man...",
		"Never gets easier...",
		"Holy Mary, mother of God pray for us sinners...",
		"Hail Mary, full of grace...",
		"Our Father, who art in heaven...",
	)
	squad_member_death_lines = list(
		"FUCK!",
		"SHIT!",
		"CRAP!",
		"MOTHERFUCKER!",
		"GOD DAMN IT!",
		"WE'RE TAKING HITS HERE!",
		"THEY GOT THEM-- RETURN THE FUCKING FAVOUR!",
		"YOU'LL FUCKIN' PAY, MOTHERFUCKER!",
		"YOU'LL FUCKIN' PAY, ASSHOLE!",
		"THEY'RE DOWN!",
		"THEY'RE DEAD!",
		"THEY GOT THEM!",
		"THEY'RE HIT BAD!",
		"THEY'RE FUCKIN' DEAD, MAN! THEY'RE FUCKIN' DEAD!",
		"GOD DAMN IT, WHY YOU?",
		"CORPSMAN, GET THE FUCK OVER HERE!",
		"GET DOC OVER HERE!",
		"DOC!",
		"CORPSMAN!",
		"DEVIL DOG DOWN!",
		"MARINE DOWN!",
		"MERCIFUL CHRIST!",
		"SWEET JESUS!",
		"MARY, MOTHER OF GOD!",
		"JESUS CHRIST!",
		"NO- NO, NOT LIKE THIS, MAN!",
		"DON'T YOU FUCKIN' DIE ON ME, MOTHERFUCKER- STAY ALIVE!",
		"THEY FUCKIN' KILLED THEM!",
		"FUBAR, MAN!",
	)
	reload_lines = list(
		"RELOADING!",
		"Reloading!",
		"Swapping magazines!",
		"Swapping mags!",
		"Changing magazines!",
		"Changing mags!",
		"Cover me, reloading!",
		"NEED COVERING FIRE!",
		"COVER ME!",
		"RED! RED!-- GREEN!",
		"I'M RED!",
		"RED!",
	)
	reload_internal_mag_lines = list(
		"RELOADING!",
		"Reloading!",
		"Cover me, reloading!",
		"NEED COVERING FIRE!",
		"COVER MY FUCKIN' ASS, RELOADING!",
		"COVER ME!",
		"RED! RED!-- GREEN!",
		"I'M RED!",
		"I NEED A FUCKING SPEEDLOADER- CHRIST!",
		"RED!",
	)
	grenade_thrown_lines = list(
		"GRENADE!",
		"THROWING GRENADE!",
		"GRENADE, GET CLEAR!",
		"GRENADE OUT!",
		"CLEAR OUT, GRENADE!",
		"'NADE OUT!",
		"TOSSIN' A NADE!",
		"TOSSIN' A GRENADE!",
		"EAT IT, FUCKER!",
		"RETURN TO SENDER!",
		"DELIVERY, MOTHERFUCKER!",
		"*warcry",
	)
	need_healing_lines = list(
		"FUCK ME!",
		"FUCK!",
		"SHIT!",
		"CRAP!",
		"MOTHERFUCKER!",
		"GOD DAMN IT!",
		"JESUS CHRIST!",
		"BLEEDING!",
		"MOTHER OF GOD-- NO!",
		"I'M TAKING HITS HERE!",
		"I'M HIT!",
		"I'M HURT!",
		"INJECTOR GOING IN!",
		"INJECTOR IN!",
		"I NEED GAUZE!",
		"SOMEONE PATCH THIS FUCKING HOLE!",
		"NEED MORPHINE!",
		"NEED MORPHINE!",
		"MEDIC, GET THE FUCK OVER HERE!",
		"GET DOC OVER HERE!",
		"DOC!",
		"MEDIC!",
		"I'M FUBAR, MAN!",
	)

/datum/human_ai_faction/usasf
	faction = FACTION_NAVY
	friendly_factions = list(
		FACTION_MARINE,
		FACTION_ARMY,
		FACTION_COLONIST,
		FACTION_MARSHAL,
		FACTION_UACG,
	)
	neutral_factions = list(
		FACTION_TWE,
		FACTION_WY,
		FACTION_PMC,
		FACTION_FREELANCER,
		FACTION_CONTRACTOR,
		FACTION_MERCENARY,
		FACTION_SURVIVOR,
	)
	enter_combat_lines = list(
		"CONTACT!",
		"Contact!",
		"I GOT CONTACT!",
		"SHIT- CONTACT!",
		"CONTACT, FRONT!",
		"WE GOT CONTACT!",
		"Look alive!",
		"GUNS UP!",
		"There!",
		"Over there!",
		"OPEN FIRE!",
		"Open fire!",
		"ENGAGE!",
		"Engage!",
		"Weapons free!",
		"WEAPONS FREE!",
		"Weapons hot!",
		"Wipe 'em out!",
		"Light 'em up!",
		"Drop 'em!",
		"Cut 'em down!",
		"Bring 'em down!",
		"Fuck 'em up!",
		"WASTE THE MOTHERFUCKERS!",
		"Kill that fucker!",
		"Ice that fucker!",
		"Eat shit!",
		"Get some!",
		"GET SOME!",
		"GET SOME, MOTHERFUCKER!",
		"*warcry",
		"KILL! KILL! KILL!",
		"KILL!",
		"COME AND GET SOME, MOTHERFUCKER!",
		"Let's rock!",
		"LET'S ROCK!",
		"ROCK OUT, MOTHERFUCKERS!",
		"X-RAY!",
		"X-RAY SPOTTED!",
		"TANGO!",
		"TANGO SPOTTED!",
		"Bring it!",
		"BRING IT!",
		"Bring it on, BRING IT ON!",
		"ENEMY ON APPROACH!",
		"MAKE MY DAY, BITCH!",
		"MAKE MY DAY, MOTHERFUCKER!",
		"ACTIVITY!",
		"Company!",
		"COMPANY!",
	)
	exit_combat_lines = list(
		"CEASE FIRE!",
		"Cease fire!",
		"Cease your fire!",
		"Hold your fire!",
		"HOLD FIRE!",
		"We're clear!",
		"We clear?",
		"Looks clear!",
		"CLEAR!",
		"Clear!",
		"Keep your eyes peeled!",
		"Might be more- Keep your eyes peeled.",
		"Might be more- Don't get too comfortable.",
		"Stay quiet.",
		"Stay sharp.",
		"Stay sharp!",
		"Check your vitals.",
		"We're clear! Take a breather!",
		"We're clear! Sound off!",
		"Hooyah.",
		"Hoo- fuckin'- 'yah.",
		"I got mine...",
		"I need a break...",
		"Need a fuckin' smoke after that...",
		"Need a fuckin' cigarette after that...",
		"Need a fuckin' shot after that...",
		"See the universe they said, meet interesting people...",
		"SNAFU...",
		"Situation normal; all fucked up...",
		"This, is fucking FUBAR, man...",
		"Never gets easier...",
		"Holy Mary, mother of God pray for us sinners...",
		"Hail Mary, full of grace...",
		"Our Father, who art in heaven...",
	)
	squad_member_death_lines = list(
		"FUCK!",
		"SHIT!",
		"CRAP!",
		"MOTHERFUCKER!",
		"GOD DAMN IT!",
		"WE'RE TAKING HITS HERE!",
		"THEY GOT THEM-- RETURN THE FUCKING FAVOUR!",
		"YOU'LL FUCKIN' PAY, MOTHERFUCKER!",
		"YOU'LL FUCKIN' PAY, ASSHOLE!",
		"THEY'RE DOWN!",
		"THEY'RE DEAD!",
		"THEY GOT THEM!",
		"THEY'RE HIT BAD!",
		"THEY'RE FUCKIN' DEAD, MAN! THEY'RE FUCKIN' DEAD!",
		"GOD DAMN IT, WHY YOU?",
		"CORPSMAN, GET THE FUCK OVER HERE!",
		"GET DOC OVER HERE!",
		"DOC!",
		"CORPSMAN!",
		"DEVIL DOG DOWN!",
		"MARINE DOWN!",
		"MERCIFUL CHRIST!",
		"SWEET JESUS!",
		"MARY, MOTHER OF GOD!",
		"JESUS CHRIST!",
		"NO- NO, NOT LIKE THIS, MAN!",
		"DON'T YOU FUCKIN' DIE ON ME, MOTHERFUCKER- STAY ALIVE!",
		"THEY FUCKIN' KILLED THEM!",
		"FUBAR, MAN!",
	)
	reload_lines = list(
		"RELOADING!",
		"Reloading!",
		"Swapping magazines!",
		"Swapping mags!",
		"Changing magazines!",
		"Changing mags!",
		"Cover me, reloading!",
		"NEED COVERING FIRE!",
		"COVER ME!",
		"RED! RED!-- GREEN!",
		"I'M RED!",
		"RED!",
	)
	reload_internal_mag_lines = list(
		"RELOADING!",
		"Reloading!",
		"Cover me, reloading!",
		"NEED COVERING FIRE!",
		"COVER MY FUCKIN' ASS, RELOADING!",
		"COVER ME!",
		"RED! RED!-- GREEN!",
		"I'M RED!",
		"I NEED A FUCKING SPEEDLOADER- CHRIST!",
		"RED!",
	)
	grenade_thrown_lines = list(
		"GRENADE!",
		"THROWING GRENADE!",
		"GRENADE, GET CLEAR!",
		"GRENADE OUT!",
		"CLEAR OUT, GRENADE!",
		"'NADE OUT!",
		"TOSSIN' A NADE!",
		"TOSSIN' A GRENADE!",
		"EAT IT, FUCKER!",
		"RETURN TO SENDER!",
		"DELIVERY, MOTHERFUCKER!",
		"*warcry",
	)
	need_healing_lines = list(
		"FUCK ME!",
		"FUCK!",
		"SHIT!",
		"CRAP!",
		"MOTHERFUCKER!",
		"GOD DAMN IT!",
		"JESUS CHRIST!",
		"BLEEDING!",
		"MOTHER OF GOD-- NO!",
		"I'M TAKING HITS HERE!",
		"I'M HIT!",
		"I'M HURT!",
		"INJECTOR GOING IN!",
		"INJECTOR IN!",
		"I NEED GAUZE!",
		"SOMEONE PATCH THIS FUCKING HOLE!",
		"NEED MORPHINE!",
		"NEED MORPHINE!",
		"CORPSMAN, GET THE FUCK OVER HERE!",
		"GET DOC OVER HERE!",
		"DOC!",
		"CORPSMAN!",
		"I'M FUBAR, MAN!",
	)

/datum/human_ai_faction/upp
	faction = FACTION_UPP
	friendly_factions = list(
		FACTION_COLONIST,
	)
	neutral_factions = list(
		FACTION_FREELANCER,
		FACTION_CONTRACTOR,
		FACTION_MERCENARY,
		FACTION_SURVIVOR,
	)
	enter_combat_lines = list(
		"CONTACT!",
		"Contact!",
		"I GOT CONTACT!",
		"SHIT- CONTACT!",
		"CONTACT, FRONT!",
		"WE GOT CONTACT!",
		"Look alive!",
		"WEAPONS UP!",
		"There!",
		"Over there!",
		"OPEN FIRE!",
		"Open fire!",
		"ENGAGE!",
		"Engage!",
		"Weapons free!",
		"WEAPONS FREE!",
		"Weapons hot!",
		"Wipe 'em out!",
		"Light 'em up!",
		"Drop 'em!",
		"Cut 'em down!",
		"Bring 'em down!",
		"Fuck 'em up!",
		"Kill that fucker!",
		"Eat shit!",
		"*warcry",
		"ENEMY ON APPROACH!",
		"MAKE MY DAY, BITCH!",
		"MAKE MY DAY, MOTHERFUCKER!",
		"ACTIVITY!",
		"Company!",
		"COMPANY!",
		"WE WILL BURY YOU!",
		"Uraaaa!",
		"URAAAA!",
	)
	exit_combat_lines = list(
		"CEASE FIRE!",
		"Cease fire!",
		"Cease your fire!",
		"Hold your fire!",
		"HOLD FIRE!",
		"We're clear!",
		"We clear?",
		"Looks clear!",
		"CLEAR!",
		"Clear!",
		"Keep your eyes peeled!",
		"Might be more- Keep your eyes peeled.",
		"Might be more- Don't get too comfortable.",
		"Stay quiet.",
		"Stay sharp.",
		"Stay sharp!",
		"Check your vitals.",
		"We're clear! Take a breather!",
		"We're clear! Sound off!",
		"Oorah.",
		"Oo- fuckin'- 'rah.",
		"I got mine...",
		"Ordinary combat work...",
		"I need a break...",
		"Need a fuckin' smoke after that...",
		"Need a fuckin' cigarette after that...",
		"Need a fuckin' shot after that...",
		"Serve the Union, they said, see the stars...",
		"Never gets easier...",
	)
	squad_member_death_lines = list(
		"FUCK!",
		"SHIT!",
		"CRAP!",
		"MOTHERFUCKER!",
		"GOD DAMN IT!",
		"WE'RE TAKING HITS HERE!",
		"THEY GOT THEM-- RETURN THE FUCKING FAVOUR!",
		"YOU'LL PAY, MOTHERFUCKER!",
		"YOU'LL PAY, ASSHOLE!",
		"THEY'RE DOWN!",
		"THEY'RE DEAD!",
		"THEY GOT THEM!",
		"THEY'RE HIT BAD!",
		"THEY'RE DEAD! THEY'RE DEAD!",
		"GOD DAMN IT, WHY YOU?",
		"SANITAR, GET OVER HERE!",
		"GET DOC OVER HERE!",
		"DOC!",
		"SANITAR!",
		"COMRADE, STAY ALIVE!",
		"COMRADE, CAN YOU HEAR ME!?",
		"COMRADE!?",
		"NO- NO, NOT LIKE THIS!",
		"DON'T YOU DIE ON ME, MOTHERFUCKER- STAY ALIVE!",
		"THEY KILLED THEM!",
	)
	need_healing_lines = list(
		"FUCK ME!",
		"FUCK!",
		"SHIT!",
		"CRAP!",
		"MOTHERFUCKER!",
		"GOD DAMN IT!",
		"BLEEDING!",
		"AGH-- NO!",
		"I'M TAKING HITS HERE!",
		"I'M HIT!",
		"I'M HURT!",
		"INJECTOR GOING IN!",
		"INJECTOR IN!",
		"I NEED GAUZE!",
		"SOMEONE PATCH THIS FUCKING HOLE!",
		"NEED MORPHINE!",
	)
	grenade_thrown_lines = list(
		"EAT THIS!",
		"GRENADE BEING THROWN!",
		"THROWING A GRENADE!",
		"PUSH THEM BACK!",
		"CLEAR OUT, GRENADE!",
	)
	reload_internal_mag_lines = list(
		"RELOADING!",
		"Reloading!",
		"Cover me, reloading!",
		"NEED COVERING FIRE!",
		"COVER MY ASS, RELOADING!",
		"COVER ME!",
		"EMPTY! RELOADING!",
	)
	reload_lines = list(
		"RELOADING!",
		"Reloading!",
		"Swapping magazines!",
		"Swapping mags!",
		"Changing magazines!",
		"Changing mags!",
		"Cover me, reloading!",
		"NEED COVERING FIRE!",
		"COVER ME!",
	)

/datum/human_ai_faction/canc
	faction = FACTION_CANC
	friendly_factions = list(
		FACTION_COLONIST,
	)
	neutral_factions = list(
		FACTION_SURVIVOR,
	)

/datum/human_ai_faction/wy
	faction = FACTION_WY
	friendly_factions = list(
		FACTION_COLONIST,
		FACTION_TWE,
		FACTION_PMC,
		FACTION_WY_DEATHSQUAD,
	)
	neutral_factions = list(
		FACTION_FREELANCER,
		FACTION_CONTRACTOR,
		FACTION_MERCENARY,
		FACTION_MARINE,
		FACTION_ARMY,
		FACTION_NAVY,
		FACTION_MARSHAL,
		FACTION_UACG,
		FACTION_SURVIVOR,
	)

/datum/human_ai_faction/wy/pmc
	faction = FACTION_PMC
	friendly_factions = list(
		FACTION_COLONIST,
		FACTION_TWE,
		FACTION_WY,
		FACTION_WY_DEATHSQUAD,
	)
	neutral_factions = list(
		FACTION_FREELANCER,
		FACTION_CONTRACTOR,
		FACTION_MERCENARY,
		FACTION_MARINE,
		FACTION_ARMY,
		FACTION_NAVY,
		FACTION_MARSHAL,
		FACTION_UACG,
		FACTION_SURVIVOR,
	)

/datum/human_ai_faction/wy_deathsquad
	faction = FACTION_WY_DEATHSQUAD
	friendly_factions = list(
		FACTION_WY,
		FACTION_PMC,
	)
	enter_combat_lines = list(
		"Visual confirmed, engaging.",
		"Engaging hostile.",
		"Eliminating hostile.",
		"Engaging.",
		"Contact.",
		"Viscon, proceeding.",
	)
	exit_combat_lines = list(
		"Hostilities ceased.",
		"Ceasing engagement.",
	)
	squad_member_death_lines = list(
		"Allied unit disabled.",
		"Friendly unit decomissioned.",
		"Allied unit decomissioned.",
		"Friendly unit disabled.",
	)
	grenade_thrown_lines = list() // Wouldn't need to call this out
	reload_lines = list() // same here
	reload_internal_mag_lines = list()
	need_healing_lines = list()


/datum/human_ai_faction/twe
	faction = FACTION_TWE
	friendly_factions = list(
		FACTION_COLONIST,
		FACTION_WY,
	)
	neutral_factions = list(
		FACTION_FREELANCER,
		FACTION_CONTRACTOR,
		FACTION_MERCENARY,
		FACTION_SURVIVOR,
		FACTION_MARINE,
		FACTION_ARMY,
		FACTION_NAVY,
		FACTION_MARSHAL,
		FACTION_UACG,
	)
	enter_combat_lines = list(
		"CONTACT!",
		"Contact!",
		"I GOT CONTACT!",
		"SHIT- CONTACT!",
		"CONTACT, FRONT!",
		"WE GOT CONTACT!",
		"Look alive!",
		"GUNS UP!",
		"There!",
		"Over there!",
		"OPEN FIRE!",
		"Open fire!",
		"ENGAGE!",
		"Engage!",
		"Weapons free!",
		"WEAPONS FREE!",
		"Weapons hot!",
		"Wipe 'em out!",
		"Light 'em up!",
		"Drop 'em!",
		"Cut 'em down!",
		"Bring 'em down!",
		"Fuck 'em up!",
		"KILL THE BASTARDS!",
		"Kill that bastard!",
		"*warcry",
		"X-RAY!",
		"X-RAY SPOTTED!",
		"TANGO!",
		"TANGO SPOTTED!",
		"Bring it!",
		"BRING IT!",
		"ENEMY ON APPROACH!",
		"ACTIVITY!",
		"Company!",
		"COMPANY!",
	)
	exit_combat_lines = list(
		"CEASE FIRE!",
		"Cease fire!",
		"Cease your fire!",
		"Hold your fire!",
		"HOLD FIRE!",
		"We're clear!",
		"We clear?",
		"Looks clear!",
		"CLEAR!",
		"Clear!",
		"Keep your eyes peeled!",
		"Might be more- Keep your eyes peeled.",
		"Might be more- Don't get too comfortable.",
		"Stay quiet.",
		"Stay sharp.",
		"Stay sharp!",
		"Check your vitals.",
		"We're clear! Take a breather!",
		"We're clear! Sound off!",
		"Blimey.",
		"Bloody hell.",
		"I got mine...",
		"Another day in the Her Majesty's service...",
		"I need a break...",
		"Need a bloody smoke after that...",
		"Need a bloody cigarette after that...",
		"Need a bloody fag after that...",
		"Need a bloody pint after that...",
		"For God and Country, they said...",
		"Rule the bloody waves...",
		"Never gets easier...",
		"Our Father, who art in heaven...",
	)
	squad_member_death_lines = list(
		"FUCK!",
		"SHIT!",
		"CRAP!",
		"BLOODY BASTARD!",
		"GOD DAMN IT!",
		"WE'RE TAKING HITS HERE!",
		"THEY GOT THEM-- RETURN FIRE!",
		"YOU'LL BLOODY WELL PAY, YOU BASTARD!",
		"THEY'RE DOWN!",
		"THEY'RE DEAD!",
		"THEY GOT THEM!",
		"THEY'RE HIT BAD!",
		"THEY'RE FUCKING DEAD! THEY'RE FUCKING DEAD!",
		"GOD DAMN IT, WHY YOU?",
		"MEDIC, GET THE BLOODY HELL OVER HERE!",
		"GET DOC OVER HERE!",
		"DOC!",
		"MEDIC!",
		"MARINE DOWN!",
		"MERCIFUL CHRIST!",
		"SWEET JESUS!",
		"MARY, MOTHER OF GOD!",
		"JESUS CHRIST!",
		"NO- NO, NOT LIKE THIS, MAN! GET UP!",
		"DON'T YOU BLOODY DIE ON ME, YOU BASTARD- STAY ALIVE!",
		"THEY KILLED THEM!",
	)
	reload_lines = list(
		"RELOADING!",
		"Reloading!",
		"Swapping magazines!",
		"Swapping mags!",
		"Changing magazines!",
		"Changing mags!",
		"Cover me, reloading!",
		"NEED COVERING FIRE!",
		"COVER ME!",
		"RED! RED!-- GREEN!",
		"I'M RED!",
		"RED!",
	)
	reload_internal_mag_lines = list(
		"RELOADING!",
		"Reloading!",
		"Cover me, reloading!",
		"NEED COVERING FIRE!",
		"COVER MY ASS, RELOADING!",
		"COVER ME!",
		"RED! RED!-- GREEN!",
		"I'M RED!",
		"I NEED A SPEEDLOADER- CHRIST!",
		"RED!",
	)
	grenade_thrown_lines = list(
		"GRENADE!",
		"THROWING GRENADE!",
		"GRENADE, GET CLEAR!",
		"GRENADE OUT!",
		"CLEAR OUT, GRENADE!",
		"TOSSING A GRENADE!",
		"*warcry",
	)
	need_healing_lines = list(
		"FUCK ME!",
		"FUCK!",
		"SHIT!",
		"CRAP!",
		"BASTARD!",
		"CUNT!",
		"BLOODY HELL!",
		"GOD DAMN IT!",
		"JESUS CHRIST!",
		"BLEEDING!",
		"MOTHER OF GOD-- NO!",
		"I'M TAKING HITS HERE!",
		"I'M HIT!",
		"I'M HURT!",
		"INJECTOR GOING IN!",
		"INJECTOR IN!",
		"I NEED GAUZE!",
		"SOMEONE PATCH THIS BLOODY HOLE!",
		"NEED MORPHINE!",
		"NEED MORPHINE!",
		"MEDIC, GET THE BLOODY HELL OVER HERE!",
		"GET DOC OVER HERE!",
		"DOC!",
		"MEDIC!",
	)

/datum/human_ai_faction/xeno_cultist
	faction = FACTION_XENOMORPH
	enter_combat_lines = list(
		"Aha!",
		"Found you!",
		"Right where you are...",
		"This won't take long.",
		"Intruder!",
		"Oppressor!",
		"Infidel!",
		"I found the oppressor!",
		"O Ascended One, give us your strength!",
		"Begone infidel!",
		"Do not let them pass!",
		"Banish them!",
		"Silence them!",
		"For the Ascended!",
		"For the Hive!",
		"You will regret this.",
		"Begone!",
		"This won't take long.",
		"...!",
	)
	exit_combat_lines = list(
		"It is silent.",
		"Hush...",
		"Nothing.",
		"It is done. For now...",
		"...",
	)
	squad_member_death_lines = list(
		"What have you done?!",
		"May they find purpose beyond...",
		"This cannot be...!",
		"Avenge them!",
		"...",
	)
	reload_lines = list(
		"Empty.",
		"Click.",
		"Zero.",
		"What.",
		"...",
		"...!",
	)
	reload_internal_mag_lines = list(
		"Empty.",
		"Click.",
		"Zero.",
		"What.",
		"...",
		"...!",
	)
	grenade_thrown_lines = list(
		"I brought a present...!",
		"We bear gifts...!",
		"This is for you...!",
	)

/datum/human_ai_faction/zombie
	faction = FACTION_ZOMBIE
	enter_combat_lines = list(
		"Agggh.",
		"Uuuugh...",
		"Agh...",
		"AGGGGH!!!",
		"myhhhh...",
		"Sam!",
		"Gahhhh!",
		"Bleeeeh",
		"Graaaa",
		"Guhhh...",
		"Muaaahh...",
		"Wuaaah...",
		"H-he-h..elp..",
		"Wmuaaaaa",
		"WMUAAAAA!",
		"GAAAHHHH!",
		"AAAAAAAGHH!",
		"UUUUUUGUGH!",
		"llluggh...",
		"Draaa..",
		"Daa...die...agggh",
		"...",
		"Bluhhhh...",
		"*pain",
		"*scream",
	)
	exit_combat_lines = list(
		"Agggh.",
		"Uuuugh...",
		"Agh...",
		"AGGGGH!!!",
		"myhhhh...",
		"Sam!",
		"Gahhhh!",
		"Bleeeeh",
		"Graaaa",
		"Guhhh...",
		"Muaaahh...",
		"Wuaaah...",
		"H-he-h..elp..",
		"Wmuaaaaa",
		"WMUAAAAA!",
		"GAAAHHHH!",
		"AAAAAAAGHH!",
		"UUUUUUGUGH!",
		"llluggh...",
		"Draaa..",
		"Daa...die...agggh",
		"...",
		"Bluhhhh...",
		"*pain",
		"*scream",
	)
	squad_member_death_lines = list(
		"Agggh.",
		"Uuuugh...",
		"Agh...",
		"AGGGGH!!!",
		"myhhhh...",
		"Sam!",
		"Gahhhh!",
		"Bleeeeh",
		"Graaaa",
		"Guhhh...",
		"Muaaahh...",
		"Wuaaah...",
		"H-he-h..elp..",
		"Wmuaaaaa",
		"WMUAAAAA!",
		"GAAAHHHH!",
		"AAAAAAAGHH!",
		"UUUUUUGUGH!",
		"llluggh...",
		"Draaa..",
		"Daa...die...agggh",
		"...",
		"Bluhhhh...",
		"*pain",
		"*scream",
	)
	reload_lines = list(
		"Agggh.",
		"Uuuugh...",
		"Agh...",
		"AGGGGH!!!",
		"myhhhh...",
		"Sam!",
		"Gahhhh!",
		"Bleeeeh",
		"Graaaa",
		"Guhhh...",
		"Muaaahh...",
		"Wuaaah...",
		"H-he-h..elp..",
		"Wmuaaaaa",
		"WMUAAAAA!",
		"GAAAHHHH!",
		"AAAAAAAGHH!",
		"UUUUUUGUGH!",
		"llluggh...",
		"Draaa..",
		"Daa...die...agggh",
		"...",
		"Bluhhhh...",
		"*pain",
		"*scream",
	)
	reload_internal_mag_lines = list(
		"Agggh.",
		"Uuuugh...",
		"Agh...",
		"AGGGGH!!!",
		"myhhhh...",
		"Sam!",
		"Gahhhh!",
		"Bleeeeh",
		"Graaaa",
		"Guhhh...",
		"Muaaahh...",
		"Wuaaah...",
		"H-he-h..elp..",
		"Wmuaaaaa",
		"WMUAAAAA!",
		"GAAAHHHH!",
		"AAAAAAAGHH!",
		"UUUUUUGUGH!",
		"llluggh...",
		"Draaa..",
		"Daa...die...agggh",
		"...",
		"Bluhhhh...",
		"*pain",
		"*scream",
	)
	grenade_thrown_lines = list(
		"Agggh.",
		"Uuuugh...",
		"Agh...",
		"AGGGGH!!!",
		"myhhhh...",
		"Sam!",
		"Gahhhh!",
		"Bleeeeh",
		"Graaaa",
		"Guhhh...",
		"Muaaahh...",
		"Wuaaah...",
		"H-he-h..elp..",
		"Wmuaaaaa",
		"WMUAAAAA!",
		"GAAAHHHH!",
		"AAAAAAAGHH!",
		"UUUUUUGUGH!",
		"llluggh...",
		"Draaa..",
		"Daa...die...agggh",
		"...",
		"Bluhhhh...",
		"*pain",
		"*scream",
	)
	need_healing_lines = list(
		"Agggh.",
		"Uuuugh...",
		"Agh...",
		"AGGGGH!!!",
		"myhhhh...",
		"Sam!",
		"Gahhhh!",
		"Bleeeeh",
		"Graaaa",
		"Guhhh...",
		"Muaaahh...",
		"Wuaaah...",
		"H-he-h..elp..",
		"Wmuaaaaa",
		"WMUAAAAA!",
		"GAAAHHHH!",
		"AAAAAAAGHH!",
		"UUUUUUGUGH!",
		"llluggh...",
		"Draaa..",
		"Daa...die...agggh",
		"...",
		"Bluhhhh...",
		"*pain",
		"*scream",
	)


/datum/human_ai_faction/xeno_cultist/corrupted
	faction = FACTION_XENOMORPH_CORRPUTED

/datum/human_ai_faction/malfunctioning_synth
	faction = FACTION_MALF_SYNTH
	friendly_factions = list(
		FACTION_COLONIST,
	)
