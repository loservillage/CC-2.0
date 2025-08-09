/obj/effect/proc_holder/spell/invoked/bellyportal // to do: get scroll icon
	name = "Belly Portal"
	desc = "Summon an arcane portal to warp someone directly into your depths."
	cost = 3
	overlay_state = "hierophant"
	xp_gain = TRUE
	releasedrain = 50
	chargedrain = 1
	chargetime = 10
	recharge_time = 30 SECONDS
	warnie = "spellwarning"
	no_early_release = TRUE
	movement_interrupt = TRUE
	charging_slowdown = 2
	chargedloop = /datum/looping_sound/invokegen
	associated_skill = /datum/skill/magic/arcane
	spell_tier = 2
	invocation = "Tamani!"
	invocation_type = "shout"
	glow_color = GLOW_COLOR_DISPLACEMENT
	glow_intensity = GLOW_INTENSITY_MEDIUM
	gesture_required = TRUE
	range = 7
	var/delay = 5
	var/area_of_effect = 0



/obj/effect/proc_holder/spell/invoked/bellyportal/cast(list/targets, mob/user)
	var/atom/A = targets[1]
	if(!isliving(A))
		revert_cast()
		return

	var/mob/living/spelltarget = A
	playsound(get_turf(spelltarget), 'sound/magic/haste.ogg', 80, TRUE, soundping = TRUE)

	if(spelltarget != user)
		user.visible_message("[user] mutters an incantation and [spelltarget] phases in an unusual fashion.")
		//vore_attack_instant(user, spelltarget, user)
	else
		user.visible_message("[user] seemed to screw up an incantation.")
			
	return TRUE
/obj/effect/temp_visual/gravity
	icon = 'icons/effects/effects.dmi'
	icon_state = "hierophant_squares"
	name = "gravity magic"
	desc = "Get out of the way!"
	randomdir = FALSE
	duration = 3 SECONDS
	layer = MASSIVE_OBJ_LAYER
	light_outer_range = 2
	light_color = COLOR_PALE_PURPLE_GRAY

/obj/effect/temp_visual/gravity_trap
	icon = 'icons/effects/effects.dmi'
	icon_state = "hierophant_blast"
	dir = NORTH
	name = "rippling arcyne energy"
	desc = "Get out of the way!"
	randomdir = FALSE
	duration = 5 SECONDS
	layer = MASSIVE_OBJ_LAYER
