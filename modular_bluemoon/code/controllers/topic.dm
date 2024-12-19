GLOBAL_LIST_EMPTY(topic_tokens)
GLOBAL_PROTECT(topic_tokens)

GLOBAL_LIST_EMPTY(topic_commands)
GLOBAL_PROTECT(topic_commands)

SUBSYSTEM_DEF(topic)
	name = "Topic"
	init_order = INIT_ORDER_FAIL2TOPIC
	flags = SS_NO_FIRE

/datum/controller/subsystem/topic/Initialize(timeofday)
	// Initialize topic datums
	var/list/anonymous_functions = list()
	for(var/path in subtypesof(/datum/world_topic))
		var/datum/world_topic/T = new path()
		if(T.anonymous)
			anonymous_functions[T.key] = TRUE
		GLOB.topic_commands[T.key] = T

	// Setup the anonymous access token
	GLOB.topic_tokens["anonymous"] = anonymous_functions
	// Parse and setup authed tokens from config
	var/list/tokens = CONFIG_GET(keyed_list/topic_tokens)
	for(var/token in tokens)
		var/list/keys = list()
		if(tokens[token] == "all")
			for(var/key in GLOB.topic_commands)
				keys[key] = TRUE
		else
			for(var/key in splittext(tokens[token], ","))
				keys[trim(key)] = TRUE
			// Grant access to anonymous topic calls (version, authed functions etc.) by default
			keys |= anonymous_functions
		GLOB.topic_tokens[token] = keys

	return ..()

/datum/config_entry/keyed_list/topic_tokens
	key_mode = KEY_MODE_TEXT
	value_mode = VALUE_MODE_TEXT
	protection = CONFIG_ENTRY_HIDDEN|CONFIG_ENTRY_LOCKED

/datum/config_entry/keyed_list/topic_tokens/ValidateListEntry(key_name, key_value)
	return key_value != "topic_token" && ..()
