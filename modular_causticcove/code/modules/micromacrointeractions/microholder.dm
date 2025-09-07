/obj/item/micro
	name = "micro"
	desc = "A person? A toy? A snack? All three! They fit into your hand, how convinient!"
	var/mob/living/held_mob
	var/matrix/original_transform
	var/original_vis_flags = NONE
	
/obj/item/micro/Initialize(mapload, mob/held)
	. = ..()
	held.forceMove(src)
	START_PROCESSING(SSobj, src)

/obj/item/micro/examine(mob/user)
	. = list()
	for(var/mob/living/M in contents)
		. += M.examine(user)

/obj/item/micro/dropped(mob/user, silent)
	if (held_mob?.loc != src || isturf(loc))
		var/held = held_mob
		dump_mob()
		held_mob = held
	. = ..()

/obj/item/micro/proc/dump_mob()
	if(!held_mob)
		return
	if (held_mob.loc == src || isnull(held_mob.loc))
		held_mob.transform = original_transform
		held_mob.update_transform()
		held_mob.forceMove(get_turf(src))
		held_mob = null

/obj/item/micro/process()
	if(held_mob?.loc != src || isturf(loc))
		qdel(src)
	
/obj/item/micro/Destroy()
	STOP_PROCESSING(SSobj, src)
	if(held_mob)
		dump_mob()
	if(ismob(loc))
		var/mob/M = loc
		M.dropItemToGround(src, get_turf(src))
	return ..()

/obj/item/micro/container_resist(mob/living/held)
	if(ismob(loc))
		var/mob/M = loc
		M.dropItemToGround(src)
		to_chat(M, span_warning("\The [held] wriggles out of your grip!"))
		to_chat(held, span_warning("You wiggle out of [M]'s grip!"))
	else if(isitem(loc))
		var/obj/item/I = loc
		to_chat(held, span_warning("You struggle free of [loc]."))
		forceMove(get_turf(src))

/obj/item/micro/Entered(mob/held, atom/OldLoc)
	. = ..()
	held_mob = held
	original_vis_flags = held.vis_flags
	held.vis_flags = VIS_INHERIT_ID|VIS_INHERIT_LAYER|VIS_INHERIT_PLANE
	vis_contents += held
	name = held.name
	original_transform = held.transform
	held.transform = null
	held.transform *= 0.7


/obj/item/micro/MouseDrop(mob/living/M)
	..()
	if(isliving(usr))
		var/mob/living/livingusr = usr
		if(!Adjacent(usr))
			return
		if(M.voremode)
			if(Adjacent(M))
				livingusr.vore_attack(livingusr, held_mob, M)
			else
				to_chat(livingusr,span_notice(M + " is too far!"))
		else
			for(var/mob/living/carbon/human/O in contents)
				O.show_inv(livingusr)