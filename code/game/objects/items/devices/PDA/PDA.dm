//The advanced pea-green monochrome lcd of tomorrow.

GLOBAL_LIST_EMPTY(PDAs)

#define PDA_SCANNER_NONE		0
#define PDA_SCANNER_MEDICAL		1
#define PDA_SCANNER_FORENSICS	2 //unused
#define PDA_SCANNER_REAGENT		3
#define PDA_SCANNER_HALOGEN		4
#define PDA_SCANNER_GAS			5
#define PDA_SPAM_DELAY		    2 MINUTES

//pda icon overlays list defines
#define PDA_OVERLAY_ALERT		1
#define PDA_OVERLAY_SCREEN		2
#define PDA_OVERLAY_ID			3
#define PDA_OVERLAY_ITEM		4
#define PDA_OVERLAY_LIGHT		5
#define PDA_OVERLAY_PAI			6

/obj/item/pda
	name = "\improper PDA"
	desc = "A portable microcomputer by Thinktronic Systems, LTD. Functionality determined by a preprogrammed ROM cartridge."
	icon = 'icons/obj/pda_alt.dmi'
	icon_state = "pda"
	item_state = "electronic"
	lefthand_file = 'icons/mob/inhands/misc/devices_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/misc/devices_righthand.dmi'
	item_flags = NOBLUDGEON
	w_class = WEIGHT_CLASS_TINY
	slot_flags = ITEM_SLOT_ID | ITEM_SLOT_BELT
	actions_types = list(/datum/action/item_action/toggle_light/pda)
	armor = list(MELEE = 0, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 0, RAD = 0, FIRE = 100, ACID = 100)
	resistance_flags = FIRE_PROOF | ACID_PROOF

	always_reskinnable = TRUE
	reskin_binding = COMSIG_CLICK_CTRL_SHIFT

	//Main variables
	var/owner = null // String name of owner
	var/default_cartridge = 0 // Access level defined by cartridge
	var/obj/item/cartridge/cartridge = null //current cartridge
	var/mode = 0 //Controls what menu the PDA will display. 0 is hub; the rest are either built in or based on cartridge.
	var/list/overlays_icons = list('icons/obj/pda_alt.dmi' = list("pda-r", "screen_default", "id_overlay", "insert_overlay", "light_overlay", "pai_overlay"))
	var/static/list/standard_overlays_icons = list("pda-r", "blank", "id_overlay", "insert_overlay", "light_overlay", "pai_overlay")
	var/list/current_overlays //set on Initialize.

	//variables exclusively used on 'update_overlays' (which should never be called directly, and 'update_icon' doesn't use args anyway)
	var/new_overlays = FALSE
	var/new_alert = FALSE

	var/font_index = 0 //This int tells DM which font is currently selected and lets DM know when the last font has been selected so that it can cycle back to the first font when "toggle font" is pressed again.
	var/font_mode = "font-family:monospace;" //The currently selected font.
	var/background_color = "#808000" //The currently selected background color.

	#define FONT_MONO "font-family:monospace;"
	#define FONT_SHARE "font-family:\"Share Tech Mono\", monospace;letter-spacing:0px;"
	#define FONT_ORBITRON "font-family:\"Orbitron\", monospace;letter-spacing:0px; font-size:15px"
	#define FONT_VT "font-family:\"VT323\", monospace;letter-spacing:1px;"
	#define MODE_MONO 0
	#define MODE_SHARE 1
	#define MODE_ORBITRON 2
	#define MODE_VT 3

	//Secondary variables
	var/scanmode = PDA_SCANNER_NONE
	var/fon = FALSE //Is the flashlight function on?
	var/f_lum = 2.3 //Luminosity for the flashlight function
	var/f_pow = 0.6 //Power for the flashlight function
	var/f_col = "#FFCC66" //Color for the flashlight function
	var/silent = FALSE //To beep or not to beep, that is the question
	var/toff = FALSE //If TRUE, messenger disabled
	var/tnote = null //Current Texts
	var/last_text //No text spamming
	var/last_everyone //No text for everyone spamming
	var/last_noise //Also no honk spamming that's bad too
	var/ttone = "beep" //The ringtone!
	var/honkamt = 0 //How many honks left when infected with honk.exe
	var/mimeamt = 0 //How many silence left when infected with mime.exe
	var/note = "Congratulations, your station has chosen the Thinktronic 5230 Personal Data Assistant! To help with navigation, we have provided the following definitions. North: Fore. South: Aft. West: Port. East: Starboard. Quarter is either side of aft." //Current note in the notepad function
	var/notehtml = ""
	var/notescanned = FALSE // True if what is in the notekeeper was from a paper.
	var/detonatable = TRUE // Can the PDA be blown up?
	var/hidden = FALSE // Is the PDA hidden from the PDA list?
	var/emped = FALSE
	var/equipped = FALSE  //used here to determine if this is the first time its been picked up
	var/allow_emojis = TRUE //if the pda can send emojis and actually have them parsed as such

	var/obj/item/card/id/id = null //Making it possible to slot an ID card into the PDA so it can function as both.
	var/ownjob = null //related to above

	var/obj/item/paicard/pai = null	// A slot for a personal AI device

	var/datum/picture/picture //Scanned photo

	var/list/contained_item = list(/obj/item/pen, /obj/item/toy/crayon, /obj/item/lipstick, /obj/item/flashlight/pen, /obj/item/clothing/mask/cigarette)
	var/obj/item/inserted_item //Used for pen, crayon, and lipstick insertion or removal. Same as above.
	var/list/overlays_offsets // offsets to use for certain overlays
	var/overlays_x_offset = 0
	var/overlays_y_offset = 0

	var/underline_flag = TRUE //flag for underline

	var/list/blocked_pdas

/obj/item/pda/suicide_act(mob/living/carbon/user)
	var/deathMessage = msg_input(user)
	if (!deathMessage)
		deathMessage = "i ded"
	user.visible_message("<span class='suicide'>[user] is sending a message to the Grim Reaper! It looks like [user.p_theyre()] trying to commit suicide!</span>")
	tnote += "<i><b>&rarr; To The Grim Reaper:</b></i><br>[deathMessage]<br>"//records a message in their PDA as being sent to the grim reaper
	return BRUTELOSS

/obj/item/pda/examine(mob/user)
	. = ..()
	. += id ? "<span class='notice'>Alt-click to remove the id.</span>" : ""
	if(inserted_item && (!isturf(loc)))
		. += "<span class='notice'>Ctrl-click to remove [inserted_item].</span>"

