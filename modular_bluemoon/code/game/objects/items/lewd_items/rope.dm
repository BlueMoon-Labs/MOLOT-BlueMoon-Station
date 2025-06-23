/obj/item/restraints/bondage_rope/CtrlClick(mob/living/user)
	. = ..()
	if(!istype(user) || !user.canUseTopic(src, BE_CLOSE, FALSE, NO_TK))
		return
	customize_rope_length(user)
	return TRUE

/obj/item/restraints/bondage_rope/proc/customize_rope_length(mob/living/user)
	if(user == roped_mob)
		to_chat(user, "<span class='warning'>You can't customize rope that restraints you.</span>")
		return

	if(src && !user.incapacitated() && in_range(user, src))
		var/N = input("Set rope length (0-2):","Set rope length") as null|num
		if(src && isnum(N) && !user.incapacitated() && in_range(user,src))
			N = floor(N)
			N = clamp(N, 0, ROPE_MAX_DISTANCE_MASTER)
			rope_length = N
			to_chat(usr, "<span class='notice'>Rope length is now [rope_length].</span>")
