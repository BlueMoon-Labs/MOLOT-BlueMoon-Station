/datum/antagonist/bloodsucker
	///Blood required to enter Frenzy
	var/frenzy_threshold = FRENZY_THRESHOLD_ENTER
	///If we are currently in a Frenzy
	var/frenzied = FALSE
	///Frenzy Grab Martial art given to Bloodsuckers in a Frenzy
	var/datum/martial_art/frenzygrab/frenzygrab = new
