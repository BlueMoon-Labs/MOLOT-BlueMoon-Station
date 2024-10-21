///////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/obj/item/modkit
	name = "modkit"
	desc = "A modkit for making something into something."
	icon = 'modular_splurt/icons/obj/clothing/reinforcekits.dmi'
	w_class = WEIGHT_CLASS_SMALL
	icon_state = "sec_armor_kit"
	var/product //what it makes
	var/list/fromitem = list() //what it needs

/obj/item/modkit/afterattack(obj/O, mob/user as mob)
	if(istype(O, product))
		to_chat(user,"<span class='warning'>[O] is already modified!")
		return
	if(O.type in fromitem) //makes sure O is the right thing
		new product(usr.loc) //spawns the product
		user.visible_message("<span class='warning'>[user] modifies [O]!","<span class='warning'>You modify the [O]!")
		qdel(O) //Gets rid of the baton
		qdel(src) //gets rid of the kit
	else
		to_chat(user, "<span class='warning'> You can't modify [O] with this kit!</span>")

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/obj/item/modkit/Kovac_Kit
	name = "Kovac Gun Kit"
	desc = "A modkit for making a Enforcer Gun into a Kovac Gun."
	product = /obj/item/gun/ballistic/automatic/pistol/enforcer/steyr
	fromitem = list(/obj/item/gun/ballistic/automatic/pistol/enforcer/nomag, /obj/item/gun/ballistic/automatic/pistol/enforcer, /obj/item/gun/ballistic/automatic/pistol/enforcerred, /obj/item/gun/ballistic/automatic/pistol/enforcergold)

/obj/item/gun/ballistic/automatic/pistol/enforcer/steyr
	name = "\improper Steyr MWS"
	desc = "An antique semi-automatic pistol, heavily modified by the MWS defence manufacturing company. Provided with a better ammo cartridge and reinforced parts, it fits perfectly for resolving various security tasks. You can also notice Kovac's family sign drawn on it's handgrip."
	icon = 'modular_bluemoon/fluffs/icons/obj/guns.dmi'
	icon_state = "steyr_m1912"
	can_suppress = FALSE
	fire_sound = 'modular_bluemoon/fluffs/sound/weapon/steyr_shoot.ogg'

/obj/item/modkit/auto9_kit
	name = "Auto 9 Kit"
	desc = "A modkit for making a WT-550 Gun into a Auto 9 Gun."
	product = /obj/item/gun/ballistic/automatic/wt550/auto9
	fromitem = list(/obj/item/gun/ballistic/automatic/wt550)

/obj/item/gun/ballistic/automatic/wt550/auto9
	name = "\improper Auto 9"
	desc = "Come quitely or there will be troubles."
	icon = 'modular_bluemoon/fluffs/icons/obj/guns.dmi'
	lefthand_file = 'modular_bluemoon/fluffs/icons/mob/guns_left.dmi'
	righthand_file = 'modular_bluemoon/fluffs/icons/mob/guns_right.dmi'
	icon_state = "auto9"
	item_state = "auto9"
	fire_sound = 'modular_bluemoon/fluffs/sound/weapon/auto9_shoot.ogg'
	can_suppress = FALSE
	can_bayonet = FALSE

/obj/item/gun/ballistic/automatic/wt550/auto9/update_icon_state()
	if(magazine)
		icon_state = "auto9"
	else
		icon_state = "auto9-e"

/obj/item/modkit/at41_kit
	name = "AT-41 Kit"
	desc = "A modkit for making a WT-550 Gun into a AT-41 Gun."
	product = /obj/item/gun/ballistic/automatic/wt550/at41
	fromitem = list(/obj/item/gun/ballistic/automatic/wt550)

/obj/item/gun/ballistic/automatic/wt550/at41
	name = "\improper AT-41"
	desc = "Старый кусок металла, который работает по принципу - и палка стреляет раз в год"
	icon = 'modular_bluemoon/fluffs/icons/obj/at41.dmi'
	lefthand_file = 'modular_bluemoon/fluffs/icons/mob/guns_left.dmi'
	righthand_file = 'modular_bluemoon/fluffs/icons/mob/guns_right.dmi'
	icon_state = "at41"
	item_state = "at41"
	fire_sound = 'modular_bluemoon/fluffs/sound/weapon/at41_fire.ogg'
	can_suppress = FALSE
	can_bayonet = TRUE

/obj/item/gun/ballistic/automatic/wt550/at41/update_icon_state()
	icon_state = "at41[magazine ? "-[CEILING(get_ammo(0)/7, 1)*4]" : ""][chambered ? "" : "-e"]"

/obj/item/modkit/wtadler
	name = "WT-550 Adler Kit"
	desc = "A modkit for making a WT-550 Gun into a WT-550 Adler Gun."
	product = /obj/item/gun/ballistic/automatic/wt550/wtadler
	fromitem = list(/obj/item/gun/ballistic/automatic/wt550)

