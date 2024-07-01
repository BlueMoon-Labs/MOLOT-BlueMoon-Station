/datum/language/modular_bluemoon/demonic
	name = LANGUAGE_DEMONIC
	desc = "The native language of many out-worlded beings. Often can be heard from someone a human could describe as a demon, fiend or anyone inbetween. (Используйте русскую букву для префикса)."
	icon = 'modular_bluemoon/icons/misc/language.dmi'
	icon_state = "demonic"
	speech_verb = "proclaims"
	ask_verb = "queries"
	exclaim_verb = "declares"
	whisper_verb = "hushes"
	key = "д"
	space_chance = 65
	default_priority = 92
	restricted = FALSE

	complex_language = TRUE
	syllables = list( // буквально латинские корни
		"ann", "acu", "audi", "bene", "bibl", "cent", "civ",
		"clar", "cred", "dict", "fract", "jur", "lax", "liber",
		"lumin", "magn", "mal", "migr", "neg", "non", "nov", "ov",
		"pre", "prim", "xim", "ques", "re", "retro", "san", "sci", "scrib",
		"semi", "sens", "soci", "sol", "surg", "temp", "tes", "gres",
		"vac", "vag", "ver", "vid", "entia"
	)
	syllables_additions_chance = 95
	syllables_prefix = list( // буквально латинские приставки
		"ab", "multi", "ambi", "ante", "bi", "contr", "con", "des", "ex",
		"extra", "ir", "inter", "per", "post", "pro", "sub", "trans", "uni"
	)
	syllables_endings = list( // буквально латинские окончания
		"us", "um", "u", "uum", "libus", "ua", "es", "a", "is", "em", "e",
		"orum", "erum", "li", "arum", "ae", "lius", "pio"
	)
