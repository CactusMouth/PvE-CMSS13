/datum/effects/crit/human/process_mob()
	. = ..()
	if(!.)
		return FALSE

	var/mob/living/carbon/affected_mob = affected_atom
	if(affected_mob.health > HEALTH_THRESHOLD_CRIT)
		qdel(src)
		return FALSE
	if((affected_mob.status_flags & CANKNOCKOUT))
		affected_mob.KnockDown(3)
		affected_mob.Stun(3)
	if(!affected_mob.reagents || !affected_mob.reagents.has_reagent("inaprovaline"))
		affected_mob.apply_damage(1, OXY)

	return TRUE
