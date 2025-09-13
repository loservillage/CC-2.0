/mob/living/carbon/human/proc/can_be_picked_up(mob/living/carbon/human/other)
	//TODO consentual before sensual
	if(client)
		if(!client.prefs.pickupable)
			return FALSE
	return TRUE

/mob/living/carbon/human/proc/get_size()
	if(HAS_TRAIT(src, TRAIT_MICRO))
		return 1
	//TODO: Someone is going to put a size between micro and normal, that one will go here with the num 2
	if(HAS_TRAIT(src, TRAIT_MACRO) || HAS_TRAIT(src, TRAIT_BIGGUY))
		var/beeg = 0
		if(HAS_TRAIT(src, TRAIT_MACRO))
			beeg = 6
		if(HAS_TRAIT(src,TRAIT_BIGGUY))
			beeg += 4.5
		return beeg
	else
		return 3
		

/mob/living/carbon/human/proc/small_enough(mob/living/carbon/human/other)
	var/othersize = other.get_size()
	if(get_size() + 2 <= othersize)
		return TRUE
	return FALSE


/mob/living/proc/getvolumemult()
	return 1

///Square cube law for tits, to be used for fluid production mainly. 1 is normal sized, and the smaller/bigger you get this gets exponentionally away from 1.
/mob/living/carbon/human/getvolumemult()
	//Square cube law for tits
	var/ownersize = get_size()
	return max_fluids * (ownersize * ownersize * ownersize) / 27)