/obj/item/gun/ballistic/automatic/wt550/wtadler
	name = "\improper Adler assault rifle"
	desc = "A assault rifle manufactured by the military industrial complex Adler. Manufactured for use by militarized law enforcement security services."
	icon = 'modular_bluemoon/fluffs/icons/obj/wtadler.dmi'
	lefthand_file = 'modular_bluemoon/fluffs/icons/mob/guns_left.dmi'
	righthand_file = 'modular_bluemoon/fluffs/icons/mob/guns_right.dmi'
	icon_state = "wtadler"
	item_state = "wtadler"
	fire_sound = 'modular_bluemoon/fluffs/sound/weapon/adlershot.ogg'
	can_suppress = FALSE
	can_bayonet = TRUE
	knife_x_offset = 25
	knife_y_offset = 7

/obj/item/gun/ballistic/automatic/wt550/wtadler/update_icon_state()
	icon_state = "wtadler[magazine ? "-[CEILING(get_ammo(0)/7, 1)*4]" : ""][chambered ? "" : "-e"]"

/obj/item/modkit/a46
	name = "A46 Kit"
	desc = "A modkit for making a WT-550 Gun into a A46 Gun."
	product = /obj/item/gun/ballistic/automatic/wt550/a46
	fromitem = list(/obj/item/gun/ballistic/automatic/wt550)

/obj/item/gun/ballistic/automatic/wt550/a46
	name = "\improper A46-Cord"
	desc = "Сбалансированная и простая в использовании автоматическая винтовка, сделанная на базе АЕК-971 и хоть придумана она была давно, но не получила такую популярность как её аналог AK-12."
	icon = 'modular_bluemoon/fluffs/icons/obj/a46.dmi'
	lefthand_file = 'modular_bluemoon/fluffs/icons/mob/guns_left.dmi'
	righthand_file = 'modular_bluemoon/fluffs/icons/mob/guns_right.dmi'
	icon_state = "a46"
	item_state = "a46"
	fire_sound = 'modular_bluemoon/fluffs/sound/weapon/a46shot1.ogg'
	pickup_sound = "modular_bluemoon/fluffs/sound/weapon/a46grab.ogg"
	can_suppress = FALSE
	can_bayonet = TRUE
	knife_x_offset = 42
	knife_y_offset = 12

/obj/item/gun/ballistic/automatic/wt550/a46/update_icon_state()
	icon_state = "a46[magazine ? "-[CEILING(get_ammo(0)/7, 1)*4]" : ""][chambered ? "" : "-e"]"

/obj/item/modkit/ots18
	name = "OTs-18 Kit"
	desc = "A modkit for making a WT-550 Gun into a OTs-18 Groza Gun."
	product = /obj/item/gun/ballistic/automatic/wt550/ots18
	fromitem = list(/obj/item/gun/ballistic/automatic/wt550)

/obj/item/gun/ballistic/automatic/wt550/ots18
	name = "\improper OTs-18 Groza"
	desc = "Компактный штурмовой стрелково-гранатометный комплекс, сделанный на базе калашникова и переделанный под калибр 4.6x30."
	icon = 'modular_bluemoon/fluffs/icons/obj/groza.dmi'
	lefthand_file = 'modular_bluemoon/fluffs/icons/mob/guns_left.dmi'
	righthand_file = 'modular_bluemoon/fluffs/icons/mob/guns_right.dmi'
	icon_state = "groza"
	item_state = "groza"
	fire_sound = 'modular_bluemoon/fluffs/sound/weapon/groza-shot1.ogg'
	pickup_sound = "modular_bluemoon/fluffs/sound/weapon/groza-grab.ogg"
	can_suppress = FALSE
	can_bayonet = TRUE
	knife_x_offset = 40
	knife_y_offset = 17

/obj/item/gun/ballistic/automatic/wt550/ots18/update_icon_state()
	icon_state = "groza[magazine ? "-[CEILING(get_ammo(0)/7, 1)*4]" : ""][chambered ? "" : "-e"]"

/obj/item/modkit/rs9
	name = "RS9 Kit"
	desc = "A modkit for making a WT-550 Gun into a RS9 Gun."
	product = /obj/item/gun/ballistic/automatic/wt550/rs9
	fromitem = list(/obj/item/gun/ballistic/automatic/wt550)

/obj/item/gun/ballistic/automatic/wt550/rs9
	name = "\improper RS9"
	desc = "The RS9 is an assault rifle designed for combat in narrow street areas. It has bayonet mount and is relatively lightweight. This model uses 4.6x30mm caliber."
	icon = 'modular_bluemoon/fluffs/icons/obj/acrador_guns.dmi'
	lefthand_file = 'modular_bluemoon/fluffs/icons/mob/guns_left.dmi'
	righthand_file = 'modular_bluemoon/fluffs/icons/mob/guns_right.dmi'
	icon_state = "rs9"
	item_state = "rs9"
	fire_sound = 'modular_bluemoon/fluffs/sound/weapon/rs9shot.ogg'
	can_suppress = FALSE
	can_bayonet = TRUE
	knife_x_offset = 40
	knife_y_offset = 10