/obj/item/pda/add_context(atom/source, list/context, obj/item/held_item, mob/living/user)
	. = ..()

	if(held_item)
		if(istype(held_item, /obj/item/cartridge) && !cartridge)
			LAZYSET(context[SCREENTIP_CONTEXT_LMB], INTENT_ANY, "Insert Cartridge")
			. = CONTEXTUAL_SCREENTIP_SET
		else if(istype(held_item, /obj/item/card/id) && !id)
			LAZYSET(context[SCREENTIP_CONTEXT_LMB], INTENT_ANY, "Insert ID")
			. = CONTEXTUAL_SCREENTIP_SET
		else if(istype(held_item, /obj/item/paicard) && !pai)
			LAZYSET(context[SCREENTIP_CONTEXT_LMB], INTENT_ANY, "Insert pAI")
			. = CONTEXTUAL_SCREENTIP_SET
		else if(is_type_in_list(held_item, contained_item) && !inserted_item)
			LAZYSET(context[SCREENTIP_CONTEXT_LMB], INTENT_ANY, "Insert [held_item]")
			. = CONTEXTUAL_SCREENTIP_SET
		else if(istype(held_item, /obj/item/photo))
			LAZYSET(context[SCREENTIP_CONTEXT_LMB], INTENT_ANY, "Scan photo")
			. = CONTEXTUAL_SCREENTIP_SET

	if(id) // ID gets removed before inserted_item
		LAZYSET(context[SCREENTIP_CONTEXT_ALT_LMB], INTENT_ANY, "Remove ID")
		. = CONTEXTUAL_SCREENTIP_SET
	else if(inserted_item)
		LAZYSET(context[SCREENTIP_CONTEXT_ALT_LMB], INTENT_ANY, "Remove [inserted_item]")
		. = CONTEXTUAL_SCREENTIP_SET

	if(inserted_item)
		LAZYSET(context[SCREENTIP_CONTEXT_CTRL_LMB], INTENT_ANY, "Remove [inserted_item]")
		. = CONTEXTUAL_SCREENTIP_SET
	return . || NONE

/obj/item/pda/Initialize(mapload)
	if(GLOB.pda_reskins)
		unique_reskin = GLOB.pda_reskins
	. = ..()
	if(fon)
		set_light(f_lum, f_pow, f_col)

	GLOB.PDAs += src
	if(default_cartridge)
		cartridge = new default_cartridge(src)
	if(inserted_item)
		inserted_item = new inserted_item(src)
	else
		inserted_item =	new /obj/item/pen(src)
	new_overlays = TRUE
	update_icon()

	register_context()

/obj/item/pda/reskin_obj(mob/M)
	. = ..()
	new_overlays = TRUE
	update_icon()

/obj/item/pda/proc/set_new_overlays()
	if(!overlays_offsets || !(icon in overlays_offsets))
		overlays_x_offset = 0
		overlays_y_offset = 0
	else
		var/list/new_offsets = overlays_offsets[icon]
		if(new_offsets)
			overlays_x_offset = new_offsets[1]
			overlays_y_offset = new_offsets[2]
	if(!(icon in overlays_icons))
		current_overlays = standard_overlays_icons
		return
	current_overlays = overlays_icons[icon]

/obj/item/pda/equipped(mob/user, slot)
	. = ..()
	if(equipped || !user.client)
		return
	update_style(user.client)

/obj/item/pda/proc/update_label()
	name = "PDA-[owner] ([ownjob])" //Name generalisation

/obj/item/pda/GetAccess()
	if(id)
		return id.GetAccess()
	else
		return ..()

/obj/item/pda/GetID()
	return id

/obj/item/pda/RemoveID()
	return do_remove_id()

/obj/item/pda/InsertID(obj/item/inserting_item)
	var/obj/item/card/inserting_id = inserting_item.RemoveID()
	if(!inserting_id)
		return
	insert_id(inserting_id)
	if(id == inserting_id)
		return TRUE
	return FALSE

/obj/item/pda/update_overlays()
	. = ..()
	if(new_overlays)
		set_new_overlays()
	var/screen_state = new_alert ? current_overlays[PDA_OVERLAY_ALERT] : current_overlays[PDA_OVERLAY_SCREEN]
	var/mutable_appearance/overlay = mutable_appearance(icon, screen_state)
	overlay.pixel_x = overlays_x_offset
	overlay.pixel_y = overlays_y_offset
	. += new /mutable_appearance(overlay)
	if(id)
		overlay.icon_state = current_overlays[PDA_OVERLAY_ID]
		. += new /mutable_appearance(overlay)
	if(inserted_item)
		overlay.icon_state = current_overlays[PDA_OVERLAY_ITEM]
		. += new /mutable_appearance(overlay)
	if(fon)
		overlay.icon_state = current_overlays[PDA_OVERLAY_LIGHT]
		. += new /mutable_appearance(overlay)
	if(pai)
		overlay.icon_state = "[current_overlays[PDA_OVERLAY_PAI]][pai.pai ? "" : "_off"]"
		. += overlay
	new_overlays = FALSE
	new_alert = FALSE

/obj/item/pda/MouseDrop(mob/over, src_location, over_location)
	var/mob/M = usr
	if((M == over) && usr.canUseTopic(src, BE_CLOSE, FALSE, NO_TK, check_resting = FALSE))
		return attack_self(M)
	return ..()

/obj/item/pda/attack_self_tk(mob/user)
	to_chat(user, "<span class='warning'>The PDA's capacitive touch screen doesn't seem to respond!</span>")
	return

