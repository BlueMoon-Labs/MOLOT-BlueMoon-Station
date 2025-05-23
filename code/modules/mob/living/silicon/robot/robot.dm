/mob/living/silicon/robot
	name = "Cyborg"
	real_name = "Cyborg"
	icon = 'icons/mob/robots.dmi'
	icon_state = "robot"
	bubble_icon = "robot"
	var/obj/item/pda/ai/aiPDA
	var/flash_protect = FALSE

/mob/living/silicon/robot/get_cell()
	return cell

/mob/living/silicon/robot/Initialize(mapload)
	spark_system = new /datum/effect_system/spark_spread()
	spark_system.set_up(5, 0, src)
	spark_system.attach(src)

	set_wires(new /datum/wires/robot(src))
	AddElement(/datum/element/empprotection, EMP_PROTECT_WIRES)
	// AddElement(/datum/element/ridable, /datum/component/riding/creature/cyborg)
	RegisterSignal(src, COMSIG_PROCESS_BORGCHARGER_OCCUPANT, PROC_REF(charge))

	robot_modules_background = new()
	robot_modules_background.icon_state = "block"
	robot_modules_background.layer = HUD_LAYER	//Objects that appear on screen are on layer ABOVE_HUD_LAYER, UI should be just below it.
	robot_modules_background.plane = HUD_PLANE

	inv1 = new /atom/movable/screen/robot/module1(null, src)
	inv2 = new /atom/movable/screen/robot/module2(null, src)
	inv3 = new /atom/movable/screen/robot/module3(null, src)

	ident = rand(1, 999)

	if(!shell)
		aiPDA = new/obj/item/pda/ai(src)
		aiPDA.owner = real_name
		aiPDA.ownjob = "Cyborg"
		aiPDA.name = real_name + " ([aiPDA.ownjob])"

	previous_health = health

	if(ispath(cell))
		cell = new cell(src)

	create_modularInterface()

	if(lawupdate)
		make_laws()
		if(!TryConnectToAI())
			lawupdate = FALSE

	radio = new /obj/item/radio/borg(src)
	if(!scrambledcodes && !builtInCamera)
		builtInCamera = new (src)
		builtInCamera.c_tag = real_name
		builtInCamera.network = list("ss13")
		builtInCamera.internal_light = FALSE
		if(wires.is_cut(WIRE_CAMERA))
			builtInCamera.status = 0
	module = new /obj/item/robot_module(src)
	module.rebuild_modules()
	update_icons()
	. = ..()

	//If this body is meant to be a borg controlled by the AI player
	//If this body is meant to be a borg controlled by the AI player
	if(shell)
		var/obj/item/borg/upgrade/ai/board = new(src)
		make_shell(board)
		add_to_upgrades(board)
	else
		//MMI stuff. Held togheter by magic. ~Miauw
		if(!mmi?.brainmob)
			mmi = new (src)
			mmi.brain = new /obj/item/organ/brain(mmi)
			mmi.brain.organ_flags |= ORGAN_FROZEN
			mmi.brain.name = "[real_name]'s brain"
			mmi.icon_state = "mmi_full"
			mmi.name = "[initial(mmi.name)]: [real_name]"
			mmi.brainmob = new(mmi)
			mmi.brainmob.name = src.real_name
			mmi.brainmob.real_name = src.real_name
			mmi.brainmob.container = mmi
			mmi.update_appearance()

	INVOKE_ASYNC(src, PROC_REF(updatename))

	aicamera = new/obj/item/camera/siliconcam/robot_camera(src)
	toner = tonermax
	diag_hud_set_borgcell()
	logevent("System brought online.")

	alert_control = new(src, list(ALARM_ATMOS, ALARM_FIRE, ALARM_POWER, ALARM_CAMERA, ALARM_BURGLAR, ALARM_MOTION), list(z))
	RegisterSignal(alert_control.listener, COMSIG_ALARM_TRIGGERED, PROC_REF(alarm_triggered))
	RegisterSignal(alert_control.listener, COMSIG_ALARM_CLEARED, PROC_REF(alarm_cleared))
	alert_control.listener.RegisterSignal(src, COMSIG_LIVING_PREDEATH, TYPE_PROC_REF(/datum/alarm_listener, prevent_alarm_changes))
	alert_control.listener.RegisterSignal(src, COMSIG_LIVING_REVIVE, TYPE_PROC_REF(/datum/alarm_listener, allow_alarm_changes))

	add_verb(src, /mob/living/proc/lay_down) //CITADEL EDIT gimmie rest verb kthx
	add_verb(src, /mob/living/silicon/robot/proc/rest_style)

/mob/living/silicon/robot/proc/create_modularInterface()
	if(!modularInterface)
		modularInterface = new /obj/item/modular_computer/tablet/integrated(src)
	modularInterface.layer = ABOVE_HUD_PLANE
	modularInterface.plane = ABOVE_HUD_PLANE

/mob/living/silicon/robot/Destroy()
	if(connected_ai)
		set_connected_ai(null)
	if(shell)
		GLOB.available_ai_shells -= src
	QDEL_NULL(modularInterface)
	QDEL_NULL(wires)
	QDEL_NULL(module)
	QDEL_NULL(eye_lights)
	QDEL_NULL(inv1)
	QDEL_NULL(inv2)
	QDEL_NULL(inv3)
	QDEL_NULL(hands)
	QDEL_NULL(spark_system)
	QDEL_NULL(aiPDA)
	QDEL_LIST(upgrades)
	QDEL_NULL(cell)
	QDEL_NULL(robot_suit)
	QDEL_NULL(thruster_button)
	QDEL_NULL(alert_control)
	cell = null
	return ..()

/mob/living/silicon/robot/Topic(href, href_list)
	. = ..()
	// BLUEMOON ADD START - профиль для боргов
	if(href_list["cyborg_profile"])
		ui_interact(usr)
	// BLUEMOON ADD END
	if(href_list["character_profile"])
		if(!profile)
			profile = new(src)
		profile.ui_interact(usr)
	//Show alerts window if user clicked on "Show alerts" in chat
	if(href_list["showalerts"])
		alert_control.ui_interact(src)

	return

// BLUEMOON ADD START - профиль для боргов
// Да, это проклято и должно быть перенесено в отдельный датум, но...
/mob/living/silicon/robot/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "CyborgProfile", "Профиль юнита [src]")
		ui.open()

/mob/living/silicon/robot/ui_static_data(mob/user, datum/tgui/ui, datum/ui_state/state)
	. = ..()
	var/data[0]
	if(!src || !istype(src))
		return
	data["silicon_flavor_text"] = mind?.silicon_flavor_text || ""
	data["oocnotes"] = mind?.ooc_notes || ""
	data["vore_tag"] = client?.prefs?.vorepref || "No"
	data["erp_tag"] = client?.prefs?.erppref || "No"
	data["mob_tag"] = client?.prefs?.mobsexpref || "No"
	data["nc_tag"] = client?.prefs?.nonconpref || "No"
	data["unholy_tag"] = client?.prefs?.unholypref || "No"
	data["extreme_tag"] = client?.prefs?.extremepref || "No"
	data["very_extreme_tag"] = client?.prefs?.extremeharm || "No"

	return data
// BLUEMOON ADD END

