//The chests dropped by mob spawner tendrils. Also contains associated loot.


/obj/structure/closet/crate/necropolis
	name = "necropolis chest"
	desc = "It's watching you closely."
	icon_state = "necrocrate"
	resistance_flags = LAVA_PROOF | FIRE_PROOF | ACID_PROOF

/obj/structure/closet/crate/necropolis/tendril/random
	name = "necropolis crate"
	desc = "A chest for a chest, a head for a head."

/obj/structure/closet/crate/necropolis/tendril/random/PopulateContents()
	var/loot = rand(1,3)
	switch(loot)
		if(1)
			new /obj/structure/closet/crate/necropolis/tendril/magic(src)
		if(2)
			new /obj/structure/closet/crate/necropolis/tendril/weapon_armor(src)
		if(3)
			new /obj/structure/closet/crate/necropolis/tendril/misc(src)

/obj/structure/closet/crate/necropolis/tendril
	desc = "It's watching you suspiciously."

/obj/structure/closet/crate/necropolis/tendril/magic
	name = "relic necropolis chest"

/obj/structure/closet/crate/necropolis/tendril/weapon_armor
	name = "armament necropolis chest"

/obj/structure/closet/crate/necropolis/tendril/misc

/obj/structure/closet/crate/necropolis/tendril/all
	desc = "It's watching you suspiciously."

/obj/structure/closet/crate/necropolis/tendril/magic/PopulateContents()
	var/loot = rand(1,10)
	switch(loot)
		if(1)
			new /obj/item/soulstone/anybody(src)
		if(2)
			new /obj/item/rod_of_asclepius(src)
		if(3)
			new /obj/item/organ/heart/cursed/wizard(src)
		if(4)
			new /obj/item/book/granter/spell/summonitem(src)
		if(5)
			new /obj/item/borg/upgrade/modkit/lifesteal(src)
			new /obj/item/bedsheet/cult(src)
		if(6)
			new /obj/item/clothing/neck/necklace/memento_mori(src)
		if(7)
			new /obj/item/warp_cube/red(src)
		if(8)
			new /obj/item/immortality_talisman(src)
		if(9)
			new /obj/item/gun/magic/wand/book/healing(src)
		if(10)
			new /obj/item/guardiancreator(src)

/obj/structure/closet/crate/necropolis/tendril/weapon_armor/PopulateContents()
	var/loot = rand(1,10)
	switch(loot)
		if(1)
			new /obj/item/clothing/suit/space/hardsuit/cult(src)
		if(2)
			new /obj/item/katana/lavaland(src)
		if(3)
			new /obj/item/clothing/suit/space/hardsuit/ert/paranormal/beserker/old(src)
		if(4)
			new /obj/item/nullrod/scythe/talking(src)
		if(5)
			new /obj/item/nullrod/armblade(src)
		if(6)
			new /obj/item/reagent_containers/food/drinks/bottle/holywater/hell(src)
			new /obj/item/clothing/suit/space/hardsuit/ert/paranormal/inquisitor/old(src)
		if(7)
			new /obj/item/grenade/clusterbuster/inferno(src)
		if(8)
			new /obj/item/gun/magic/wand/book/shock(src)
		if(9)
			new /obj/item/gun/magic/wand/book/page(src)
		if(10)
			new /obj/item/gun/magic/wand/book/spark(src)

/obj/structure/closet/crate/necropolis/tendril/misc/PopulateContents()
	var/loot = rand(1,12)
	switch(loot)
		if(1)
			new /obj/item/shared_storage/red(src)
		if(2)
			new /obj/item/reagent_containers/glass/bottle/potion/flight(src)
		if(3)
			new /obj/item/ship_in_a_bottle(src)
		if(4)
			new /obj/item/voodoo(src)
		if(5)
			new /obj/item/book_of_babel(src)
		if(6)
			new /obj/item/jacobs_ladder(src)
		if(7)
			new /obj/item/wisp_lantern(src)
		if(8)
			new /obj/item/pickaxe/rosegold(src)
		if(9)
			new /obj/item/bedsheet/cosmos(src)
			new /obj/item/melee/skateboard/hoverboard(src)
		if(10)
			new /obj/item/disk/tech_disk/illegal(src)
		if(11)
			new /obj/item/clothing/suit/space/hardsuit/cult(src)
		if(12)
			new /obj/item/katana/lavaland(src)

/obj/structure/closet/crate/necropolis/tendril/all/PopulateContents()
	var/loot = rand(1,28)
	switch(loot)
		if(1)
			new /obj/item/shared_storage/red(src)
		if(2)
			new /obj/item/reagent_containers/glass/bottle/potion/flight(src)
		if(3)
			new /obj/item/ship_in_a_bottle(src)
		if(4)
			new /obj/item/voodoo(src)
		if(5)
			new /obj/item/book_of_babel(src)
		if(6)
			new /obj/item/jacobs_ladder(src)
		if(7)
			new /obj/item/wisp_lantern(src)
		if(8)
			new /obj/item/pickaxe/rosegold(src)
		if(9)
			new /obj/item/bedsheet/cosmos(src)
			new /obj/item/melee/skateboard/hoverboard(src)
		if(10)
			new /obj/item/disk/tech_disk/illegal(src)
		if(11)
			new /obj/item/clothing/suit/space/hardsuit/ert/paranormal/beserker/old(src)
		if(12)
			new /obj/item/nullrod/scythe/talking(src)
		if(13)
			new /obj/item/nullrod/armblade(src)
		if(14)
			new /obj/item/reagent_containers/food/drinks/bottle/holywater/hell(src)
			new /obj/item/clothing/suit/space/hardsuit/ert/paranormal/inquisitor/old(src)
		if(15)
			new /obj/item/grenade/clusterbuster/inferno(src)
		if(16)
			new /obj/item/gun/magic/wand/book/shock(src)
		if(17)
			new /obj/item/gun/magic/wand/book/page(src)
		if(18)
			new /obj/item/gun/magic/wand/book/spark(src)
		if(19)
			new /obj/item/soulstone/anybody(src)
		if(20)
			new /obj/item/rod_of_asclepius(src)
		if(21)
			new /obj/item/organ/heart/cursed/wizard(src)
		if(22)
			new /obj/item/book/granter/spell/summonitem(src)
		if(23)
			new /obj/item/borg/upgrade/modkit/lifesteal(src)
			new /obj/item/bedsheet/cult(src)
		if(24)
			new /obj/item/clothing/neck/necklace/memento_mori(src)
		if(25)
			new /obj/item/warp_cube/red(src)
		if(26)
			new /obj/item/immortality_talisman(src)
		if(27)
			new /obj/item/gun/magic/wand/book/healing(src)
		if(28)
			new /obj/item/guardiancreator(src)

//KA modkit design discs
/obj/item/disk/design_disk/modkit_disc
	name = "KA Mod Disk"
	desc = "A design disc containing the design for a unique kinetic accelerator modkit. It's compatible with a research console."
	icon_state = "datadisk1"
	var/modkit_design = /datum/design/unique_modkit

/obj/item/disk/design_disk/modkit_disc/Initialize(mapload)
	. = ..()
	blueprints[1] = new modkit_design

/obj/item/disk/design_disk/modkit_disc/mob_and_turf_aoe
	name = "Offensive Mining Explosion Mod Disk"
	modkit_design = /datum/design/unique_modkit/offensive_turf_aoe

/obj/item/disk/design_disk/modkit_disc/rapid_repeater
	name = "Rapid Repeater Mod Disk"
	modkit_design = /datum/design/unique_modkit/rapid_repeater

/obj/item/disk/design_disk/modkit_disc/resonator_blast
	name = "Resonator Blast Mod Disk"
	modkit_design = /datum/design/unique_modkit/resonator_blast

/obj/item/disk/design_disk/modkit_disc/bounty
	name = "Death Syphon Mod Disk"
	modkit_design = /datum/design/unique_modkit/bounty

/datum/design/unique_modkit
	category = list("Mining Designs", "Cyborg Upgrade Modules") //can't be normally obtained
	build_type = PROTOLATHE | MECHFAB
	departmental_flags = DEPARTMENTAL_FLAG_CARGO

/datum/design/unique_modkit/offensive_turf_aoe
	name = "Kinetic Accelerator Offensive Mining Explosion Mod"
	desc = "A device which causes kinetic accelerators to fire AoE blasts that destroy rock and damage creatures."
	id = "hyperaoemod"
	materials = list(/datum/material/iron = 7000, /datum/material/glass = 3000, /datum/material/silver = 3000, /datum/material/gold = 3000, /datum/material/diamond = 4000)
	build_path = /obj/item/borg/upgrade/modkit/aoe/turfs/andmobs

