// Слабый выстрел который станит
/obj/item/ammo_casing/energy/electrode/legax
	projectile_type = /obj/item/projectile/energy/electrode/security/hos/legax
	select_name = "weak gravpulse"
	fire_sound = 'modular_bluemoon/sound/weapons/gravpulser.ogg'
	e_cost = 25
	harmful = FALSE

/obj/item/projectile/energy/electrode/security/hos/legax
	name = "weak gravpulse"
	icon = 'icons/effects/cult_effects.dmi'
	icon_state = "rune4center"
	color = COLOR_BLUE_GRAY
	hitsound = 'modular_bluemoon/sound/weapons/gravcut.ogg'
	tracer_type = null
	muzzle_type = null
	impact_type = null

// Сильный выстрел который дамажит
/obj/item/ammo_casing/energy/bolt/legax
	projectile_type = /obj/item/projectile/energy/bolt/legax
	select_name = "heavy gravpulse"
	fire_sound = 'modular_bluemoon/sound/weapons/gravpulser_alt.ogg'
	e_cost = 50

/obj/item/projectile/energy/bolt/legax
	name = "heavy gravpulse"
	icon = 'icons/effects/cult_effects.dmi'
	icon_state = "rune4center"
	color = COLOR_MOSTLY_PURE_PINK
	hitsound = 'modular_bluemoon/sound/weapons/gravcut_alt.ogg'
	damage = 20
	damage_type = BRUTE
	nodamage = 0
	eyeblur = 0
	slur = 0
	knockdown = 0
	stamina = 5
	knockdown_stamoverride = 0