/mob/living/silicon/robot/proc/pick_module()
	if(module.type != /obj/item/robot_module)
		return

	if(wires.is_cut(WIRE_RESET_MODULE))
		to_chat(src,"<span class='userdanger'>ERROR: Module installer reply timeout. Please check internal connections.</span>")
		return

	if(!CONFIG_GET(flag/disable_secborg) && GLOB.security_level < CONFIG_GET(number/minimum_secborg_alert) && !CONFIG_GET(flag/bypass_secborg_code))
		to_chat(src, "<span class='notice'>NOTICE: Due to local station regulations, the security cyborg module and its variants are only available during [NUM2SECLEVEL(CONFIG_GET(number/minimum_secborg_alert))] alert and greater.</span>")

	var/list/modulelist = list("Standard" = /obj/item/robot_module/standard, \
	"Engineering" = /obj/item/robot_module/engineering, \
	"Medical" = /obj/item/robot_module/medical, \
	"Miner" = /obj/item/robot_module/miner, \
	"Cargo" = /obj/item/robot_module/cargo, \
	"Service" = /obj/item/robot_module/butler)
	if(!CONFIG_GET(flag/disable_peaceborg))
		modulelist["Peacekeeper"] = /obj/item/robot_module/peacekeeper
	if(BORG_SEC_AVAILABLE || CONFIG_GET(flag/bypass_secborg_code))
		modulelist["Security"] = /obj/item/robot_module/security

	var/input_module = input("Please, select a module!", "Robot", null, null) as null|anything in sort_list(modulelist)
	if(!input_module || module.type != /obj/item/robot_module)
		return

	module.transform_to(modulelist[input_module])


/mob/living/silicon/robot/proc/updatename(client/C)
	if(shell)
		return
	if(!C)
		C = client
	var/changed_name = ""
	if(custom_name)
		changed_name = custom_name
	// if(SSticker.anonymousnames) //only robotic renames will allow for anything other than the anonymous one
	// 	changed_name = anonymous_ai_name(is_ai = FALSE)
	if(!changed_name && C && C.prefs.custom_names["cyborg"] != DEFAULT_CYBORG_NAME)
		apply_pref_name("cyborg", C)
		return //built in camera handled in proc
	if(!changed_name)
		changed_name = get_standard_name()

	real_name = changed_name
	name = real_name
	if(!QDELETED(builtInCamera))
		builtInCamera.c_tag = real_name	//update the camera name too

/mob/living/silicon/robot/proc/get_standard_name()
	return "[(designation ? "[designation] " : "")][mmi.braintype]-[ident]"

/mob/living/silicon/robot/verb/cmd_robot_alerts()
	set category = "Robot Commands"
	set name = "Show Alerts"
	if(usr.stat == DEAD)
		to_chat(src, "<span class='userdanger'>Alert: You are dead.</span>")
		return //won't work if dead
	alert_control.ui_interact(src)

/mob/living/silicon/robot/proc/ionpulse()
	if(!ionpulse_on)
		return

	if(cell.charge <= 10)
		toggle_ionpulse()
		return

	cell.charge -= 10
	return TRUE

/mob/living/silicon/robot/proc/toggle_ionpulse()
	if(!ionpulse)
		to_chat(src, "<span class='notice'>No thrusters are installed!</span>")
		return

	if(!ion_trail)
		ion_trail = new
		ion_trail.set_up(src)

	ionpulse_on = !ionpulse_on
	to_chat(src, "<span class='notice'>You [ionpulse_on ? null :"de"]activate your ion thrusters.</span>")
	if(ionpulse_on)
		ion_trail.start()
	else
		ion_trail.stop()
	if(thruster_button)
		thruster_button.icon_state = "ionpulse[ionpulse_on]"

/mob/living/silicon/robot/get_status_tab_items()
	. = ..()
	. += ""
	if(cell)
		. += "Charge Left: [cell.charge]/[cell.maxcharge]"
	else
		. += text("No Cell Inserted!")

	if(module)
		for(var/datum/robot_energy_storage/st in module.storages)
			. += "[st.name]: [st.energy]/[st.max_energy]"
	if(connected_ai)
		. += "Master AI: [connected_ai.name]"

/mob/living/silicon/robot/restrained(ignore_grab)
	. = 0

/mob/living/silicon/robot/proc/alarm_triggered(datum/source, alarm_type, area/source_area)
	SIGNAL_HANDLER
	queueAlarm("--- [alarm_type] alarm detected in [source_area.name]!", alarm_type)

/mob/living/silicon/robot/proc/alarm_cleared(datum/source, alarm_type, area/source_area)
	SIGNAL_HANDLER
	queueAlarm("--- [alarm_type] alarm in [source_area.name] has been cleared.", alarm_type, FALSE)

/mob/living/silicon/robot/can_interact_with(atom/A)
	if (A == modularInterface)
		return TRUE //bypass for borg tablets
	if (low_power_mode)
		return FALSE
	var/turf/T0 = get_turf(src)
	var/turf/T1 = get_turf(A)
	if (!T0 || ! T1)
		return FALSE
	return ISINRANGE(T1.x, T0.x - interaction_range, T0.x + interaction_range) && ISINRANGE(T1.y, T0.y - interaction_range, T0.y + interaction_range)

/mob/living/silicon/robot/attackby(obj/item/W, mob/user, params)
	if(istype(W, /obj/item/stack/cable_coil) && wiresexposed)
		user.DelayNextAction(CLICK_CD_MELEE)
		if (getFireLoss() > 0 || getToxLoss() > 0)
			if(src == user)
				to_chat(user, span_notice("You start fixing yourself..."))
				if(!W.use_tool(src, user, 5 SECONDS, 1, skill_gain_mult = TRIVIAL_USE_TOOL_MULT))
					to_chat(user, span_warning("You need more cable to repair [src]!"))
					return
				adjustFireLoss(-10)
				adjustToxLoss(-10)
			else
				to_chat(user, span_notice("You start fixing [src]..."))
				if(!W.use_tool(src, user, 3 SECONDS, 1))
					to_chat(user, span_warning("You need more cable to repair [src]!"))
				adjustFireLoss(-30)
				adjustToxLoss(-30)
				updatehealth()
				user.visible_message(span_notice("[user] has fixed some of the burnt wires on [src]."), span_notice("You fix some of the burnt wires on [src]."))
		else
			to_chat(user, span_warning("The wires seem fine, there's no need to fix them."))
		return

	if(istype(W, /obj/item/stock_parts/cell) && opened) // trying to put a cell inside
		if(wiresexposed)
			to_chat(user, span_warning("Close the cover first!"))
		else if(cell)
			to_chat(user, span_warning("There is a power cell already installed!"))
		else
			if(!user.transferItemToLoc(W, src))
				return
			cell = W
			to_chat(user, span_notice("You insert the power cell."))
		update_icons()
		diag_hud_set_borgcell()
		return

	if(is_wire_tool(W))
		if (wiresexposed)
			wires.interact(user)
		else
			to_chat(user, span_warning("You can't reach the wiring!"))
		return

	if(istype(W, /obj/item/ai_module))
		var/obj/item/ai_module/MOD = W
		if(!opened)
			to_chat(user, span_warning("You need access to the robot's insides to do that!"))
			return
		if(wiresexposed)
			to_chat(user, span_warning("You need to close the wire panel to do that!"))
			return
		if(!cell)
			to_chat(user, span_warning("You need to install a power cell to do that!"))
			return
		if(shell) //AI shells always have the laws of the AI
			to_chat(user, span_warning("[src] is controlled remotely! You cannot upload new laws this way!"))
			return
		if(connected_ai && lawupdate)
			to_chat(user, span_warning("[src] is receiving laws remotely from a synced AI!"))
			return
		if(emagged)
			to_chat(user, span_warning("The law interface glitches out!"))
			emote("buzz")
			return
		if(!mind) //A player mind is required for law procs to run antag checks.
			to_chat(user, span_warning("[src] is entirely unresponsive!"))
			return
		MOD.install(laws, user) //Proc includes a success mesage so we don't need another one
		return

	if(istype(W, /obj/item/encryptionkey) && opened)
		if(radio)//sanityyyyyy
			radio.attackby(W,user)//GTFO, you have your own procs
		else
			to_chat(user, span_warning("Unable to locate a radio!"))
		return

	if (W.GetID()) // trying to unlock the interface with an ID card
		if(opened)
			to_chat(user, span_warning("You must close the cover to swipe an ID card!"))
		else
			if(allowed(usr))
				locked = !locked
				to_chat(user, span_notice("You [ locked ? "lock" : "unlock"] [src]'s cover."))
				update_icons()
				if(emagged)
					to_chat(user, span_notice("The cover interface glitches out for a split second."))
					logevent("ChÃ¥vÃis cover lock has been [locked ? "engaged" : "released"]") //ChÃ¥vÃis: see above line
				else
					logevent("Chassis cover lock has been [locked ? "engaged" : "released"]")
			else
				to_chat(user, span_danger("Access denied."))
		return

	if(istype(W, /obj/item/borg/upgrade))
		var/obj/item/borg/upgrade/U = W
		if(!opened)
			to_chat(user, span_warning("You must access the cyborg's internals!"))
			return
		if(!module && U.require_module)
			to_chat(user, span_warning("The cyborg must choose a model before it can be upgraded!"))
			return
		if(U.locked)
			to_chat(user, span_warning("The upgrade is locked and cannot be used yet!"))
			return
		if(!user.canUnEquip(U))
			to_chat(user, span_warning("The upgrade is stuck to you and you can't seem to let go of it!"))
			return
		apply_upgrade(U, user)
		return

	if(istype(W, /obj/item/toner))
		if(toner >= tonermax)
			to_chat(user, span_warning("The toner level of [src] is at its highest level possible!"))
			return
		if(!user.temporarilyRemoveItemFromInventory(W))
			return
		toner = tonermax
		qdel(W)
		to_chat(user, span_notice("You fill the toner level of [src] to its max capacity."))
		return

	if(istype(W, /obj/item/flashlight))
		if(!opened)
			to_chat(user, span_warning("You need to open the panel to repair the headlamp!"))
			return
		if(lamp_functional)
			to_chat(user, span_warning("The headlamp is already functional!"))
			return
		if(!user.temporarilyRemoveItemFromInventory(W))
			to_chat(user, span_warning("[W] seems to be stuck to your hand. You'll have to find a different light."))
			return
		lamp_functional = TRUE
		qdel(W)
		to_chat(user, span_notice("You replace the headlamp bulbs."))
		return

	return ..()

