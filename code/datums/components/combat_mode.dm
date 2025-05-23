/**
  * Combat mode component. It makes the user face whichever atom the mouse pointer is hovering,
  * amongst other things designed outside of this file, namely PvP and PvE stuff, hence the name.
  * Can be toggled on and off by clicking the screen hud object or by pressing the assigned hotkey (default 'C')
  */
/datum/component/combat_mode
	var/mode_flags = COMBAT_MODE_INACTIVE
	var/combatmessagecooldown
	var/lastmousedir
	var/atom/movable/screen/combattoggle/hud_icon
	var/hud_loc

/datum/component/combat_mode/Initialize(hud_loc = ui_combat_toggle)
	if(!isliving(parent))
		return COMPONENT_INCOMPATIBLE
	var/mob/living/L = parent

	src.hud_loc = hud_loc

	RegisterSignal(L, SIGNAL_TRAIT(TRAIT_COMBAT_MODE_LOCKED), PROC_REF(update_combat_lock))
	RegisterSignal(L, COMSIG_TOGGLE_COMBAT_MODE, PROC_REF(user_toggle_intentional_combat_mode))
	RegisterSignal(L, COMSIG_DISABLE_COMBAT_MODE, PROC_REF(safe_disable_combat_mode))
	RegisterSignal(L, COMSIG_ENABLE_COMBAT_MODE, PROC_REF(safe_enable_combat_mode))
	RegisterSignal(L, COMSIG_MOB_DEATH, PROC_REF(on_death))
	RegisterSignal(L, COMSIG_MOB_CLIENT_LOGOUT, PROC_REF(on_logout))
	RegisterSignal(L, COMSIG_MOB_HUD_CREATED, PROC_REF(on_mob_hud_created))
	RegisterSignal(L, COMSIG_COMBAT_MODE_CHECK, PROC_REF(check_flags))

	update_combat_lock()

	if(L.client)
		on_mob_hud_created(L)

/datum/component/combat_mode/Destroy()
	if(parent)
		safe_disable_combat_mode(parent)
	if(hud_icon)
		QDEL_NULL(hud_icon)
	return ..()

/// Creates the hud screen object.
/datum/component/combat_mode/proc/on_mob_hud_created(mob/source)
	hud_icon = new(null, source.hud_used)
	hud_icon.icon = tg_ui_icon_to_cit_ui(source.hud_used.ui_style)
	hud_icon.screen_loc = hud_loc
	source.hud_used.static_inventory += hud_icon
	hud_icon.update_icon()

/// Combat mode can be locked out, forcibly disabled by a status trait.
/datum/component/combat_mode/proc/update_combat_lock()
	var/locked = HAS_TRAIT(parent, TRAIT_COMBAT_MODE_LOCKED)
	var/desired = (mode_flags & COMBAT_MODE_TOGGLED)
	var/actual = (mode_flags & COMBAT_MODE_ACTIVE)
	if(actual)
		if(locked)
			disable_combat_mode(parent, FALSE, TRUE)
		else if(!desired)
			disable_combat_mode(parent, TRUE, TRUE)
	else
		if(desired && !locked)
			enable_combat_mode(parent, FALSE, TRUE)

