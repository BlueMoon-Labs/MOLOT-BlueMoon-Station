/datum/preferences
	var/list/favorite_tracks = list()

/datum/preferences/save_preferences()
	. = ..()
	if(!istype(., /savefile))
		return FALSE
	WRITE_FILE(.["favorite_tracks"], favorite_tracks)

/datum/preferences/load_preferences()
	. = ..()
	if(!istype(., /savefile))
		return FALSE
	.["favorite_tracks"] >> favorite_tracks
	favorite_tracks = SANITIZE_LIST(favorite_tracks)