/datum/design/unique_modkit/rapid_repeater
	name = "Kinetic Accelerator Rapid Repeater Mod"
	desc = "A device which greatly reduces a kinetic accelerator's cooldown on striking a living target or rock, but greatly increases its base cooldown."
	id = "repeatermod"
	materials = list(/datum/material/iron = 5000, /datum/material/glass = 5000, /datum/material/uranium = 8000, /datum/material/bluespace = 2000)
	build_path = /obj/item/borg/upgrade/modkit/cooldown/repeater

/datum/design/unique_modkit/resonator_blast
	name = "Kinetic Accelerator Resonator Blast Mod"
	desc = "A device which causes kinetic accelerators to fire shots that leave and detonate resonator blasts."
	id = "resonatormod"
	materials = list(/datum/material/iron = 5000, /datum/material/glass = 5000, /datum/material/silver = 5000, /datum/material/uranium = 5000)
	build_path = /obj/item/borg/upgrade/modkit/resonator_blasts

/datum/design/unique_modkit/bounty
	name = "Kinetic Accelerator Death Syphon Mod"
	desc = "A device which causes kinetic accelerators to permanently gain damage against creature types killed with it."
	id = "bountymod"
	materials = list(/datum/material/iron = 4000, /datum/material/silver = 4000, /datum/material/gold = 4000, /datum/material/bluespace = 4000)
	reagents_list = list(/datum/reagent/blood = 40)
	build_path = /obj/item/borg/upgrade/modkit/bounty

//Spooky special loot

//Rod of Asclepius
/obj/item/rod_of_asclepius
	name = "\improper Rod of Asclepius"
	desc = "A wooden rod about the size of your forearm with a snake carved around it, winding it's way up the sides of the rod. Something about it seems to inspire in you the responsibilty and duty to help others."
	icon = 'icons/obj/lavaland/artefacts.dmi'
	icon_state = "asclepius_dormant"
	lefthand_file = 'icons/mob/inhands/weapons/staves_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/staves_righthand.dmi'
	var/activated = FALSE
	var/usedHand

/obj/item/rod_of_asclepius/attack_self(mob/user)
	if(activated)
		return
	if(!iscarbon(user))
		to_chat(user, "<span class='warning'>The snake carving seems to come alive, if only for a moment, before returning to it's dormant state, almost as if it finds you incapable of holding it's oath.</span>")
		return
	var/mob/living/carbon/itemUser = user
	usedHand = itemUser.get_held_index_of_item(src)
	if(itemUser.has_status_effect(STATUS_EFFECT_HIPPOCRATIC_OATH))
		to_chat(user, "<span class='warning'>You can't possibly handle the responsibility of more than one rod!</span>")
		return
	var/failText = "<span class='warning'>The snake seems unsatisfied with your incomplete oath and returns to it's previous place on the rod, returning to its dormant, wooden state. You must stand still while completing your oath!</span>"
	to_chat(itemUser, "<span class='notice'>The wooden snake that was carved into the rod seems to suddenly come alive and begins to slither down your arm! The compulsion to help others grows abnormally strong...</span>")
	if(do_after(itemUser, 40, target = itemUser))
		itemUser.say("I swear to fulfill, to the best of my ability and judgment, this covenant:", forced = "hippocratic oath")
	else
		to_chat(itemUser, failText)
		return
	if(do_after(itemUser, 20, target = itemUser))
		itemUser.say("I will apply, for the benefit of the sick, all measures that are required, avoiding those twin traps of overtreatment and therapeutic nihilism.", forced = "hippocratic oath")
	else
		to_chat(itemUser, failText)
		return
	if(do_after(itemUser, 30, target = itemUser))
		itemUser.say("I will remember that I remain a member of society, with special obligations to all my fellow human beings, those sound of mind and body as well as the infirm.", forced = "hippocratic oath")
	else
		to_chat(itemUser, failText)
		return
	if(do_after(itemUser, 30, target = itemUser))
		itemUser.say("If I do not violate this oath, may I enjoy life and art, respected while I live and remembered with affection thereafter. May I always act so as to preserve the finest traditions of my calling and may I long experience the joy of healing those who seek my help.", forced = "hippocratic oath")
	else
		to_chat(itemUser, failText)
		return
	to_chat(itemUser, "<span class='notice'>The snake, satisfied with your oath, attaches itself and the rod to your forearm with an inseparable grip. Your thoughts seem to only revolve around the core idea of helping others, and harm is nothing more than a distant, wicked memory...</span>")
	var/datum/status_effect/hippocraticOath/effect = itemUser.apply_status_effect(STATUS_EFFECT_HIPPOCRATIC_OATH)
	effect.hand = usedHand
	activated()

/obj/item/rod_of_asclepius/proc/activated()
	item_flags = DROPDEL
	ADD_TRAIT(src, TRAIT_NODROP, CURSED_ITEM_TRAIT)
	desc = "A short wooden rod with a mystical snake inseparably gripping itself and the rod to your forearm. It flows with a healing energy that disperses amongst yourself and those around you. "
	icon_state = "asclepius_active"
	activated = TRUE

//Memento Mori
/obj/item/clothing/neck/necklace/memento_mori
	name = "Memento Mori"
	desc = "A mysterious pendant. An inscription on it says: \"Certain death tomorrow means certain life today.\""
	icon = 'icons/obj/lavaland/artefacts.dmi'
	icon_state = "memento_mori"
	actions_types = list(/datum/action/item_action/hands_free/memento_mori)
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF
	var/mob/living/carbon/human/active_owner

/obj/item/clothing/neck/necklace/memento_mori/item_action_slot_check(slot, mob/user, datum/action/A)
	return slot == ITEM_SLOT_NECK

/obj/item/clothing/neck/necklace/memento_mori/dropped(mob/user)
	..()
	if(active_owner)
		mori()

//Just in case
/obj/item/clothing/neck/necklace/memento_mori/Destroy()
	if(active_owner)
		mori()
	return ..()

/obj/item/clothing/neck/necklace/memento_mori/proc/memento(mob/living/carbon/human/user)
	to_chat(user, "<span class='warning'>You feel your life being drained by the pendant...</span>")
	if(do_after(user, 40, target = user))
		to_chat(user, "<span class='notice'>Your lifeforce is now linked to the pendant! You feel like removing it would kill you, and yet you instinctively know that until then, you won't die.</span>")
		ADD_TRAIT(user, TRAIT_NODEATH, "memento_mori")
		ADD_TRAIT(user, TRAIT_NOHARDCRIT, "memento_mori")
		ADD_TRAIT(user, TRAIT_NOCRITDAMAGE, "memento_mori")
		icon_state = "memento_mori_active"
		active_owner = user

/obj/item/clothing/neck/necklace/memento_mori/proc/mori()
	icon_state = "memento_mori"
	if(!active_owner)
		return
	var/mob/living/carbon/human/H = active_owner //to avoid infinite looping when dust unequips the pendant
	active_owner = null
	to_chat(H, "<span class='userdanger'>You feel your life rapidly slipping away from you!</span>")
	H.dust(TRUE, TRUE)

/datum/action/item_action/hands_free/memento_mori
	check_flags = NONE
	name = "Memento Mori"
	desc = "Bind your life to the pendant."

/datum/action/item_action/hands_free/memento_mori/Trigger()
	var/obj/item/clothing/neck/necklace/memento_mori/MM = target
	if(!MM.active_owner)
		if(ishuman(owner))
			MM.memento(owner)
	else
		to_chat(owner, "<span class='warning'>You try to free your lifeforce from the pendant...</span>")
		if(do_after(owner, 40, target = owner))
			MM.mori()

//Wisp Lantern
/obj/item/wisp_lantern
	name = "spooky lantern"
	desc = "This lantern gives off no light, but is home to a friendly wisp."
	icon = 'icons/obj/lighting.dmi'
	icon_state = "lantern-blue"
	item_state = "lantern"
	lefthand_file = 'icons/mob/inhands/equipment/mining_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/mining_righthand.dmi'
	var/obj/effect/wisp/wisp

/obj/item/wisp_lantern/attack_self(mob/user)
	if(!wisp)
		to_chat(user, "<span class='warning'>The wisp has gone missing!</span>")
		icon_state = "lantern"
		return

	if(wisp.loc == src)
		to_chat(user, "<span class='notice'>You release the wisp. It begins to bob around your head.</span>")
		icon_state = "lantern"
		wisp.orbit(user, 20)
		SSblackbox.record_feedback("tally", "wisp_lantern", 1, "Freed")

	else
		to_chat(user, "<span class='notice'>You return the wisp to the lantern.</span>")
		icon_state = "lantern-blue"
		wisp.forceMove(src)
		SSblackbox.record_feedback("tally", "wisp_lantern", 1, "Returned")

