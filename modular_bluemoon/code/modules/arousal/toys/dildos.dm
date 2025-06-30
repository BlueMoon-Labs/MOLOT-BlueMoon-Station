/obj/item/dildo/proc/update_lust()
    switch(dildo_size)
        if(5)
            lust_amount = HIGH_LUST*4
        if(4)
            lust_amount = HIGH_LUST*2
        if(3)
            lust_amount = HIGH_LUST
        if(2)
            lust_amount = NORMAL_LUST
        if(1)
            lust_amount = LOW_LUST
        // if some add bigger dildo
        else
            lust_amount = max(HIGH_LUST*dildo_size,LOW_LUST)

/obj/item/dildo/Initialize(mapload)
    . = ..()
    update_lust()

/obj/item/dildo/customize(mob/living/user)
    if(!..())
        return FALSE
    update_lust()