/obj/item/gun/ballistic/automatic/wt550/rs9/update_icon_state()
	icon_state = "rs9[magazine ? "-[CEILING(get_ammo(0)/7, 1)*4]" : ""][chambered ? "" : "-e"]"

/obj/item/modkit/m240_kit
	name = "M240 Kit"
	desc = "A modkit for making a Flamethrower into a M240."
	product = /obj/item/flamethrower/full/tank/m240
	fromitem = list(/obj/item/flamethrower, /obj/item/flamethrower/full, /obj/item/flamethrower/full/tank)

/obj/item/flamethrower/full/tank/m240
	name = "M240 Flamethrower"
	icon = 'modular_bluemoon/fluffs/icons/obj/guns.dmi'
	icon_state = "m240"
	item_state = "m240_0"
	lefthand_file = 'modular_bluemoon/fluffs/icons/mob/guns_left.dmi'
	righthand_file = 'modular_bluemoon/fluffs/icons/mob/guns_right.dmi'
	create_with_tank = TRUE
	fire_sound = 'modular_bluemoon/fluffs/sound/weapon/flamethrower.ogg'

/obj/item/flamethrower/update_icon_state()
	item_state = "m240_[lit]"

/obj/item/modkit/old_kit
	name = "H&K Luftkuss Kit"
	desc = "A modkit for making a hybrid taser into a H&K Luftkuss."
	product = /obj/item/gun/energy/e_gun/advtaser_old
	fromitem = list(/obj/item/gun/energy/e_gun/advtaser)

/obj/item/gun/energy/e_gun/advtaser_old
	name = "H&K Luftkuss"
	desc = "An upgraded hybrid taser gun with several stripes, manufactured by the SolFed H&K arms company."
	icon_state = "old"
	item_state = "taser"
	icon = 'modular_bluemoon/fluffs/icons/obj/guns.dmi'
	lefthand_file = 'modular_bluemoon/fluffs/icons/mob/guns_left.dmi'
	righthand_file = 'modular_bluemoon/fluffs/icons/mob/guns_right.dmi'
	ammo_type = list(/obj/item/ammo_casing/energy/disabler/old, /obj/item/ammo_casing/energy/electrode/old = FALSE)
	ammo_x_offset = 0
	var/last_altfire = 0
	var/altfire_delay = CLICK_CD_RANGE

/obj/item/gun/energy/e_gun/advtaser_old/altafterattack(atom/target, mob/user, proximity_flag, params)
	. = TRUE
	if(last_altfire + altfire_delay > world.time)
		return
	var/current_index = current_firemode_index
	set_firemode_to_type(/obj/item/ammo_casing/energy/electrode/old)
	process_afterattack(target, user, proximity_flag, params)
	set_firemode_index(current_index)
	last_altfire = world.time

/obj/item/ammo_casing/energy/disabler/old
	fire_sound = 'modular_bluemoon/fluffs/sound/weapon/disabler.ogg'

/obj/item/ammo_casing/energy/electrode/old
	projectile_type = /obj/item/projectile/energy/electrode
	select_name = "stun"
	fire_sound = 'modular_bluemoon/fluffs/sound/weapon/taser.ogg'
	e_cost = 200
	harmful = FALSE


////////////

/obj/item/modkit/dominator_kit
	name = "Dominator Kit"
	desc = "A modkit for making a hybrid taser into a Dominator."
	product = /obj/item/gun/energy/e_gun/advtaser/dominator
	fromitem = list(/obj/item/gun/energy/e_gun/advtaser)

/obj/item/gun/energy/e_gun/advtaser/dominator
	name = "\improper Dominator"
	icon_state = "dominator"
	item_state = "taser"
	icon = 'modular_bluemoon/fluffs/icons/obj/guns.dmi'
	lefthand_file = 'modular_bluemoon/fluffs/icons/mob/guns_left.dmi'
	righthand_file = 'modular_bluemoon/fluffs/icons/mob/guns_right.dmi'
	ammo_x_offset = 0

/////////////////

/obj/item/modkit/nue_kit
	name = "Araki Nue Kit"
	desc = "A modkit for making an Enforcer into a Araki Nue."
	product = /obj/item/gun/ballistic/automatic/pistol/enforcer/nue
	fromitem = list(/obj/item/gun/ballistic/automatic/pistol/enforcer/nomag, /obj/item/gun/ballistic/automatic/pistol/enforcer, /obj/item/gun/ballistic/automatic/pistol/enforcerred, /obj/item/gun/ballistic/automatic/pistol/enforcergold)