/obj/item/wisp_lantern/Initialize(mapload)
	. = ..()
	wisp = new(src)

/obj/item/wisp_lantern/Destroy()
	if(wisp)
		if(wisp.loc == src)
			QDEL_NULL(wisp)
		else
			wisp.visible_message("<span class='notice'>[wisp] has a sad feeling for a moment, then it passes.</span>")
	return ..()

/obj/effect/wisp
	name = "friendly wisp"
	desc = "Happy to light your way."
	icon = 'icons/obj/lighting.dmi'
	icon_state = "orb"
	light_range = 7
	layer = ABOVE_ALL_MOB_LAYER
	var/sight_flags = SEE_MOBS
	var/lighting_alpha = LIGHTING_PLANE_ALPHA_MOSTLY_VISIBLE

/obj/effect/wisp/orbit(atom/thing, radius, clockwise, rotation_speed, rotation_segments, pre_rotation, lockinorbit)
	. = ..()
	if(ismob(thing))
		RegisterSignal(thing, COMSIG_MOB_UPDATE_SIGHT, PROC_REF(update_user_sight))
		var/mob/being = thing
		being.update_sight()
		to_chat(thing, "<span class='notice'>The wisp enhances your vision.</span>")

/obj/effect/wisp/stop_orbit(datum/component/orbiter/orbits)
	. = ..()
	if(ismob(orbits.parent))
		UnregisterSignal(orbits.parent, COMSIG_MOB_UPDATE_SIGHT)
		to_chat(orbits.parent, "<span class='notice'>Your vision returns to normal.</span>")

/obj/effect/wisp/proc/update_user_sight(mob/user)
	user.sight |= sight_flags
	if(!isnull(lighting_alpha))
		user.lighting_alpha = min(user.lighting_alpha, lighting_alpha)

//Red/Blue Cubes
/obj/item/warp_cube
	name = "blue cube"
	desc = "A mysterious blue cube."
	icon = 'icons/obj/lavaland/artefacts.dmi'
	icon_state = "blue_cube"
	var/teleport_color = "#3FBAFD"
	var/obj/item/warp_cube/linked
	var/teleporting = FALSE

/obj/item/warp_cube/Destroy()
	if(!QDELETED(linked))
		linked.linked = null
		QDEL_NULL(linked)
	return ..()

/obj/item/warp_cube/attack_self(mob/user)
	if(!linked)
		to_chat(user, "[src] fizzles uselessly.")
		return
	if(teleporting)
		return
	teleporting = TRUE
	linked.teleporting = TRUE
	var/turf/T = get_turf(src)
	new /obj/effect/temp_visual/warp_cube(T, user, teleport_color, TRUE)
	SSblackbox.record_feedback("tally", "warp_cube", 1, type)
	new /obj/effect/temp_visual/warp_cube(get_turf(linked), user, linked.teleport_color, FALSE)
	var/obj/effect/warp_cube/link_holder = new /obj/effect/warp_cube(T)
	user.forceMove(link_holder) //mess around with loc so the user can't wander around
	sleep(2.5)
	if(QDELETED(user))
		qdel(link_holder)
		return
	if(QDELETED(linked))
		user.forceMove(get_turf(link_holder))
		qdel(link_holder)
		return
	link_holder.forceMove(get_turf(linked))
	sleep(2.5)
	if(QDELETED(user))
		qdel(link_holder)
		return
	teleporting = FALSE
	if(!QDELETED(linked))
		linked.teleporting = FALSE
	user.forceMove(get_turf(link_holder))
	qdel(link_holder)

/obj/item/warp_cube/red
	name = "red cube"
	desc = "A mysterious red cube."
	icon_state = "red_cube"
	teleport_color = "#FD3F48"

/obj/item/warp_cube/red/Initialize(mapload)
	. = ..()
	if(!linked)
		var/obj/item/warp_cube/blue = new(src.loc)
		linked = blue
		blue.linked = src

/obj/item/warp_cube/red/Destroy()
	if(!QDELETED(linked))
		linked.linked = null
		QDEL_NULL(linked)
	return ..()

/obj/effect/warp_cube
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	anchored = TRUE

/obj/effect/warp_cube/ex_act(severity, target, origin)
	return

//Meat Hook
/obj/item/gun/magic/hook
	name = "meat hook"
	desc = "Mid or feed."
	ammo_type = /obj/item/ammo_casing/magic/hook
	icon_state = "hook"
	item_state = "chain"
	lefthand_file = 'icons/mob/inhands/weapons/melee_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/melee_righthand.dmi'
	fire_sound = 'sound/weapons/batonextend.ogg'
	max_charges = 1
	item_flags = NEEDS_PERMIT | NOBLUDGEON
	w_class = WEIGHT_CLASS_BULKY
	force = 15

/obj/item/ammo_casing/magic/hook
	name = "hook"
	desc = "A hook."
	projectile_type = /obj/item/projectile/hook
	caliber = "hook"
	icon_state = "hook"

/obj/item/projectile/hook
	name = "hook"
	icon_state = "hook"
	icon = 'icons/obj/lavaland/artefacts.dmi'
	pass_flags = PASSTABLE
	damage = 15
	armour_penetration = 10
	knockdown = 5
	damage_type = BRUTE
	hitsound = 'sound/effects/splat.ogg'

/obj/item/projectile/hook/fire(setAngle)
	if(firer)
		chain = firer.Beam(src, icon_state = "chain", time = INFINITY, maxdistance = INFINITY)
	..()
	//TODO: root the firer until the chain returns

/obj/item/projectile/hook/on_hit(atom/target)
	. = ..()
	if(ismovable(target))
		var/atom/movable/A = target
		if(A.anchored)
			return
		A.visible_message("<span class='danger'>[A] is snagged by [firer]'s hook!</span>")
		new /datum/forced_movement(A, get_turf(firer), 5, TRUE)
		//TODO: keep the chain beamed to A
		//TODO: needs a callback to delete the chain

/obj/item/projectile/hook/Destroy()
	qdel(chain)
	return ..()


//Immortality Talisman
/obj/item/immortality_talisman
	name = "\improper Immortality Talisman"
	desc = "A dread talisman that can render you completely invulnerable."
	icon = 'icons/obj/lavaland/artefacts.dmi'
	icon_state = "talisman"
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF
	actions_types = list(/datum/action/item_action/immortality)
	var/cooldown = 0

/obj/item/immortality_talisman/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/anti_magic, TRUE, TRUE, TRUE)

/datum/action/item_action/immortality
	name = "Immortality"

/obj/item/immortality_talisman/attack_self(mob/user)
	if(cooldown < world.time)
		SSblackbox.record_feedback("amount", "immortality_talisman_uses", 1)
		cooldown = world.time + 600
		new /obj/effect/immortality_talisman(get_turf(user), user)
	else
		to_chat(user, "<span class='warning'>[src] is not ready yet!</span>")

/obj/effect/immortality_talisman
	name = "hole in reality"
	desc = "It's shaped an awful lot like a person."
	icon_state = "blank"
	icon = 'icons/effects/effects.dmi'
	var/vanish_description = "vanishes from reality"
	var/can_destroy = TRUE

/obj/effect/immortality_talisman/Initialize(mapload, mob/new_user)
	. = ..()
	if(new_user)
		vanish(new_user)

/obj/effect/immortality_talisman/proc/vanish(mob/user)
	user.visible_message("<span class='danger'>[user] [vanish_description], leaving a hole in [user.ru_ego()] place!</span>")

	desc = "It's shaped an awful lot like [user.name]."
	setDir(user.dir)

	user.forceMove(src)
	user.mob_transforming = TRUE
	user.status_flags |= GODMODE

	can_destroy = FALSE

	addtimer(CALLBACK(src, PROC_REF(unvanish), user), 10 SECONDS)

/obj/effect/immortality_talisman/proc/unvanish(mob/user)
	user.status_flags &= ~GODMODE
	user.mob_transforming = FALSE
	user.forceMove(get_turf(src))

	user.visible_message("<span class='danger'>[user] pops back into reality!</span>")
	can_destroy = TRUE
	qdel(src)

/obj/effect/immortality_talisman/attackby()
	return

/obj/effect/immortality_talisman/ex_act(severity, target, origin)
	return

/obj/effect/immortality_talisman/singularity_pull()
	return

/obj/effect/immortality_talisman/Destroy(force)
	if(!can_destroy && !force)
		return QDEL_HINT_LETMELIVE
	else
		. = ..()

/obj/effect/immortality_talisman/void
	vanish_description = "is dragged into the void"


//Shared Bag

