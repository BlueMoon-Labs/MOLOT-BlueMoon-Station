/datum/uplink_item/mod
    category = "MOD"
    surplus = 0

/datum/uplink_item/mod/core //
	name = "InteQ MOD"
	desc = "A highly advanced combat suit,decorated with a sinister-looking dark blue colors, manufactured and crafted for special operations mercenaries. The design is a streamlined layered construction composed of molded plasteel and composite ceramics, while the undersuit is lined with lightweight kevlar and hybrid duratri weave. A small tag hangs on it that reads: Made by Fox and Ghost inc cooperation. All rights reserved, tampering with the suit's design will result in immediate suit annihilation."
	item = /obj/item/mod/control/pre_equipped/InteQ
	cost = 39
	purchasable_from = (UPLINK_NUKE_OPS | UPLINK_CLOWN_OPS)

/datum/uplink_item/mod/noslip //
	name = "MOD anti slip module"
	desc = "These are a modified variant of standard magnetic boots, utilizing piezoelectric crystals on the soles. \
		The two plates on the bottom of the boots automatically extend and magnetize as the user steps; \
		a pull that's too weak to offer them the ability to affix to a hull, but just strong enough to \
		protect against the fact that you didn't read the wet floor sign. Honk Co. has come out numerous times \
		in protest of these modules being legal"
	item = /obj/item/mod/module/noslip
	cost = 3
	purchasable_from = (UPLINK_NUKE_OPS | UPLINK_CLOWN_OPS)

/datum/uplink_item/mod/thermal //
	name = "MOD thermal visor module"
	desc = "A heads-up display installed into the visor of the suit. This uses a small IR scanner to detect and identify \
		the thermal radiation output of objects near the user. While it can detect the heat output of even something as \
		small as a rodent, it still produces irritating red overlay. They say these also let you see behind you."
	item = /obj/item/mod/module/visor/thermal
	cost = 3
	purchasable_from = (UPLINK_NUKE_OPS | UPLINK_CLOWN_OPS)

/datum/uplink_item/mod/emp_shield //
	name = "MOD advanced EMP shield module"
	desc = "An advanced field inhibitor installed into the suit, protecting it against feedback such as \
		electromagnetic pulses that would otherwise damage the electronic systems of the suit or electronic devices on the wearer, \
		including augmentations. However, it will take from the suit's power to do so."
	item = /obj/item/mod/module/emp_shield/advanced
	cost = 6
	purchasable_from = (UPLINK_NUKE_OPS | UPLINK_CLOWN_OPS)