/obj/item/gun/ballistic/automatic/pistol/enforcer/nue
	name = "\improper Araki Nue"
	desc = "Semi-automatic, double-action pistol that was engineered to fit any hand. The handle is decorated with orange-colored ergonomic rubber with a Vulpkanin muzzle on it. It's looks familiar."
	icon = 'modular_bluemoon/fluffs/icons/obj/guns.dmi'
	icon_state = "nue"
	can_suppress = FALSE
	fire_sound = 'modular_bluemoon/fluffs/sound/weapon/nue_shoot.ogg'

//////////////////////////////////////////////////////////////////////////////////////////////////////////////

/obj/item/modkit/malorian_kit
	name = "Malorian Kit"
	desc = "A modkit for making an Enforcer into a Araki Malorian."
	product = /obj/item/gun/ballistic/automatic/pistol/enforcer/malorian
	fromitem = list(/obj/item/gun/ballistic/automatic/pistol/enforcer/nomag, /obj/item/gun/ballistic/automatic/pistol/enforcer, /obj/item/gun/ballistic/automatic/pistol/enforcerred, /obj/item/gun/ballistic/automatic/pistol/enforcergold)

/obj/item/modkit/malorian_mag_kit
	name = "Malorian Mag Kit"
	desc = "A modkit for making an Enforcer mag into a Malorian mag."
	product = /obj/item/ammo_box/magazine/e45/malorian
	fromitem = list(/obj/item/ammo_box/magazine/e45, /obj/item/ammo_box/magazine/e45/taser, /obj/item/ammo_box/magazine/e45/lethal, /obj/item/ammo_box/magazine/e45/stun, /obj/item/ammo_box/magazine/e45/hydra)

/obj/item/gun/ballistic/automatic/pistol/enforcer/malorian
	name = "\improper Araki Arms 3516"
	desc = "Unique heavy pistol manufactured by Araki Arms. Taking already successful design of previous Araki Nue, this one was designed to the personal specifications of Shiro."
	icon = 'modular_bluemoon/fluffs/icons/obj/64x64.dmi'
	icon_state = "arakiarms"
	can_suppress = FALSE
	fire_sound = 'modular_bluemoon/fluffs/sound/weapon/nue_shoot.ogg'
	mag_type = /obj/item/ammo_box/magazine/e45/malorian

/obj/item/ammo_box/magazine/e45/malorian
	name = "Araki Arms magazine"
	icon = 'modular_bluemoon/fluffs/icons/obj/guns.dmi'
	//icon_state = "mag"
	desc = "An Araki Arms magazine. Can be loaded with .45 ammo."

/obj/item/storage/box/malorian_mag

/obj/item/storage/box/malorian_mag/PopulateContents()
	new /obj/item/modkit/malorian_mag_kit(src)
	new /obj/item/modkit/malorian_mag_kit(src)
	new /obj/item/modkit/malorian_mag_kit(src)
	new /obj/item/modkit/malorian_mag_kit(src)
	new /obj/item/modkit/malorian_mag_kit(src)
	new /obj/item/modkit/malorian_mag_kit(src)
	new /obj/item/modkit/malorian_mag_kit(src)

/////////////////////////////////////////////////////////////////////////////////////

/obj/item/gun/ballistic/revolver/r45l/rt46
	name = "\improper RT-46 The Tempest"
	desc = "The Tempest belongs to the museum as a benchmark of Soviet design. Is it beautiful to look at? No. Comfortable to use? No. Safe? No. But effective? Damn effective."
	icon = 'modular_bluemoon/fluffs/icons/obj/guns.dmi'
	icon_state = "rt46"
	item_state = "rt46"
	lefthand_file = 'modular_bluemoon/fluffs/icons/mob/guns_left.dmi'
	righthand_file = 'modular_bluemoon/fluffs/icons/mob/guns_right.dmi'

/obj/item/modkit/rt46
	name = "RT-46 The Tempest Kit"
	desc = "A modkit for making a Revolver into a RT-46."
	product = /obj/item/gun/ballistic/revolver/r45l/rt46
	fromitem = list (/obj/item/gun/ballistic/revolver/r45l)

//////////////////// AM4 уже есть в лодауте донатеров. Это лишь его рескин.

/obj/item/gun/ballistic/automatic/AM4B_pchelik
	name = "GFYS"
	desc = "На донк-софт оружии видна гравировка: 'Coopie'. Предназначено для нетравмирующего выкидывания существ из бара и самозащиты от приставал."
	icon = 'modular_bluemoon/fluffs/icons/obj/guns.dmi'
	icon_state = "coopie"
	item_state = "arifle-wielded"
	mag_type = /obj/item/ammo_box/magazine/toy/AM4B
	can_suppress = 0
	casing_ejector = 0
	spread = 30		//Assault Rifleeeeeee
	w_class = WEIGHT_CLASS_NORMAL
	burst_size = 1	//Shh.
	fire_delay = 15
	automatic_burst_overlay = FALSE