/obj/item/shared_storage
	name = "paradox bag"
	desc = "Somehow, it's in two places at once."
	icon = 'icons/obj/storage.dmi'
	icon_state = "cultpack"
	slot_flags = ITEM_SLOT_BACK
	resistance_flags = INDESTRUCTIBLE

/obj/item/shared_storage/red
	name = "paradox bag"
	desc = "Somehow, it's in two places at once."

/obj/item/shared_storage/red/Initialize(mapload)
	. = ..()
	var/datum/component/storage/STR = AddComponent(/datum/component/storage/concrete)
	STR.max_w_class = WEIGHT_CLASS_NORMAL
	STR.max_combined_w_class = 60
	STR.max_items = 21
	new /obj/item/shared_storage/blue(drop_location(), STR)

/obj/item/shared_storage/blue/Initialize(mapload, datum/component/storage/concrete/master)
	. = ..()
	if(!istype(master))
		return INITIALIZE_HINT_QDEL
	var/datum/component/storage/STR = AddComponent(/datum/component/storage, master)
	STR.max_w_class = WEIGHT_CLASS_NORMAL
	STR.max_combined_w_class = 60
	STR.max_items = 21

//Book of Babel

/obj/item/book_of_babel
	name = "Book of Babel"
	desc = "An ancient tome written in countless tongues."
	icon = 'icons/obj/library.dmi'
	icon_state = "book1"
	w_class = 2

/obj/item/book_of_babel/attack_self(mob/user)
	to_chat(user, "You flip through the pages of the book, quickly and conveniently learning every language in existence. Somewhat less conveniently, the aging book crumbles to dust in the process. Whoops.")
	user.grant_all_languages()
	user.remove_blocked_language(GLOB.all_languages, source = LANGUAGE_ALL)
	new /obj/effect/decal/cleanable/ash(get_turf(user))
	qdel(src)


//Potion of Flight
/obj/item/reagent_containers/glass/bottle/potion
	icon = 'icons/obj/lavaland/artefacts.dmi'
	icon_state = "potionflask"

/obj/item/reagent_containers/glass/bottle/potion/flight
	name = "strange elixir"
	desc = "A flask with an almost-holy aura emitting from it. The label on the bottle says: 'erqo'hyy tvi'rf lbh jv'atf'."
	list_reagents = list(/datum/reagent/flightpotion = 5)

/obj/item/reagent_containers/glass/bottle/potion/update_icon_state()
	if(reagents.total_volume)
		icon_state = "potionflask"
	else
		icon_state = "potionflask_empty"

/datum/reagent/flightpotion
	name = "Flight Potion"
	description = "Strange mutagenic compound of unknown origins."
	reagent_state = LIQUID
	color = "#FFEBEB"

/datum/reagent/flightpotion/reaction_mob(mob/living/M, method=TOUCH, reac_volume, show_message = 1)
	if(iscarbon(M) && M.stat != DEAD)
		var/mob/living/carbon/C = M
		if(reac_volume < 5)
			if(method == INGEST && show_message)
				to_chat(C, "<span class='notice'><i>You feel nothing but a terrible aftertaste.</i></span>")
			return ..()
		var/has_wings = (C.dna.species.mutant_bodyparts["deco_wings"] && C.dna.features["deco_wings"] != "None" || C.dna.species.mutant_bodyparts["insect_wings"] && C.dna.features["insect_wings"] != "None")
		var/has_functional_wings = (C.dna.species.mutant_bodyparts["wings"] != null)
		to_chat(C, "<span class='userdanger'>A terrible pain travels down your back as [has_wings || has_functional_wings ? "your wings transform" : "wings burst out"]!</span>")
		C.dna.species.GiveSpeciesFlight(C, has_functional_wings ? TRUE : FALSE) //give them the full list of wing choices if this is their second flight potion
		// to_chat(C, "<span class='notice'>You feel blessed!</span>")
		// ADD_TRAIT(C, TRAIT_HOLY, SPECIES_TRAIT) //implying anyone is truly holy in a setting where people throw tantrums when things aren't violent
		playsound(C.loc, 'sound/items/poster_ripped.ogg', 50, TRUE, -1)
		C.adjustBruteLoss(20)
		if(!HAS_TRAIT(C, TRAIT_ROBOTIC_ORGANISM)) // BLUEMOON ADD - роботы не кричат от боли
			C.emote("scream")
	..()


/obj/item/jacobs_ladder
	name = "jacob's ladder"
	desc = "A celestial ladder that violates the laws of physics."
	icon = 'icons/obj/structures.dmi'
	icon_state = "ladder00"

/obj/item/jacobs_ladder/attack_self(mob/user)
	var/turf/T = get_turf(src)
	var/ladder_x = T.x
	var/ladder_y = T.y
	to_chat(user, "<span class='notice'>You unfold the ladder. It extends much farther than you were expecting.</span>")
	var/last_ladder = null
	for(var/i in 1 to world.maxz)
		if(is_centcom_level(i) || is_reserved_level(i) || is_reebe(i) || is_away_level(i))
			continue
		var/turf/T2 = locate(ladder_x, ladder_y, i)
		last_ladder = new /obj/structure/ladder/unbreakable/jacob(T2, null, last_ladder)
	qdel(src)

// Inherit from unbreakable but don't set ID, to suppress the default Z linkage
/obj/structure/ladder/unbreakable/jacob
	name = "jacob's ladder"
	desc = "An indestructible celestial ladder that violates the laws of physics."

///Bosses

//Miniboss Miner

/obj/item/melee/transforming/cleaving_saw
	name = "cleaving saw"
	desc = "This saw, effective at drawing the blood of beasts, transforms into a long cleaver that makes use of centrifugal force."
	resistance_flags = LAVA_PROOF | FIRE_PROOF | ACID_PROOF
	force = 12
	force_on = 20 //force when active
	throwforce = 20
	throwforce_on = 20
	icon = 'icons/obj/lavaland/artefacts.dmi'
	lefthand_file = 'icons/mob/inhands/64x64_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/64x64_righthand.dmi'
	inhand_x_dimension = 64
	inhand_y_dimension = 64
	icon_state = "cleaving_saw"
	icon_state_on = "cleaving_saw_open"
	slot_flags = ITEM_SLOT_BELT
	attack_verb_off = list("attacked", "sawed", "sliced", "torn", "ripped", "diced", "cut")
	attack_verb_on = list("cleaved", "swiped", "slashed", "chopped")
	hitsound = 'sound/weapons/bladeslice.ogg'
	hitsound_on = 'sound/weapons/bladeslice.ogg'
	w_class = WEIGHT_CLASS_BULKY
	sharpness = SHARP_EDGED
	faction_bonus_force = 30
	nemesis_factions = list("mining", "boss")
	var/transform_cooldown
	var/swiping = FALSE
	var/bleed_stacks_per_hit = 3
	total_mass = 2.75
	total_mass_on = 5
	attack_speed = 0
	attack_unwieldlyness = CLICK_CD_MELEE * 0.5
	/// how much stamina does it cost to roll?
	var/roll_stamcost = 15
	/// how far are we rolling?
	var/roll_range = 3
	/// do you spin when dodgerolling
	var/roll_orientation = TRUE

/obj/item/melee/transforming/cleaving_saw/examine(mob/user)
	. = ..()
	. += "<span class='notice'>It is [active ? "open, and will cleave enemies in a wide arc":"closed, and can be used for rapid consecutive attacks that cause beastly enemies to bleed"].<br>\
	Both modes will build up existing bleed effects, doing a burst of high damage if the bleed is built up high enough.<br>\
	Transforming it immediately after an attack causes the next attack to come out faster.</span>"

/obj/item/melee/transforming/cleaving_saw/suicide_act(mob/user)
	user.visible_message("<span class='suicide'>[user] is [active ? "closing [src] on [user.ru_ego()] neck" : "opening [src] into [user.ru_ego()] chest"]! It looks like [user.p_theyre()] trying to commit suicide!</span>")
	transform_cooldown = 0
	transform_weapon(user, TRUE)
	return BRUTELOSS

/obj/item/melee/transforming/cleaving_saw/transform_weapon(mob/living/user, supress_message_text)
	if(transform_cooldown > world.time)
		return FALSE
	. = ..()
	if(.)
		if(active)
			attack_unwieldlyness = CLICK_CD_MELEE
		else
			attack_unwieldlyness = CLICK_CD_MELEE * 0.5
		transform_cooldown = world.time + (CLICK_CD_MELEE * 0.5)
		user.SetNextAction(CLICK_CD_MELEE * 0.25, considered_action = FALSE, flush = TRUE)

