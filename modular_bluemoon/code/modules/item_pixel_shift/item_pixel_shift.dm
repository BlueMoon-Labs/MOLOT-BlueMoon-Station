/obj/item
	///Datum used in item pixel shift TGUI
	var/datum/item_pixel_shift/item_pixel_shift = null

/obj/item/Destroy()
	QDEL_NULL(item_pixel_shift)
	. = ..()

/obj/item/verb/shift_position()
	set name = "Shift Item Pixel Position"
	set category = "Object"
	set src in view(1)

	if(!(iscarbon(usr) || iscyborg(usr) || isanimal(usr)))
		return

	if(!usr.canUseTopic(src, BE_CLOSE) || !isturf(src.loc) || usr.incapacitated() || HAS_TRAIT(usr, TRAIT_HANDS_BLOCKED) || src.anchored || src.density)
		return

	if(item_flags & ABSTRACT)
		return

	if(!item_pixel_shift)
		item_pixel_shift = new(src)

	item_pixel_shift.ui_interact(usr)


/datum/item_pixel_shift
	var/obj/item/holder = null
	var/pixels_per_click = 1
	var/random_drop_on = TRUE
	var/init_no_random_drop = FALSE


/datum/item_pixel_shift/New(obj/item/holder)
	. = ..()
	if(!istype(holder))
		CRASH("item_pixel_shift holder is not of the expected type!")
	src.holder = holder
	if(holder.item_flags & NO_PIXEL_RANDOM_DROP)
		random_drop_on = FALSE
		init_no_random_drop = TRUE

/datum/item_pixel_shift/Destroy(force, ...)
	holder = null
	. = ..()

/datum/item_pixel_shift/ui_host()
	return holder

/datum/item_pixel_shift/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "ItemPixelShift", "[holder.name] Pixel Shift")
		ui.open()


/datum/item_pixel_shift/ui_data(mob/user)
	var/list/data = list(
		"pixel_x" = holder.pixel_x,
		"pixel_y" = holder.pixel_y,
		"max_shift_x" = (initial(holder.pixel_x) + (world.icon_size / 2)),
		"max_shift_y" = (initial(holder.pixel_y) + (world.icon_size / 2)),
		"random_drop_on" = random_drop_on,
	)
	return data


/datum/item_pixel_shift/ui_act(action, list/params)
	if(..())
		return

	if(QDELETED(holder))
		return

	if(!isturf(holder.loc) || usr.incapacitated() || !in_range(usr, holder) || holder.anchored || holder.density || !isliving(usr))
		return

	var/shift_max = world.icon_size / 2
	var/shift_limit_x = initial(holder.pixel_x) + shift_max
	var/shift_limit_y = initial(holder.pixel_y) + shift_max

	switch(action)
		if("shift_up")
			holder.pixel_y = clamp(holder.pixel_y + pixels_per_click, -shift_limit_y, shift_limit_y)

		if("shift_down")
			holder.pixel_y = clamp(holder.pixel_y - pixels_per_click, -shift_limit_y, shift_limit_y)

		if("shift_left")
			holder.pixel_x = clamp(holder.pixel_x - pixels_per_click, -shift_limit_x, shift_limit_x)

		if("shift_right")
			holder.pixel_x = clamp(holder.pixel_x + pixels_per_click, -shift_limit_x, shift_limit_x)

		if("custom_x")
			holder.pixel_x = clamp(text2num(params["pixel_x"]), -shift_limit_x, shift_limit_x)

		if("custom_y")
			holder.pixel_y = clamp(text2num(params["pixel_y"]), -shift_limit_y, shift_limit_y)

		if("move_to_top")
			holder.move_to_top(usr)
			// var/turf/source_loc = holder.loc
			// holder.loc = null
			// holder.loc = source_loc

		if("toggle")
			if(init_no_random_drop)
				to_chat(usr, span_warning("Вы не можете изменить флажок случайного выпадения для этого элемента."))
				return

			if(random_drop_on)
				random_drop_on = FALSE
				holder.item_flags |= NO_PIXEL_RANDOM_DROP
			else
				random_drop_on = TRUE
				holder.item_flags &= ~NO_PIXEL_RANDOM_DROP

	. = TRUE

