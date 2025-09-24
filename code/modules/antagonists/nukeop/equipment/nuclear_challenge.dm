#define CHALLENGE_TELECRYSTALS 300
#define PLAYER_SCALING 1.5
#define CHALLENGE_TIME_LIMIT 25000 // 25 minutes, so the ops have at least 5 minutes before the shuttle is callable.
#define CHALLENGE_PLAYERS_TARGET 25 //target players population. anything below is a malus to the challenge tc bonus.
#define TELECRYSTALS_MALUS_SCALING 1.5 //the higher the value, the bigger the malus.
#define CHALLENGE_SHUTTLE_DELAY 25000 // 25 minutes, so the ops have at least 5 minutes before the shuttle is callable.

GLOBAL_LIST_EMPTY(jam_on_wardec)
GLOBAL_VAR_INIT(war_declared, FALSE)

/obj/item/nuclear_challenge
	name = "Declaration of War (Challenge Mode)"
	icon = 'icons/obj/device.dmi'
	icon_state = "gangtool-red"
	item_state = "radio"
	lefthand_file = 'icons/mob/inhands/misc/devices_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/misc/devices_righthand.dmi'
	desc = "Use to send a declaration of hostilities to the target, delaying your shuttle departure for 20 minutes while they prepare for your assault.  \
			Such a brazen move will attract the attention of powerful benefactors within the Syndicate, who will supply your team with a massive amount of bonus credits.  \
			Must be used within five minutes, or your benefactors will lose interest."
	var/declaring_war = FALSE
	var/uplink_type = /obj/item/inteq/uplink/radio/nuclear
	var/war_sound = 'sound/machines/alarm.ogg'

/obj/item/nuclear_challenge/attack_self(mob/living/user)
	if(!check_allowed(user))
		return

	declaring_war = TRUE
	var/are_you_sure = alert(user, "Consult your team carefully before you declare war on [station_name()]]. Are you sure you want to alert the enemy crew? You have [DisplayTimeText(world.time-SSticker.round_start_time - CHALLENGE_TIME_LIMIT)] to decide", "Declare war?", "Yes", "No")
	declaring_war = FALSE

	if(!check_allowed(user))
		return

	if(are_you_sure == "No")
		to_chat(user, "On second thought, the element of surprise isn't so bad after all.")
		return

	var/war_declaration = "Местная вооружённая группа Головорезов InteQ заявила о своем намерении полностью уничтожить [station_name()] с помощью Ядерной Боеголовки и предлагает Экипажу попробовать их остановить."

	declaring_war = TRUE
	var/custom_threat = alert(user, "Do you want to customize your declaration?", "Customize?", "Yes", "No")
	declaring_war = FALSE

	if(!check_allowed(user))
		return

	if(custom_threat == "Yes")
		declaring_war = TRUE
		war_declaration = stripped_input(user, "Insert your custom declaration", "Declaration")
		declaring_war = FALSE

	if(!check_allowed(user) || !war_declaration)
		return

	if(SSticker.mode.name == "clown ops")
		war_sound = 'sound/announcer/classic/_admin_war_pipisky.ogg'

	priority_announce(war_declaration, title = "Объявление Войны", sound = war_sound, has_important_message = TRUE)

	addtimer(CALLBACK(SSsecurity_level, TYPE_PROC_REF(/datum/controller/subsystem/security_level, set_level), SEC_LEVEL_LAMBDA), 30 SECONDS)

	to_chat(user, "You've attracted the attention of powerful forces within the InteQ. A bonus bundle of Credits has been granted to your team. Great things await you if you complete the mission.")

	for(var/V in GLOB.syndicate_shuttle_boards)
		var/obj/item/circuitboard/computer/syndicate_shuttle/board = V
		board.challenge = TRUE

	for(var/obj/machinery/computer/camera_advanced/shuttle_docker/D in GLOB.jam_on_wardec)
		D.jammed = TRUE

	GLOB.war_declared = TRUE
	var/list/nukeops = get_antag_minds(/datum/antagonist/nukeop)
	var/actual_players = GLOB.joined_player_list.len - nukeops.len
	var/tc_malus = 0
	if(actual_players < CHALLENGE_PLAYERS_TARGET)
		tc_malus = FLOOR(((CHALLENGE_TELECRYSTALS / CHALLENGE_PLAYERS_TARGET) * (CHALLENGE_PLAYERS_TARGET - actual_players)) * TELECRYSTALS_MALUS_SCALING, 1)

	new uplink_type(get_turf(user), user.key, CHALLENGE_TELECRYSTALS - tc_malus + CEILING(PLAYER_SCALING * actual_players, 1))

	CONFIG_SET(number/shuttle_refuel_delay, max(CONFIG_GET(number/shuttle_refuel_delay), CHALLENGE_SHUTTLE_DELAY))
	SSblackbox.record_feedback("amount", "nuclear_challenge_mode", 1)

	qdel(src)