/////////////////////////////////////////////////////////////////////////////////////

/obj/item/modkit/stunblade_kit
	name = "Stunblade Kit"
	desc = "A modkit for making an stunbaton into a stunblade."
	product = /obj/item/melee/baton/stunblade
	fromitem = list(/obj/item/melee/baton, /obj/item/melee/baton/loaded)

/obj/item/melee/baton/stunblade
	name = "folding stunblade"
	desc = "A stunblade made of several segments collapse into each other much like a spyglass, thus it can fit inside of the handle entirely. This utility combined with its dense metal makes it perfect for defensive maneuvers."
	item_state = "stunblade"
	icon_state = "stunblade"
	icon = 'modular_bluemoon/fluffs/icons/obj/guns.dmi'
	lefthand_file = 'modular_bluemoon/fluffs/icons/mob/guns_left.dmi'
	righthand_file = 'modular_bluemoon/fluffs/icons/mob/guns_right.dmi'

/obj/item/melee/baton/stunblade/switch_status(new_status = FALSE, silent = FALSE)
	if(turned_on != new_status)
		turned_on = new_status
		if(!silent)
			playsound(loc, 'modular_bluemoon/fluffs/sound/weapon/stunblade.ogg', 75, 1, -1)
		if(turned_on)
			START_PROCESSING(SSobj, src)
		else
			STOP_PROCESSING(SSobj, src)
	update_icon()

/obj/item/melee/baton/stunblade/update_icon_state()
	if(turned_on)
		icon_state = "stunblade_active"
		item_state = "stunblade_active"
	else if(!cell)
		icon_state = "stunblade_nocell"
		item_state = "stunblade"
	else
		icon_state = "stunblade"
		item_state = "stunblade"

/obj/item/melee/baton/stunblade/get_worn_belt_overlay(icon_file)
	return mutable_appearance('icons/obj/clothing/belt_overlays.dmi', "-stunblade")

/////////////////////////////////////////////////////////////////////////////////////

/obj/item/modkit/tonfa_kit
	name = "Ton-Fa Kit"
	desc = "A modkit for making an stunbaton into a ton-Fa."
	product = /obj/item/melee/baton/tonfa
	fromitem = list(/obj/item/melee/baton, /obj/item/melee/baton/loaded)

/obj/item/melee/baton/tonfa
	name = "Stun Ton-Fa"
	desc = "A non-lethal baton for suppressing manpower. Developed during the riots when the existence of the rifters was confirmed."
	item_state = "tonfa"
	icon_state = "tonfa"
	icon = 'modular_bluemoon/fluffs/icons/obj/acrador_guns.dmi'
	lefthand_file = 'modular_bluemoon/fluffs/icons/mob/guns_left.dmi'
	righthand_file = 'modular_bluemoon/fluffs/icons/mob/guns_right.dmi'

/obj/item/melee/baton/tonfa/switch_status(new_status = FALSE, silent = FALSE)
	if(turned_on != new_status)
		turned_on = new_status
		if(!silent)
			playsound(loc, 'modular_bluemoon/fluffs/sound/weapon/tonfa.ogg', 75, 1, -1)
		if(turned_on)
			START_PROCESSING(SSobj, src)
		else
			STOP_PROCESSING(SSobj, src)
	update_icon()

/obj/item/melee/baton/tonfa/update_icon_state()
	if(turned_on)
		icon_state = "tonfa_active"
		item_state = "tonfa_active"
	else if(!cell)
		icon_state = "tonfa_nocell"
		item_state = "tonfa"
	else
		icon_state = "tonfa"
		item_state = "tonfa"

/obj/item/melee/baton/tonfa/get_worn_belt_overlay(icon_file)
	return mutable_appearance('icons/obj/clothing/belt_overlays.dmi', "-tonfa")

////////////////////////////////////////////////////////////////////////////////////////

/obj/item/modkit/ntcane_kit
	name = "Harness Armor Kit"
	desc = "A modkit for making an Fancy Cane into a Old Luxury Cane."
	product = /obj/item/melee/baton/stunntcane
	fromitem = list(/obj/item/melee/classic_baton/ntcane)

/obj/item/melee/baton/stunntcane
	name = "Old Luxury Cane"
	desc = "На вид потрепанная временем трость которая украшена золотом с не раз отреставрированным деревом и на ручке еле поблескивал алмаз. Такие имеют на некоторых станция Представители НТ как показатель статуса, этот же видимо скорее как память раз уж не заменялся владельцем видимо годами."
	item_state = "cane_nt"
	icon_state = "cane_nt"
	icon = 'modular_bluemoon/fluffs/icons/obj/guns.dmi'
	lefthand_file = 'modular_bluemoon/fluffs/icons/mob/guns_left.dmi'
	righthand_file = 'modular_bluemoon/fluffs/icons/mob/guns_right.dmi'

