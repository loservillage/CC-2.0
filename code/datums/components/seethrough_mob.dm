/datum/action/sizecode_smallsprite
	name = "Toggle Giant Sprite"
	desc = "Others will always see you as giant"
	button_icon = 'icons/mob/actions/actions_xeno.dmi'
	button_icon_state = "smallqueen"
	background_icon_state = "bg_alien"
	var/small = FALSE
	//var/image/small_icon

/datum/action/sizecode_smallsprite/Trigger(trigger_flags)
	. = ..()
	if(!owner)
		return

	if(!small)
		var/image/I = image(icon = owner.icon, icon_state = owner.icon_state, loc = owner, layer = owner.layer, pixel_x = owner.pixel_x, pixel_y = owner.pixel_y)
		I.override = TRUE
		I.overlays += owner.overlays
		owner.add_alt_appearance(/datum/atom_hud/alternate_appearance/basic, "smallsprite_sizecode", I)
		//small_icon = I
	else
		owner.remove_alt_appearance("smallsprite_sizecode")

	small = !small
	return TRUE

/obj/effect/proc_holder/spell/self/sizecode_smallsprite
	name = "Small Sprite"
	desc = "!"
	overlay_state = "claws"
	antimagic_allowed = TRUE
	recharge_time = 20 //2 seconds
	ignore_cockblock = TRUE
	var/small = FALSE

/obj/effect/proc_holder/spell/self/sizecode_smallsprite/cast(mob/user = usr)
	. = ..()
	if(!user)
		return

	if(!small)
		var/image/I = image(icon = user.icon, icon_state = user.icon_state, loc = user, layer = user.layer, pixel_x = user.pixel_x, pixel_y = user.pixel_y)
		I.override = TRUE
		I.overlays += user.overlays
		user.add_alt_appearance(/datum/atom_hud/alternate_appearance/basic, "smallsprite_sizecode", I)
		//small_icon = I
	else
		user.remove_alt_appearance("smallsprite_sizecode")

	small = !small
	return TRUE
