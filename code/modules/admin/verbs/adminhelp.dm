/client/var/adminhelptimerid = 0	//a timer id for returning the ahelp verb
/client/var/datum/admin_help/current_ticket	//the current ticket the (usually) not-admin client is dealing with

//
//TICKET MANAGER
//

GLOBAL_DATUM_INIT(ahelp_tickets, /datum/admin_help_tickets, new)

/datum/admin_help_tickets
	var/list/active_tickets = list()
	var/list/closed_tickets = list()
	var/list/resolved_tickets = list()

	var/obj/effect/statclick/ticket_list/astatclick = new(null, null, AHELP_ACTIVE)
	var/obj/effect/statclick/ticket_list/cstatclick = new(null, null, AHELP_CLOSED)
	var/obj/effect/statclick/ticket_list/rstatclick = new(null, null, AHELP_RESOLVED)

/datum/admin_help_tickets/Destroy()
	QDEL_LIST(active_tickets)
	QDEL_LIST(closed_tickets)
	QDEL_LIST(resolved_tickets)
	QDEL_NULL(astatclick)
	QDEL_NULL(cstatclick)
	QDEL_NULL(rstatclick)
	return ..()

/datum/admin_help_tickets/proc/TicketByID(id)
	var/list/lists = list(active_tickets, closed_tickets, resolved_tickets)
	for(var/I in lists)
		for(var/J in I)
			var/datum/admin_help/AH = J
			if(AH.id == id)
				return J

/datum/admin_help_tickets/proc/TicketsByCKey(ckey)
	. = list()
	var/list/lists = list(active_tickets, closed_tickets, resolved_tickets)
	for(var/I in lists)
		for(var/J in I)
			var/datum/admin_help/AH = J
			if(AH.initiator_ckey == ckey)
				. += AH

//private
/datum/admin_help_tickets/proc/ListInsert(datum/admin_help/new_ticket)
	var/list/ticket_list
	switch(new_ticket.state)
		if(AHELP_ACTIVE)
			ticket_list = active_tickets
		if(AHELP_CLOSED)
			ticket_list = closed_tickets
		if(AHELP_RESOLVED)
			ticket_list = resolved_tickets
		else
			CRASH("Invalid ticket state: [new_ticket.state]")
	var/num_closed = ticket_list.len
	if(num_closed)
		for(var/I in 1 to num_closed)
			var/datum/admin_help/AH = ticket_list[I]
			if(AH.id > new_ticket.id)
				ticket_list.Insert(I, new_ticket)
				return
	ticket_list += new_ticket

//opens the ticket listings for one of the 3 states
/datum/admin_help_tickets/proc/BrowseTickets(state)
	var/list/l2b
	var/title
	switch(state)
		if(AHELP_ACTIVE)
			l2b = active_tickets
			title = "Active Tickets"
		if(AHELP_CLOSED)
			l2b = closed_tickets
			title = "Closed Tickets"
		if(AHELP_RESOLVED)
			l2b = resolved_tickets
			title = "Resolved Tickets"
	if(!l2b)
		return
	var/list/dat = list("<html><head><meta http-equiv='Content-Type' content='text/html; charset=utf-8'><title>[title]</title></head>")
	dat += "<A href='?_src_=holder;[HrefToken()];ahelp_tickets=[state]'>Refresh</A><br><br>"
	for(var/I in l2b)
		var/datum/admin_help/AH = I
		dat += "<span class='adminnotice'><span class='adminhelp'>Ticket #[AH.id]</span>: <A href='?_src_=holder;[HrefToken()];ahelp=[REF(AH)];ahelp_action=ticket'>[AH.initiator_key_name]: [AH.name]</A></span><br>"

	usr << browse(dat.Join(), "window=ahelp_list[state];size=600x480")

//Tickets statpanel
/datum/admin_help_tickets/proc/stat_entry()
	SHOULD_CALL_PARENT(TRUE)
	SHOULD_NOT_SLEEP(TRUE)
	var/list/L = list()
	var/num_disconnected = 0
	L[++L.len] = list("Active Tickets:", "[astatclick.update("[active_tickets.len]")]", null, REF(astatclick))
	astatclick.update("[active_tickets.len]")
	for(var/I in active_tickets)
		var/datum/admin_help/AH = I
		if(AH.initiator)
			L[++L.len] = list("#[AH.id]. [AH.initiator_key_name]:", "[AH.statclick.update()]", REF(AH))
		else
			++num_disconnected
	if(num_disconnected)
		L[++L.len] = list("Disconnected:", "[astatclick.update("[num_disconnected]")]", null, REF(astatclick))
	L[++L.len] = list("Closed Tickets:", "[cstatclick.update("[closed_tickets.len]")]", null, REF(cstatclick))
	L[++L.len] = list("Resolved Tickets:", "[rstatclick.update("[resolved_tickets.len]")]", null, REF(rstatclick))

	var/unhandledMessages = 0
	for(var/list/commandMessage in GLOB.centcom_communications_messages)
		if(commandMessage["handled"] == FALSE)
			unhandledMessages++
	L[++L.len] = list("Communications:", "[mstatclick.update("[unhandledMessages]")]", null, REF(mstatclick))

	return L