/mob/living/silicon/robot/crowbar_act(mob/living/user, obj/item/I) //TODO: make fucking everything up there in that attackby() proc use the proper tool_act() procs. But honestly, who has time for that? 'cause I know for sure that you, the person reading this, sure as hell doesn't.
	var/validbreakout = FALSE
	for(var/obj/item/dogborg/sleeper/S in held_items)
		if(!LAZYLEN(S.contents))
			continue
		if(!validbreakout)
			visible_message("<span class='notice'>[user] wedges [I] into the crevice separating [S] from [src]'s chassis, and begins to pry...</span>", "<span class='notice'>You wedge [I] into the crevice separating [S] from [src]'s chassis, and begin to pry...</span>")
		validbreakout = TRUE
		S.go_out()
	if(validbreakout)
		return TRUE
	return ..()

/mob/living/silicon/robot/verb/unlock_own_cover()
	set category = "Robot Commands"
	set name = "Unlock Cover"
	set desc = "Unlocks your own cover if it is locked. You can not lock it again. A human will have to lock it for you."
	if(stat == DEAD)
		return //won't work if dead
	if(locked)
		switch(alert("You cannot lock your cover again, are you sure?\n      (You can still ask for a human to lock it)", "Unlock Own Cover", "Yes", "No"))
			if("Yes")
				locked = FALSE
				update_icons()
				to_chat(usr, "<span class='notice'>You unlock your cover.</span>")

/mob/living/silicon/robot/proc/allowed(mob/M)
	//check if it doesn't require any access at all
	if(check_access(null))
		return TRUE
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		//if they are holding or wearing a card that has access, that works
		if(check_access(H.get_active_held_item()) || check_access(H.wear_id) || check_access(H.wear_neck))
			return TRUE
	else if(ismonkey(M))
		var/mob/living/carbon/monkey/george = M
		//they can only hold things :(
		if(isitem(george.get_active_held_item()))
			return check_access(george.get_active_held_item())
	return FALSE

/mob/living/silicon/robot/proc/check_access(obj/item/card/id/I)
	if(!istype(req_access, /list)) //something's very wrong
		return TRUE

	var/list/L = req_access
	if(!L.len) //no requirements
		return TRUE

	if(!istype(I, /obj/item/card/id) && isitem(I))
		I = I.GetID()

	if(!I || !I.access) //not ID or no access
		return FALSE
	for(var/req in req_access)
		if(!(req in I.access)) //doesn't have this access
			return FALSE
	return TRUE

/mob/living/silicon/robot/regenerate_icons()
	return update_icons()

/mob/living/silicon/robot/proc/self_destruct()
	if(emagged)
		QDEL_NULL(mmi)
		explosion(loc,1,2,4,flame_range = 2)
	else
		explosion(loc,-1,0,2)
	gib()

/mob/living/silicon/robot/proc/UnlinkSelf()
	set_connected_ai(null)
	lawupdate = FALSE
	locked_down = FALSE
	scrambledcodes = TRUE
	//Disconnect it's camera so it's not so easily tracked.
	if(!QDELETED(builtInCamera))
		QDEL_NULL(builtInCamera)
		// I'm trying to get the Cyborg to not be listed in the camera list
		// Instead of being listed as "deactivated". The downside is that I'm going
		// to have to check if every camera is null or not before doing anything, to prevent runtime errors.
		// I could change the network to null but I don't know what would happen, and it seems too hacky for me.
	update_mobility()

/mob/living/silicon/robot/mode()
	set name = "Activate Held Object"
	set category = "IC"
	set src = usr

	if(incapacitated())
		return
	var/obj/item/W = get_active_held_item()
	if(W)
		W.attack_self(src)


/mob/living/silicon/robot/proc/SetLockdown(state = TRUE)
	// They stay locked down if their wire is cut.
	if(wires?.is_cut(WIRE_LOCKDOWN))
		state = TRUE
	if(state)
		throw_alert("locked", /atom/movable/screen/alert/locked)
	else
		clear_alert("locked")
	locked_down = state
	update_mobility()
	logevent("System lockdown [locked_down?"triggered":"released"].")


/mob/living/silicon/robot/proc/SetEmagged(new_state)
	emagged = new_state
	module.rebuild_modules()
	update_icons()
	if(emagged)
		throw_alert("hacked", /atom/movable/screen/alert/hacked)
	else
		clear_alert("hacked")

/**
 * Handles headlamp smashing
 *
 * When called (such as by the shadowperson lighteater's attack), this proc will break the borg's headlamp
 * and then call toggle_headlamp to disable the light. It also plays a sound effect of glass breaking, and
 * tells the borg what happened to its chat. Broken lights can be repaired by using a flashlight on the borg.
 */
/mob/living/silicon/robot/proc/smash_headlamp()
	if(!lamp_functional)
		return
	lamp_functional = FALSE
	playsound(src, 'sound/effects/glass_step.ogg', 50)
	toggle_headlamp(TRUE)
	to_chat(src, "<span class='danger'>Your headlamp is broken! You'll need a human to help replace it.</span>")


