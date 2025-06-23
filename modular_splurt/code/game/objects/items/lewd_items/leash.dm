//Jay Sparrow
//TODO
/*
Icons, maybe?
*/
#define MOVESPEED_ID_LEASH      "LEASH"

/////STATUS EFFECTS/////
//These are mostly used as flags for the states each member can be in

// /datum/status_effect/leash_dom
// 	status_type = STATUS_EFFECT_UNIQUE
// 	alert_type = /atom/movable/screen/alert/status_effect/leash_dom

// /atom/movable/screen/alert/status_effect/leash_dom
// 	name = "Leash Master"
// 	desc = "You've got a leash, and a cute pet on the other end."
// 	icon_state = "leash_master" //These call icons that don't exist, so no icon comes up. Which is good.
// 		//As a result, the descriptions also don't proc, which is fine.

// /datum/status_effect/leash_freepet
// 	status_type = STATUS_EFFECT_UNIQUE
// 	alert_type = /atom/movable/screen/alert/status_effect/leash_freepet

// /atom/movable/screen/alert/status_effect/leash_freepet
// 	name = "Escaped Pet"
// 	desc = "You're on a leash, but you've no master. If anyone grabs the leash they'll gain control!"
// 	icon_state = "leash_freepet"

/datum/status_effect/leash_pet
	id = "leashed"
	status_type = STATUS_EFFECT_UNIQUE
	alert_type = null
// 	var/mob/redirect_component
// 	alert_type = /atom/movable/screen/alert/status_effect/leash_pet

// /atom/movable/screen/alert/status_effect/leash_pet
// 	name = "Leashed Pet"
// 	desc = "You're on the hook now! Be good for your master."
// 	icon_state = "leash_pet"

// /datum/status_effect/leash_pet/on_apply()
// 	RegisterSignal(owner, COMSIG_LIVING_RESIST, PROC_REF(owner_resist))
// 	redirect_component = owner
// 	if(!owner.stat)
// 		to_chat(owner, span_userdanger("You have been leashed!"))
// 	return ..()

// //This lets the pet resist their leash
// /datum/status_effect/leash_pet/proc/owner_resist()
// 	to_chat(owner, "You reach for the hook on your collar...")
// 	//Determine how long it takes to remove the leash
// 	var/deleash = 15
// 	//if(owner.get_item_by_slot(SLOT_HANDCUFFED))  //Commented out because there is no clear way to make this proc BEFORE decuff on resist.
// 		//deleash = 100
// 	if(do_mob(owner, owner, deleash))//do_mob creates a progress bar and then enacts the code after. Owner, owner, because it's an act on themself
// 		if(!QDELETED(src))
// 			to_chat(owner, span_warning("[owner] has removed their leash!"))
// 			owner.remove_status_effect(/datum/status_effect/leash_pet)

///// OBJECT /////
//The leash object itself
//The component variables are used for hooks, used later.

/obj/item/leash
	name = "leash"
	desc = "A simple tether that can easily be hooked onto a collar. Perfect for your pet."
	icon = 'modular_splurt/icons/obj/leash.dmi'
	icon_state = "leash"
	item_state = "leash"
	throw_range = 4
	slot_flags = ITEM_SLOT_BELT
	force = 1
	throwforce = 1
	w_class = WEIGHT_CLASS_SMALL
	var/mob/living/leash_pet = null //Variable to store our pet later
	var/mob/living/leash_master = null //And our master too
	var/datum/beam/leash_beam = null

/obj/item/leash/examine(mob/user)
	. = ..()
	. += span_notice("You can clip it on your belt.")
	if(istype(leash_pet))
		. += span_notice("Activate in hand to tug the pet closer to you.")

/obj/item/leash/Destroy()
	sever_leash()
	. = ..()

