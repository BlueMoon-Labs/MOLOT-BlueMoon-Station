/datum/quirk/onelife
	name = "Одна Жизнь"
	desc = "С вас буквально сыпется песок. И... кажется, если вы погибнете (даже если это будет шуткой) - никто этот песок собрать воедино больше не сможет."
	mob_trait = TRAIT_ONELIFE
	value = -6
	gain_text = "<span class='danger'>Вы чувствуете, что вам нельзя умирать.</span>"
	lose_text = "<span class='notice'>Жизнь для вас снова ничто.</span>" //if only it were that easy!
	medical_record_text = "Пациент не сможет восстановиться после смерти."
	processing_quirk = TRUE

/datum/quirk/onelife/add()
	RegisterSignal(quirk_holder, COMSIG_MOB_DEATH, PROC_REF(get_rid_of_them))
	RegisterSignal(quirk_holder, COMSIG_MOB_EMOTE, PROC_REF(get_rid_of_them_emote))

/datum/quirk/onelife/remove()
	remove_signals()

/datum/quirk/onelife/proc/remove_signals()
	if(!QDELETED(quirk_holder))
		UnregisterSignal(quirk_holder, list(COMSIG_MOB_DEATH, COMSIG_MOB_EMOTE))

/datum/quirk/onelife/proc/get_rid_of_them(mob/user, datum/emote/emote)
	if(quirk_holder.stat == DEAD)
		remove_signals()
		quirk_holder.dust(TRUE, TRUE)

/datum/quirk/onelife/proc/get_rid_of_them_emote(mob/user, datum/emote/emote)
	var/key = emote.key
	if(key == "deathgasp")
		remove_signals()
		quirk_holder.dust(TRUE, TRUE)