/mob/living/silicon/robot/verb/outputlaws()
	set category = "Robot Commands"
	set name = "State Laws"

	if(usr.stat == DEAD)
		return //won't work if dead
	checklaws()

/mob/living/silicon/robot/verb/set_automatic_say_channel() //Borg version of setting the radio for autosay messages.
	set name = "Set Auto Announce Mode"
	set desc = "Modify the default radio setting for stating your laws."
	set category = "Robot Commands"

	if(usr.stat == DEAD)
		return //won't work if dead
	set_autosay()

/**
 * Handles headlamp toggling, disabling, and color setting.
 *
 * The initial if statment is a bit long, but the gist of it is that should the lamp be on AND the update_color
 * arg be true, we should simply change the color of the lamp but not disable it. Otherwise, should the turn_off
 * arg be true, the lamp already be enabled, any of the normal reasons the lamp would turn off happen, or the
 * update_color arg be passed with the lamp not on, we should set the lamp off. The update_color arg is only
 * ever true when this proc is called from the borg tablet, when the color selection feature is used.
 *
 * Arguments:
 * * arg1 - turn_off, if enabled will force the lamp into an off state (rather than toggling it if possible)
 * * arg2 - update_color, if enabled, will adjust the behavior of the proc to change the color of the light if it is already on.
 */
/mob/living/silicon/robot/proc/toggle_headlamp(turn_off = FALSE, update_color = FALSE)
	//if both lamp is enabled AND the update_color flag is on, keep the lamp on. Otherwise, if anything listed is true, disable the lamp.
	if(!(update_color && lamp_enabled) && (turn_off || lamp_enabled || update_color || !lamp_functional || stat || low_power_mode))
		set_light((lamp_functional && stat != DEAD && lamp_doom) ? lamp_intensity : 0, l_color = COLOR_RED)
		// set_light_on(lamp_functional && stat != DEAD && lamp_doom) //If the lamp isn't broken and borg isn't dead, doomsday borgs cannot disable their light fully.
		// set_light_color(COLOR_RED) //This should only matter for doomsday borgs, as any other time the lamp will be off and the color not seen
		// set_light_range(1) //Again, like above, this only takes effect when the light is forced on by doomsday mode.
		lamp_enabled = FALSE
		lampButton?.update_icon()
		update_icons()
		return
	set_light(lamp_intensity, l_color = (lamp_doom? COLOR_RED : lamp_color))
	// set_light_range(lamp_intensity)
	// set_light_color(lamp_doom? COLOR_RED : lamp_color) //Red for doomsday killborgs, borg's choice otherwise
	// set_light_on(TRUE)
	lamp_enabled = TRUE
	lampButton?.update_icon()
	update_icons()

/mob/living/silicon/robot/proc/cyborg_deconstruct()
	// SEND_SIGNAL(src, COMSIG_BORG_SAFE_DECONSTRUCT)
	var/turf/drop_to = drop_location(src)
	if(robot_suit)
		robot_suit.drop_all_parts(drop_to)
	else
		new /obj/item/robot_suit(drop_to)
		new /obj/item/bodypart/l_leg/robot(drop_to)
		new /obj/item/bodypart/r_leg/robot(drop_to)
		new /obj/item/stack/cable_coil(drop_to, 1)
		new /obj/item/bodypart/chest/robot(drop_to)
		new /obj/item/bodypart/l_arm/robot(drop_to)
		new /obj/item/bodypart/r_arm/robot(drop_to)
		new /obj/item/bodypart/head/robot(drop_to)
		for(var/i in 1 to 2)
			var/obj/item/assembly/flash/handheld/borgeye = new(drop_to)
			borgeye.burn_out()

	cell?.forceMove(drop_to) // Cell can be null, if removed beforehand
	radio?.keyslot?.forceMove(drop_to)
	radio?.keyslot = null

	dump_into_mmi(drop_to)

	qdel(src)

/// Dumps the current occupant of the cyborg into an MMI at the passed location
/// Returns the borg's MMI on success
/mob/living/silicon/robot/proc/dump_into_mmi(atom/at_location = drop_location())
	if(isnull(mmi))
		return

	var/obj/item/mmi/removing = mmi
	mmi.forceMove(at_location) // Nulls it out via exited

	if(isnull(mind)) // no one to transfer, just leave the MMI.
		return mmi

	if(removing.brainmob)
		if(removing.brainmob.stat == DEAD)
			removing.brainmob.set_stat(CONSCIOUS)
		mind.transfer_to(removing.brainmob)
		removing.update_appearance()

	else
		to_chat(src, span_boldannounce("Oops! Something went very wrong, your MMI was unable to receive your mind. \
			You have been ghosted. Please make a bug report so we can fix this bug."))
		ghostize()
		stack_trace("Borg MMI lacked a brainmob")

	return mmi

///This is the subtype that gets created by robot suits. It's needed so that those kind of borgs don't have a useless cell in them
/mob/living/silicon/robot/nocell
	cell = null

/mob/living/silicon/robot/modules
	var/set_module = /obj/item/robot_module

/mob/living/silicon/robot/modules/Initialize(mapload)
	. = ..()
	module.transform_to(set_module)

/mob/living/silicon/robot/modules/standard
	set_module = /obj/item/robot_module/standard

/mob/living/silicon/robot/modules/medical
	set_module = /obj/item/robot_module/medical

/mob/living/silicon/robot/modules/engineering
	set_module = /obj/item/robot_module/engineering

/mob/living/silicon/robot/modules/security
	set_module = /obj/item/robot_module/security

/mob/living/silicon/robot/modules/clown
	set_module = /obj/item/robot_module/clown

/mob/living/silicon/robot/modules/peacekeeper
	set_module = /obj/item/robot_module/peacekeeper

/mob/living/silicon/robot/modules/miner
	set_module = /obj/item/robot_module/miner

/mob/living/silicon/robot/modules/syndicate
	icon_state = "synd_sec"
	faction = list(ROLE_SYNDICATE)
	bubble_icon = "syndibot"
	req_access = list(ACCESS_SYNDICATE)
	lawupdate = FALSE
	scrambledcodes = TRUE // These are rogue borgs.
	ionpulse = TRUE
	flash_protect = TRUE
	var/playstyle_string = "<span class='big bold'>Вы - Штурмовой Киборг Синдиката!</span><br>\
							<b>Вы вооружены мощными наступательными средствами, которые помогут вам выполнить задание: помочь Союзным Оперативникам. \
							Ваш LMG будет медленно производить боеприпасы из вашего источника питания, а ваш оперативный пинпоинтер будет находить и определять местоположение товарищей по Операции. \
							<i>Помогите оперативникам любой ценой!!!</i></b>"
	set_module = /obj/item/robot_module/syndicate
	cell = /obj/item/stock_parts/cell/hyper
	typing_indicator_state = /obj/effect/overlay/typing_indicator/additional/syndbot

/mob/living/silicon/robot/modules/syndicate/Initialize(mapload)
	. = ..()
	radio = new /obj/item/radio/borg/syndicate(src)
	laws = new /datum/ai_laws/syndicate_override()
	addtimer(CALLBACK(src, PROC_REF(show_playstyle)), 5)

/mob/living/silicon/robot/modules/syndicate/create_modularInterface()
	if(!modularInterface)
		modularInterface = new /obj/item/modular_computer/tablet/integrated/syndicate(src)
	return ..()

/mob/living/silicon/robot/modules/syndicate/proc/show_playstyle()
	if(playstyle_string)
		to_chat(src, playstyle_string)

/mob/living/silicon/robot/modules/syndicate/ResetModule()
	return