/obj/item/leash/process(delta_time)
	if(!leash_pet) //No pet, break loop
		sever_leash()
		return PROCESS_KILL
	if(!(leash_pet.get_item_by_slot(ITEM_SLOT_NECK))) //The pet has slipped their collar and is not the pet anymore.
		leash_pet.visible_message(
			span_warning("[leash_pet] has slipped out of their collar!"),
			span_warning("You have slipped out of your collar!"),
			target = leash_master,
			target_message = span_warning("[leash_pet] has slipped out of their collar!")
		)
		sever_leash()
		return PROCESS_KILL
	if(leash_pet.z != loc.z)
		leash_pet.visible_message(
			span_warning("[leash_pet] has severed the leash!"),
			span_warning("You have severed the leash!"),
			target = leash_master,
			target_message = span_warning("[leash_pet] has severed the leash!")
		)
		sever_leash()
		return PROCESS_KILL
	if(leash_beam?.finished)
		if(istype(leash_master))
			leash_beam = leash_master.Beam(leash_pet, icon_state="leash", icon = "modular_bluemoon/icons/effects/beam.dmi", time = INFINITY, maxdistance = INFINITY, beam_sleep_time = 1)
		else if(loc != leash_pet)
			leash_beam = Beam(leash_pet, icon_state="leash", icon = "modular_bluemoon/icons/effects/beam.dmi", time = INFINITY, maxdistance = INFINITY, beam_sleep_time = 1)
	// if(!leash_pet.has_status_effect(/datum/status_effect/leash_pet)) //If there is no pet, there is no dom. Loop breaks.
	// 	sever_leash()
	// 	return PROCESS_KILL

/obj/item/leash/proc/sever_leash()
	if(leash_pet)
		UnregisterSignal(leash_pet, COMSIG_MOVABLE_MOVED)
		leash_pet.remove_movespeed_modifier(/datum/movespeed_modifier/leash)
		leash_pet.remove_status_effect(/datum/status_effect/leash_pet)
	if(leash_master)
		UnregisterSignal(leash_master, COMSIG_MOVABLE_MOVED)
	// leash_pet.remove_status_effect(/datum/status_effect/leash_freepet)
	// leash_master?.remove_status_effect(/datum/status_effect/leash_dom)
	QDEL_NULL(leash_beam)
	leash_pet = null
	leash_master = null
	w_class = initial(w_class)

/obj/item/leash/proc/check_leash_mobs()
	if(istype(leash_pet) && istype(leash_master))
		return TRUE
	else
		return FALSE

