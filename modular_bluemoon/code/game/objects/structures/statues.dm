/obj/structure/carving_block/ComponentInitialize()
	. = ..()
	var/rotation_flags = ROTATION_ALTCLICK | ROTATION_CLOCKWISE | ROTATION_COUNTERCLOCKWISE | ROTATION_VERBS
	AddComponent(/datum/component/simple_rotation, rotation_flags, null, CALLBACK(src, PROC_REF(can_be_rotated)))

/obj/structure/carving_block/proc/can_be_rotated(mob/user, rotation_type)
	if(anchored)
		to_chat(user, "<span class='warning'>[src] cannot be rotated while it is fastened to the floor!</span>")
		return FALSE
	return TRUE

/obj/structure/carving_block/attackby(obj/item/W, mob/living/user, params)
	add_fingerprint(user)
	if(!(flags_1 & NODECONSTRUCT_1))
		if(default_unfasten_wrench(user, W))
			return
		if(W.tool_behaviour == TOOL_WELDER)
			if(!W.tool_start_check(user, amount=0))
				return FALSE

			user.visible_message(span_notice("[user] is slicing apart the [name]."), \
								span_notice("You are slicing apart the [name]..."))
			if(W.use_tool(src, user, 40, volume=50))
				user.visible_message(span_notice("[user] slices apart the [name]."), \
									span_notice("You slice apart the [name]!"))
				deconstruct(TRUE)
			return
	return ..()

/obj/structure/carving_block/deconstruct(disassembled = TRUE)
	if(!(flags_1 & NODECONSTRUCT_1))
		var/amount_mod = disassembled ? 0 : -2
		for(var/mat in custom_materials)
			var/datum/material/custom_material = SSmaterials.GetMaterialRef(mat)
			var/amount = max(0,round(custom_materials[mat]/MINERAL_MATERIAL_AMOUNT) + amount_mod)
			if(amount > 0)
				new custom_material.sheet_type(drop_location(),amount)
	qdel(src)

/obj/structure/carving_block/AltClick(mob/user)
	return ..() // This hotkey is BLACKLISTED since it's used by /datum/component/simple_rotation

// LifeWeb Statues integrated in BM
/obj/item/choice_beacon/box/creepy_statue_kit
	name = "Creepy statue construction kit"
	desc = "Construction requires a crowbar & screwdriver . Put it on the ground first!"
	icon = 'modular_bluemoon/icons/obj/statue.dmi'
	icon_state = "const_box"
	throwforce = 0
	var/unwrapped = 0
	w_class = WEIGHT_CLASS_BULKY

/obj/item/choice_beacon/box/creepy_statue_kit/attack_self()
	return //перегруз фции

/obj/item/choice_beacon/box/creepy_statue_kit/generate_display_names()
	var/static/list/creepy_list = list() //мозгоёбка шо пиздец
	if(!length(creepy_list))
		var/list/creepy_list_temp = subtypesof(/obj/structure/statue/creepy_statue)
		for(var/V in creepy_list_temp) // отображение читаемых имён вместо /obj/gavno/zalupa
			var/atom/A = V
			creepy_list[initial(A.name)] = A

	return creepy_list

/obj/item/choice_beacon/box/creepy_statue_kit/spawn_option(choice,mob/user)
	to_chat(user, span_notice("You assemble it."))
	new choice (src.loc)
	qdel(src)


/obj/item/choice_beacon/box/creepy_statue_kit/attackby(obj/item/used_item, mob/user, params) //constructing a bed here.
	if(istype(used_item, /obj/item/screwdriver))
		if (!(item_flags & IN_INVENTORY) && !(item_flags & IN_STORAGE))
			playsound(loc, "'sound/items/screwdriver.ogg'", 30, 1)
			if(used_item.use_tool(src, user, 8 SECONDS, volume = 50))
				generate_options(user)

/////////

/obj/structure/statue/creepy_statue
	//name = "Creepy statue"
	desc = "Goosebumps run when you see it."
	icon = 'modular_bluemoon/icons/obj/statue.dmi'
	anchored = 0