/obj/item/melee/transforming/cleaving_saw/transform_messages(mob/living/user, supress_message_text)
	if(!supress_message_text)
		if(active)
			to_chat(user, "<span class='notice'>You open [src]. It will now cleave enemies in a wide arc.</span>")
		else
			to_chat(user, "<span class='notice'>You close [src]. It will now attack rapidly and cause beastly enemies to bleed.</span>")
	playsound(user, 'sound/magic/clockwork/fellowship_armory.ogg', 35, TRUE, frequency = 90000 - (active * 30000))

/obj/item/melee/transforming/cleaving_saw/clumsy_transform_effect(mob/living/user)
	if(HAS_TRAIT(user, TRAIT_CLUMSY) && prob(50))
		to_chat(user, "<span class='warning'>You accidentally cut yourself with [src], like a doofus!</span>")
		user.take_bodypart_damage(10)

/obj/item/melee/transforming/cleaving_saw/nemesis_effects(mob/living/user, mob/living/target)
	var/datum/status_effect/stacking/saw_bleed/B = target.has_status_effect(STATUS_EFFECT_SAWBLEED)
	if(!B)
		target.apply_status_effect(STATUS_EFFECT_SAWBLEED,bleed_stacks_per_hit)
	else
		B.add_stacks(bleed_stacks_per_hit)

/obj/item/melee/transforming/cleaving_saw/AltClick(mob/user)
	. = ..()
	roll_orientation = !roll_orientation
	to_chat(user, span_notice("You are now [roll_orientation ? "rolling" : "quick-stepping"] when you dodge. (This only affects if you spin or not during a dodge.)"))

/obj/item/melee/transforming/cleaving_saw/attack(mob/living/target, mob/living/carbon/human/user)
	if(!active || swiping || !target.density || get_turf(target) == get_turf(user))
		if(!active)
			faction_bonus_force = 0
		..()
		if(!active)
			faction_bonus_force = initial(faction_bonus_force)
	else
		var/turf/user_turf = get_turf(user)
		var/dir_to_target = get_dir(user_turf, get_turf(target))
		swiping = TRUE
		var/static/list/cleaving_saw_cleave_angles = list(0, -45, 45) //so that the animation animates towards the target clicked and not towards a side target
		for(var/i in cleaving_saw_cleave_angles)
			var/turf/T = get_step(user_turf, turn(dir_to_target, i))
			for(var/mob/living/L in T)
				if(user.Adjacent(L) && L.density)
					melee_attack_chain(user, L)
		swiping = FALSE

/obj/item/melee/transforming/cleaving_saw/alt_pre_attack(atom/A, mob/living/user, params)
	return TRUE // Let's dance.

/obj/item/melee/transforming/cleaving_saw/altafterattack(atom/target, mob/living/user, proximity_flag, click_parameters)
	if(user.IsImmobilized()) // no free dodgerolls
		return
	var/turf/where_to = get_turf(target)
	user.apply_damage(damage = roll_stamcost, damagetype = STAMINA)
	user.Immobilize(0.8 SECONDS) // you dont get to adjust your roll
	user.throw_at(where_to, range = roll_range, speed = 1, force = MOVE_FORCE_NORMAL, spin = roll_orientation)
	user.apply_status_effect(/datum/status_effect/dodgeroll_iframes)
	playsound(user, 'sound/effects/body-armor-rolling.ogg', 50, FALSE)
	return ..()

/datum/status_effect/dodgeroll_iframes
	id = "dodgeroll_dodging"
	alert_type = null
	status_type = STATUS_EFFECT_REFRESH
	duration = 0.8 SECONDS // worth tweaking?

/datum/status_effect/dodgeroll_iframes/on_apply()
	. = ..()
	RegisterSignal(owner, COMSIG_LIVING_RUN_BLOCK, PROC_REF(trolled))

/datum/status_effect/dodgeroll_iframes/on_remove()
	UnregisterSignal(owner, list(
		COMSIG_LIVING_RUN_BLOCK
		))
	return ..()

/datum/status_effect/dodgeroll_iframes/proc/trolled(mob/living/source, real_attack, object, damage, attack_text, attack_type, armour_penetration, attacker, def_zone, return_list)
	SIGNAL_HANDLER
	owner.balloon_alert_to_viewers("missed!")
	playsound(src, 'sound/weapons/thudswoosh.ogg', 50, TRUE, -1)
	return_list[BLOCK_RETURN_REDIRECT_METHOD] = REDIRECT_METHOD_PASSTHROUGH
	return BLOCK_SUCCESS | BLOCK_SHOULD_REDIRECT | BLOCK_TARGET_DODGED

//Dragon

/obj/structure/closet/crate/necropolis/dragon
	name = "dragon chest"

/obj/structure/closet/crate/necropolis/dragon/PopulateContents()
	var/loot = rand(1,4)
	switch(loot)
		if(1)
			new /obj/item/melee/ghost_sword(src)
		if(2)
			new /obj/item/lava_staff(src)
		if(3)
			new /obj/item/book/granter/spell/sacredflame(src)
			new /obj/item/gun/magic/hook(src)
		if(4)
			new /obj/item/dragons_blood(src)

/obj/structure/closet/crate/necropolis/dragon/crusher
	name = "firey dragon chest"

/obj/structure/closet/crate/necropolis/dragon/crusher/PopulateContents()
	..()
	new /obj/item/crusher_trophy/tail_spike(src)

/obj/item/melee/ghost_sword
	name = "\improper spectral blade"
	desc = "A rusted and dulled blade. It doesn't look like it'd do much damage. It glows weakly."
	icon_state = "spectral"
	item_state = "spectral"
	lefthand_file = 'icons/mob/inhands/weapons/swords_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/swords_righthand.dmi'
	flags_1 = CONDUCT_1
	sharpness = SHARP_EDGED
	w_class = WEIGHT_CLASS_BULKY
	force = 1
	throwforce = 1
	hitsound = 'sound/effects/ghost2.ogg'
	attack_verb = list("attacked", "slashed", "stabbed", "sliced", "torn", "ripped", "diced", "rended")
	var/summon_cooldown = 0
	var/list/mob/dead/observer/spirits

/obj/item/melee/ghost_sword/Initialize(mapload)
	. = ..()
	spirits = list()
	START_PROCESSING(SSobj, src)
	GLOB.poi_list |= src
	AddComponent(/datum/component/butchering, 150, 90)

/obj/item/melee/ghost_sword/Destroy()
	for(var/mob/dead/observer/G in spirits)
		G.invisibility = GLOB.observer_default_invisibility
	spirits.Cut()
	STOP_PROCESSING(SSobj, src)
	GLOB.poi_list -= src
	. = ..()

/obj/item/melee/ghost_sword/attack_self(mob/user)
	if(summon_cooldown > world.time)
		to_chat(user, "You just recently called out for aid. You don't want to annoy the spirits.")
		return
	to_chat(user, "You call out for aid, attempting to summon spirits to your side.")

	notify_ghosts("[user] is raising [user.ru_ego()] [src], calling for your help!",
		enter_link="<a href=?src=[REF(src)];orbit=1>(Click to help)</a>",
		source = user, action=NOTIFY_ORBIT, ignore_key = POLL_IGNORE_SPECTRAL_BLADE)

	summon_cooldown = world.time + 600

/obj/item/melee/ghost_sword/Topic(href, href_list)
	if(href_list["orbit"])
		var/mob/dead/observer/ghost = usr
		if(istype(ghost))
			ghost.ManualFollow(src)

/obj/item/melee/ghost_sword/process()
	force = 0
	var/ghost_counter = ghost_check()

	force = clamp((ghost_counter * 4), 0, 75)

/obj/item/melee/ghost_sword/proc/recursive_orbit_collect(atom/A, list/L)
	for(var/i in A.orbiters?.orbiters)
		if(!isobserver(i) || (i in L))
			continue
		L |= i
		recursive_orbit_collect(i, L)

/obj/item/melee/ghost_sword/proc/ghost_check()
	var/list/mob/dead/observer/current_spirits = list()

	recursive_orbit_collect(src, current_spirits)
	recursive_orbit_collect(loc, current_spirits)		//anything holding us

	for(var/i in spirits - current_spirits)
		var/mob/dead/observer/G = i
		G.invisibility = GLOB.observer_default_invisibility

	for(var/i in current_spirits)
		var/mob/dead/observer/G = i
		G.invisibility = 0

	spirits = current_spirits
	return length(spirits)

/obj/item/melee/ghost_sword/attack(mob/living/target, mob/living/carbon/human/user)
	force = 0
	var/ghost_counter = ghost_check()

	force = clamp((ghost_counter * 4), 0, 75)
	user.visible_message("<span class='danger'>[user] strikes with the force of [ghost_counter] vengeful spirits!</span>")
	return ..()