/mob/living/silicon/robot/modules/syndicate/medical
	icon_state = "synd_medical"
	playstyle_string = "<span class='big bold'>Вы - Медицинский Киборг Синдиката!</span><br>\
						<b>Вы вооружены мощными медицинскими инструментами, которые помогут вам выполнить задание: помочь союзным оперативникам. \
						Ваш гипоспрей производит восстанавливающие наниты - чудо-лекарство, исцеляющее большинство видов телесных повреждений, включая повреждения мозга. Он также производит сильнодействующий морфий для нападения. \
						Ваши дефибрилляторы могут оживлять оперативников через их бронескафандры, или могут быть использованы для нападения на врагов! \
						Ваша энергетическая пила работает как циркулярная, но может быть активирована для нанесения больших повреждений, а ваш оперативный пинпоинтер найдет и определит местонахождение товарищей по Операции. \
						<i>Помогите оперативникам любой ценой!!!</i></b>"
	set_module = /obj/item/robot_module/syndicate_medical

/mob/living/silicon/robot/modules/syndicate/saboteur
	icon_state = "synd_engi"
	playstyle_string = "<span class='big bold'>Вы - Саботажный Киборг Синдиката!</span><br>\
						<b>Вы вооружены надежными инженерными средствами, которые помогут вам выполнить задание: помочь союзным оперативникам. \
						Ваш Маркер Назначения позволит Вам скрытно перемещаться по сети утилизации по всей станции. \
						Ваш сварочный аппарат позволит Вам ремонтировать экзокостюмы оперативников, а также себя и своих товарищей-киборгов. \
						Ваш Киборг-Проектор Хамелеон позволит вам принять облик и зарегистрированное имя инженерного борга Nanotrasen и проводить тайные операции на Космических Станциях. \
						Имейте в виду, что почти любой физический контакт или случайное повреждение нарушит ваш камуфляж! \
						<i>Помогите оперативникам любой ценой!!!</i></b>"
	set_module = /obj/item/robot_module/saboteur

/mob/living/silicon/robot/modules/inteq
	icon_state = "inteq_sec"
	var/playstyle_string = "<span class='big bold'>Вы - Штурмовой Киборг ИнтеКью!</span><br>\
							<b>Вы вооружены мощными наступательными средствами, которые помогут вам выполнить задание: помочь Союзным Оперативникам. \
							Ваш LMG будет медленно производить боеприпасы из вашего источника питания, а ваш оперативный пинпоинтер будет находить и определять местоположение товарищей по Операции. \
							<i>Помогите оперативникам любой ценой!!!</i></b>"
	faction = list(ROLE_INTEQ)
	bubble_icon = "syndibot"
	req_access = list(ACCESS_SYNDICATE)
	lawupdate = FALSE
	scrambledcodes = TRUE // These are rogue borgs.
	ionpulse = TRUE
	flash_protect = TRUE
	lamp_color = COLOR_SOAPSTONE_GOLD
	set_module = /obj/item/robot_module/syndicate/inteq
	cell = /obj/item/stock_parts/cell/hyper
	typing_indicator_state = /obj/effect/overlay/typing_indicator/additional/syndbot
	upgrades = list(/obj/item/borg/upgrade/vtec)

/mob/living/silicon/robot/modules/inteq/Initialize(mapload)
	. = ..()
	radio = new /obj/item/radio/borg/inteq(src)
	laws = new /datum/ai_laws/inteq_override()
	addtimer(CALLBACK(src, PROC_REF(show_playstyle)), 5)

/mob/living/silicon/robot/modules/inteq/create_modularInterface()
	if(!modularInterface)
		modularInterface = new /obj/item/modular_computer/tablet/integrated/syndicate(src)
	return ..()

/mob/living/silicon/robot/modules/inteq/proc/show_playstyle()
	if(playstyle_string)
		to_chat(src, playstyle_string)

/mob/living/silicon/robot/modules/inteq/ResetModule()
	return

/mob/living/silicon/robot/modules/inteq/medical
	icon_state = "inteq_medical"
	playstyle_string = "<span class='big bold'>Вы - Медицинский Киборг ИнтеКью!</span><br>\
						<b>Вы вооружены мощными медицинскими инструментами, которые помогут вам выполнить задание: помочь союзным оперативникам. \
						Ваш гипоспрей производит восстанавливающие наниты - чудо-лекарство, исцеляющее большинство видов телесных повреждений, включая повреждения мозга. Он также производит сильнодействующий морфий для нападения. \
						Ваши дефибрилляторы могут оживлять оперативников через их бронескафандры, или могут быть использованы для нападения на врагов! \
						Ваша энергетическая пила работает как циркулярная, но может быть активирована для нанесения больших повреждений, а ваш оперативный пинпоинтер найдет и определит местонахождение товарищей по Операции. \
						<i>Помогите оперативникам любой ценой!!!</i></b>"
	set_module = /obj/item/robot_module/syndicate_medical/inteq

/mob/living/silicon/robot/modules/inteq/saboteur
	icon_state = "inteq_engi"
	playstyle_string = "<span class='big bold'>Вы - Саботажный Киборг ИнтеКью!</span><br>\
						<b>Вы вооружены надежными инженерными средствами, которые помогут вам выполнить задание: помочь союзным оперативникам. \
						Ваш Маркер Назначения позволит Вам скрытно перемещаться по сети утилизации по всей станции. \
						Ваш сварочный аппарат позволит Вам ремонтировать экзокостюмы оперативников, а также себя и своих товарищей-киборгов. \
						Ваш Киборг-Проектор Хамелеон позволит вам принять облик и зарегистрированное имя инженерного борга Nanotrasen и проводить тайные операции на Космических Станциях. \
						Имейте в виду, что почти любой физический контакт или случайное повреждение нарушит ваш камуфляж! \
						<i>Помогите оперативникам любой ценой!!!</i></b>"
	set_module = /obj/item/robot_module/saboteur/inteq

/mob/living/silicon/robot/modules/syndicate/spider// used for space ninja and their cyborg hacking special objective
	bubble_icon = "spider"
	playstyle_string = "<span class='big bold'>You are a Spider Clan assault cyborg!</span><br>\
							<b>You are armed with powerful offensive tools to aid you in your mission: obey your ninja masters by any means necessary. \
							Your cyborg LMG will slowly produce ammunition from your power supply, and your pinpointer will find and locate fellow members of the Spider Clan.</b>"
	set_module = /obj/item/robot_module/syndicate/spider
	typing_indicator_state = /obj/effect/overlay/typing_indicator/additional/spider

/mob/living/silicon/robot/modules/syndicate_medical/spider// ditto
	bubble_icon = "spider"
	var/playstyle_string = "<span class='big bold'>You are a Spider Clan medical cyborg!</span><br>\
						<b>You are armed with powerful medical tools to aid you in your mission: obey your ninja masters by any means necessary. \
						Your hypospray will produce Restorative Nanites, a wonder-drug that will heal most types of bodily damages, including clone and brain damage. It also produces morphine for offense. \
						Your defibrillator paddles can revive allies through their hardsuits, or can be used on harm intent to shock enemies! \
						Your energy saw functions as a circular saw, but can be activated to deal more damage, and your pinpointer will find and locate fellow members of the Spider Clan.</b>"
	set_module = /obj/item/robot_module/syndicate_medical/spider
	typing_indicator_state = /obj/effect/overlay/typing_indicator/additional/spider

