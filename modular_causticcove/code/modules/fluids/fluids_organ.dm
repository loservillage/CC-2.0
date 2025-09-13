/datum/reagents/fluids_organ
	var/max_fluids = 0
	var/datum/reagent/default_fluid = /datum/reagent/water
	var/datum/reagent/current_fluid
	var/mob/living/owner
	var/production_rate = 0
	var/obj/belly/parentbelly

/datum/reagents/fluids_organ/New(obj/belly/b, datum/reagent/df)
	. = ..(0,0)
	parentbelly = b
	if(df)
		default_fluid = df
	current_fluid = default_fluid

/datum/reagents/fluids_organ/proc/bellytick()
	produce()


/datum/reagents/fluids_organ/proc/try_add_fluid(datum/reagent/fluid_to_add, amount = 1)
	

///The max limit, beyond this the organ begins to stretch to acoomedate extra fluids, up to 1.5 times the max size, which will cause discomfort.
/datum/reagents/fluids_organ/proc/get_max_fluids()
	if(owner)
		return max_fluids * owner.getvolumemult
	return max_fluids

/datum/reagents/fluids_organ/proc/produce()
	if(owner)




/// 1.5 times the max limit. You cannot exceed this limit, at least not with normal productions.
/datum/reagents/fluids_organ/proc/get_absolute_limit()
	return get_max_fluids() * 1.5
