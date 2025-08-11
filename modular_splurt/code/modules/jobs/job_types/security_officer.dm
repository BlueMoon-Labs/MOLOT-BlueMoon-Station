/datum/outfit/job/security/New()
    . = ..()
    suit_store = /obj/item/gun/energy/e_gun/advtaser
    backpack_contents += list(/obj/item/gun/ballistic/automatic/pistol/enforcer/nomag=1, \
                            /obj/item/ammo_box/magazine/e45/taser=3)