/obj/item/melee/baton/stunntcane/switch_status(new_status = FALSE, silent = FALSE)
	if(turned_on != new_status)
		turned_on = new_status
		if(!silent)
			playsound(loc, 'modular_bluemoon/fluffs/sound/weapon/stunblade.ogg', 75, 1, -1)
		if(turned_on)
			START_PROCESSING(SSobj, src)
		else
			STOP_PROCESSING(SSobj, src)
	update_icon()

/obj/item/melee/baton/stunntcane/update_icon_state()
	if(turned_on)
		icon_state = "cane_nt_active"
		item_state = "cane_nt_active"
	else if(!cell)
		icon_state = "cane_nt_nocell"
		item_state = "cane_nt"
	else
		icon_state = "cane_nt"
		item_state = "cane_nt"

/obj/item/melee/baton/stunntcane/get_worn_belt_overlay(icon_file)
	return mutable_appearance('icons/obj/clothing/belt_overlays.dmi', "cane_nt")

////////////////////////////////////////////////////////////////////////////////////////

/obj/item/modkit/pf940_kit
	name = "PF940 Kit"
	desc = "A modkit for making an Enforcer into a PF940."
	product = /obj/item/gun/ballistic/automatic/pistol/enforcer/pf940
	fromitem = list(/obj/item/gun/ballistic/automatic/pistol/enforcer/nomag, /obj/item/gun/ballistic/automatic/pistol/enforcer, /obj/item/gun/ballistic/automatic/pistol/enforcerred, /obj/item/gun/ballistic/automatic/pistol/enforcergold)

/obj/item/modkit/pf940_kit_g22
	name = "PF940 G22 Kit"
	desc = "A modkit for making a G22 into a PF940."
	product = /obj/item/gun/ballistic/automatic/pistol/enforcer/pf940
	fromitem = list(/obj/item/gun/ballistic/automatic/pistol/enforcer/nomag, /obj/item/gun/ballistic/automatic/pistol/enforcer, /obj/item/gun/ballistic/automatic/pistol/enforcerred, /obj/item/gun/ballistic/automatic/pistol/enforcergold)

/obj/item/gun/ballistic/automatic/pistol/enforcer/pf940
	name = "\improper PF940"
	desc = "A heavily modified Glock 21 pistol with some ergonomic parts and a caliber converted to .45, making it easy to find ammo at Edem stations. Your team is down, you're the only fella left. You- You'll just have to figure it out."
	icon = 'modular_bluemoon/fluffs/icons/obj/guns.dmi'
	icon_state = "pf940"
	can_suppress = FALSE
	fire_sound = 'modular_bluemoon/fluffs/sound/weapon/pf940_shoot.ogg'

/obj/item/gun/ballistic/automatic/pistol/g22/pf940
	name = "\improper PF940"
	desc = "A heavily modified Glock 21 pistol with some ergonomic parts and a caliber converted to .45, making it easy to find ammo at Edem stations. Your team is down, you're the only fella left. You- You'll just have to figure it out."
	icon = 'modular_bluemoon/fluffs/icons/obj/guns.dmi'
	icon_state = "pf940"
	can_suppress = FALSE
	fire_sound = 'modular_bluemoon/fluffs/sound/weapon/pf940_shoot.ogg'

/obj/item/modkit/ks23_kit
	name = "KS-23 Shotgun Kit"
	desc = "A modkit for making a Shotgun into a KS-23."
	product = /obj/item/gun/ballistic/shotgun/riot/ks_23
	fromitem = list(/obj/item/gun/ballistic/shotgun, /obj/item/gun/ballistic/shotgun/riot, /obj/item/gun/ballistic/shotgun/riot/syndicate)

/obj/item/gun/ballistic/shotgun/riot/ks_23
	name = "\improper KS-23"
	desc = "Карабин Специальный-23М - ружьё с нарезным стволом. Многофункциональное полицейское оружие, предназначенное для пресечения массовых беспорядков, избирательного силового, психического и химического воздействия на правонарушителей."
	icon = 'modular_bluemoon/fluffs/icons/obj/guns.dmi'
	lefthand_file = 'modular_bluemoon/fluffs/icons/mob/guns_left.dmi'
	righthand_file = 'modular_bluemoon/fluffs/icons/mob/guns_right.dmi'
	//chosen_icon = 'icons/mob/clothing/back.dmi'
	icon_state = "KS-23M"
	can_suppress = FALSE
	fire_sound = 'modular_bluemoon/fluffs/sound/shoot.ogg'

/obj/item/gun/ballistic/shotgun/riot/ks_23/update_icon_state()
	. = ..()
	icon_state = "KS-23M[chambered ? "" : "-e"]"

/obj/item/modkit/g36_kit
	name = "G36 Kit"
	desc = "A modkit for making a AK-12 into a G36."
	product = /obj/item/gun/ballistic/automatic/ak12/g36
	fromitem = list(/obj/item/gun/ballistic/automatic/ak12, /obj/item/gun/ballistic/automatic/ak12/r)