/// Enables combat mode. Please use 'safe_enable_combat_mode' instead, if you wish to also enable the toggle flag.
/datum/component/combat_mode/proc/enable_combat_mode(mob/living/source, silent = TRUE, forced = TRUE, visible = FALSE, locked = FALSE, playsound = FALSE)
	if(locked)
		if(hud_icon)
			hud_icon.combat_on = TRUE
			hud_icon.update_icon()
		return
	if(mode_flags & COMBAT_MODE_ACTIVE)
		return
	mode_flags |= COMBAT_MODE_ACTIVE
	mode_flags &= ~COMBAT_MODE_INACTIVE
	SEND_SIGNAL(source, COMSIG_LIVING_COMBAT_ENABLED, forced)
	if(!silent)
		var/self_message = forced? "<span class='warning'>Your muscles reflexively tighten!</span>" : "<span class='warning'>You drop into a combative stance!</span>"
		if(visible && (forced || world.time >= combatmessagecooldown))
			combatmessagecooldown = world.time + 10 SECONDS
			if(!forced)
				if(source.a_intent != INTENT_HELP)
					source.visible_message("<span class='warning'>[source] [source.resting ? "tenses up" : "drops into a combative stance"].</span>", self_message)
				else
					source.visible_message("<span class='notice'>[source] [pick("looks","seems","goes")] [pick("alert","attentive","vigilant")].</span>")
			else
				source.visible_message("<span class='warning'>[source] drops into a combative stance!</span>", self_message)
		else
			to_chat(source, self_message)
		if(playsound)
			playsound(source, 'sound/machines/chime.ogg', 10) 	//sandstorm stuff - combat mode indicator
			flick_emote_popup_on_mob(source, "combat", 10)	//sandstorm stuff - combat mode indicator
	log_combat(source, source, "включает Комбат Индикатор")
	RegisterSignal(source, COMSIG_MOB_CLIENT_MOUSEMOVE, PROC_REF(onMouseMove))
	RegisterSignal(source, COMSIG_MOVABLE_MOVED, PROC_REF(on_move))
	if(hud_icon)
		hud_icon.combat_on = TRUE
		hud_icon.update_icon()

	source.set_combat_indicator(TRUE) //sandstorm stuff - combat mode indicator

/// Disables combat mode. Please use 'safe_disable_combat_mode' instead, if you wish to also disable the toggle flag.
/datum/component/combat_mode/proc/disable_combat_mode(mob/living/source, silent = TRUE, forced = TRUE, visible = FALSE, locked = FALSE, playsound = FALSE)
	if(locked)
		if(hud_icon)
			hud_icon.combat_on = FALSE
			hud_icon.update_icon()
		return
	if(!(mode_flags & COMBAT_MODE_ACTIVE))
		return
	mode_flags &= ~COMBAT_MODE_ACTIVE
	mode_flags |= COMBAT_MODE_INACTIVE
	SEND_SIGNAL(source, COMSIG_LIVING_COMBAT_DISABLED, forced)
	if(!silent)
		var/self_message = forced? "<span class='warning'>Your muscles are forcibly relaxed!</span>" : "<span class='warning'>You relax your stance.</span>"
		if(visible)
			source.visible_message("<span class='warning'>[source] relaxes [source.ru_ego()] stance.</span>", self_message)
		else
			to_chat(source, self_message)
		if(playsound)
			source.playsound_local(source, 'sound/misc/ui_toggleoff.ogg', 50, FALSE, pressure_affected = FALSE) //Slightly modified version of the toggleon sound!
	UnregisterSignal(source, list(COMSIG_MOB_CLIENT_MOUSEMOVE, COMSIG_MOVABLE_MOVED))
	if(hud_icon)
		hud_icon.combat_on = FALSE
		hud_icon.update_icon()
	source.stop_active_blocking()
	source.end_parry_sequence()

	source.set_combat_indicator(FALSE) //sandstorm stuff - combat mode indicator

///Changes the user direction to (try) keep match the pointer.
/datum/component/combat_mode/proc/on_move(atom/movable/source, dir, atom/oldloc, forced)
	var/mob/living/L = source
	if((mode_flags & COMBAT_MODE_ACTIVE) && L.client)
		L.setDir(lastmousedir, ismousemovement = TRUE)

///Changes the user direction to (try) match the pointer.
/datum/component/combat_mode/proc/onMouseMove(mob/source, object, location, control, params)
	if(source.client.show_popup_menus)
		return
	source.face_atom(object, TRUE)
	lastmousedir = source.dir