//Called when someone is clicked with the leash
/obj/item/leash/attack(mob/living/carbon/C, mob/living/user, attackchain_flags, damage_multiplier) //C is the target, user is the one with the leash
	if(C == leash_pet)	//we set our pet free.
		C.visible_message(
			span_warning("The leash on [C]'s collar is gone."),
			span_warning("Master frees you from the leash."),
			target = leash_master,
			target_message = span_warning("You free your pet.")
		)
		sever_leash()
		return
	else if(istype(leash_pet))	//we can't have 2 pets on the same leash.
		to_chat(user, "You already have a pet on that leath.")
		return
	if(C.has_status_effect(/datum/status_effect/leash_pet)) //If the pet is already leashed, do not leash them. For the love of god.
		to_chat(user, span_notice("[C] has already been leashed."))
		return
	if(istype(C.get_item_by_slot(ITEM_SLOT_NECK), /obj/item/clothing/neck/petcollar) || istype(C.get_item_by_slot(ITEM_SLOT_NECK), /obj/item/electropack/shockcollar) || istype(C.get_item_by_slot(ITEM_SLOT_NECK), /obj/item/clothing/neck/necklace/cowbell) || istype(C.get_item_by_slot(ITEM_SLOT_NECK), /obj/item/clothing/neck/maid))
		var/leashtime = 50
		if(C.handcuffed)
			leashtime = 5
		if(do_mob(user, C, leashtime)) //do_mob adds a progress bar, but then we also check to see if they have a collar
			w_class = WEIGHT_CLASS_HUGE
			log_combat(user, C, "leashed", addition="playfully")
			C.apply_status_effect(/datum/status_effect/leash_pet)//Has now been leashed
			// user.apply_status_effect(/datum/status_effect/leash_dom) //Is the leasher
			leash_pet = C //Save pet reference for later
			// if(leash_pet.has_status_effect(/datum/status_effect/leash_dom)) //Pet leashed themself. They are not the dom
			// 	leash_pet.apply_status_effect(/datum/status_effect/leash_freepet)
			// 	leash_pet.remove_status_effect(/datum/status_effect/leash_dom)
			if(C != user)
				leash_master = user //Save dom reference for later
				leash_pet.add_movespeed_modifier(/datum/movespeed_modifier/leash)
				RegisterSignal(leash_master, COMSIG_MOVABLE_MOVED, PROC_REF(on_master_move))
				leash_beam = user.Beam(leash_pet, icon_state="leash", icon = "modular_bluemoon/icons/effects/beam.dmi", time = INFINITY, maxdistance = INFINITY, beam_sleep_time = 1)
			leash_pet.visible_message(
				span_warning("[leash_pet] has been leashed by [leash_master ? leash_master : "[leash_pet.p_them()]self"]."),
				span_warning("You have hooked a leash onto [leash_master ? leash_pet : "yourself"]!"),
			)
			START_PROCESSING(SSfastprocess, src) // The original while loop here ran every 2 deciseconds, and so does SSfastprocess.
			RegisterSignal(leash_pet, COMSIG_MOVABLE_MOVED, PROC_REF(on_pet_move))
	else //No collar, no fun
		var/leash_message = pick("[C] needs a collar before you can attach a leash to it.")
		to_chat(user, span_notice("[leash_message]"))

//Called when the leash is used in hand
//Tugs the pet closer
/obj/item/leash/attack_self(mob/living/user)
	if(!leash_pet || user == leash_pet) //No pet, no tug.
		return
	//Yank the pet. Yank em in close.
	apply_tug_mob_to_mob(leash_pet, leash_master, 1)
	leash_pet.adjustOxyLoss(3)

/obj/item/leash/proc/on_master_move()
	SIGNAL_HANDLER
	if(leash_pet == leash_master) //Pet is the master
		return
	addtimer(CALLBACK(src, PROC_REF(after_master_move)), 0.2 SECONDS)

/obj/item/leash/proc/after_master_move()
	//If the master moves, pull the pet in behind
	//Also, the timer means that the distance check for master happens before the pet, to prevent both from proccing.
	if(!check_leash_mobs())
		return
	apply_tug_mob_to_mob(leash_pet, leash_master, 2)
	//Knock the pet over if they get further behind. Shouldn't happen too often.
	stoplag(3) //This way running normally won't just yank the pet to the ground.
	if(!check_leash_mobs())
		return
	if(get_dist(leash_pet, leash_master) > 3)
		leash_pet.visible_message(
			span_warning("[leash_pet] is pulled to the ground by their leash!"),
			span_warning("You are pulled to the ground by your leash!")
		)
		leash_pet.adjustOxyLoss(3)
		leash_pet.apply_effect(20, EFFECT_KNOCKDOWN, 0)
	//This code is to check if the pet has gotten too far away, and then break the leash.
	stoplag(3) //Wait to snap the leash
	if(!check_leash_mobs())
		return
	if(get_dist(leash_pet, leash_master) > 5)
		leash_pet.visible_message(
			span_warning("The leash snaps free from [leash_pet]'s collar!"),
			span_warning("Your leash pops from your collar!"),
			target = leash_master,
			target_message = span_warning("The leash snaps free from your pet's collar!")
		)
		leash_pet.apply_effect(20, EFFECT_KNOCKDOWN, 0)
		leash_pet.adjustOxyLoss(6)
		sever_leash()