/obj/item/pda/interact(mob/user)
	if(!user.IsAdvancedToolUser())
		to_chat(user, "<span class='warning'>You don't have the dexterity to do this!</span>")
		return

	..()

	var/datum/asset/spritesheet/assets = get_asset_datum(/datum/asset/spritesheet/simple/pda)
	assets.send(user)

	var/datum/asset/spritesheet/emoji_s = get_asset_datum(/datum/asset/spritesheet/chat)
	emoji_s.send(user) //Already sent by chat but no harm doing this

	user.set_machine(src)

	var/dat = "<!DOCTYPE html><html><head><meta http-equiv='Content-Type' content='text/html; charset=utf-8'><title>Personal Data Assistant</title><link href=\"https://fonts.googleapis.com/css?family=Orbitron|Share+Tech+Mono|VT323\" rel=\"stylesheet\"></head><body bgcolor=\"" + background_color + "\"><style>body{" + font_mode + "}ul,ol{list-style-type: none;}a, a:link, a:visited, a:active, a:hover { color: #000000;text-decoration:none; }img {border-style:none;}a img{padding-right: 9px;}</style>"
	dat += assets.css_tag()
	dat += emoji_s.css_tag()

	dat += "<a href='byond://?src=[REF(src)];choice=Refresh'>[PDAIMG(refresh)]Refresh</a>"

	if ((!isnull(cartridge)) && (mode == 0))
		dat += " | <a href='byond://?src=[REF(src)];choice=Eject'>[PDAIMG(eject)]Eject [cartridge]</a>"
	if (mode)
		dat += " | <a href='byond://?src=[REF(src)];choice=Return'>[PDAIMG(menu)]Return</a>"

	if (mode == 0)
		dat += "<div align=\"center\">"
		dat += "<br><a href='byond://?src=[REF(src)];choice=Toggle_Font'>Toggle Font</a>"
		dat += " | <a href='byond://?src=[REF(src)];choice=Change_Color'>Change Color</a>"
		dat += " | <a href='byond://?src=[REF(src)];choice=Toggle_Underline'>Toggle Underline</a>" //underline button

		dat += "</div>"

	dat += "<br>"

	if (!owner)
		dat += "Warning: No owner information entered.  Please swipe card.<br><br>"
		dat += "<a href='byond://?src=[REF(src)];choice=Refresh'>[PDAIMG(refresh)]Retry</a>"
	else
		switch (mode)
			if (0)
				dat += "<h2>PERSONAL DATA ASSISTANT v.1.2</h2>"
				dat += "Owner: [owner], [ownjob]<br>"
				dat += text("ID: <a href='?src=[REF(src)];choice=Authenticate'>[id ? "[id.registered_name], [id.assignment]" : "----------"]")
				dat += text("<br><a href='?src=[REF(src)];choice=UpdateInfo'>[id ? "Update PDA Info" : ""]</A><br><br>")

				dat += "[STATION_TIME_TIMESTAMP("hh:mm:ss", world.time)]<br>" //:[world.time / 100 % 6][world.time / 100 % 10]"
				dat += "[time2text(world.realtime, "MMM DD")] [GLOB.year_integer]"

				dat += "<br><br>"

				dat += "<h4>General Functions</h4>"
				dat += "<ul>"
				dat += "<li><a href='byond://?src=[REF(src)];choice=1'>[PDAIMG(notes)]Notekeeper</a></li>"
				dat += "<li><a href='byond://?src=[REF(src)];choice=2'>[PDAIMG(mail)]Messenger</a></li>"

				if (cartridge)
					if (cartridge.access & CART_CLOWN)
						dat += "<li><a href='byond://?src=[REF(src)];choice=Honk'>[PDAIMG(honk)]Honk Synthesizer</a></li>"
						dat += "<li><a href='byond://?src=[REF(src)];choice=Trombone'>[PDAIMG(honk)]Sad Trombone</a></li>"
					if (cartridge.access & CART_MANIFEST)
						dat += "<li><a href='byond://?src=[REF(src)];choice=41'>[PDAIMG(notes)]View Crew Manifest</a></li>"
					if(cartridge.access & CART_STATUS_DISPLAY)
						dat += "<li><a href='byond://?src=[REF(src)];choice=42'>[PDAIMG(status)]Set Status Display</a></li>"
					dat += "</ul>"
					if (cartridge.access & CART_ENGINE)
						dat += "<h4>Engineering Functions</h4>"
						dat += "<ul>"
						dat += "<li><a href='byond://?src=[REF(src)];choice=43'>[PDAIMG(power)]Power Monitor</a></li>"
						dat += "</ul>"
					if (cartridge.access & CART_MEDICAL)
						dat += "<h4>Medical Functions</h4>"
						dat += "<ul>"
						dat += "<li><a href='byond://?src=[REF(src)];choice=44'>[PDAIMG(medical)]Medical Records</a></li>"
						dat += "<li><a href='byond://?src=[REF(src)];choice=Medical Scan'>[PDAIMG(scanner)][scanmode == 1 ? "Disable" : "Enable"] Medical Scanner</a></li>"
						dat += "</ul>"
					if (cartridge.access & CART_SECURITY)
						dat += "<h4>Security Functions</h4>"
						dat += "<ul>"
						dat += "<li><a href='byond://?src=[REF(src)];choice=45'>[PDAIMG(cuffs)]Security Records</A></li>"
						dat += "</ul>"
					if(cartridge.access & CART_QUARTERMASTER)
						dat += "<h4>Quartermaster Functions:</h4>"
						dat += "<ul>"
						dat += "<li><a href='byond://?src=[REF(src)];choice=47'>[PDAIMG(crate)]Supply Records</A></li>"
						dat += "<li><a href='byond://?src=[REF(src)];choice=48'>[PDAIMG(crate)]Ore Silo Logs</a></li>"
						dat += "</ul>"
				dat += "</ul>"

				dat += "<h4>Utilities</h4>"
				dat += "<ul>"
				if (cartridge)
					if(cartridge.bot_access_flags)
						dat += "<li><a href='byond://?src=[REF(src)];choice=54'>[PDAIMG(medbot)]Bots Access</a></li>"
					if (cartridge.access & CART_JANITOR)
						dat += "<li><a href='byond://?src=[REF(src)];choice=49'>[PDAIMG(bucket)]Custodial Locator</a></li>"
					if(cartridge.access & CART_MIME)
						dat += "<li><a href='byond://?src=[REF(src)];choice=55'>[PDAIMG(emoji)]Emoji Guidebook</a></li>"
					if (istype(cartridge.radio))
						dat += "<li><a href='byond://?src=[REF(src)];choice=40'>[PDAIMG(signaler)]Signaler System</a></li>"
					if (cartridge.access & CART_NEWSCASTER)
						dat += "<li><a href='byond://?src=[REF(src)];choice=53'>[PDAIMG(notes)]Newscaster Access </a></li>"
					if (cartridge.access & CART_REAGENT_SCANNER)
						dat += "<li><a href='byond://?src=[REF(src)];choice=Reagent Scan'>[PDAIMG(reagent)][scanmode == 3 ? "Disable" : "Enable"] Reagent Scanner</a></li>"
					if (cartridge.access & CART_ENGINE)
						dat += "<li><a href='byond://?src=[REF(src)];choice=Halogen Counter'>[PDAIMG(reagent)][scanmode == 4 ? "Disable" : "Enable"] Halogen Counter</a></li>"
					if (cartridge.access & CART_ATMOS)
						dat += "<li><a href='byond://?src=[REF(src)];choice=Gas Scan'>[PDAIMG(reagent)][scanmode == 5 ? "Disable" : "Enable"] Gas Scanner</a></li>"
					if (cartridge.access & CART_REMOTE_DOOR)
						dat += "<li><a href='byond://?src=[REF(src)];choice=Toggle Door'>[PDAIMG(rdoor)]Toggle Remote Door</a></li>"
					if (cartridge.access & CART_DRONEPHONE)
						dat += "<li><a href='byond://?src=[REF(src)];choice=Drone Phone'>[PDAIMG(dronephone)]Drone Phone</a></li>"
					if (cartridge.access & CART_BARTENDER)
						dat += "<li><a href='byond://?src=[REF(src)];choice=Drink Recipe Browser'>[PDAIMG(bucket)]Drink Recipe Browser</a></li>"
					if (cartridge.access & CART_CHEMISTRY)
						dat += "<li><a href='byond://?src=[REF(src)];choice=Chemistry Recipe Browser'>[PDAIMG(bucket)]Chemistry Recipe Browser</a></li>"
				dat += "<li><a href='byond://?src=[REF(src)];choice=3'>[PDAIMG(atmos)]Atmospheric Scan</a></li>"
				dat += "<li><a href='byond://?src=[REF(src)];choice=Light'>[PDAIMG(flashlight)][fon ? "Disable" : "Enable"] Flashlight</a></li>"
				if (pai)
					if(pai.loc != src)
						pai = null
						update_icon()
					else
						dat += "<li><a href='byond://?src=[REF(src)];choice=pai;option=1'>pAI Device Configuration</a></li>"
						dat += "<li><a href='byond://?src=[REF(src)];choice=pai;option=2'>Eject pAI Device</a></li>"
				dat += "</ul>"

			if (1)
				dat += "<h4>[PDAIMG(notes)] Notekeeper V2.2</h4>"
				dat += "<a href='byond://?src=[REF(src)];choice=Edit'>Edit</a><br>"
				if(notescanned)
					dat += "(This is a scanned image, editing it may cause some text formatting to change.)<br>"
				dat += "<HR><font face=\"[PEN_FONT]\">[(!notehtml ? note : notehtml)]</font>"

			if (2)
				dat += "<h4>[PDAIMG(mail)] SpaceMessenger V3.9.6</h4>"
				dat += "<a href='byond://?src=[REF(src)];choice=Toggle Ringer'>[PDAIMG(bell)]Ringer: [silent == 1 ? "Off" : "On"]</a> | "
				dat += "<a href='byond://?src=[REF(src)];choice=Toggle Messenger'>[PDAIMG(mail)]Send / Receive: [toff == 1 ? "Off" : "On"]</a> | "
				dat += "<a href='byond://?src=[REF(src)];choice=Ringtone'>[PDAIMG(bell)]Set Ringtone</a> | "
				dat += "<a href='byond://?src=[REF(src)];choice=21'>[PDAIMG(mail)]Messages</a><br>"

				if(cartridge)
					dat += cartridge.message_header()

				dat += "<h4>[PDAIMG(menu)] Detected PDAs</h4>"

				dat += "<ul>"
				var/count = 0

				if (!toff)
					for (var/obj/item/pda/P in sortNames(get_viewable_pdas()))
						if (P == src)
							continue
						if(P.owner in blocked_pdas)
							dat += "<li><a href='byond://?src=[REF(src)];choice=unblock_pda;target=[P.owner]'>(BLOCKED - CLICK TO UNBLOCK) [P]</a>"
						else
							dat += "<li><a href='byond://?src=[REF(src)];choice=Message;target=[REF(P)]'>[P]</a>"
						if(cartridge)
							dat += cartridge.message_special(P)
						dat += "</li>"
						count++
				dat += "</ul>"
				if (count == 0)
					dat += "None detected.<br>"
				else if(cartridge && cartridge.spam_enabled)
					dat += "<a href='byond://?src=[REF(src)];choice=MessageAll'>Send To All</a>"

			if(21)
				dat += "<h4>[PDAIMG(mail)] SpaceMessenger V3.9.6</h4>"
				dat += "<a href='byond://?src=[REF(src)];choice=Clear'>[PDAIMG(blank)]Clear Messages</a>"

				dat += "<h4>[PDAIMG(mail)] Messages</h4>"

				dat += tnote
				dat += "<br>"

			if (3)
				dat += "<h4>[PDAIMG(atmos)] Atmospheric Readings</h4>"

				var/turf/T = user.loc
				if (isnull(T))
					dat += "Unable to obtain a reading.<br>"
				else
					var/datum/gas_mixture/environment = T.return_air()

					var/pressure = environment.return_pressure()
					var/total_moles = environment.total_moles()

					dat += "Air Pressure: [round(pressure,0.1)] kPa<br>"

					if (total_moles)
						for(var/id in environment.get_gases())
							var/gas_level = environment.get_moles(id)/total_moles
							if(gas_level > 0)
								dat += "[GLOB.gas_data.names[id]]: [round(gas_level*100, 0.01)]%<br>"

					dat += "Temperature: [round(environment.return_temperature()-T0C)]&deg;C<br>"
				dat += "<br>"
			else//Else it links to the cart menu proc. Although, it really uses menu hub 4--menu 4 doesn't really exist as it simply redirects to hub.
				dat += cartridge.generate_menu()

	dat += "</body></html>"

	if (underline_flag)
		dat = replacetext(dat, "text-decoration:none", "text-decoration:underline")
	if (!underline_flag)
		dat = replacetext(dat, "text-decoration:underline", "text-decoration:none")

	user << browse(dat, "window=pda;size=400x450;border=1;can_resize=1;can_minimize=0")
	onclose(user, "pda", src)