/obj/item/gun/ballistic/automatic/ak12/g36
	name = "\improper G-36"
	desc = "Heckler & Koch Gewehr 36, G36 - семейство стрелкового оружия, разработанное в начале 1990-х немецкой компанией Heckler & Koch, под внутрифирменным обозначением HK 50, для замены хорошо известной автоматической винтовки HK G3."
	icon = 'modular_bluemoon/fluffs/icons/obj/guns.dmi'
	lefthand_file = 'modular_bluemoon/fluffs/icons/mob/guns_left.dmi'
	righthand_file = 'modular_bluemoon/fluffs/icons/mob/guns_right.dmi'
	mag_type = /obj/item/ammo_box/magazine/ak12/r
	//chosen_icon = 'icons/mob/clothing/back.dmi'
	icon_state = "G36"
	fire_delay = 3
	fire_sound = 'modular_bluemoon/fluffs/sound/shoot.ogg'

/obj/item/gun/ballistic/automatic/ak12/g36/update_icon_state()
	if(magazine)
		icon_state = "G36"
		item_state = "G36"
	else
		icon_state = "G36_e"
		item_state = "G36_e"

/obj/item/modkit/legax
	name = "Legax Gravpulser Kit"
	desc = "Модифицирует стандартную лазерную винтовку в эксперментальный гравпульсер."
	product = /obj/item/gun/energy/taser/legax
	fromitem = list(/obj/item/gun/energy/laser)

/////////////////////////////////////////////////////////////////////////////////////////////////////////////

/obj/item/modkit/cmg_kit
	name = "Combat MG Kit"
	desc = "A modkit for making an combat knife into a Combat MG."
	product = /obj/item/kitchen/knife/combat/cmg
	fromitem = list(/obj/item/kitchen/knife/combat)

/obj/item/kitchen/knife/combat/cmg
	name = "Combat MG"
	desc = "It is a straight sword with blade made of iron and plasteel alloy. Its handle is covered with cloth for better grip as a sort of field modification, with the emblem of Rohai engraved under it. It doesn't feel well balanced or sharp enough, but at least may look stylish"
	item_state = "cmg"
	icon_state = "cmg"
	icon = 'modular_bluemoon/fluffs/icons/obj/cmg.dmi'
	lefthand_file = 'modular_bluemoon/fluffs/icons/mob/guns_left.dmi'
	righthand_file = 'modular_bluemoon/fluffs/icons/mob/guns_right.dmi'
	mob_overlay_icon = 'modular_bluemoon/fluffs/icons/mob/back.dmi'

/obj/item/modkit/rs14_kit
	name = "RS14 Kit"
	desc = "A modkit for making an Rsha12 into a RS14."
	product = /obj/item/gun/ballistic/shotgun/rsh12/rs14
	fromitem = list(/obj/item/gun/ballistic/shotgun/rsh12)

/obj/item/gun/ballistic/shotgun/rsh12/rs14
	name = "RS14"
	desc = "Shotgun revolver. It was formerly a hunting weapon, but has since been adopted by the Rohai armies because of its ease of use, effectiveness and cheapness. This model uses 12 gauge."
	item_state = "rs14"
	icon_state = "rs14"
	icon = 'modular_bluemoon/fluffs/icons/obj/acrador_guns.dmi'
	lefthand_file = 'modular_bluemoon/fluffs/icons/mob/guns_left.dmi'
	righthand_file = 'modular_bluemoon/fluffs/icons/mob/guns_right.dmi'
	fire_sound = 'modular_bluemoon/fluffs/sound/weapon/rs14shot.ogg'

/obj/item/modkit/rshield_kit
	name = "Telescopic riot shield Kit"
	desc = "A modkit for making an telescopic riot shield into a Acrador telescopic riot shield."
	product = /obj/item/shield/riot/rshield
	fromitem = list(/obj/item/shield/riot/tele)

/obj/item/shield/riot/rshield
	name = "Telescopic riot shield"
	desc = "A shield used to quell civil unrest in the cities of Irelia. It is easy to use and can be folded into a more compact form for carrying."
	icon_state = "rshield0"
	icon = 'modular_bluemoon/fluffs/icons/obj/acrador_guns.dmi'
	lefthand_file = 'modular_bluemoon/fluffs/icons/mob/guns_left.dmi'
	righthand_file = 'modular_bluemoon/fluffs/icons/mob/guns_right.dmi'
	slot_flags = null
	force = 3
	throwforce = 3
	throw_speed = 3
	throw_range = 4
	w_class = WEIGHT_CLASS_NORMAL
	var/active = FALSE

/obj/item/shield/riot/rshield/run_block(mob/living/owner, atom/object, damage, attack_text, attack_type, armour_penetration, mob/attacker, def_zone, final_block_chance, list/block_return)
	if(!active)
		return BLOCK_NONE
	return ..()