/mob/living/silicon/robot/modules/saboteur/spider// ditto
	bubble_icon = "spider"
	var/playstyle_string = "<span class='big bold'>You are a Spider Clan saboteur cyborg!</span><br>\
						<b>You are armed with robust engineering tools to aid you in your mission: obey your ninja masters by any means necessary. \
						Your destination tagger will allow you to stealthily traverse the disposal network across the station. \
						Your welder will can be used to repair yourself or any allied silicon units, while serving as an impromptu melee weapon.  \
						Your cyborg chameleon projector allows you to assume the appearance and registered name of a Nanotrasen engineering borg, and undertake covert actions on the station, \
						be aware that almost any physical contact or incidental damage will break your camouflage.</b>"
	set_module = /obj/item/robot_module/saboteur/spider
	typing_indicator_state = /obj/effect/overlay/typing_indicator/additional/spider

/mob/living/silicon/robot/proc/notify_ai(notifytype, oldname, newname)
	if(!connected_ai)
		return
	switch(notifytype)
		if(NEW_BORG) //New Cyborg
			to_chat(connected_ai, "<br><br><span class='notice'>NOTICE - New cyborg connection detected: <a href='?src=[REF(connected_ai)];track=[html_encode(name)]'>[name]</a></span><br>")
		if(NEW_MODULE) //New Module
			to_chat(connected_ai, "<br><br><span class='notice'>NOTICE - Cyborg module change detected: [name] has loaded the [designation] module.</span><br>")
		if(RENAME) //New Name
			to_chat(connected_ai, "<br><br><span class='notice'>NOTICE - Cyborg reclassification detected: [oldname] is now designated as [newname].</span><br>")
		if(AI_SHELL) //New Shell
			to_chat(connected_ai, "<br><br><span class='notice'>NOTICE - New cyborg shell detected: <a href='?src=[REF(connected_ai)];track=[html_encode(name)]'>[name]</a></span><br>")
		if(DISCONNECT) //Tampering with the wires
			to_chat(connected_ai, "<br><br><span class='notice'>NOTICE - Remote telemetry lost with [name].</span><br>")

/mob/living/silicon/robot/canUseTopic(atom/movable/M, be_close=FALSE, no_dextery=FALSE, no_tk=FALSE, check_resting=FALSE)
	if(stat || locked_down || low_power_mode)
		to_chat(src, "<span class='warning'>You can't do that right now!</span>")
		return FALSE
	if(be_close && !in_range(M, src))
		to_chat(src, "<span class='warning'>You are too far away!</span>")
		return FALSE
	return TRUE

/mob/living/silicon/robot/updatehealth()
	..()
	// if(!module.breakable_modules)
	// 	return

	/// the current percent health of the robot (-1 to 1)
	var/percent_hp = health/maxHealth
	if(health <= previous_health) //if change in health is negative (we're losing hp)
		if(percent_hp <= 0.5)
			break_cyborg_slot(3)

		if(percent_hp <= 0)
			break_cyborg_slot(2)

		if(percent_hp <= -0.5)
			break_cyborg_slot(1)

	else //if change in health is positive (we're gaining hp)
		if(percent_hp >= 0.5)
			repair_cyborg_slot(3)

		if(percent_hp >= 0)
			repair_cyborg_slot(2)

		if(percent_hp >= -0.5)
			repair_cyborg_slot(1)

	previous_health = health

/mob/living/silicon/robot/update_sight()
	if(!client)
		return
	if(stat == DEAD)
		sight = (SEE_TURFS|SEE_MOBS|SEE_OBJS)
		see_in_dark = 8
		see_invisible = SEE_INVISIBLE_OBSERVER
		return

	see_invisible = initial(see_invisible)
	see_in_dark = initial(see_in_dark)
	sight = initial(sight)
	lighting_alpha = LIGHTING_PLANE_ALPHA_VISIBLE

	if(client.eye != src)
		var/atom/A = client.eye
		if(A.update_remote_sight(src)) //returns 1 if we override all other sight updates.
			return

	if(sight_mode & BORGMESON)
		sight |= SEE_TURFS
		lighting_alpha = LIGHTING_PLANE_ALPHA_MOSTLY_VISIBLE
		see_in_dark = 1

	if(sight_mode & BORGMATERIAL)
		sight |= SEE_OBJS
		lighting_alpha = LIGHTING_PLANE_ALPHA_MOSTLY_INVISIBLE
		see_in_dark = 1

	if(sight_mode & BORGXRAY)
		sight |= (SEE_TURFS|SEE_MOBS|SEE_OBJS)
		see_invisible = SEE_INVISIBLE_LIVING
		see_in_dark = 8

	if(sight_mode & BORGTHERM)
		sight |= SEE_MOBS
		lighting_alpha = LIGHTING_PLANE_ALPHA_MOSTLY_VISIBLE
		see_invisible = min(see_invisible, SEE_INVISIBLE_LIVING)
		see_in_dark = 8

	if(see_override)
		see_invisible = see_override
	sync_lighting_plane_alpha()

/mob/living/silicon/robot/update_stat()
	if(status_flags & GODMODE)
		return
	if(stat != DEAD)
		if(health <= -maxHealth) //die only once
			death()
			toggle_headlamp(1)
			return
		if(IsUnconscious() || IsStun() || IsKnockdown() || IsParalyzed() || getOxyLoss() > maxHealth * 0.5)
			set_stat(UNCONSCIOUS)
		else
			set_stat(CONSCIOUS)
		update_mobility()
	diag_hud_set_status()
	diag_hud_set_health()
	diag_hud_set_aishell()
	update_health_hud()
	..()

/mob/living/silicon/robot/revive(full_heal = FALSE, admin_revive = FALSE, excess_healing = 0)
	if(..()) //successfully ressuscitated from death
		if(!QDELETED(builtInCamera) && !wires.is_cut(WIRE_CAMERA))
			builtInCamera.toggle_cam(src,0)
		if(admin_revive)
			locked = TRUE
		notify_ai(NEW_BORG)
		. = TRUE
		toggle_headlamp(FALSE, TRUE) //This will reenable borg headlamps if doomsday is currently going on still.

/mob/living/silicon/robot/fully_replace_character_name(oldname, newname)
	..()
	if(oldname != real_name)
		notify_ai(RENAME, oldname, newname)
	if(!QDELETED(builtInCamera))
		builtInCamera.c_tag = real_name
	if(aiPDA && !shell)
		aiPDA.owner = newname
		aiPDA.name = newname + " (" + aiPDA.ownjob + ")"
	custom_name = newname


/mob/living/silicon/robot/proc/ResetModule()
	// SEND_SIGNAL(src, COMSIG_BORG_SAFE_DECONSTRUCT)
	uneq_all()
	shown_robot_modules = FALSE
	if(hud_used)
		hud_used.update_robot_modules_display()
	logevent("Chassis configuration has been reset.")
	module.transform_to(/obj/item/robot_module)

	// Remove upgrades.
	for(var/obj/item/borg/upgrade/I in upgrades)
		I.deactivate(src)
		I.forceMove(get_turf(src))

	upgrades.Cut()

	vtec = 0
	vtec_disabled = FALSE
	ionpulse = FALSE
	revert_shell()

	return TRUE

/mob/living/silicon/robot/proc/has_module()
	if(!module || module.type == /obj/item/robot_module)
		. = FALSE
	else
		. = TRUE

/mob/living/silicon/robot/proc/update_module_innate()
	designation = module.name
	if(hands)
		hands.icon_state = module.moduleselect_icon
		//CITADEL CHANGE - allows module select icons to use a different icon file
		hands.icon = (module.moduleselect_alternate_icon ? module.moduleselect_alternate_icon : initial(hands.icon))
	if(module.can_be_pushed)
		status_flags |= CANPUSH
	else
		status_flags &= ~CANPUSH

	if(module.clean_on_move)
		AddElement(/datum/element/cleaning, cleaning_range = 1)
	else
		RemoveElement(/datum/element/cleaning)

	hat_offset = module.hat_offset

	magpulse = module.magpulsing
	INVOKE_ASYNC(src, PROC_REF(updatename))