/obj/item/pda/Topic(href, href_list)
	..()
	var/mob/living/U = usr
	//Looking for master was kind of pointless since PDAs don't appear to have one.

	if(usr.canUseTopic(src, BE_CLOSE, FALSE, NO_TK, FALSE) && !href_list["close"])
		add_fingerprint(U)
		U.set_machine(src)

		switch(href_list["choice"])

//BASIC FUNCTIONS===================================

			if("Refresh")//Refresh, goes to the end of the proc.
				if (!silent)
					playsound(src, 'sound/machines/terminal_select.ogg', 15, 1)

			if ("Toggle_Font")
				//CODE REVISION 2
				font_index = (font_index + 1) % 4

				switch(font_index)
					if (MODE_MONO)
						font_mode = FONT_MONO
					if (MODE_SHARE)
						font_mode = FONT_SHARE
					if (MODE_ORBITRON)
						font_mode = FONT_ORBITRON
					if (MODE_VT)
						font_mode = FONT_VT
						if (!silent)
							playsound(src, 'sound/machines/terminal_select.ogg', 15, 1)

			if ("Change_Color")
				var/new_color = input("Please enter a color name or hex value (Default is \'#808000\').",background_color)as color
				background_color = new_color
				if (!silent)
					playsound(src, 'sound/machines/terminal_select.ogg', 15, 1)

			if ("Toggle_Underline")
				underline_flag = !underline_flag
				if (!silent)
					playsound(src, 'sound/machines/terminal_select.ogg', 15, 1)

			if("Return")//Return
				if(mode<=9)
					mode = 0
				else
					mode = round(mode/10)
					if(mode==4 || mode == 5)//Fix for cartridges. Redirects to hub.
						mode = 0
				if (!silent)
					playsound(src, 'sound/machines/terminal_select.ogg', 15, 1)

			if ("Authenticate")//Checks for ID
				id_check(U)

			if("UpdateInfo")
				ownjob = id.assignment
				if(istype(id, /obj/item/card/id/syndicate))
					owner = id.registered_name
				update_label()
				if (!silent)
					playsound(src, 'sound/machines/terminal_processing.ogg', 15, 1)
				addtimer(CALLBACK(GLOBAL_PROC, GLOBAL_PROC_REF(playsound), src, 'sound/machines/terminal_success.ogg', 15, 1), 13)

			if("Eject")//Ejects the cart, only done from hub.
				if (!isnull(cartridge))
					U.put_in_hands(cartridge)
					to_chat(U, "<span class='notice'>You remove [cartridge] from [src].</span>")
					scanmode = PDA_SCANNER_NONE
					cartridge.host_pda = null
					cartridge = null
					update_icon()
				if (!silent)
					playsound(src, 'sound/machines/terminal_eject_disc.ogg', 50, 1)