/obj/item/melee/ghost_sword/run_block(mob/living/owner, atom/object, damage, attack_text, attack_type, armour_penetration, mob/attacker, def_zone, final_block_chance, list/block_return)
	var/ghost_counter = ghost_check()
	final_block_chance += clamp((ghost_counter * 5), 0, 75)
	owner.visible_message("<span class='danger'>[owner] is protected by a ring of [ghost_counter] ghosts!</span>")
	return ..()

//Blood

/obj/item/dragons_blood
	name = "bottle of dragons blood"
	desc = "You're not actually going to drink this, are you?"
	icon = 'icons/obj/wizard.dmi'
	icon_state = "vial"

/obj/item/dragons_blood/attack_self(mob/living/carbon/human/user)
	if(!istype(user))
		return

	var/mob/living/carbon/human/H = user
	var/random = rand(1,4)

	switch(random)
		if(1)
			to_chat(user, "<span class='danger'>Your appearance morphs to that of a very small humanoid ash dragon! You get to look like a freak without the cool abilities.</span>")
			H.dna.features["mcolor"] = "A02720"
			H.dna.features["tail_lizard"] = "Dark Tiger"
			H.dna.features["tail_human"] = "None"
			H.dna.features["mam_snout"] = "Sharp"
			H.dna.features["horns"] = "Curled"
			H.dna.features["ears"] = "None"
			H.dna.features["wings"] = "None"
			H.dna.features["frills"] = "None"
			H.dna.features["spines"] = "Long"
			H.dna.features["legs"] = "Digitigrade"
			H.dna.features["taur_body"] = "None"
			H.left_eye_color = "fee5a3"
			H.right_eye_color = "fee5a3"
			H.set_species(/datum/species/lizard)
		if(2)
			to_chat(user, "<span class='danger'>Your flesh begins to melt! Miraculously, you seem fine otherwise.</span>")
			H.set_species(/datum/species/skeleton)
		if(3)
			to_chat(user, "<span class='danger'>Power courses through you! You can now shift your form at will.</span>")
			if(user.mind)
				var/obj/effect/proc_holder/spell/targeted/shapeshift/dragon/D = new
				user.mind.AddSpell(D)
		if(4)
			to_chat(user, "<span class='danger'>You feel like you could walk straight through lava now.</span>")
			ADD_TRAIT(user, TRAIT_LAVA_IMMUNE, type)

	playsound(user.loc,'sound/items/drink.ogg', rand(10,50), 1)
	qdel(src)

/datum/disease/transformation/dragon
	name = "dragon transformation"
	cure_text = "nothing"
	cures = list("adminordrazine")
	agent = "dragon's blood"
	desc = "What do dragons have to do with Space Station 13?"
	stage_prob = 20
	severity = DISEASE_SEVERITY_BIOHAZARD
	visibility_flags = 0
	stage1	= list("Your bones ache.")
	stage2	= list("Your skin feels scaly.")
	stage3	= list("<span class='danger'>You have an overwhelming urge to terrorize some peasants.</span>", "<span class='danger'>Your teeth feel sharper.</span>")
	stage4	= list("<span class='danger'>Your blood burns.</span>")
	stage5	= list("<span class='danger'>You're a fucking dragon. However, any previous allegiances you held still apply. It'd be incredibly rude to eat your still human friends for no reason.</span>")
	new_form = /mob/living/simple_animal/hostile/megafauna/dragon/lesser


//Lava Staff

/obj/item/lava_staff
	name = "staff of lava"
	desc = "The ability to fill the emergency shuttle with lava. What more could you want out of life?"
	icon_state = "staffofstorms"
	item_state = "staffofstorms"
	lefthand_file = 'icons/mob/inhands/weapons/staves_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/staves_righthand.dmi'
	icon = 'icons/obj/guns/magic.dmi'
	slot_flags = ITEM_SLOT_BACK
	w_class = WEIGHT_CLASS_BULKY
	force = 25
	damtype = BURN
	resistance_flags = LAVA_PROOF | FIRE_PROOF | ACID_PROOF
	hitsound = 'sound/weapons/sear.ogg'
	var/turf_type = /turf/open/lava/smooth
	var/transform_string = "lava"
	var/reset_turf_type = /turf/open/floor/plating/asteroid/basalt
	var/reset_string = "basalt"
	var/create_cooldown = 100
	var/create_delay = 30
	var/reset_cooldown = 50
	var/timer = 0
	var/static/list/banned_turfs = typecacheof(list(/turf/open/space/transit, /turf/closed))

/obj/item/lava_staff/afterattack(atom/target, mob/user, proximity_flag, click_parameters)
	. = ..()
	INVOKE_ASYNC(src, PROC_REF(attempt_lava), target, user, proximity_flag, click_parameters)

/obj/item/lava_staff/proc/attempt_lava(atom/target, mob/user, proximity_flag, click_parameters)
	if(timer > world.time)
		return

	if(is_type_in_typecache(target, banned_turfs))
		return

	if(target in view(user.client.view, get_turf(user)))

		var/turf/open/T = get_turf(target)
		if(!istype(T))
			return
		if(!istype(T, turf_type))
			var/obj/effect/temp_visual/lavastaff/L = new /obj/effect/temp_visual/lavastaff(T)
			L.alpha = 0
			animate(L, alpha = 255, time = create_delay)
			user.visible_message("<span class='danger'>[user] points [src] at [T]!</span>")
			timer = world.time + create_delay + 1
			if(do_after(user, create_delay, target = T))
				var/old_name = T.name
				if(T.TerraformTurf(turf_type, flags = CHANGETURF_INHERIT_AIR))
					user.visible_message("<span class='danger'>[user] turns \the [old_name] into [transform_string]!</span>")
					message_admins("[ADMIN_LOOKUPFLW(user)] fired the lava staff at [ADMIN_VERBOSEJMP(T)]")
					log_game("[key_name(user)] fired the lava staff at [AREACOORD(T)].")
					timer = world.time + create_cooldown
					playsound(T,'sound/magic/fireball.ogg', 200, 1)
			else
				timer = world.time
			qdel(L)
		else
			var/old_name = T.name
			if(T.TerraformTurf(reset_turf_type, flags = CHANGETURF_INHERIT_AIR))
				user.visible_message("<span class='danger'>[user] turns \the [old_name] into [reset_string]!</span>")
				timer = world.time + reset_cooldown
				playsound(T,'sound/magic/fireball.ogg', 200, 1)

/obj/effect/temp_visual/lavastaff
	icon_state = "lavastaff_warn"
	duration = 50

//Bubblegum
/obj/structure/closet/crate/necropolis/bubblegum
	name = "bubblegum chest"

/obj/structure/closet/crate/necropolis/bubblegum/PopulateContents()
	new /obj/item/clothing/suit/space/hostile_environment(src)
	new /obj/item/clothing/head/helmet/space/hostile_environment(src)
	var/loot = rand(1,2)
	switch(loot)
		if(1)
			new /obj/item/mayhem(src)
		if(2)
			new /obj/item/book/granter/spell/asura(src)

/obj/structure/closet/crate/necropolis/bubblegum/crusher
	name = "bloody bubblegum chest"

/obj/structure/closet/crate/necropolis/bubblegum/crusher/PopulateContents()
	..()
	new /obj/item/crusher_trophy/demon_claws(src)

/obj/item/mayhem
	name = "mayhem in a bottle"
	desc = "A magically infused bottle of blood, the scent of which will drive anyone nearby into a murderous frenzy."
	icon = 'icons/obj/wizard.dmi'
	icon_state = "vial"

/obj/item/mayhem/attack_self(mob/user)
	for(var/mob/living/carbon/human/H in range(21,user))
		var/obj/effect/mine/pickup/bloodbath/B = new(H)
		INVOKE_ASYNC(B, TYPE_PROC_REF(/obj/effect/mine/pickup/bloodbath, mineEffect), H)
	to_chat(user, "<span class='notice'>You shatter the bottle!</span>")
	playsound(user.loc, 'sound/effects/glassbr1.ogg', 100, 1)
	message_admins("<span class='adminnotice'>[ADMIN_LOOKUPFLW(user)] has activated a bottle of mayhem!</span>")
	log_combat(user, null, "activated a bottle of mayhem", src)
	qdel(src)

/obj/item/blood_contract
	name = "blood contract"
	icon = 'icons/obj/wizard.dmi'
	icon_state = "scroll2"
	color = "#FF0000"
	desc = "Mark your target for death."
	var/used = FALSE