/mob/living/silicon/robot/proc/place_on_head(obj/item/new_hat)
	if(hat)
		hat.forceMove(get_turf(src))
	hat = new_hat
	new_hat.forceMove(src)
	update_icons()

/**
	*Checking Exited() to detect if a hat gets up and walks off.
	*Drones and pAIs might do this, after all.
*/
/mob/living/silicon/robot/Exited(atom/movable/gone)
	. = ..()
	if(hat == gone)
		hat = null
		if(!QDELETED(src)) //Don't update icons if we are deleted.
			update_icons()

	if(gone == cell)
		cell = null

	if(gone == mmi)
		mmi = null

///Called when a mob uses an upgrade on an open borg. Checks to make sure the upgrade can be applied
/mob/living/silicon/robot/proc/apply_upgrade(obj/item/borg/upgrade/new_upgrade, mob/user, admin_added)
	if(!admin_added && isnull(user))
		return FALSE
	if(new_upgrade in upgrades)
		return FALSE
	if(!admin_added && !user.temporarilyRemoveItemFromInventory(new_upgrade)) //calling the upgrade's dropped() proc /before/ we add action buttons
		return FALSE
	if(!new_upgrade.action(src, user))
		to_chat(user, span_danger("Upgrade error."))
		if(admin_added)
			qdel(new_upgrade)
		else
			new_upgrade.forceMove(loc) //gets lost otherwise
		return FALSE
	to_chat(user, span_notice("You apply the upgrade to [src]."))
	add_to_upgrades(new_upgrade)
	return TRUE

///Moves the upgrade inside the robot and registers relevant signals.
/mob/living/silicon/robot/proc/add_to_upgrades(obj/item/borg/upgrade/new_upgrade)
	to_chat(src, "----------------\nNew hardware detected...Identified as \"<b>[new_upgrade]</b>\"...Setup complete.\n----------------")
	if(new_upgrade.one_use)
		logevent("Firmware [new_upgrade] run successfully.")
		qdel(new_upgrade)
		return
	upgrades += new_upgrade
	new_upgrade.forceMove(src)
	RegisterSignal(new_upgrade, COMSIG_MOVABLE_MOVED, PROC_REF(remove_from_upgrades))
	RegisterSignal(new_upgrade, COMSIG_PARENT_QDELETING, PROC_REF(on_upgrade_deleted))
	logevent("Hardware [new_upgrade] installed successfully.")

///Called when an upgrade is moved outside the robot. So don't call this directly, use forceMove etc.
/mob/living/silicon/robot/proc/remove_from_upgrades(obj/item/borg/upgrade/old_upgrade)
	SIGNAL_HANDLER
	if(loc == src)
		return
	old_upgrade.deactivate(src)
	upgrades -= old_upgrade
	UnregisterSignal(old_upgrade, list(COMSIG_MOVABLE_MOVED, COMSIG_PARENT_QDELETING))

///Called when an applied upgrade is deleted.
/mob/living/silicon/robot/proc/on_upgrade_deleted(obj/item/borg/upgrade/old_upgrade)
	SIGNAL_HANDLER
	if(!QDELETED(src))
		old_upgrade.deactivate(src)
	upgrades -= old_upgrade
	UnregisterSignal(old_upgrade, list(COMSIG_MOVABLE_MOVED, COMSIG_PARENT_QDELETING))

/**
 * make_shell: Makes an AI shell out of a cyborg unit
 *
 * Arguments:
 * * board - B.O.R.I.S. module board used for transforming the cyborg into AI shell
 */
/mob/living/silicon/robot/proc/make_shell(obj/item/borg/upgrade/ai/board)
	if(isnull(board))
		stack_trace("make_shell was called without a board argument! This is never supposed to happen!")
		return FALSE

	shell = TRUE
	braintype = "AI Shell"
	name = "Empty AI Shell-[ident]"
	real_name = name
	GLOB.available_ai_shells |= src
	if(!QDELETED(builtInCamera))
		builtInCamera.c_tag = real_name //update the camera name too
	diag_hud_set_aishell()
	notify_ai(AI_SHELL)

/**
 * revert_shell: Reverts AI shell back into a normal cyborg unit
 */
/mob/living/silicon/robot/proc/revert_shell()
	if(!shell)
		return
	undeploy()
	for(var/obj/item/borg/upgrade/ai/boris in src)
	//A player forced reset of a borg would drop the module before this is called, so this is for catching edge cases
		qdel(boris)
		upgrades -= boris
	shell = FALSE
	GLOB.available_ai_shells -= src
	name = "Unformatted Cyborg-[ident]"
	real_name = name
	if(!QDELETED(builtInCamera))
		builtInCamera.c_tag = real_name
	diag_hud_set_aishell()

/**
 * deploy_init: Deploys AI unit into AI shell
 *
 * Arguments:
 * * AI - AI unit that initiated the deployment into the AI shell
 */
/mob/living/silicon/robot/proc/deploy_init(mob/living/silicon/ai/AI)
	real_name = "[AI.real_name] [designation] Shell-[ident]"
	name = real_name
	if(!QDELETED(builtInCamera))
		builtInCamera.c_tag = real_name	//update the camera name too
	mainframe = AI
	deployed = TRUE
	set_connected_ai(mainframe)
	mainframe.connected_robots |= src
	lawupdate = TRUE
	lawsync()
	if(radio && AI.radio) //AI keeps all channels, including Syndie if it is a Traitor
		if(AI.radio.syndie)
			radio.make_syndie()
		radio.subspace_transmission = TRUE
		radio.channels = AI.radio.channels
		for(var/chan in radio.channels)
			radio.secure_radio_connections[chan] = add_radio(radio, GLOB.radiochannels[chan])

	diag_hud_set_aishell()
	undeployment_action.Grant(src)

/datum/action/innate/undeployment
	name = "Disconnect from shell"
	desc = "Stop controlling your shell and resume normal core operations."
	icon_icon = 'icons/mob/actions/actions_AI.dmi'
	button_icon_state = "ai_core"
	required_mobility_flags = NONE

/datum/action/innate/undeployment/Trigger()
	if(!..())
		return FALSE
	var/mob/living/silicon/robot/R = owner

	R.undeploy()
	return TRUE

/datum/action/innate/custom_holoform
	name = "Select Custom Holoform"
	desc = "Select one of your existing avatars to use as a holoform."
	icon_icon = 'icons/mob/actions/actions_silicon.dmi'
	button_icon_state = "custom_holoform"
	required_mobility_flags = NONE

/datum/action/innate/custom_holoform/Trigger()
	if(!..())
		return FALSE
	var/mob/living/silicon/S = owner

	//if setting the holoform succeeds, attempt to set it as the current holoform for the pAI or AI
	if(S.attempt_set_custom_holoform())
		if(istype(S, /mob/living/silicon/pai))
			var/mob/living/silicon/pai/P = S
			P.chassis = "custom"
		else if(istype(S, /mob/living/silicon/ai))
			var/mob/living/silicon/ai/A = S
			if(A.client?.prefs?.custom_holoform_icon)
				A.holo_icon = A.client.prefs.get_filtered_holoform(HOLOFORM_FILTER_AI)
			else
				A.holo_icon = getHologramIcon(icon('icons/mob/ai.dmi', "female"))

	return TRUE


