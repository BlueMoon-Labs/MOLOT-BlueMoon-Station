/**
 * At shift start, pulls the autotransfer interval from config and applies
 *
 * Arguments:
 * * real_round_shift_time - World time the round left the pregame lobby
 */
/datum/controller/subsystem/autotransfer/proc/new_shift(real_round_start_time)
	var/init_vote = CONFIG_GET(number/vote_autotransfer_initial) // Check if an admin has manually set an override in the pre-game lobby
	starttime = real_round_start_time
	targettime = starttime + init_vote
	log_game("Autotransfer enabled, first vote in [DisplayTimeText(targettime - starttime)]")
	message_admins("Autotransfer enabled, first vote in [DisplayTimeText(targettime - starttime)]")