/obj/item/leash/proc/on_pet_move()
	SIGNAL_HANDLER
	addtimer(CALLBACK(src, PROC_REF(after_pet_move)), 0.3 SECONDS) //A short timer so the pet kind of bounces back after they make the step

/obj/item/leash/proc/after_pet_move()
	if(!istype(leash_pet))
		return
	if(istype(leash_master))
		for(var/i in 3 to get_dist(leash_pet, leash_master)) // Move the pet to a minimum of 2 tiles away from the master, so the pet trails behind them.
			step_towards(leash_pet, leash_master)
	else if(!ismob(loc))
		for(var/i in 3 to get_dist(src, leash_pet)) // Move us to a minimum of 2 tiles away from the pet, so we trail behind them.
			step_towards(src, leash_pet)
		if(get_dist(src, leash_pet) > 5)
			leash_pet.visible_message(span_warning("\The [src] snaps free from \the [leash_pet]!"), span_warning("Your leash pops free from your collar!"))
			leash_pet.apply_effect(20, EFFECT_KNOCKDOWN, 0)
			leash_pet.adjustOxyLoss(6)
			sever_leash()

/obj/item/leash/Moved(atom/OldLoc, Dir)
	. = ..()
	if(leash_pet && !ismob(OldLoc) && !ismob(loc) && get_dist(src, leash_pet)>3)
		after_pet_move()

/obj/item/leash/equipped(mob/user)
	. = ..()
	if(!leash_pet)
		return
	if(leash_master == user)
		return // Don't double-register.
	if(leash_pet == user) //Pet picked up their own leash.
		return
	leash_master = user
	// leash_master.apply_status_effect(/datum/status_effect/leash_dom)
	// leash_pet.remove_status_effect(/datum/status_effect/leash_freepet)
	leash_pet.add_movespeed_modifier(/datum/movespeed_modifier/leash)
	RegisterSignal(leash_master, COMSIG_MOVABLE_MOVED, PROC_REF(on_master_move))
	QDEL_NULL(leash_beam)
	leash_beam = leash_master.Beam(leash_pet, icon_state="leash", icon = "modular_bluemoon/icons/effects/beam.dmi", time = INFINITY, maxdistance = INFINITY, beam_sleep_time = 1)

/obj/item/leash/dropped(mob/user, silent)
	. = ..()
	if(!leash_pet)
		return
	if(leash_master)
		if(leash_master.is_holding(src) || leash_master.get_item_by_slot(ITEM_SLOT_BELT) == src)
			return  //Dom still has the leash as it turns out. Cancel the proc.
		leash_master.visible_message(span_notice("\The [leash_master] drops \the [src]."), span_notice("You drop \the [src]."))
		//DOM HAS DROPPED LEASH. PET IS FREE. SCP HAS BREACHED CONTAINMENT.
		UnregisterSignal(leash_master, COMSIG_MOVABLE_MOVED)
		leash_pet.remove_movespeed_modifier(/datum/movespeed_modifier/leash)
		// leash_master.remove_status_effect(/datum/status_effect/leash_dom) //No dom with no leash. We will get a new dom if the leash is picked back up.
		leash_master = null
		QDEL_NULL(leash_beam)
	if(!ismob(loc))
		leash_beam = Beam(leash_pet, icon_state="leash", icon = "modular_bluemoon/icons/effects/beam.dmi", time = INFINITY, maxdistance = INFINITY, beam_sleep_time = 1)
	// leash_beam.origin = src

/datum/movespeed_modifier/leash
	id = MOVESPEED_ID_LEASH
	multiplicative_slowdown = 1

/*/datum/crafting_recipe/leash
	name = "Leash"
	result = /obj/item/leash
	time = 40
	reqs = list(/obj/item/stack/sheet/metal = 1,
				/obj/item/stack/sheet/cloth = 3)
	category = CAT_MISCELLANEOUS*/