//MENU FUNCTIONS===================================

			if("0")//Hub
				mode = 0
				if (!silent)
					playsound(src, 'sound/machines/terminal_select.ogg', 15, 1)
			if("1")//Notes
				mode = 1
				if (!silent)
					playsound(src, 'sound/machines/terminal_select.ogg', 15, 1)
			if("2")//Messenger
				mode = 2
				if (!silent)
					playsound(src, 'sound/machines/terminal_select.ogg', 15, 1)
			if("21")//Read messeges
				mode = 21
				if (!silent)
					playsound(src, 'sound/machines/terminal_select.ogg', 15, 1)
			if("3")//Atmos scan
				mode = 3
				if (!silent)
					playsound(src, 'sound/machines/terminal_select.ogg', 15, 1)
			if("4")//Redirects to hub
				mode = 0
				if (!silent)
					playsound(src, 'sound/machines/terminal_select.ogg', 15, 1)


//MAIN FUNCTIONS===================================

			if("Light")
				toggle_light()
				if (!silent)
					playsound(src, 'sound/machines/terminal_select.ogg', 15, 1)

			if("Medical Scan")
				if(scanmode == PDA_SCANNER_MEDICAL)
					scanmode = PDA_SCANNER_NONE
				else if((!isnull(cartridge)) && (cartridge.access & CART_MEDICAL))
					scanmode = PDA_SCANNER_MEDICAL
				if (!silent)
					playsound(src, 'sound/machines/terminal_select.ogg', 15, 1)

			if("Reagent Scan")
				if(scanmode == PDA_SCANNER_REAGENT)
					scanmode = PDA_SCANNER_NONE
				else if((!isnull(cartridge)) && (cartridge.access & CART_REAGENT_SCANNER))
					scanmode = PDA_SCANNER_REAGENT
				if (!silent)
					playsound(src, 'sound/machines/terminal_select.ogg', 15, 1)

			if("Halogen Counter")
				if(scanmode == PDA_SCANNER_HALOGEN)
					scanmode = PDA_SCANNER_NONE
				else if((!isnull(cartridge)) && (cartridge.access & CART_ENGINE))
					scanmode = PDA_SCANNER_HALOGEN
				if (!silent)
					playsound(src, 'sound/machines/terminal_select.ogg', 15, 1)

			if("Honk")
				if ( !(last_noise && world.time < last_noise + 20) )
					playsound(src, 'sound/items/bikehorn.ogg', 50, 1)
					last_noise = world.time

			if("Trombone")
				if ( !(last_noise && world.time < last_noise + 20) )
					playsound(src, 'sound/misc/sadtrombone.ogg', 50, 1)
					last_noise = world.time

			if("Gas Scan")
				if(scanmode == PDA_SCANNER_GAS)
					scanmode = PDA_SCANNER_NONE
				else if((!isnull(cartridge)) && (cartridge.access & CART_ATMOS))
					scanmode = PDA_SCANNER_GAS
				if (!silent)
					playsound(src, 'sound/machines/terminal_select.ogg', 15, 1)

			if("Drone Phone")
				var/alert_s = input(U,"Alert severity level","Ping Drones",null) as null|anything in list("Low","Medium","High","Critical")
				var/area/A = get_area(U)
				if(A && alert_s && !QDELETED(U))
					var/msg = "<span class='boldnotice'>NON-DRONE PING: [U.name]: [alert_s] priority alert in [A.name]!</span>"
					_alert_drones(msg, TRUE, U)
					to_chat(U, msg)
					if (!silent)
						playsound(src, 'sound/machines/terminal_success.ogg', 15, 1)


//NOTEKEEPER FUNCTIONS===================================

			if ("Edit")
				var/n = stripped_multiline_input(U, "Please enter message", name, note)
				if (in_range(src, U) && loc == U)
					if (mode == 1 && n)
						note = n
						notehtml = parsemarkdown(n, U)
						notescanned = FALSE
				else
					U << browse(null, "window=pda")
					return

//MESSENGER FUNCTIONS===================================

			if("Toggle Messenger")
				toff = !toff
			if("Toggle Ringer")//If viewing texts then erase them, if not then toggle silent status
				silent = !silent
			if("Clear")//Clears messages
				tnote = null
			if("Ringtone")
				var/t = stripped_input(U, "Please enter new ringtone", name, ttone, 20)
				if(in_range(src, U) && loc == U && t)
					if(SEND_SIGNAL(src, COMSIG_PDA_CHANGE_RINGTONE, U, t) & COMPONENT_STOP_RINGTONE_CHANGE)
						U << browse(null, "window=pda")
						return
					else
						ttone = t
				else
					U << browse(null, "window=pda")
					return
			if("Message")
				create_message(U, locate(href_list["target"]))

			if("MessageAll")
				if(cartridge?.spam_enabled)
					send_to_all(U)

			if("toggle_block")
				toggle_blocking(usr, href_list["target"])

			if("block_pda")
				block_pda(usr, href_list["target"])

			if("unblock_pda")
				unblock_pda(usr, href_list["target"])

			if("cart")
				if(cartridge)
					cartridge.special(U, href_list)
				else
					U << browse(null, "window=pda")
					return

//SYNDICATE FUNCTIONS===================================

			if("Toggle Door")
				if(cartridge && cartridge.access & CART_REMOTE_DOOR)
					for(var/obj/machinery/door/poddoor/M in GLOB.machines)
						if(M.id == cartridge.remote_door_id)
							if(M.density)
								M.open()
							else
								M.close()

//pAI FUNCTIONS===================================
			if("pai")
				switch(href_list["option"])
					if("1")		// Configure pAI device
						pai.attack_self(U)
					if("2")		// Eject pAI device
						var/turf/T = get_turf(loc)
						if(T)
							pai.forceMove(T)

//DRINK RECIPE BROWSER=============================
			if("Drink Recipe Browser")
				if(cartridge && cartridge.access & CART_BARTENDER)
					recipe_search(U, GLOB.drink_reactions_list)

//CHEMISTRY RECIPE BROWSER
			if("Chemistry Recipe Browser")
				if(cartridge && cartridge.access & CART_CHEMISTRY)
					recipe_search(U, GLOB.normalized_chemical_reactions_list)

//LINK FUNCTIONS===================================

			else//Cartridge menu linking
				mode = max(text2num(href_list["choice"]), 0)

	else//If not in range, can't interact or not using the pda.
		U.unset_machine()
		U << browse(null, "window=pda")
		return

//EXTRA FUNCTIONS===================================

	if (mode == 2 || mode == 21)//To clear message overlays.
		update_icon()

	if ((honkamt > 0) && (prob(60)))//For clown virus.
		honkamt--
		playsound(src, 'sound/items/bikehorn.ogg', 30, 1)

	if(U.machine == src && href_list["skiprefresh"]!="1")//Final safety.
		attack_self(U)//It auto-closes the menu prior if the user is not in range and so on.
	else
		U.unset_machine()
		U << browse(null, "window=pda")
	return

/obj/item/pda/proc/remove_id(mob/user)
	if(hasSiliconAccessInArea(user) || !user.canUseTopic(src, BE_CLOSE, FALSE, NO_TK, FALSE))
		return
	do_remove_id(user)