/mob/living/silicon/robot/proc/undeploy()

	if(!deployed || !mind || !mainframe)
		return
	mainframe.redeploy_action.Grant(mainframe)
	mainframe.redeploy_action.last_used_shell = src
	mind.transfer_to(mainframe)
	deployed = FALSE
	mainframe.deployed_shell = null
	undeployment_action.Remove(src)
	if(radio) //Return radio to normal
		radio.recalculateChannels()
	if(!QDELETED(builtInCamera))
		builtInCamera.c_tag = real_name	//update the camera name too
	diag_hud_set_aishell()
	mainframe.diag_hud_set_deployed()
	if(mainframe.laws)
		mainframe.laws.show_laws(mainframe) //Always remind the AI when switching
	if(mainframe.eyeobj)
		mainframe.eyeobj.setLoc(loc)
	mainframe = null

/mob/living/silicon/robot/attack_ai(mob/user)
	if(shell && (!connected_ai || connected_ai == user))
		var/mob/living/silicon/ai/AI = user
		AI.deploy_to_shell(src)

/mob/living/silicon/robot/shell
	shell = TRUE
	cell = null

/mob/living/silicon/robot/MouseDrop_T(mob/living/M, mob/living/user)
	. = ..()
	if(!(M in buckled_mobs) && isliving(M))
		buckle_mob(M)

/mob/living/silicon/robot/buckle_mob(mob/living/M, force = FALSE, check_loc = TRUE)
	// BLUEMOON ADD START - дубликает проверки, т.к. функция переписывает попытку сесть
	if(!pre_buckle_mob(M))
		return FALSE
	// BLUEMOON ADD END

	if(!is_type_in_typecache(M, can_ride_typecache))
		M.visible_message("<span class='warning'>[M] really can't seem to mount [src]...</span>")
		return

	var/datum/component/riding/riding_datum = LoadComponent(/datum/component/riding/cyborg)
	if(buckled_mobs)
		if(buckled_mobs.len >= max_buckled_mobs)
			return
		if(M in buckled_mobs)
			return

	if(stat || incapacitated())
		return
	if(module && !module.allow_riding)
		M.visible_message("<span class='boldwarning'>Unfortunately, [M] just can't seem to hold onto [src]!</span>")
		return
	if(iscarbon(M) && !M.incapacitated() && !riding_datum.equip_buckle_inhands(M, 1))
		if(M.get_num_arms() <= 0)
			M.visible_message("<span class='boldwarning'>[M] can't climb onto [src] because [M.ru_who()] don't have any usable arms!</span>")
		else
			M.visible_message("<span class='boldwarning'>[M] can't climb onto [src] because [M.ru_ego()] hands are full!</span>")
		return
	. = ..(M, force, check_loc)

/mob/living/silicon/robot/unbuckle_mob(mob/user, force=FALSE)
	if(iscarbon(user))
		var/datum/component/riding/riding_datum = GetComponent(/datum/component/riding)
		if(istype(riding_datum))
			riding_datum.unequip_buckle_inhands(user)
			riding_datum.restore_position(user)
	. = ..(user)

/mob/living/silicon/robot/resist()
	. = ..()
	if(!has_buckled_mobs())
		return
	for(var/i in buckled_mobs)
		var/mob/unbuckle_me_now = i
		unbuckle_mob(unbuckle_me_now, FALSE)

/mob/living/silicon/robot/proc/TryConnectToAI(mob/living/silicon/ai/connect_to)
	set_connected_ai(connect_to || select_active_ai_with_fewest_borgs(z))
	if(connected_ai)
		lawsync()
		lawupdate = TRUE
		return TRUE
	picturesync()
	return FALSE

/mob/living/silicon/robot/proc/picturesync()
	if(connected_ai?.aicamera && aicamera)
		for(var/i in aicamera.stored)
			connected_ai.aicamera.stored[i] = TRUE
		for(var/i in connected_ai.aicamera.stored)
			aicamera.stored[i] = TRUE

/mob/living/silicon/robot/proc/charge(datum/source, amount, repairs)
	if(module)
		module.respawn_consumable(src, amount * 0.005)
	if(cell)
		cell.charge = min(cell.charge + amount, cell.maxcharge)
	if(repairs)
		heal_bodypart_damage(repairs, repairs - 1)

/mob/living/silicon/robot/proc/rest_style()
	set name = "Switch Rest Style"
	set category = "Robot Commands"
	set desc = "Select your resting pose."
	sitting = 0
	bellyup = 0
	deep_rest = 0		//DarkSer request by Gardelin0
	wag_rest = 0		//DarkSer request by Gardelin0
	wag_sit = 0			//DarkSer request by Gardelin0

	if(module.drakerest == TRUE)	//DarkSer request by Gardelin0
		var/choice_drake = tgui_alert(usr, "Select resting pose", "Pose", list("Resting", "Sitting", "Belly up", "Napping", "Resting Wag", "Sitting Wag"))
		switch(choice_drake)
			if("Resting")
				update_icons()
				return FALSE
			if("Sitting")
				sitting = 1
			if("Belly up")
				bellyup = 1
			if("Napping")
				deep_rest = 1
			if("Resting Wag")
				wag_rest = 1
			if("Sitting Wag")
				wag_sit = 1
		update_icons()
	if(module.drakerest == FALSE)
		var/choice = tgui_alert(usr, "Select resting pose", "Pose", list("Resting", "Sitting", "Belly up"))
		switch(choice)
			if("Resting")
				update_icons()
				return FALSE
			if("Sitting")
				sitting = 1
			if("Belly up")
				bellyup = 1
		update_icons()

/mob/living/silicon/robot/verb/viewmanifest()
	set category = "Robot Commands"
	set name = "View Crew Manifest"

	if(usr.stat == DEAD)
		return //won't work if dead
	ai_roster()

/mob/living/silicon/robot/proc/set_connected_ai(new_ai)
	if(connected_ai == new_ai)
		return
	. = connected_ai
	connected_ai = new_ai
	if(.)
		var/mob/living/silicon/ai/old_ai = .
		old_ai.connected_robots -= src
	lamp_doom = FALSE
	if(connected_ai)
		connected_ai.connected_robots |= src
		lamp_doom = connected_ai.doomsday_device ? TRUE : FALSE
	toggle_headlamp(FALSE, TRUE)

/**
 * Records an IC event log entry in the cyborg's internal tablet.
 *
 * Creates an entry in the borglog list of the cyborg's internal tablet, listing the current
 * in-game time followed by the message given. These logs can be seen by the cyborg in their
 * BorgUI tablet app. By design, logging fails if the cyborg is dead.
 *
 * Arguments:
 * arg1: a string containing the message to log.
 */
/mob/living/silicon/robot/proc/logevent(string = "")
	if(!string)
		return
	if(stat == DEAD) //Dead borgs log no longer
		return
	if(!modularInterface)
		stack_trace("Cyborg [src] ( [type] ) was somehow missing their integrated tablet. Please make a bug report.")
		create_modularInterface()
	modularInterface.borglog += "[STATION_TIME_TIMESTAMP("hh:mm:ss", world.time)] - [string]"
	var/datum/computer_file/program/robotact/program = modularInterface.get_robotact()
	if(program)
		program.force_full_update()

/mob/living/silicon/robot/get_tooltip_data()
	var/t_He = ru_who(TRUE)
	var/t_is = p_are()
	. = list()
	var/borg_type = module ? module : "Default"
//This isn't even used normally, but if that ever changes, just uncomment this
/*	var/obj/item/borg_chameleon/chameleon = locate() in src
	if(!chameleon)
		chameleon = locate() in src.module
	if(chameleon?.active)
		borg_type = "Engineering"
*/
	. += "[t_He] [t_is] a [borg_type] unit"
	if(activity)
		. += activity
	SEND_SIGNAL(src, COMSIG_PARENT_EXAMINE, usr, .)