//Reassociate still open ticket if one exists
/datum/admin_help_tickets/proc/ClientLogin(client/C)
	C.current_ticket = CKey2ActiveTicket(C.ckey)
	if(C.current_ticket)
		C.current_ticket.initiator = C
		C.current_ticket.AddInteraction("Client reconnected.")
		SSblackbox.LogAhelp(C.current_ticket.id, "Reconnected", "Client reconnected", C.ckey) //BLUEMOON EDIT, enable ticket logging

//Dissasociate ticket
/datum/admin_help_tickets/proc/ClientLogout(client/C)
	if(C.current_ticket)
		C.current_ticket.AddInteraction("Client disconnected.")
		SSblackbox.LogAhelp(C.current_ticket.id, "Disconnected", "Client disconnected", C.ckey) //BLUEMOON EDIT, enable ticket logging
		C.current_ticket.initiator = null
		C.current_ticket = null

//Get a ticket given a ckey
/datum/admin_help_tickets/proc/CKey2ActiveTicket(ckey)
	for(var/I in active_tickets)
		var/datum/admin_help/AH = I
		if(AH.initiator_ckey == ckey)
			return AH

//
//TICKET LIST STATCLICK
//

/obj/effect/statclick/ticket_list
	var/current_state

/obj/effect/statclick/ticket_list/Initialize(mapload, name, state)
	. = ..()
	current_state = state

/obj/effect/statclick/ticket_list/Click()
	GLOB.ahelp_tickets.BrowseTickets(current_state)

//called by admin topic
/obj/effect/statclick/ticket_list/proc/Action()
	Click()

//
//TICKET DATUM
//

/datum/admin_help
	var/id
	var/name
	var/state = AHELP_ACTIVE

	var/opened_at
	var/closed_at

	var/client/initiator	//semi-misnomer, it's the person who ahelped/was bwoinked
	var/initiator_ckey
	var/initiator_key_name

	var/list/_interactions	//use AddInteraction() or, preferably, admin_ticket_log()

	var/obj/effect/statclick/ahelp/statclick

	var/static/ticket_counter = 0
	/// did we send "answered" to irc yet
	var/answered = FALSE

	/// Have we requested this ticket to stop being part of the Ticket Ping subsystem?
	var/ticket_ping_stop = FALSE
	/// Are we added to the ticket ping subsystem in the first place
	var/ticket_ping = FALSE
	/// Who is handling this admin help?
	var/handler

