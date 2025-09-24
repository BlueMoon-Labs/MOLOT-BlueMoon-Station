/mob/living/simple_animal/hostile/asteroid/elite/legionnaire/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/glory_kill, \
		messages_unarmed = list("хватает Легионнера за череп и избивает его им же, пока тот не рассыпется на кости!"), \
		messages_crusher = list("отсекает ноги Легионнера одним взмахом крашера, после чего вонзает рукоятку в его злобный череп!"), \
		messages_pka = list("отстреливает череп Легионнера, что разрывается на тысячу осколков, после чего завершает всё выстрелом в рёбра, также взрывая их!"), \
		messages_pka_bayonet = list("втыкает свой нож в череп Легионнера, которым же и добили оставшуюся часть тела до праха!"), \
		health_given = 50, \
		threshold = (maxHealth/10 * 0.625))
