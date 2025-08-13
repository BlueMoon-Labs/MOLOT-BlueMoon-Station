/// The light switch. Can have multiple per area.
/obj/machinery/light_switch
	name = "light switch"
	icon = 'icons/obj/power.dmi'
	icon_state = "light1"
	base_icon_state = "light"
	desc = "Make dark."
	mouse_over_pointer = MOUSE_HAND_POINTER
	var/area/area = null
	var/otherarea = null
	var/autoname = TRUE

/obj/machinery/light_switch/directional/north
	dir = SOUTH
	pixel_y = 26

/obj/machinery/light_switch/directional/south
	dir = NORTH
	pixel_y = -26

/obj/machinery/light_switch/directional/east
	dir = WEST
	pixel_x = 26

/obj/machinery/light_switch/directional/west
	dir = EAST
	pixel_x = -26

/obj/machinery/light_switch/Initialize(mapload,  ndir, building)
	. = ..()
	if(istext(area))
		area = text2path(area)
	if(ispath(area))
		area = GLOB.areas_by_type[area]
	if(otherarea)
		area = locate(text2path("/area/[otherarea]"))
	if(!area)
		area = get_area(src)
	if(autoname)
		name = "light switch ([area.name])"
	if(building)
		setDir(ndir)
		pixel_x = (dir & 3)? 0 : (dir == 4 ? -26 : 26)
		pixel_y = (dir & 3)? (dir ==1 ? -26 : 26) : 0
		update_icon()
	register_context()

/obj/machinery/light_switch/add_context(atom/source, list/context, obj/item/held_item, mob/living/user)
	. = ..()
	if(isnull(held_item))
		LAZYSET(context[SCREENTIP_CONTEXT_LMB], INTENT_ANY, (area.lightswitch ? "Flick off" : "Flick on"))
		return CONTEXTUAL_SCREENTIP_SET
	if(held_item.tool_behaviour == TOOL_SCREWDRIVER)
		LAZYSET(context[SCREENTIP_CONTEXT_LMB], INTENT_ANY, "Deconstruct")
		return CONTEXTUAL_SCREENTIP_SET
	return

/obj/machinery/light_switch/update_appearance(updates=ALL)
	. = ..()
	luminosity = (machine_stat & NOPOWER) ? 0 : 1

/obj/machinery/light_switch/update_icon_state()
	if(machine_stat & NOPOWER)
		icon_state = "[base_icon_state]-p"
		return ..()
	icon_state = "[base_icon_state][area.lightswitch ? 1 : 0]"
	return ..()

/obj/machinery/light_switch/update_overlays()
	. = ..()
	if(!(machine_stat & NOPOWER))
		. += emissive_appearance(icon, "[base_icon_state]-glow", alpha = src.alpha)

/obj/machinery/light_switch/examine(mob/user)
	. = ..()
	. += "It is [area.lightswitch ? "on" : "off"]."
/obj/machinery/light_switch/interact(mob/user)
	. = ..()
	area.lightswitch = !area.lightswitch
	area.update_appearance()
	for(var/obj/machinery/light_switch/L in area)
		L.update_appearance()
	area.power_change()

/obj/machinery/light_switch/screwdriver_act(mob/living/user, obj/item/I)
	user.visible_message(span_notice("[user] starts unscrewing [src]..."), span_notice("You start unscrewing [src]..."))
	if(!I.use_tool(src, user, 40, volume = 50))
		return TRUE
	user.visible_message(span_notice("[user] unscrews [src]!"), span_notice("You detach [src] from the wall."))
	playsound(src, 'sound/items/deconstruct.ogg', 50, TRUE)
	deconstruct(TRUE)
	return TRUE

/obj/machinery/light_switch/power_change()
	if(!otherarea)
		if(powered(LIGHT))
			machine_stat &= ~NOPOWER
		else
			machine_stat |= NOPOWER
	update_appearance()

/obj/machinery/light_switch/emp_act(severity)
	. = ..()
	if (. & EMP_PROTECT_SELF)
		return
	if(!(machine_stat & (BROKEN|NOPOWER)))
		power_change()

/obj/machinery/light_switch/on_deconstruction()
	new /obj/item/wallframe/light_switch(loc)

/obj/item/wallframe/light_switch
	name = "light switch"
	desc = "An unmounted light switch. Attach it to a wall to use."
	icon = 'icons/obj/power.dmi'
	icon_state = "light-p"
	result_path = /obj/machinery/light_switch
	custom_materials = list(/datum/material/iron = SHEET_MATERIAL_AMOUNT)