//call this on its own to create a ticket, don't manually assign current_ticket
//msg is the title of the ticket: usually the ahelp text
//is_bwoink is TRUE if this ticket was started by an admin PM
/datum/admin_help/New(msg, client/C, is_bwoink)
	//clean the input msg
	msg = copytext_char(msg,1,MAX_MESSAGE_LEN)
	if(!msg || !C || !C.mob)
		qdel(src)
		return

	id = ++ticket_counter
	opened_at = world.time

	name = msg

	initiator = C
	initiator_ckey = initiator.ckey
	initiator_key_name = key_name(initiator, FALSE, TRUE)
	if(initiator.current_ticket)	//This is a bug
		stack_trace("Multiple ahelp current_tickets")
		initiator.current_ticket.AddInteraction("Ticket erroneously left open by code")
		initiator.current_ticket.Close()
	initiator.current_ticket = src

	TimeoutVerb()

	statclick = new(null, src)
	_interactions = list()

	addtimer(CALLBACK(src, PROC_REF(add_to_ping_ss), 2 MINUTES)) // Ticket Ping | this is not responsible for the notification itself, but only for adding the ticket to the list of those to notify.

	if(is_bwoink)
		AddInteraction("<font color='blue'>[key_name_admin(usr)] PM'd [LinkedReplyName()]</font>")
		message_admins("<font color='blue'>Ticket [TicketHref("#[id]")] created</font>")
		//SSredbot.send_discord_message("admin", "Ticket #[id] created by [usr.ckey] ([usr.real_name]): [name]", "ticket")
	else
		MessageNoRecipient(msg)

		//send it to irc if nobody is on and tell us how many were on
		var/admin_number_present = send2tgs_adminless_only(initiator_ckey, "Ticket #[id]: [name]")
		log_admin_private("Ticket #[id]: [key_name(initiator)]: [name] - heard by [admin_number_present] non-AFK admins who have +BAN.")
		if(admin_number_present <= 0)
			to_chat(C, "<span class='notice'>No active admins are online, your adminhelp was sent to the admin irc.</span>")
		else
			// citadel edit: send anyways
			send2adminchat(initiator_ckey, "[key_name(initiator)] | Ticket #[id]: [name] - Heard by [admin_number_present] admins present with +BAN.")

	GLOB.ahelp_tickets.active_tickets += src

/datum/admin_help/Destroy()
	RemoveActive()
	GLOB.ahelp_tickets.closed_tickets -= src
	GLOB.ahelp_tickets.resolved_tickets -= src
	return ..()

/datum/admin_help/proc/AddInteraction(formatted_message)
	if(usr && (usr.ckey != initiator_ckey) && !answered)
		answered = TRUE
		send2adminchat(initiator_ckey, "[key_name(initiator)] | Ticket #[id]: Answered by [key_name(usr)]")
	_interactions += "[TIME_STAMP("hh:mm:ss", FALSE)]: [formatted_message]"

//Removes the ahelp verb and returns it after 2 minutes
/datum/admin_help/proc/TimeoutVerb()
	remove_verb(initiator, /client/verb/adminhelp)
	initiator.adminhelptimerid = addtimer(CALLBACK(initiator, TYPE_PROC_REF(/client, giveadminhelpverb)), 1200, TIMER_STOPPABLE) //2 minute cooldown of admin helps

//private
/datum/admin_help/proc/FullMonty(ref_src)
	if(!ref_src)
		ref_src = "[REF(src)]"
	. = ADMIN_FULLMONTY_NONAME(initiator.mob)
	if(state == AHELP_ACTIVE)
		. += ClosureLinks(ref_src)

		if (CONFIG_GET(flag/popup_admin_pm))
			. += " (<A HREF='?_src_=holder;[HrefToken(TRUE)];adminpopup=[REF(initiator)]'>POPUP</A>)"

//private
/datum/admin_help/proc/ClosureLinks(ref_src)
	if(!ref_src)
		ref_src = "[REF(src)]"
	. = " (<A HREF='?_src_=holder;[HrefToken(TRUE)];ahelp=[ref_src];ahelp_action=reject'>REJT</A>)"
	. += " (<A HREF='?_src_=holder;[HrefToken(TRUE)];ahelp=[ref_src];ahelp_action=icissue'>IC</A>)"
	. += " (<A HREF='?_src_=holder;[HrefToken(TRUE)];ahelp=[ref_src];ahelp_action=skillissue'>SI</A>)"
	. += " (<A HREF='?_src_=holder;[HrefToken(TRUE)];ahelp=[ref_src];ahelp_action=close'>CLOSE</A>)"
	. += " (<A HREF='?_src_=holder;[HrefToken(TRUE)];ahelp=[ref_src];ahelp_action=resolve'>RSLVE</A>)"
	. += " (<A HREF='?_src_=holder;[HrefToken(TRUE)];ahelp=[ref_src];ahelp_action=handle_issue'>HANDLE</A>)"

//private
/datum/admin_help/proc/LinkedReplyName(ref_src)
	if(!ref_src)
		ref_src = "[REF(src)]"
	return "<A HREF='?_src_=holder;[HrefToken(TRUE)];ahelp=[ref_src];ahelp_action=reply'>[initiator_key_name]</A>"

//private
/datum/admin_help/proc/TicketHref(msg, ref_src, action = "ticket")
	if(!ref_src)
		ref_src = "[REF(src)]"
	return "<A HREF='?_src_=holder;[HrefToken(TRUE)];ahelp=[ref_src];ahelp_action=[action]'>[msg]</A>"

//message from the initiator without a target, all admins will see this
//won't bug irc
/datum/admin_help/proc/MessageNoRecipient(msg)
	msg = copytext_char(sanitize(msg), 1, MAX_MESSAGE_LEN)
	var/ref_src = "[REF(src)]"
	//Message to be sent to all admins
	var/admin_msg = "<span class='adminnotice'><span class='adminhelp'>Ticket [TicketHref("#[id]", ref_src)]</span><b>: [LinkedReplyName(ref_src)] [FullMonty(ref_src)]:</b> <span class='linkify'>[keywords_lookup(msg)]</span></span>"

	AddInteraction("<font color='red'>[LinkedReplyName(ref_src)]: [msg]</font>")

	//send this msg to all admins
	for(var/client/X in GLOB.admins)
		if(X.prefs.toggles & SOUND_ADMINHELP)
			SEND_SOUND(X, sound('sound/effects/adminhelp.ogg'))
		window_flash(X, ignorepref = TRUE)
		to_chat(X, admin_msg)

	//show it to the person adminhelping too
	to_chat(initiator, "<span class='adminnotice'>PM to-<b>Admins</b>: <span class='linkify'>[msg]</span></span>")
	SSblackbox.LogAhelp(id, "Ticket Opened", msg, null, initiator.ckey) //BLUEMOON EDIT, enable ticket logging

//Reopen a closed ticket
/datum/admin_help/proc/Reopen()
	if(state == AHELP_ACTIVE)
		to_chat(usr, "<span class='warning'>This ticket is already open.</span>")
		return

	if(GLOB.ahelp_tickets.CKey2ActiveTicket(initiator_ckey))
		to_chat(usr, "<span class='warning'>This user already has an active ticket, cannot reopen this one.</span>")
		return

	statclick = new(null, src)
	GLOB.ahelp_tickets.active_tickets += src
	GLOB.ahelp_tickets.closed_tickets -= src
	GLOB.ahelp_tickets.resolved_tickets -= src
	switch(state)
		if(AHELP_CLOSED)
			SSblackbox.record_feedback("tally", "ahelp_stats", -1, "closed")
		if(AHELP_RESOLVED)
			SSblackbox.record_feedback("tally", "ahelp_stats", -1, "resolved")
	state = AHELP_ACTIVE
	closed_at = null
	if(initiator)
		initiator.current_ticket = src

	AddInteraction("<font color='purple'>Reopened by [key_name_admin(usr)]</font>")
	var/msg = "<span class='adminhelp'>Ticket [TicketHref("#[id]")] reopened by [key_name_admin(usr)].</span>"
	message_admins(msg)
	log_admin_private(msg)
	SSblackbox.LogAhelp(id, "Reopened", "Reopened by [usr.key]", usr.ckey) //BLUEMOON EDIT, enable ticket logging
	SSblackbox.record_feedback("tally", "ahelp_stats", 1, "reopened")
	TicketPanel()	//can only be done from here, so refresh it

//private
/datum/admin_help/proc/RemoveActive()
	if(state != AHELP_ACTIVE)
		return
	closed_at = world.time
	QDEL_NULL(statclick)
	GLOB.ahelp_tickets.active_tickets -= src
	if(initiator && initiator.current_ticket == src)
		initiator.current_ticket = null

	SEND_SIGNAL(src, COMSIG_ADMIN_HELP_MADE_INACTIVE)

//Mark open ticket as closed/meme
/datum/admin_help/proc/Close(key_name = key_name_admin(usr), silent = FALSE)
	if(state != AHELP_ACTIVE)
		return
	RemoveActive()
	state = AHELP_CLOSED
	GLOB.ahelp_tickets.ListInsert(src)
	to_chat(initiator, "<span class='adminhelp'>Ticket closed by [usr?.client?.holder?.fakekey? usr.client.holder.fakekey : "an administrator"].</span>")
	AddInteraction("<font color='red'>Closed by [key_name].</font>")
	if(!silent)
		SSblackbox.record_feedback("tally", "ahelp_stats", 1, "closed")
		var/msg = "Ticket [TicketHref("#[id]")] closed by [key_name]."
		message_admins(msg)
		SSblackbox.LogAhelp(id, "Closed", "Closed by [usr.key]", null, usr.ckey) //BLUEMOON EDIT, enable ticket logging
		log_admin_private(msg)

//Mark open ticket as resolved/legitimate, returns ahelp verb
/datum/admin_help/proc/Resolve(key_name = key_name_admin(usr), silent = FALSE)
	if(state != AHELP_ACTIVE)
		return
	RemoveActive()
	state = AHELP_RESOLVED
	GLOB.ahelp_tickets.ListInsert(src)

	addtimer(CALLBACK(initiator, TYPE_PROC_REF(/client, giveadminhelpverb)), 50)

	AddInteraction("<font color='green'>Resolved by [key_name].</font>")
	to_chat(initiator, "<span class='adminhelp'>Your ticket has been resolved by [usr?.client?.holder?.fakekey? usr.client.holder.fakekey : "an administrator"]. The Adminhelp verb will be returned to you shortly.</span>")
	if(!silent)
		SSblackbox.record_feedback("tally", "ahelp_stats", 1, "resolved")
		var/msg = "Ticket [TicketHref("#[id]")] resolved by [key_name]"
		message_admins(msg)
		SSblackbox.LogAhelp(id, "Resolved", "Resolved by [usr.key]", null, usr.ckey) //BLUEMOON EDIT, enable ticket logging
		log_admin_private(msg)

//Close and return ahelp verb, use if ticket is incoherent
/datum/admin_help/proc/Reject(key_name = key_name_admin(usr))
	if(state != AHELP_ACTIVE)
		return

	if(initiator)
		initiator.giveadminhelpverb()

		SEND_SOUND(initiator, sound('sound/effects/adminhelp.ogg'))

		to_chat(initiator, "<font color='red' size='4'><b>- AdminHelp Rejected by [usr?.client?.holder?.fakekey? usr.client.holder.fakekey : "an administrator"]! -</b></font>")
		to_chat(initiator, "<font color='red'><b>Your admin help was rejected.</b> The adminhelp verb has been returned to you so that you may try again.</font>")
		to_chat(initiator, "Please try to be calm, clear, and descriptive in admin helps, do not assume the admin has seen any related events, and clearly state the names of anybody you are reporting.")

	SSblackbox.record_feedback("tally", "ahelp_stats", 1, "rejected")
	var/msg = "Ticket [TicketHref("#[id]")] rejected by [key_name]"
	message_admins(msg)
	log_admin_private(msg)
	AddInteraction("Rejected by [key_name].")
	SSblackbox.LogAhelp(id, "Rejected", "Rejected by [usr.key]", null, usr.ckey) //BLUEMOON EDIT, enable ticket logging
	Close(silent = TRUE)

//Resolve ticket with IC Issue message
/datum/admin_help/proc/ICIssue(key_name = key_name_admin(usr))
	if(state != AHELP_ACTIVE)
		return

	var/msg = "<font color='red' size='4'><b>- AdminHelp marked as IC issue by [usr?.client?.holder?.fakekey? usr.client.holder.fakekey : "an administrator"]! -</b></font><br>"
	msg += "<font color='red'>Your ahelp is unable to be answered properly due to events occurring in the round. Your question probably has an IC answer, which means you should deal with it IC!</font>"
	if(initiator)
		to_chat(initiator, msg)

	SEND_SOUND(initiator, sound('modular_bluemoon/kovac_shitcode/sound/misc/ic_issue.ogg'))

	SSblackbox.record_feedback("tally", "ahelp_stats", 1, "IC")
	msg = "Ticket [TicketHref("#[id]")] marked as IC by [key_name]"
	message_admins(msg)
	log_admin_private(msg)
	AddInteraction("Marked as IC issue by [key_name]")
	SSblackbox.LogAhelp(id, "IC Issue", "Marked as IC issue by [usr.key]", null,  usr.ckey) //BLUEMOON EDIT, enable ticket logging
	Resolve(silent = TRUE)

//Resolve ticket with Skill Issue message
/datum/admin_help/proc/SkillIssue(key_name = key_name_admin(usr))
	if(state != AHELP_ACTIVE)
		return

	var/msg = "<font color='red' size='4'><b>- AdminHelp marked as Skill Issue by [usr?.client?.holder?.fakekey? usr.client.holder.fakekey : "an administrator"]! -</b></font><br>"
	msg += "<font color='red'>Your ahelp is unable to be answered properly due to lack of your own robust skill. You should train youself a bit more!</font>"
	if(initiator)
		to_chat(initiator, msg)

	SEND_SOUND(initiator, sound('modular_bluemoon/kovac_shitcode/sound/misc/skill_issue.ogg'))

	SSblackbox.record_feedback("tally", "ahelp_stats", 1, "SI")
	msg = "Ticket [TicketHref("#[id]")] marked as Skill Issue by [key_name]"
	message_admins(msg)
	log_admin_private(msg)
	AddInteraction("Marked as Skill issue by [key_name]")
	Resolve(silent = TRUE)

//Let the initiator know their ahelp is being handled
/datum/admin_help/proc/handle_issue(key_name = key_name_admin(usr))
	if(state != AHELP_ACTIVE)
		return FALSE

	if(handler && handler == usr.ckey) // No need to handle it twice as the same person ;)
		return TRUE

	if(handler && handler != usr.ckey)
		var/response = tgui_alert(usr, "This ticket is already being handled by [handler]. Do you want to continue?", "Ticket already assigned", list("Yes", "No"))
		if(!response || response == "No")
			return FALSE

	var/msg = span_adminhelp("Your ticket is now being handled by [usr?.client?.holder?.fakekey ? usr?.client?.holder?.fakekey : "an administrator"]! Please wait while they type their response and/or gather relevant information.")

	if(initiator)
		to_chat(initiator, msg)

	SSblackbox.record_feedback("tally", "ahelp_stats", 1, "handling")
	msg = "Ticket [TicketHref("#[id]")] is being handled by [key_name]"
	message_admins(msg)
	log_admin_private(msg)
	AddInteraction("Being handled by [key_name]", "Being handled by [key_name_admin(usr, FALSE)]")

	handler = "[usr.ckey]"
	return TRUE

//Show the ticket panel
/datum/admin_help/proc/TicketPanel()
	var/list/dat = list("<html><head><meta http-equiv='Content-Type' content='text/html; charset=utf-8'><title>Ticket #[id]</title></head>")
	var/ref_src = "[REF(src)]"
	dat += "<h4>Admin Help Ticket #[id]: [LinkedReplyName(ref_src)]</h4>"
	dat += "<b>State: "
	switch(state)
		if(AHELP_ACTIVE)
			dat += "<font color='red'>OPEN</font>"
		if(AHELP_RESOLVED)
			dat += "<font color='green'>RESOLVED</font>"
		if(AHELP_CLOSED)
			dat += "CLOSED"
		else
			dat += "UNKNOWN"
	dat += "</b>[FOURSPACES][TicketHref("Refresh", ref_src)][FOURSPACES][TicketHref("Re-Title", ref_src, "retitle")]"
	if(state != AHELP_ACTIVE)
		dat += "[FOURSPACES][TicketHref("Reopen", ref_src, "reopen")]"
	dat += "<br><br>Opened at: [GAMETIMESTAMP("hh:mm:ss", closed_at)] (Approx [DisplayTimeText(world.time - opened_at)] ago)"
	if(closed_at)
		dat += "<br>Closed at: [GAMETIMESTAMP("hh:mm:ss", closed_at)] (Approx [DisplayTimeText(world.time - closed_at)] ago)"
	dat += "<br><br>"
	if(initiator)
		dat += "<b>Actions:</b> [FullMonty(ref_src)]<br>"
	else
		dat += "<b>DISCONNECTED</b>[FOURSPACES][ClosureLinks(ref_src)]<br>"
	dat += "<br><b>Log:</b><br><br>"
	for(var/I in _interactions)
		dat += "[I]<br>"

	usr << browse(dat.Join(), "window=ahelp[id];size=620x480")

/datum/admin_help/proc/Retitle()
	var/new_title = input(usr, "Enter a title for the ticket", "Rename Ticket", name) as text|null
	if(new_title)
		name = new_title
		//not saying the original name cause it could be a long ass message
		var/msg = "Ticket [TicketHref("#[id]")] titled [name] by [key_name_admin(usr)]"
		message_admins(msg)
		log_admin_private(msg)
	TicketPanel()	//we have to be here to do this

//Forwarded action from admin/Topic
/datum/admin_help/proc/Action(action)
	testing("Ahelp action: [action]")
	switch(action)
		if("ticket")
			TicketPanel()
		if("retitle")
			Retitle()
		if("reject")
			Reject()
		if("reply")
			usr.client.cmd_ahelp_reply(initiator)
		if("icissue")
			ICIssue()
		if("skillissue")
			SkillIssue()
		if("close")
			Close()
		if("resolve")
			Resolve()
		if("handle_issue")
			handle_issue()
		if("reopen")
			Reopen()
		if("pingmute")
			ticket_ping_stop = !ticket_ping_stop
			SSblackbox.record_feedback("tally", "ahelp_stats", 1, "pingmute")
			var/msg = "Ticket [TicketHref("#[id]")] has been [ticket_ping_stop ? "" : "un"]muted from the Ticket Ping Subsystem by [key_name_admin(usr)]."
			message_admins(msg)
			log_admin_private(msg)

//
// TICKET STATCLICK
//

/obj/effect/statclick/ahelp
	var/datum/admin_help/ahelp_datum

/obj/effect/statclick/ahelp/Initialize(mapload, datum/admin_help/AH)
	ahelp_datum = AH
	. = ..()

/obj/effect/statclick/ahelp/update()
	return ..(ahelp_datum.name)

/obj/effect/statclick/ahelp/Click()
	ahelp_datum.TicketPanel()

/obj/effect/statclick/ahelp/Destroy()
	ahelp_datum = null
	return ..()

//
// CLIENT PROCS
//

/client/proc/giveadminhelpverb()
	add_verb(src, /client/verb/adminhelp)
	deltimer(adminhelptimerid)
	adminhelptimerid = 0

// Used for methods where input via arg doesn't work
/client/proc/get_adminhelp()
	var/msg = input(src, "Please describe your problem concisely and an admin will help as soon as they're able.", "Adminhelp contents") as text
	adminhelp(msg)

/client/verb/adminhelp(msg as text)
	set category = "Admin"
	set name = "Adminhelp"

	if(GLOB.say_disabled)	//This is here to try to identify lag problems
		to_chat(usr, "<span class='danger'>Speech is currently admin-disabled.</span>")
		return

	//handle muting and automuting
	if(prefs.muted & MUTE_ADMINHELP)
		to_chat(src, "<span class='danger'>Error: Admin-PM: You cannot send adminhelps (Muted).</span>")
		return
	if(handle_spam_prevention(msg,MUTE_ADMINHELP))
		return

	msg = sanitize(trim(msg))

	if(!msg)
		return

	SSblackbox.record_feedback("tally", "admin_verb", 1, "Adminhelp") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!
	if(current_ticket)
		if(alert(usr, "You already have a ticket open. Is this for the same issue?",,"Да","Нет") != "Нет")
			if(current_ticket)
				current_ticket.MessageNoRecipient(msg)
				current_ticket.TimeoutVerb()
				return
			else
				to_chat(usr, "<span class='warning'>Ticket not found, creating new one...</span>")
		else
			current_ticket.AddInteraction("[key_name_admin(usr)] opened a new ticket.")
			current_ticket.Close()

	new /datum/admin_help(msg, src, FALSE)

//
// LOGGING
//

//Use this proc when an admin takes action that may be related to an open ticket on what
//what can be a client, ckey, or mob
/proc/admin_ticket_log(what, message)
	var/client/C
	var/mob/Mob = what
	if(istype(Mob))
		C = Mob.client
	else
		C = what
	if(istype(C) && C.current_ticket)
		C.current_ticket.AddInteraction(message)
		return C.current_ticket
	if(istext(what))	//ckey
		var/datum/admin_help/AH = GLOB.ahelp_tickets.CKey2ActiveTicket(what)
		if(AH)
			AH.AddInteraction(message)
			return AH

//
// HELPER PROCS
//

/proc/get_admin_counts(requiredflags = R_BAN)
	. = list("total" = list(), "noflags" = list(), "afk" = list(), "stealth" = list(), "present" = list())
	for(var/client/X in GLOB.admins)
		.["total"] += X
		if(requiredflags != NONE && !check_rights_for(X, requiredflags))
			.["noflags"] += X
		else if(X.is_afk())
			.["afk"] += X
		else if(X.holder.fakekey)
			.["stealth"] += X
		else
			.["present"] += X

/proc/send2tgs_adminless_only(source, msg, requiredflags = R_BAN)
	var/list/adm = get_admin_counts(requiredflags)
	var/list/activemins = adm["present"]
	. = activemins.len
	if(. <= 0)
		var/final = ""
		var/list/afkmins = adm["afk"]
		var/list/stealthmins = adm["stealth"]
		var/list/powerlessmins = adm["noflags"]
		var/list/allmins = adm["total"]
		if(!afkmins.len && !stealthmins.len && !powerlessmins.len)
			final = "[msg] - No admins online"
		else
			final = "[msg] - All admins stealthed\[[english_list(stealthmins)]\], AFK\[[english_list(afkmins)]\], or lacks +BAN\[[english_list(powerlessmins)]\]! Total: [allmins.len] "
		send2adminchat(source,final)
		send2otherserver(source,final)

/**
 * Sends a message to a set of cross-communications-enabled servers using world topic calls
 *
 * Arguments:
 * * source - Who sent this message
 * * msg - The message body
 * * type - The type of message, becomes the topic command under the hood
 * * target_servers - A collection of servers to send the message to, defined in config
 * * additional_data - An (optional) associated list of extra parameters and data to send with this world topic call
 */
/proc/send2otherserver(source, msg, type = "Ahelp", target_servers, list/additional_data = list())
	if(!CONFIG_GET(string/comms_key))
		debug_world_log("Server cross-comms message not sent for lack of configured key")
		return

	var/our_id = CONFIG_GET(string/cross_comms_name)
	additional_data["message_sender"] = source
	additional_data["message"] = msg
	additional_data["source"] = "([our_id])"
	additional_data += type

	var/list/servers = CONFIG_GET(keyed_list/cross_server)
	for(var/I in servers)
		if(I == our_id) //No sending to ourselves
			continue
		if(target_servers && !(I in target_servers))
			continue
		world.send_cross_comms(I, additional_data)

/// Sends a message to a given cross comms server by name (by name for security).
/world/proc/send_cross_comms(server_name, list/message, auth = TRUE)
	set waitfor = FALSE
	if (auth)
		var/comms_key = CONFIG_GET(string/comms_key)
		if(!comms_key)
			debug_world_log("Server cross-comms message not sent for lack of configured key")
			return
		message["key"] = comms_key
	var/list/servers = CONFIG_GET(keyed_list/cross_server)
	var/server_url = servers[server_name]
	if (!server_url)
		CRASH("Invalid cross comms config: [server_name]")
	world.Export("[server_url]?[list2params(message)]")

/proc/ircadminwho()
	var/list/message = list("Admins: ")
	var/list/admin_keys = list()
	for(var/adm in GLOB.admins)
		var/client/C = adm
		admin_keys += "[C][C.holder.fakekey ? "(Stealth)" : ""][C.is_afk() ? "(AFK)" : ""]"

	for(var/admin in admin_keys)
		if(LAZYLEN(message) > 1)
			message += ", [admin]"
		else
			message += "[admin]"

	return jointext(message, "")

/proc/keywords_lookup(msg,irc)

	//This is a list of words which are ignored by the parser when comparing message contents for names. MUST BE IN LOWER CASE!
	var/list/adminhelp_ignored_words = list("unknown","the","a","an","of","monkey","alien","as", "i")

	//explode the input msg into a list
	var/list/msglist = splittext(msg, " ")

	//generate keywords lookup
	var/list/surnames = list()
	var/list/forenames = list()
	var/list/ckeys = list()
	var/founds = ""
	for(var/mob/M in GLOB.mob_list)
		var/list/indexing = list(M.real_name, M.name)
		if(M.mind)
			indexing += M.mind.name

		for(var/string in indexing)
			var/list/L = splittext(string, " ")
			var/surname_found = 0
			//surnames
			for(var/i=L.len, i>=1, i--)
				var/word = ckey(L[i])
				if(word)
					surnames[word] = M
					surname_found = i
					break
			//forenames
			for(var/i=1, i<surname_found, i++)
				var/word = ckey(L[i])
				if(word)
					forenames[word] = M
			//ckeys
			ckeys[M.ckey] = M

	var/ai_found = 0
	msg = ""
	var/list/mobs_found = list()
	for(var/original_word in msglist)
		var/word = ckey(original_word)
		if(word)
			if(!(word in adminhelp_ignored_words))
				if(word == "ai")
					ai_found = 1
				else
					var/mob/found = ckeys[word]
					if(!found)
						found = surnames[word]
						if(!found)
							found = forenames[word]
					if(found)
						if(!(found in mobs_found))
							mobs_found += found
							if(!ai_found && isAI(found))
								ai_found = 1
							var/is_antag = 0
							if(found.mind && found.mind.special_role)
								is_antag = 1
							founds += "Name: [found.name]([found.real_name]) Key: [found.key] Ckey: [found.ckey] [is_antag ? "(Antag)" : null] "
							msg += "[original_word]<font size='1' color='[is_antag ? "red" : "black"]'>(<A HREF='?_src_=holder;[HrefToken(TRUE)];adminmoreinfo=[REF(found)]'>?</A>|<A HREF='?_src_=holder;[HrefToken(TRUE)];adminplayerobservefollow=[REF(found)]'>F</A>)</font> "
							continue
		msg += "[original_word] "
	if(irc)
		if(founds == "")
			return "Search Failed"
		else
			return founds

	return msg

/**
 * Checks a given message to see if any of the words contain an active admin's ckey with an @ before it
 *
 * Returns nothing if no pings are found, otherwise returns an associative list with ckey -> client
 * Also modifies msg to underline the pings, then stores them in the key [ADMINSAY_PING_UNDERLINE_NAME_INDEX] for returning
 *
 * Arguments:
 * * msg - the message being scanned
 */
/proc/check_admin_pings(msg)
	//explode the input msg into a list
	var/list/msglist = splittext(msg, " ")
	var/list/admins_to_ping = list()

	var/i = 0
	for(var/word in msglist)
		i++
		if(!length(word))
			continue
		if(word[1] != "@")
			continue
		var/ckey_check = lowertext(copytext(word, 2))
		var/client/client_check = GLOB.directory[ckey_check]
		if(client_check?.holder)
			msglist[i] = "<u>[word]</u>"
			admins_to_ping[ckey_check] = client_check

	if(length(admins_to_ping))
		admins_to_ping[ADMINSAY_PING_UNDERLINE_NAME_INDEX] = jointext(msglist, " ") // without tuples, we must make do!
		return admins_to_ping