/obj/structure/statue/creepy_statue/altar
	name = "Creepy statue of altar"
	icon_state="altar"

/obj/structure/statue/creepy_statue/bat
	name = "Creepy statue of bat"
	icon_state="bat"

/obj/structure/statue/creepy_statue/comatic
	name = "Creepy statue of comatic"
	icon_state="comatic"

/obj/structure/statue/creepy_statue/corpse
	name =  "Creepy statue of corpse"
	icon_state="corpse"

/obj/structure/statue/creepy_statue/claw
	name =  "Creepy statue of claw"
	icon_state="claw"

/obj/structure/statue/creepy_statue/dog
	name = "Creepy statue of dog"
	icon_state="dog"

/obj/structure/statue/creepy_statue/gargoyle1
	name = "Creepy statue of gargoyle 1"
	icon_state="gargoyle1"

/obj/structure/statue/creepy_statue/gargoyle2
	name = "Creepy statue of gargoyle 2"
	icon_state="gargoyle2"

/obj/structure/statue/creepy_statue/gargoyle3
	name = "Creepy statue of gargoyle 3"
	icon_state="gargoyle3"

/obj/structure/statue/creepy_statue/krakenl
	name ="Creepy statue of kraken Left"
	icon_state="krakenL"

/obj/structure/statue/creepy_statue/krakenr
	name ="Creepy statue of  kraken Right"
	icon_state="krakenR"

/obj/structure/statue/creepy_statue/ktulhu
	name = "Creepy statue of K`tullhu"
	icon_state="ktulhu"

/obj/structure/statue/creepy_statue/rahl
	name = "Creepy statue of Rahl"
	icon_state="rahl"

/obj/structure/statue/creepy_statue/scorn
	name = "Creepy statue of scorn"
	icon_state="scorn"

/obj/structure/statue/creepy_statue/spiral
	name = "Creepy statue of spiral"
	icon_state="spiral"

/obj/structure/statue/creepy_statue/sword
	name = "Creepy statue of sword"
	icon_state="sword"



/////////

/obj/item/choice_beacon/box/creepy_statue_kit/big
	name = "Big monument construction kit"


/obj/item/choice_beacon/box/creepy_statue_kit/big/generate_display_names()
	var/static/list/creepy_list = list() //мозгоёбка шо пиздец
	if(!length(creepy_list))
		var/list/creepy_list_temp = subtypesof(/obj/structure/statue/big_monument)
		for(var/V in creepy_list_temp) // отображение читаемых имён вместо /obj/gavno/zalupa
			var/atom/A = V
			creepy_list[initial(A.name)] = A

	return creepy_list

//

/obj/structure/statue/big_monument
	name = "Big monument"
	desc = "The scale is mesmerizing."
	icon = 'modular_bluemoon/icons/obj/statue_big.dmi'
	density = TRUE

	anchored = 0

/obj/structure/statue/big_monument/angel_cool
	name = "Big monument of cool angel"
	icon_state="angel_cool"
	bound_height = 64
	bound_width = 64 // 2x2

/obj/structure/statue/big_monument/openhelmet_guy
	name = "Big monument of openhelmet guy"
	icon_state="openhelmet_guy"
	bound_height = 64
	bound_width = 64 // 2x2
/obj/structure/statue/big_monument/creepy
	name = "Big monument of creep"
	icon_state="creepy"
	bound_height = 64
	bound_width = 64 // 2x2

/obj/structure/statue/big_monument/angelRight
	name = "Big monument of Angel Right"
	icon_state="AngelRight"
	bound_height = 96
	bound_width = 32 // 1x3

/obj/structure/statue/big_monument/angelLeft
	name = "Big monument of Ange lLeft"
	icon_state="AngelLeft"
	bound_height = 96
	bound_width = 32 // 1x3

/obj/structure/statue/big_monument/defender
	name = "Big monument of defender"
	icon_state="defender"
	bound_height = 64
	bound_width = 64 // 2x2