///Admin only proc to bypass checks and force a war declaration. Button on antag panel.
/obj/item/nuclear_challenge/proc/force_war()
	var/are_you_sure = tgui_alert(usr, "Are you sure you wish to force a war declaration?", "Declare war?", list("Yes", "No"))

	if(are_you_sure != "Yes")
		return

	var/war_declaration = "Местная вооружённая группа Головорезов InteQ заявила о своем намерении полностью уничтожить [station_name()] с помощью Ядерной Боеголовки и предлагает Экипажу попробовать их остановить."

	var/custom_threat = tgui_alert(usr, "Do you want to customize the declaration?", "Customize?", list("Yes", "No"))

	if(custom_threat == "Yes")
		war_declaration = tgui_input_text(usr, "Insert your custom declaration", "Declaration", multiline = TRUE)

	if(!war_declaration)
		to_chat(usr, span_warning("Invalid war declaration."))
		return

	priority_announce(war_declaration, title = "Объявление Войны", sound = 'sound/machines/alarm.ogg', has_important_message = TRUE)

	addtimer(CALLBACK(SSsecurity_level, TYPE_PROC_REF(/datum/controller/subsystem/security_level, set_level), SEC_LEVEL_LAMBDA), 30 SECONDS)

	for(var/V in GLOB.syndicate_shuttle_boards)
		var/obj/item/circuitboard/computer/syndicate_shuttle/board = V
		board.challenge = TRUE

	for(var/obj/machinery/computer/camera_advanced/shuttle_docker/D in GLOB.jam_on_wardec)
		D.jammed = TRUE

	GLOB.war_declared = TRUE
	var/list/nukeops = get_antag_minds(/datum/antagonist/nukeop)
	var/actual_players = GLOB.joined_player_list.len - nukeops.len
	var/tc_malus = 0
	if(actual_players < CHALLENGE_PLAYERS_TARGET)
		tc_malus = FLOOR(((CHALLENGE_TELECRYSTALS / CHALLENGE_PLAYERS_TARGET) * (CHALLENGE_PLAYERS_TARGET - actual_players)) * TELECRYSTALS_MALUS_SCALING, 1)

	new uplink_type(get_turf(usr), usr.key, CHALLENGE_TELECRYSTALS - tc_malus + CEILING(PLAYER_SCALING * actual_players, 1))

	CONFIG_SET(number/shuttle_refuel_delay, max(CONFIG_GET(number/shuttle_refuel_delay), CHALLENGE_SHUTTLE_DELAY))
	SSblackbox.record_feedback("amount", "nuclear_challenge_mode", 1)

	qdel(src)

/obj/item/nuclear_challenge/proc/check_allowed(mob/living/user)
	if(declaring_war)
		to_chat(user, "You are already in the process of declaring war! Make your mind up.")
		return FALSE

	if(!user.onSyndieBase())
		to_chat(user, "You have to be at your base to use this.")
		return FALSE
	if(world.time-SSticker.round_start_time > CHALLENGE_TIME_LIMIT)
		to_chat(user, "It's too late to declare hostilities. Your benefactors are already busy with other schemes. You'll have to make do with what you have on hand.")
		return FALSE
	for(var/V in GLOB.syndicate_shuttle_boards)
		var/obj/item/circuitboard/computer/syndicate_shuttle/board = V
		if(board.moved)
			to_chat(user, "The shuttle has already been moved! You have forfeit the right to declare war.")
			return FALSE
	return TRUE

/obj/item/nuclear_challenge/clownops
	uplink_type = /obj/item/uplink/clownop

#undef CHALLENGE_TELECRYSTALS
#undef CHALLENGE_TIME_LIMIT
#undef CHALLENGE_PLAYERS_TARGET
#undef TELECRYSTALS_MALUS_SCALING
#undef CHALLENGE_SHUTTLE_DELAY