/obj/item/blood_contract/attack_self(mob/user)
	if(used)
		return
	used = TRUE

	var/list/da_list = list()
	for(var/I in GLOB.alive_mob_list & GLOB.player_list)
		var/mob/living/L = I
		da_list[L.real_name] = L

	var/choice = input(user,"Who do you want dead?","Choose Your Victim") as null|anything in da_list

	choice = da_list[choice]

	if(!choice)
		used = FALSE
		return
	if(!(isliving(choice)))
		to_chat(user, "[choice] is already dead!")
		used = FALSE
		return
	if(choice == user)
		to_chat(user, "You feel like writing your own name into a cursed death warrant would be unwise.")
		used = FALSE
		return

	var/mob/living/L = choice

	message_admins("<span class='adminnotice'>[ADMIN_LOOKUPFLW(L)] has been marked for death by [ADMIN_LOOKUPFLW(user)]!</span>")

	var/datum/antagonist/blood_contract/A = new
	L.mind.add_antag_datum(A)

	log_combat(user, L, "took out a blood contract on", src)
	qdel(src)

/obj/item/gun/ballistic/revolver/doublebarrel/super
	name = "super combat shotgun"
	desc = "From the belly of the beast - or rather, demon. Twice as lethal as a less-than-super shotgun, but a tad bulkier."
	resistance_flags = LAVA_PROOF | FIRE_PROOF | ACID_PROOF
	icon_state = "heckgun"
	slot_flags = null
	mag_type = /obj/item/ammo_box/magazine/internal/shot/dual/heck
	burst_size = 2
	burst_shot_delay = 0
	unique_reskin = null
	sawn_off = TRUE

/obj/item/book/granter/spell/asura
	spell = /obj/effect/proc_holder/spell/self/asura
	spellname = "asuras wrath"
	icon_state = "bookasura"
	desc = "This crimson novel emanates rage incarnate."
	remarks = list("Kaio-What?", "It can only be sustained for a short time...", "It's like a massive upsurge of energy...", "Takes a heavy toll on the user's body...?", "Extra arms not included...", "There's stronger levels? Why aren't they in the book...")

//Colossus
/obj/structure/closet/crate/necropolis/colossus
	name = "colossus chest"

/obj/structure/closet/crate/necropolis/colossus/PopulateContents()
	var/list/choices = subtypesof(/obj/machinery/anomalous_crystal)
	var/random_crystal = pick(choices)
	new random_crystal(src)
	new /obj/item/organ/vocal_cords/colossus(src)
	new /obj/item/clothing/glasses/godeye(src)

/obj/structure/closet/crate/necropolis/colossus/crusher
	name = "angelic colossus chest"

/obj/structure/closet/crate/necropolis/colossus/crusher/PopulateContents()
	..()
	new /obj/item/crusher_trophy/blaster_tubes(src)

//Hierophant
/obj/item/hierophant_club
	name = "hierophant club"
	desc = "The strange technology of this large club allows various nigh-magical feats. It used to beat you, but now you can set the beat."
	resistance_flags = LAVA_PROOF | FIRE_PROOF | ACID_PROOF
	icon_state = "hierophant_club_ready_beacon"
	item_state = "hierophant_club_ready_beacon"
	icon = 'icons/obj/lavaland/artefacts.dmi'
	lefthand_file = 'icons/mob/inhands/64x64_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/64x64_righthand.dmi'
	inhand_x_dimension = 64
	inhand_y_dimension = 64
	slot_flags = ITEM_SLOT_BACK
	w_class = WEIGHT_CLASS_BULKY
	force = 15
	attack_verb = list("clubbed", "beat", "pummeled")
	hitsound = 'sound/weapons/sonic_jackhammer.ogg'
	actions_types = list(/datum/action/item_action/vortex_recall, /datum/action/item_action/toggle_unfriendly_fire)
	var/cooldown_time = 15 //how long the cooldown between non-melee ranged attacks is
	var/chaser_cooldown = 60 //how long the cooldown between firing chasers at mobs is
	var/chaser_timer = 0 //what our current chaser cooldown is
	var/chaser_speed = 0.8 //how fast our chasers are
	var/timer = 0 //what our current cooldown is
	var/blast_range = 13 //how long the cardinal blast's walls are
	var/obj/effect/hierophant/beacon //the associated beacon we teleport to
	var/teleporting = FALSE //if we ARE teleporting
	var/friendly_fire_check = TRUE //if the blasts we make will consider our faction against the faction of hit targets

/obj/item/hierophant_club/ComponentInitialize()
	. = ..()
	AddElement(/datum/element/update_icon_updates_onmob)

/obj/item/hierophant_club/examine(mob/user)
	. = ..()
	. += "<span class='hierophant_warning'>The[beacon ? " beacon is not currently":"re is a beacon"] attached.</span>"

/obj/item/hierophant_club/suicide_act(mob/living/user)
	say("Xverwpsgexmrk...", forced = "hierophant club suicide")
	user.visible_message("<span class='suicide'>[user] holds [src] into the air! It looks like [user.p_theyre()] trying to commit suicide!</span>")
	new/obj/effect/temp_visual/hierophant/telegraph(get_turf(user))
	playsound(user,'sound/machines/airlockopen.ogg', 75, TRUE)
	user.visible_message("<span class='hierophant_warning'>[user] fades out, leaving [user.ru_ego()] belongings behind!</span>")
	for(var/obj/item/I in user)
		if(I != src)
			user.dropItemToGround(I)
	for(var/turf/T in RANGE_TURFS(1, user))
		var/obj/effect/temp_visual/hierophant/blast/B = new(T, user, TRUE)
		B.damage = 0
	user.dropItemToGround(src) //Drop us last, so it goes on top of their stuff
	qdel(user)

/obj/item/hierophant_club/afterattack(atom/target, mob/user, proximity_flag, click_parameters)
	. = ..()
	var/turf/T = get_turf(target)
	if(!T || timer > world.time)
		return
	calculate_anger_mod(user)
	timer = world.time + CLICK_CD_MELEE //by default, melee attacks only cause melee blasts, and have an accordingly short cooldown
	if(proximity_flag)
		INVOKE_ASYNC(src, PROC_REF(aoe_burst), T, user)
		log_combat(user, target, "fired 3x3 blast at", src)
	else
		if(ismineralturf(target) && get_dist(user, target) < 6) //target is minerals, we can hit it(even if we can't see it)
			INVOKE_ASYNC(src, PROC_REF(cardinal_blasts), T, user)
			timer = world.time + cooldown_time
		else if(target in view(5, get_turf(user))) //if the target is in view, hit it
			timer = world.time + cooldown_time
			if(isliving(target) && chaser_timer <= world.time) //living and chasers off cooldown? fire one!
				chaser_timer = world.time + chaser_cooldown
				var/obj/effect/temp_visual/hierophant/chaser/C = new(get_turf(user), user, target, chaser_speed, friendly_fire_check)
				C.damage = 25
				C.monster_damage_boost = TRUE
				log_combat(user, target, "fired a chaser at", src)
			else
				INVOKE_ASYNC(src, PROC_REF(cardinal_blasts), T, user) //otherwise, just do cardinal blast
				log_combat(user, target, "fired cardinal blast at", src)
		else
			to_chat(user, "<span class='warning'>That target is out of range!</span>" )
			timer = world.time
	INVOKE_ASYNC(src, PROC_REF(prepare_icon_update))

/obj/item/hierophant_club/proc/calculate_anger_mod(mob/user) //we get stronger as the user loses health
	chaser_cooldown = initial(chaser_cooldown)
	cooldown_time = initial(cooldown_time)
	chaser_speed = initial(chaser_speed)
	blast_range = initial(blast_range)
	if(isliving(user))
		var/mob/living/L = user
		var/health_percent = L.health / L.maxHealth
		chaser_cooldown += round(health_percent * 20) //two tenths of a second for each missing 10% of health
		cooldown_time += round(health_percent * 10) //one tenth of a second for each missing 10% of health
		chaser_speed = max(chaser_speed + health_percent, 0.5) //one tenth of a second faster for each missing 10% of health
		blast_range -= round(health_percent * 10) //one additional range for each missing 10% of health

/obj/item/hierophant_club/update_icon_state()
	icon_state = item_state = "hierophant_club[timer <= world.time ? "_ready":""][(beacon && !QDELETED(beacon)) ? "":"_beacon"]"

/obj/item/hierophant_club/proc/prepare_icon_update()
	update_icon()
	sleep(timer - world.time)
	update_icon()