/obj/item/shield/riot/rshield/can_active_block()
	return ..() && active

/obj/item/shield/riot/rshield/attack_self(mob/living/user)
	active = !active
	icon_state = "rshield[active]"
	playsound(src.loc, 'sound/weapons/batonextend.ogg', 50, TRUE)

	if(active)
		force = 8
		throwforce = 5
		throw_speed = 2
		w_class = WEIGHT_CLASS_BULKY
		slot_flags = ITEM_SLOT_BACK
		to_chat(user, "<span class='notice'>You extend \the [src].</span>")
	else
		force = 3
		throwforce = 3
		throw_speed = 3
		w_class = WEIGHT_CLASS_NORMAL
		slot_flags = null
		to_chat(user, "<span class='notice'>[src] can now be concealed.</span>")
	add_fingerprint(user)

/obj/item/modkit/anstrum_kit
	name = "SP 488 Anstrum Kit"
	desc = "A modkit for making an Enforcer into a SP 488 Anstrum."
	product = /obj/item/gun/ballistic/automatic/pistol/enforcer/anstrum
	fromitem = list(/obj/item/gun/ballistic/automatic/pistol/enforcer/nomag, /obj/item/gun/ballistic/automatic/pistol/enforcer, /obj/item/gun/ballistic/automatic/pistol/enforcerred, /obj/item/gun/ballistic/automatic/pistol/enforcergold)

/obj/item/gun/ballistic/automatic/pistol/enforcer/anstrum
	name = "\improper SP 488 Anstrum"
	desc = "A series of semi-automatic pistols designed and manufactured specifically for the Rohai Law Enforcement Units and as personal weapons for the senior army officers. The design is old but reliable, combining compactness with sufficient combat power for everyday tasks."
	icon = 'modular_bluemoon/fluffs/icons/obj/acrador_guns.dmi'
	icon_state = "anstrum"
	fire_sound = 'modular_bluemoon/fluffs/sound/weapon/anstrumshot.ogg'

////////////////////////////////////////////////////////////////////////////////////////

/obj/item/gun/energy/e_gun/hos/dreadmk3
	name = "\improper Законодатель MK3"
	desc = "Стандартное оружие судей из Мега-Города Солнечной Федерации. Пистолет комплектуется несколькими типами боеприпасов, иногда набор снарядов отличается от стандартного в зависимости от миссии судьи. Оснащён биометрическим датчиком ладони — оружие может применять только судья, а при несанкционированном использовании в рукояти срабатывает взрывное устройство. Этот же пистолет на радость недругов что преступают Закон, со сломанной биометрией ради стандартизации электронных бойков."
	icon = 'modular_bluemoon/fluffs/icons/obj/dreadmk3.dmi'
	icon_state = "dreadmk3"
	ammo_type = list(/obj/item/ammo_casing/energy/disabler/dreadmk3, /obj/item/ammo_casing/energy/laser/hos/dreadmk3, /obj/item/ammo_casing/energy/ion/hos/dreadmk3, /obj/item/ammo_casing/energy/electrode/hos/dreadmk3)
	ammo_x_offset = 0
	flight_x_offset = 22
	flight_y_offset = 5

/obj/item/ammo_casing/energy/disabler/dreadmk3

/obj/item/ammo_casing/energy/laser/hos/dreadmk3

/obj/item/ammo_casing/energy/ion/hos/dreadmk3

/obj/item/ammo_casing/energy/electrode/hos/dreadmk3

/obj/item/modkit/dreadmk3_kit
	name = "Законодатель MK3 Kit"
	desc = "A modkit for making a MultiPhase Energy Gun into Законодатель MK3."
	product = /obj/item/gun/energy/e_gun/hos/dreadmk3
	fromitem = list(/obj/item/gun/energy/e_gun/hos)

////////////////////////////////////////////////////////////////////////////////////////

/obj/item/crowbar/large/heavy/hammercrowbar
	name = "Heavy pocket hammer"
	desc = "A heavy-duty hammer designed for all types of working conditions. Extremely durable and reliable. Made of high-quality black metal, with a rubberized silicone handle."
	item_state = "hammercrowbar"
	icon_state = "hammercrowbar"
	icon = 'modular_bluemoon/fluffs/icons/obj/guns.dmi'
	lefthand_file = 'modular_bluemoon/fluffs/icons/mob/guns_left.dmi'
	righthand_file = 'modular_bluemoon/fluffs/icons/mob/guns_right.dmi'
	hitsound = "modular_bluemoon/fluffs/sound/weapon/stab_hammer.ogg"

/obj/item/modkit/hammercrowbar_kit
	name = "Heavy pocket hammer Kit"
	desc = "A modkit for making a Heavy crowbar into Heavy pocket hammer."
	product = /obj/item/crowbar/large/heavy/hammercrowbar
	fromitem = list(/obj/item/crowbar/large/heavy)