/obj/item/pda/proc/do_remove_id(mob/user)
	if(!id)
		return
	if(user)
		user.put_in_hands(id)
		to_chat(user, "<span class='notice'>You remove the ID from the [name].</span>")
	else
		id.forceMove(get_turf(src))

	. = id
	id = null
	update_icon()

	if(ishuman(loc))
		var/mob/living/carbon/human/H = loc
		if(H.wear_id == src)
			H.sec_hud_set_ID()

/obj/item/pda/proc/msg_input(mob/living/U = usr)
	var/t = stripped_input(U, "Please enter message", name)
	if (!t || toff)
		return
	if(!U.canUseTopic(src, BE_CLOSE, FALSE, NO_TK, FALSE))
		return
	if(emped)
		t = Gibberish(t, 100)
	return t

/obj/item/pda/proc/send_message(mob/living/user, list/obj/item/pda/targets, everyone)
	var/message = msg_input(user)
	if(!message || !targets.len)
		return
	if((last_text && world.time < last_text + 10) || (everyone && last_everyone && world.time < last_everyone + PDA_SPAM_DELAY))
		return
	if(prob(1))
		message += "\nSent from my PDA"
	// Send the signal
	var/list/string_targets = list()
	var/list/string_blocked
	for(var/obj/item/pda/P in targets)
		if(owner in P.blocked_pdas)
			LAZYADD(string_blocked, P.owner)
			continue
		if(P.owner && P.ownjob)  // != src is checked by the UI
			string_targets += "[P.owner] ([P.ownjob])"
	if(string_blocked)
		string_blocked = english_list(string_blocked)
		to_chat(user, "<span class='warning'>[icon2html(src, user)] The following recipients have blocked your message: [string_blocked].</span>")
	for (var/obj/machinery/computer/message_monitor/M in targets)
		// In case of "Reply" to a message from a console, this will make the
		// message be logged successfully. If the console is impersonating
		// someone by matching their name and job, the reply will reach the
		// impersonated PDA.
		string_targets += "[M.customsender] ([M.customjob])"
	if (!string_targets.len)
		return

	var/datum/signal/subspace/pda/signal = new(src, list(
		"name" = "[owner]",
		"job" = "[ownjob]",
		"message" = message,
		"targets" = string_targets,
		"emojis" = allow_emojis
	))
	if (picture)
		signal.data["photo"] = picture
	signal.send_to_receivers()

	// If it didn't reach, note that fact
	if (!signal.data["done"])
		to_chat(user, "<span class='notice'>ERROR: Server isn't responding.</span>")
		if (!silent)
			playsound(src, 'sound/machines/terminal_error.ogg', 15, 1)
		return

	var/target_text = signal.format_target()
	if(allow_emojis)
		message = emoji_parse(message)//already sent- this just shows the sent emoji as one to the sender in the to_chat
		signal.data["message"] = emoji_parse(signal.data["message"])
	// Log it in our logs
	tnote += "<i><b>&rarr; To [target_text]:</b></i><br>[signal.format_message()]<br>"
	// Show it to ghosts
	var/ghost_message = "<span class='name'>[owner] </span><span class='game say'>PDA Message</span> --> <span class='name'>[target_text]</span>: <span class='message'>[signal.format_message()]</span>"
	for(var/i in GLOB.dead_mob_list)
		var/mob/M = i
		if(M?.client && M.client.prefs.chat_toggles & CHAT_GHOSTPDA)
			to_chat(M, "[FOLLOW_LINK(M, user)] [ghost_message]")
	to_chat(user, "<span class='info'>Message sent to [target_text]: \"[message]\"</span>")
	// Log in the talk log
	user.log_talk(message, LOG_PDA, tag="PDA: [initial(name)] to [target_text] (BLOCKED:[string_blocked])")
	if (!silent)
		playsound(src, 'sound/machines/terminal_success.ogg', 15, 1)
	// Reset the photo
	picture = null
	last_text = world.time
	if (everyone)
		last_everyone = world.time

/obj/item/pda/proc/receive_message(datum/signal/subspace/pda/signal)
	tnote += "<i><b>&larr; From <a href='byond://?src=[REF(src)];choice=Message;target=[REF(signal.source)]'>[signal.data["name"]]</a> ([signal.data["job"]]):</b></i> <a href='byond://?src=[REF(src)];choice=toggle_block;target=[signal.data["name"]]'>(BLOCK/UNBLOCK)</a><br>[signal.format_message()]<br>"
	if (!silent)
		playsound(src, 'sound/machines/twobeep.ogg', 50, 1)
		audible_message("[icon2html(src, hearers(src))] *[ttone]*", null, 3)
	//Search for holder of the PDA.
	var/mob/living/L = null
	if(loc && isliving(loc))
		L = loc
	//Maybe they are a pAI!
	else
		L = get(src, /mob/living/silicon)

	if(L && L.stat != UNCONSCIOUS)
		var/hrefstart
		var/hrefend
		if (isAI(L))
			hrefstart = "<a href='?src=[REF(L)];track=[html_encode(signal.data["name"])]'>"
			hrefend = "</a>"

		var/inbound_message = signal.format_message()
		if(signal.data["emojis"] == TRUE)//so will not parse emojis as such from pdas that don't send emojis
			inbound_message = emoji_parse(inbound_message)

		to_chat(L, "[icon2html(src)] <b>Message from [hrefstart][signal.data["name"]] ([signal.data["job"]])[hrefend], </b>[inbound_message] (<a href='byond://?src=[REF(src)];choice=Message;skiprefresh=1;target=[REF(signal.source)]'>Reply</a>) (<a href='byond://?src=[REF(src)];choice=toggle_block;target=[signal.data["name"]]'>BLOCK/UNBLOCK</a>)")

	new_alert = TRUE
	update_icon()

/obj/item/pda/proc/send_to_all(mob/living/U)
	if (last_everyone && world.time < last_everyone + PDA_SPAM_DELAY)
		to_chat(U,"<span class='warning'>Send To All function is still on cooldown.")
		return
	send_message(U,get_viewable_pdas(), TRUE)

/obj/item/pda/proc/create_message(mob/living/U, obj/item/pda/P)
	send_message(U,list(P))

/obj/item/pda/proc/toggle_blocking(mob/user, target)
	if(target in blocked_pdas)
		unblock_pda(user, target)
	else
		block_pda(user, target)

/obj/item/pda/proc/block_pda(mob/user, target)
	to_chat(user, "<span class='notice'>[icon2html(src, user)] [target] blocked from messages. Use the messenger PDA list to unblock.</span>")
	LAZYOR(blocked_pdas, target)

/obj/item/pda/proc/unblock_pda(mob/user, target)
	to_chat(user, "<span class='notice'>[icon2html(src, user)] [target] unblocked from messages.</span>")
	LAZYREMOVE(blocked_pdas, target)

/obj/item/pda/AltClick(mob/user)
	. = ..()
	if(id)
		remove_id(user)
		playsound(src, 'sound/machines/terminal_eject_disc.ogg', 50, 1)
	else
		remove_pen(user)
		playsound(src, 'sound/machines/button4.ogg', 50, 1)
	return TRUE

