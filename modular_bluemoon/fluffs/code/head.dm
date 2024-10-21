/obj/item/clothing/head/donator/bm
	icon = 'modular_bluemoon/fluffs/icons/obj/clothing/hats.dmi'
	mob_overlay_icon = 'modular_bluemoon/fluffs/icons/mob/clothing/hats.dmi'

/obj/item/clothing/head/donator/bm/pt_crown
	name = "Crown of Pure Tyranny"
	desc = "Корона, выполненная из оникса и обсидиана, украшенная прекрасным зелёным камнем и воплощающая самое потаённое зло и ненависть, заложенные в ней. Должно быть, кто-то действительно постарался ради её создания, как и носитель, сохранивший её. Она кажется до жути знакомой."
	icon_state = "pt_crown"
	item_state = "jackboots"

/obj/item/clothing/head/donator/bm/bishop_mitre
	name = "GPC Mitre"
	desc = "Один из символов Серой Постхристианской церкви. Внушает власть и уважение одним лишь своим видом."
	icon_state = "tall_mitre"
	item_state = "balaclava"

/obj/item/clothing/head/donator/bm/blueflame
	name = "horns of blue flame"
	desc = "It's horns of blue flame. A brightly glowing hologram that looks like fire, as if someone turned on the welding."
	icon_state = "blueflame"
	item_state = "jackboots"

/obj/item/clothing/head/donator/bm/cerberus_helmet
	name = "cerberus helmet"
	desc = "Шлем-маска напоминающая собачью голову с красными глазами. Она кажется вам знакомой и навевает страх. От неё пахнет тухлым мясом, от чего кружится голова. И как её вообще носят на голове..?"
	icon_state = "cerberushelm"
	item_state = "cerberushelm"
	flags_inv = HIDEFACIALHAIR|HIDEFACE|HIDEEYES|HIDEEARS|HIDEHAIR
	actions_types = list(/datum/action/item_action/cerberbark)

/datum/action/item_action/cerberbark
	name = "BARK!"

/obj/item/clothing/head/donator/bm/cerberus_helmet/verb/cerberbark()
	set category = "Object"
	set name = "BARK!"
	set src in usr
	if(!isliving(usr))
		return
	if(!can_use(usr))
		return

	var/frase
	frase = input("Какую фразу вы хотите сказать через преобразователь в шлеме?","") as text

	if(frase)
		usr.audible_message("[usr] barks, <font color='red' size='4'><b>[frase]</b></font>")
		playsound(src.loc, 'modular_bluemoon/fluffs/sound/bark.ogg', 100, 1)

/obj/item/clothing/head/donator/bm/cerberus_helmet/ui_action_click(mob/user, action)
	if(istype(action, /datum/action/item_action/cerberbark))
		cerberbark()

/obj/item/clothing/head/helmet/space/plasmaman/security/reaper
	name = "Security Plasma Envirosuit Helmet"
	desc = "Plasmaman Envirohelmet. Has red markings and reinforced with some composite materials."
	icon = 'modular_bluemoon/fluffs/icons/obj/clothing/hats.dmi'
	mob_overlay_icon = 'modular_bluemoon/fluffs/icons/mob/clothing/hats.dmi'
	icon_state = "pluto_enviro"

/obj/item/clothing/head/donator/bm/flektarn_beret
	name = "flektarn beret"
	desc = "Five-color, -explosive- beret in camouflage colors with a golden badge."
	icon_state = "flektarn_beret"
	item_state = "flektarn_beret"

/obj/item/clothing/head/donator/bm/nri_drg_head // civil version of nri antagonist beret
	name = "covet ops headgear"
	desc = "A special headger containing unknown fibers and electronics, providing the NVG effect for it's user. Formerly."
	icon_state = "nri_drg_ushanka"
	item_state = "nri_drg_ushanka"
	icon = 'modular_bluemoon/kovac_shitcode/icons/rus/obj_drg.dmi'
	mob_overlay_icon = 'modular_bluemoon/kovac_shitcode/icons/rus/mob_drg.dmi'
	unique_reskin = list(
		"Ushanka" = list("icon_state" = "nri_drg_ushanka"),
		"Beret" = list("icon_state" = "nri_drg_beret")
	)

/obj/item/modkit/tagilla
	name = "Tagilla Kit"
	desc = "A modkit for making a Welding helmet into a Tagilla welding helmet."
	product = /obj/item/clothing/head/welding/tagilla
	fromitem = list(/obj/item/clothing/head/welding)

/obj/item/clothing/head/welding/tagilla
	name = "Provocateur welding Helmet"
	desc = "На вид обычная сварочная маска разрисованная с лицевой стороны,особенно выделяется надпись «Убей» под визором."
	icon_state = "provocateur"
	item_state = "provocateur"
	icon = 'modular_bluemoon/fluffs/icons/obj/clothing/hats.dmi'
	mob_overlay_icon = 'modular_bluemoon/fluffs/icons/mob/clothing/hats.dmi'

/obj/item/clothing/head/HoS/dread_helmet
	name = "Шлем Судьи"
	desc = "Стандартный шлем судьи из Мега-Города Солнечной Федерации. Оснащен слоем кевлара и других материалов что защищают голову и визор что защищает от осколков и вспышек. Имеет встроенный микрофон с динамиком в который непонятно почему вам так и хочется сказать Я! ЗАКОН!"
	icon_state = "dread_helmet"
	item_state = "dread_helmet"
	icon = 'modular_bluemoon/fluffs/icons/obj/clothing/hats.dmi'
	mob_overlay_icon = 'modular_bluemoon/fluffs/icons/mob/clothing/hats.dmi'
	flags_cover = HEADCOVERSEYES
	flags_inv = HIDEHAIR|HIDEEARS|HIDESNOUT