/obj/item/hierophant_club/ui_action_click(mob/user, action)
	if(istype(action, /datum/action/item_action/toggle_unfriendly_fire)) //toggle friendly fire...
		friendly_fire_check = !friendly_fire_check
		to_chat(user, "<span class='warning'>You toggle friendly fire [friendly_fire_check ? "off":"on"]!</span>")
		return
	if(timer > world.time)
		return
	if(!user.is_holding(src)) //you need to hold the staff to teleport
		to_chat(user, "<span class='warning'>You need to hold the club in your hands to [beacon ? "teleport with it":"detach the beacon"]!</span>")
		return
	if(!beacon || QDELETED(beacon))
		if(isturf(user.loc))
			user.visible_message("<span class='hierophant_warning'>[user] starts fiddling with [src]'s pommel...</span>", \
			"<span class='notice'>You start detaching the hierophant beacon...</span>")
			timer = world.time + 51
			INVOKE_ASYNC(src, PROC_REF(prepare_icon_update))
			if(do_after(user, 50, target = user) && !beacon)
				var/turf/T = get_turf(user)
				playsound(T,'sound/magic/blind.ogg', 200, 1, -4)
				new /obj/effect/temp_visual/hierophant/telegraph/teleport(T, user)
				beacon = new/obj/effect/hierophant(T)
				user.update_action_buttons_icon()
				user.visible_message("<span class='hierophant_warning'>[user] places a strange machine beneath [user.ru_ego()] feet!</span>", \
				"<span class='hierophant'>You detach the hierophant beacon, allowing you to teleport yourself and any allies to it at any time!</span>\n\
				<span class='notice'>You can remove the beacon to place it again by striking it with the club.</span>")
			else
				timer = world.time
				INVOKE_ASYNC(src, PROC_REF(prepare_icon_update))
		else
			to_chat(user, "<span class='warning'>You need to be on solid ground to detach the beacon!</span>")
		return
	if(get_dist(user, beacon) <= 2) //beacon too close abort
		to_chat(user, "<span class='warning'>You are too close to the beacon to teleport to it!</span>")
		return
	if(is_blocked_turf(get_turf(beacon), TRUE))
		to_chat(user, "<span class='warning'>The beacon is blocked by something, preventing teleportation!</span>")
		return
	if(!isturf(user.loc))
		to_chat(user, "<span class='warning'>You don't have enough space to teleport from here!</span>")
		return
	teleporting = TRUE //start channel
	user.update_action_buttons_icon()
	user.visible_message("<span class='hierophant_warning'>[user] starts to glow faintly...</span>")
	timer = world.time + 50
	INVOKE_ASYNC(src, PROC_REF(prepare_icon_update))
	beacon.icon_state = "hierophant_tele_on"
	var/obj/effect/temp_visual/hierophant/telegraph/edge/TE1 = new /obj/effect/temp_visual/hierophant/telegraph/edge(user.loc)
	var/obj/effect/temp_visual/hierophant/telegraph/edge/TE2 = new /obj/effect/temp_visual/hierophant/telegraph/edge(beacon.loc)
	if(do_after(user, 40, target = user) && user && beacon)
		var/turf/T = get_turf(beacon)
		var/turf/source = get_turf(user)
		if(is_blocked_turf(T, TRUE))
			teleporting = FALSE
			to_chat(user, "<span class='warning'>The beacon is blocked by something, preventing teleportation!</span>")
			user.update_action_buttons_icon()
			timer = world.time
			INVOKE_ASYNC(src, PROC_REF(prepare_icon_update))
			beacon.icon_state = "hierophant_tele_off"
			return
		new /obj/effect/temp_visual/hierophant/telegraph(T, user)
		new /obj/effect/temp_visual/hierophant/telegraph(source, user)
		playsound(T,'sound/magic/wand_teleport.ogg', 200, 1)
		playsound(source,'sound/machines/airlockopen.ogg', 200, 1)
		if(!do_after(user, 3, target = user) || !user || !beacon || QDELETED(beacon)) //no walking away shitlord
			teleporting = FALSE
			if(user)
				user.update_action_buttons_icon()
			timer = world.time
			INVOKE_ASYNC(src, PROC_REF(prepare_icon_update))
			if(beacon)
				beacon.icon_state = "hierophant_tele_off"
			return
		if(is_blocked_turf(T, TRUE))
			teleporting = FALSE
			to_chat(user, "<span class='warning'>The beacon is blocked by something, preventing teleportation!</span>")
			user.update_action_buttons_icon()
			timer = world.time
			INVOKE_ASYNC(src, PROC_REF(prepare_icon_update))
			beacon.icon_state = "hierophant_tele_off"
			return
		user.log_message("teleported self from [AREACOORD(source)] to [beacon]")
		new /obj/effect/temp_visual/hierophant/telegraph/teleport(T, user)
		new /obj/effect/temp_visual/hierophant/telegraph/teleport(source, user)
		for(var/t in RANGE_TURFS(1, T))
			var/obj/effect/temp_visual/hierophant/blast/B = new /obj/effect/temp_visual/hierophant/blast(t, user, TRUE) //blasts produced will not hurt allies
			B.damage = 25
		for(var/t in RANGE_TURFS(1, source))
			var/obj/effect/temp_visual/hierophant/blast/B = new /obj/effect/temp_visual/hierophant/blast(t, user, TRUE) //but absolutely will hurt enemies
			B.damage = 25
		for(var/mob/living/L in range(1, source))
			INVOKE_ASYNC(src, PROC_REF(teleport_mob), source, L, T, user) //regardless, take all mobs near us along
		sleep(6) //at this point the blasts detonate
		if(beacon)
			beacon.icon_state = "hierophant_tele_off"
	else
		qdel(TE1)
		qdel(TE2)
		timer = world.time
		INVOKE_ASYNC(src, PROC_REF(prepare_icon_update))
	if(beacon)
		beacon.icon_state = "hierophant_tele_off"
	teleporting = FALSE
	if(user)
		user.update_action_buttons_icon()

/obj/item/hierophant_club/proc/teleport_mob(turf/source, mob/M, turf/target, mob/user)
	var/turf/turf_to_teleport_to = get_step(target, get_dir(source, M)) //get position relative to caster
	if(!turf_to_teleport_to || is_blocked_turf(turf_to_teleport_to, TRUE))
		return
	animate(M, alpha = 0, time = 2, easing = EASE_OUT) //fade out
	sleep(1)
	if(!M)
		return
	M.visible_message("<span class='hierophant_warning'>[M] fades out!</span>")
	sleep(2)
	if(!M)
		return
	M.forceMove(turf_to_teleport_to)
	sleep(1)
	if(!M)
		return
	animate(M, alpha = 255, time = 2, easing = EASE_IN) //fade IN
	sleep(1)
	if(!M)
		return
	M.visible_message("<span class='hierophant_warning'>[M] fades in!</span>")
	if(user != M)
		log_combat(user, M, "teleported", null, "from [AREACOORD(source)]")

/obj/item/hierophant_club/proc/cardinal_blasts(turf/T, mob/living/user) //fire cardinal cross blasts with a delay
	if(!T)
		return
	new /obj/effect/temp_visual/hierophant/telegraph/cardinal(T, user)
	playsound(T,'sound/effects/bin_close.ogg', 200, 1)
	sleep(2)
	new /obj/effect/temp_visual/hierophant/blast(T, user, friendly_fire_check)
	for(var/d in GLOB.cardinals)
		INVOKE_ASYNC(src, PROC_REF(blast_wall), T, d, user)

/obj/item/hierophant_club/proc/blast_wall(turf/T, dir, mob/living/user) //make a wall of blasts blast_range tiles long
	if(!T)
		return
	var/range = blast_range
	var/turf/previousturf = T
	var/turf/J = get_step(previousturf, dir)
	for(var/i in 1 to range)
		if(!J)
			return
		var/obj/effect/temp_visual/hierophant/blast/B = new(J, user, friendly_fire_check)
		B.damage = 25
		B.monster_damage_boost = TRUE
		previousturf = J
		J = get_step(previousturf, dir)

/obj/item/hierophant_club/proc/aoe_burst(turf/T, mob/living/user) //make a 3x3 blast around a target
	if(!T)
		return
	new /obj/effect/temp_visual/hierophant/telegraph(T, user)
	playsound(T,'sound/effects/bin_close.ogg', 200, 1)
	sleep(2)
	for(var/t in RANGE_TURFS(1, T))
		var/obj/effect/temp_visual/hierophant/blast/B = new(t, user, friendly_fire_check)
		B.damage = 25


//Just some minor stuff
/obj/structure/closet/crate/necropolis/puzzle
	name = "puzzling chest"

/obj/structure/closet/crate/necropolis/puzzle/PopulateContents()
	var/loot = rand(1,3)
	switch(loot)
		if(1)
			new /obj/item/soulstone/anybody(src)
		if(2)
			new /obj/item/wisp_lantern(src)
		if(3)
			new /obj/item/prisoncube(src)