/obj/item/pda/CtrlClick(mob/user)
	..()

	if(isturf(loc)) //stops the user from dragging the PDA by ctrl-clicking it.
		return

	remove_pen(user)

/obj/item/pda/verb/verb_toggle_light()
	set category = "Object"
	set name = "Toggle Flashlight"

	toggle_light()

/obj/item/pda/verb/verb_remove_id()
	set category = "Object"
	set name = "Eject ID"
	set src in usr

	if(id)
		remove_id(usr)
	else
		to_chat(usr, "<span class='warning'>This PDA does not have an ID in it!</span>")

/obj/item/pda/verb/verb_remove_pen()
	set category = "Object"
	set name = "Remove Pen"
	set src in usr

	remove_pen()

/obj/item/pda/proc/toggle_light()
	if(hasSiliconAccessInArea(usr) || !usr.canUseTopic(src, BE_CLOSE, check_resting = FALSE))
		return FALSE
	if(fon)
		fon = FALSE
		set_light(0)
	else if(f_lum)
		fon = TRUE
		set_light(f_lum, f_pow, f_col)
	update_icon()
	return TRUE

/obj/item/pda/proc/remove_pen()

	if(hasSiliconAccessInArea(usr) || !usr.canUseTopic(src, BE_CLOSE, FALSE, NO_TK, FALSE))
		return

	if(inserted_item)
		usr.put_in_hands(inserted_item)
		to_chat(usr, "<span class='notice'>You remove [inserted_item] from [src].</span>")
		inserted_item = null
		update_icon()
	else
		to_chat(usr, "<span class='warning'>This PDA does not have a pen in it!</span>")

//trying to insert or remove an id
/obj/item/pda/proc/id_check(mob/user, obj/item/card/id/I)
	if(!I)
		if(id && (src in user.contents))
			remove_id(user)
			return TRUE
		else
			var/obj/item/card/id/C = user.get_active_held_item()
			if(istype(C))
				I = C

	if(I?.registered_name)
		if(!user.transferItemToLoc(I, src))
			return FALSE
		insert_id(I, user)
		update_icon()
		playsound(src, 'sound/machines/button.ogg', 50, 1)
	return TRUE

/obj/item/pda/proc/insert_id(obj/item/card/id/inserting_id, mob/user)
	var/obj/old_id = id
	id = inserting_id
	if(ishuman(loc))
		var/mob/living/carbon/human/human_wearer = loc
		if(human_wearer.wear_id == src)
			human_wearer.sec_hud_set_ID()
	if(old_id)
		if(user)
			user.put_in_hands(old_id)
		else
			old_id.forceMove(get_turf(src))

// access to status display signals
/obj/item/pda/attackby(obj/item/C, mob/user, params)
	if(istype(C, /obj/item/cartridge) && !cartridge)
		if(!user.transferItemToLoc(C, src))
			return
		cartridge = C
		cartridge.host_pda = src
		to_chat(user, "<span class='notice'>You insert [cartridge] into [src].</span>")
		update_icon()
		playsound(src, 'sound/machines/button.ogg', 50, 1)

	else if(istype(C, /obj/item/card/id))
		var/obj/item/card/id/idcard = C
		if(!idcard.registered_name)
			to_chat(user, "<span class='warning'>\The [src] rejects the ID!</span>")
			if (!silent)
				playsound(src, 'sound/machines/terminal_error.ogg', 15, 1)
			return

		if(!owner)
			owner = idcard.registered_name
			ownjob = idcard.assignment
			update_label()
			to_chat(user, "<span class='notice'>Card scanned.</span>")
			if (!silent)
				playsound(src, 'sound/machines/terminal_success.ogg', 15, 1)
		else
			//Basic safety check. If either both objects are held by user or PDA is on ground and card is in hand.
			if(((src in user.contents) || (isturf(loc) && in_range(src, user))) && (C in user.contents))
				if(!id_check(user, idcard))
					return
				to_chat(user, "<span class='notice'>You put the ID into \the [src]'s slot.</span>")
				updateSelfDialog()//Update self dialog on success.
			return	//Return in case of failed check or when successful.
		updateSelfDialog()//For the non-input related code.
	else if(istype(C, /obj/item/paicard) && !pai)
		if(!user.transferItemToLoc(C, src))
			return
		pai = C
		to_chat(user, "<span class='notice'>You slot \the [C] into [src].</span>")
		update_icon()
		updateUsrDialog()
	else if(is_type_in_list(C, contained_item)) //Checks if there is a pen
		if(inserted_item)
			to_chat(user, "<span class='warning'>There is already \a [inserted_item] in \the [src]!</span>")
			return ..()
		else
			if(!user.transferItemToLoc(C, src))
				return
			to_chat(user, "<span class='notice'>You slide \the [C] into \the [src].</span>")
			inserted_item = C
			update_icon()
			playsound(src, 'sound/machines/button.ogg', 50, 1)

	else if(istype(C, /obj/item/photo))
		var/obj/item/photo/P = C
		picture = P.picture
		to_chat(user, "<span class='notice'>You scan \the [C].</span>")
	else
		return ..()

/obj/item/pda/attack(mob/living/carbon/C, mob/living/user)
	if(istype(C))
		switch(scanmode)

			if(PDA_SCANNER_MEDICAL)
				C.visible_message("<span class='alert'>[user] has analyzed [C]'s vitals!</span>")
				healthscan(user, C, 1)
				add_fingerprint(user)

			if(PDA_SCANNER_HALOGEN)
				C.visible_message("<span class='warning'>[user] has analyzed [C]'s radiation levels!</span>")

				user.show_message("<span class='notice'>Analyzing Results for [C]:</span>")
				if(C.radiation)
					user.show_message("\green Radiation Level: \black [C.radiation]")
				else
					user.show_message("<span class='notice'>No radiation detected.</span>")

/obj/item/pda/afterattack(atom/A as mob|obj|turf|area, mob/user, proximity)
	. = ..()
	if(!proximity)
		return
	switch(scanmode)
		if(PDA_SCANNER_REAGENT)
			if(!isnull(A.reagents))
				if(A.reagents.reagent_list.len > 0)
					var/reagents_length = A.reagents.reagent_list.len
					to_chat(user, "<span class='notice'>[reagents_length] chemical agent[reagents_length > 1 ? "s" : ""] found.</span>")
					for (var/re in A.reagents.reagent_list)
						to_chat(user, "<span class='notice'>\t [re]</span>")
				else
					to_chat(user, "<span class='notice'>No active chemical agents found in [A].</span>")
			else
				to_chat(user, "<span class='notice'>No significant chemical agents found in [A].</span>")

		if(PDA_SCANNER_GAS)
			A.analyzer_act(user, src)

	if (!scanmode && istype(A, /obj/item/paper) && owner)
		var/obj/item/paper/PP = A
		if (!PP.default_raw_text)
			to_chat(user, "<span class='warning'>Unable to scan! Paper is blank.</span>")
			return
		notehtml = PP.default_raw_text
		note = replacetext(notehtml, "<BR>", "\[br\]")
		note = replacetext(note, "<li>", "\[*\]")
		note = replacetext(note, "<ul>", "\[list\]")
		note = replacetext(note, "</ul>", "\[/list\]")
		note = html_encode(note)
		notescanned = TRUE
		to_chat(user, "<span class='notice'>Paper scanned. Saved to PDA's notekeeper.</span>" )