/// Toggles whether the user is intentionally in combat mode. THIS should be the proc you generally use! Has built in visual/to other player feedback, as well as an audible cue to ourselves.
/datum/component/combat_mode/proc/user_toggle_intentional_combat_mode(mob/living/source)
	if(mode_flags & COMBAT_MODE_TOGGLED)
		safe_disable_combat_mode(source)
	else if(source.stat == CONSCIOUS && !(source.combat_flags & COMBAT_FLAG_HARD_STAMCRIT))
		safe_enable_combat_mode(source)

/// Enables intentionally being in combat mode. Please try to use the COMSIG_COMBAT_MODE_CHECK signal for feedback when possible.
/datum/component/combat_mode/proc/safe_enable_combat_mode(mob/living/source, silent = FALSE, visible = TRUE)
	if((mode_flags & COMBAT_MODE_TOGGLED) && (mode_flags & COMBAT_MODE_ACTIVE))
		return TRUE
	mode_flags |= COMBAT_MODE_TOGGLED
	enable_combat_mode(source, silent, FALSE, visible, HAS_TRAIT(source, TRAIT_COMBAT_MODE_LOCKED), TRUE)
	if(source.client)
		source.client.show_popup_menus = FALSE
	if(iscarbon(source)) //I dislike this typecheck. It probably should be removed once that spoiled apple is componentized too.
		var/mob/living/carbon/C = source
		if(C.voremode)
			C.disable_vore_mode()
	return TRUE

/// Disables intentionally being in combat mode. Please try to use the COMSIG_COMBAT_MODE_CHECK signal for feedback when possible.
/datum/component/combat_mode/proc/safe_disable_combat_mode(mob/living/source, silent = FALSE, visible = FALSE)
	if(!(mode_flags & COMBAT_MODE_TOGGLED) && !(mode_flags & COMBAT_MODE_ACTIVE))
		return TRUE
	mode_flags &= ~COMBAT_MODE_TOGGLED
	disable_combat_mode(source, silent, FALSE, visible, !(mode_flags & COMBAT_MODE_ACTIVE), TRUE)
	if(source.client)
		source.client.show_popup_menus = TRUE
	return TRUE

/// Returns a field of flags that are contained in both the second arg and our bitfield variable.
/datum/component/combat_mode/proc/check_flags(mob/living/source, flags)
	return mode_flags & (flags)

/// Disables combat mode upon death.
/datum/component/combat_mode/proc/on_death(mob/living/source)
	safe_disable_combat_mode(source)

/// Disables combat mode upon logout
/datum/component/combat_mode/proc/on_logout(mob/living/source)
	safe_disable_combat_mode(source)

/// The screen button.
/atom/movable/screen/combattoggle
	name = "toggle combat mode"
	icon = 'modular_citadel/icons/ui/screen_midnight.dmi'
	icon_state = "combat_off"
	mouse_over_pointer = MOUSE_HAND_POINTER
	var/mutable_appearance/flashy
	var/combat_on = FALSE ///Wheter combat mode is enabled or not, so we don't have to store a reference.

/atom/movable/screen/combattoggle/Click()
	if(hud && usr == hud.mymob)
		SEND_SIGNAL(hud.mymob, COMSIG_TOGGLE_COMBAT_MODE)

/atom/movable/screen/combattoggle/update_icon_state()
	var/mob/living/user = hud?.mymob
	if(!user)
		return
	if(combat_on)
		icon_state = "combat"
	else if(HAS_TRAIT(user, TRAIT_COMBAT_MODE_LOCKED))
		icon_state = "combat_locked"
	else
		icon_state = "combat_off"

/atom/movable/screen/combattoggle/update_overlays()
	. = ..()
	var/mob/living/carbon/user = hud?.mymob
	if(!(user?.client))
		return

	if(combat_on)
		if(!flashy)
			flashy = mutable_appearance('icons/mob/screen_gen.dmi', "togglefull_flash")
		flashy.color = user.client.prefs.hud_toggle_color
		. += flashy //TODO - beg lummox jr for the ability to force mutable appearances or images to be created rendering from their first frame of animation rather than being based entirely around the client's frame count
