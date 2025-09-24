/mob/living/simple_animal/hostile/asteroid/elite/pandora/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/glory_kill, \
		messages_unarmed = list("хватает Пандору и закрывает её навсегда!"), \
		messages_crusher = list("рассекает шею Пандоры, отправляя её голову в свободный полёт!"), \
		messages_pka = list("стреляет в голову Пандоры до тех пор, пока та не закроется сама!"), \
		messages_pka_bayonet = list("многократно пронзает Пандору до тех пор, пока та не закроется обратно!"), \
		health_given = 50, \
		threshold = (maxHealth/10 * 0.625))
//at this point i'm legitimately tired i dont care aaaaaaaaaaa // so true