/obj/item/pda/proc/explode() //This needs tuning.
	if(!detonatable)
		return
	var/turf/T = get_turf(src)

	if (ismob(loc))
		var/mob/M = loc
		M.show_message("<span class='userdanger'>Your [src] explodes!</span>", MSG_VISUAL, "<span class='warning'>You hear a loud *pop*!</span>", MSG_AUDIBLE)
	else
		visible_message("<span class='danger'>[src] explodes!</span>", "<span class='warning'>You hear a loud *pop*!</span>")

	if(T)
		T.hotspot_expose(700,125)
		if(istype(cartridge, /obj/item/cartridge/virus/syndicate))
			explosion(T, -1, 1, 3, 4)
		else
			explosion(T, -1, -1, 2, 3)
	qdel(src)
	return

/obj/item/pda/Destroy()
	GLOB.PDAs -= src
	if(istype(id))
		QDEL_NULL(id)
	if(istype(cartridge))
		QDEL_NULL(cartridge)
	if(istype(pai))
		QDEL_NULL(pai)
	if(istype(inserted_item))
		QDEL_NULL(inserted_item)
	return ..()

//AI verb and proc for sending PDA messages.

/mob/living/silicon/ai/proc/cmd_send_pdamesg(mob/user)
	var/list/plist = list()
	var/list/namecounts = list()

	if(aiPDA.toff)
		to_chat(user, "Turn on your receiver in order to send messages.")
		return

	for (var/obj/item/pda/P in get_viewable_pdas())
		if (P == src)
			continue
		else if (P == aiPDA)
			continue

		plist[avoid_assoc_duplicate_keys(P.owner, namecounts)] = P

	var/c = input(user, "Please select a PDA") as null|anything in sort_list(plist)

	if (!c)
		return

	var/selected = plist[c]

	if(aicamera.stored.len)
		var/add_photo = input(user,"Do you want to attach a photo?","Photo","No") as null|anything in list("Да","Нет")
		if(add_photo=="Да")
			var/datum/picture/Pic = aicamera.selectpicture(user)
			aiPDA.picture = Pic

	if(incapacitated())
		return

	aiPDA.create_message(src, selected)


/mob/living/silicon/ai/verb/cmd_toggle_pda_receiver()
	set category = "AI Commands"
	set name = "PDA - Toggle Sender/Receiver"
	if(usr.stat == DEAD)
		return //won't work if dead
	if(!isnull(aiPDA))
		aiPDA.toff = !aiPDA.toff
		to_chat(usr, "<span class='notice'>PDA sender/receiver toggled [(aiPDA.toff ? "Off" : "On")]!</span>")
	else
		to_chat(usr, "You do not have a PDA. You should make an issue report about this.")

/mob/living/silicon/ai/verb/cmd_toggle_pda_silent()
	set category = "AI Commands"
	set name = "PDA - Toggle Ringer"
	if(usr.stat == DEAD)
		return //won't work if dead
	if(!isnull(aiPDA))
		//0
		aiPDA.silent = !aiPDA.silent
		to_chat(usr, "<span class='notice'>PDA ringer toggled [(aiPDA.silent ? "Off" : "On")]!</span>")
	else
		to_chat(usr, "You do not have a PDA. You should make an issue report about this.")

/mob/living/silicon/ai/proc/cmd_show_message_log(mob/user)
	if(incapacitated())
		return
	if(!isnull(aiPDA))
		var/HTML = "<html><head><meta http-equiv='Content-Type' content='text/html; charset=utf-8'><title>AI PDA Message Log</title></head><body>[aiPDA.tnote]</body></html>"
		user << browse(HTML, "window=log;size=400x444;border=1;can_resize=1;can_close=1;can_minimize=0")
	else
		to_chat(user, "You do not have a PDA. You should make an issue report about this.")


// Pass along the pulse to atoms in contents, largely added so pAIs are vulnerable to EMP
/obj/item/pda/emp_act(severity)
	. = ..()
	if (!(. & EMP_PROTECT_CONTENTS))
		for(var/atom/A in src)
			A.emp_act(severity)
	if (!(. & EMP_PROTECT_SELF))
		emped += 1
		spawn(2 * severity)
			emped -= 1

/proc/get_viewable_pdas()
	. = list()
	// Returns a list of PDAs which can be viewed from another PDA/message monitor.
	for(var/obj/item/pda/P in GLOB.PDAs)
		if(!P.owner || P.toff || P.hidden)
			continue
		. += P

//borg pda stuff
/mob/living/silicon/robot/proc/cmd_send_pdamesg(mob/user)
	var/list/plist = list()
	var/list/namecounts = list()

	if(aiPDA.toff)
		to_chat(user, "Turn on your receiver in order to send messages.")
		return

	for (var/obj/item/pda/P in get_viewable_pdas())
		if (P == src)
			continue
		else if (P == aiPDA)
			continue

		plist[avoid_assoc_duplicate_keys(P.owner, namecounts)] = P

	var/c = input(user, "Please select a PDA") as null|anything in sort_list(plist)

	if (!c)
		return

	var/selected = plist[c]

	if(aicamera.stored.len)
		var/add_photo = input(user,"Do you want to attach a photo?","Photo","No") as null|anything in list("Да","Нет")
		if(add_photo=="Yes")
			var/datum/picture/Pic = aicamera.selectpicture(user)
			aiPDA.picture = Pic

	if(incapacitated())
		return

	aiPDA.create_message(src, selected)


/mob/living/silicon/robot/proc/cmd_show_message_log(mob/user)
	if(incapacitated())
		return
	if(!isnull(aiPDA))
		var/HTML = "<html><head><meta http-equiv='Content-Type' content='text/html; charset=utf-8'><title>AI PDA Message Log</title></head><body>[aiPDA.tnote]</body></html>"
		user << browse(HTML, "window=log;size=400x444;border=1;can_resize=1;can_close=1;can_minimize=0")
	else
		to_chat(user, "You do not have a PDA. You should make an issue report about this.")

#undef PDA_SCANNER_NONE
#undef PDA_SCANNER_MEDICAL
#undef PDA_SCANNER_FORENSICS
#undef PDA_SCANNER_REAGENT
#undef PDA_SCANNER_HALOGEN
#undef PDA_SCANNER_GAS
#undef PDA_SPAM_DELAY

#undef PDA_OVERLAY_ALERT
#undef PDA_OVERLAY_SCREEN
#undef PDA_OVERLAY_ID
#undef PDA_OVERLAY_ITEM
#undef PDA_OVERLAY_LIGHT
#undef PDA_OVERLAY_PAI
