/turf/open/floor/iron
	icon_state = "floor"
	floor_tile = /obj/item/stack/tile/iron/base


/turf/open/floor/iron/examine(mob/user)
	. = ..()
	. += span_notice("There's a <b>small crack</b> on the edge of it.")


/turf/open/floor/iron/rust_heretic_act()
	if(prob(70))
		new /obj/effect/temp_visual/glowing_rune(src)
	ChangeTurf(/turf/open/floor/plating/rust)

/turf/open/floor/iron/update_icon_state()
	if(broken || burnt)
		return ..()
	icon_state = base_icon_state
	return ..()

/turf/open/floor/iron/smooth/edge
	icon_state = "floor_edge"
	base_icon_state = "floor_edge"
	floor_tile = /obj/item/stack/tile/iron/edge

/turf/open/floor/iron/smooth/half
	icon_state = "floor_half"
	base_icon_state = "floor_half"
	floor_tile = /obj/item/stack/tile/iron/half

/turf/open/floor/iron/smooth/corner
	icon_state = "floor_corner"
	base_icon_state = "floor_corner"
	floor_tile = /obj/item/stack/tile/iron/corner

/turf/open/floor/iron/smooth/large
	icon_state = "floor_large"
	base_icon_state = "floor_large"
	floor_tile = /obj/item/stack/tile/iron/large

/turf/open/floor/iron/textured
	icon_state = "textured"
	base_icon_state = "textured"
	floor_tile = /obj/item/stack/tile/iron/textured

/turf/open/floor/iron/textured/edge
	icon_state = "textured_edge"
	base_icon_state = "textured_edge"
	floor_tile = /obj/item/stack/tile/iron/textured_edge

/turf/open/floor/iron/textured/half
	icon_state = "textured_half"
	base_icon_state = "textured_half"
	floor_tile = /obj/item/stack/tile/iron/textured_half

/turf/open/floor/iron/textured/corner
	icon_state = "textured_corner"
	base_icon_state = "textured_corner"
	floor_tile = /obj/item/stack/tile/iron/textured_corner

/turf/open/floor/iron/textured/large
	icon_state = "textured_large"
	base_icon_state = "textured_large"
	floor_tile = /obj/item/stack/tile/iron/textured_large

/turf/open/floor/iron/smooth/small
	icon_state = "small"
	base_icon_state = "small"
	floor_tile = /obj/item/stack/tile/iron/small

/turf/open/floor/iron/smooth/diagonal
	icon_state = "diagonal"
	base_icon_state = "diagonal"
	floor_tile = /obj/item/stack/tile/iron/diagonal

/turf/open/floor/iron/smooth/herringbone
	icon_state = "herringbone"
	base_icon_state = "herringbone"
	floor_tile = /obj/item/stack/tile/iron/herringbone

/turf/open/floor/iron/dark
	icon_state = "darkfull"
	base_icon_state = "darkfull"
	floor_tile = /obj/item/stack/tile/iron/dark

/turf/open/floor/iron/dark/smooth/edge
	icon_state = "dark_edge"
	base_icon_state = "dark_edge"
	floor_tile = /obj/item/stack/tile/iron/dark/smooth_edge

/turf/open/floor/iron/dark/smooth/half
	icon_state = "dark_half"
	base_icon_state = "dark_half"
	floor_tile = /obj/item/stack/tile/iron/dark/smooth_half

/turf/open/floor/iron/dark/smooth/corner
	icon_state = "dark_corner"
	base_icon_state = "dark_corner"
	floor_tile = /obj/item/stack/tile/iron/dark/smooth_corner

/turf/open/floor/iron/dark/smooth/large
	icon_state = "dark_large"
	base_icon_state = "dark_large"
	floor_tile = /obj/item/stack/tile/iron/dark/smooth_large

/turf/open/floor/iron/dark/textured
	icon_state = "textured_dark"
	base_icon_state = "textured_dark"
	floor_tile = /obj/item/stack/tile/iron/dark/textured

/turf/open/floor/iron/dark/textured/edge
	icon_state = "textured_dark_edge"
	base_icon_state = "textured_dark_edge"
	floor_tile = /obj/item/stack/tile/iron/dark/textured_edge

/turf/open/floor/iron/dark/textured/half
	icon_state = "textured_dark_half"
	base_icon_state = "textured_dark_half"
	floor_tile = /obj/item/stack/tile/iron/dark/textured_half

/turf/open/floor/iron/dark/textured/corner
	icon_state = "textured_dark_corner"
	base_icon_state = "textured_dark_corner"
	floor_tile = /obj/item/stack/tile/iron/dark/textured_corner

/turf/open/floor/iron/dark/textured/large
	icon_state = "textured_dark_large"
	base_icon_state = "textured_dark_large"
	floor_tile = /obj/item/stack/tile/iron/dark/textured_large

/turf/open/floor/iron/dark/smooth/small
	icon_state = "dark_small"
	base_icon_state = "dark_small"
	floor_tile = /obj/item/stack/tile/iron/dark/small

/turf/open/floor/iron/dark/smooth/diagonal
	icon_state = "dark_diagonal"
	base_icon_state = "dark_diagonal"
	floor_tile = /obj/item/stack/tile/iron/dark/diagonal

/turf/open/floor/iron/dark/smooth/herringbone
	icon_state = "dark_herringbone"
	base_icon_state = "dark_herringbone"
	floor_tile = /obj/item/stack/tile/iron/dark/herringbone

/turf/open/floor/iron/white
	icon_state = "white"
	base_icon_state = "white"
	floor_tile = /obj/item/stack/tile/iron/white

/turf/open/floor/iron/white/smooth/edge
	icon_state = "white_edge"
	base_icon_state = "white_edge"
	floor_tile = /obj/item/stack/tile/iron/white/smooth_edge

/turf/open/floor/iron/white/smooth/half
	icon_state = "white_half"
	base_icon_state = "white_half"
	floor_tile = /obj/item/stack/tile/iron/white/smooth_half

/turf/open/floor/iron/white/smooth/corner
	icon_state = "white_corner"
	base_icon_state = "white_corner"
	floor_tile = /obj/item/stack/tile/iron/white/smooth_corner

/turf/open/floor/iron/white/smooth/large
	icon_state = "white_large"
	base_icon_state = "white_large"
	floor_tile = /obj/item/stack/tile/iron/white/smooth_large

/turf/open/floor/iron/white/textured
	icon_state = "textured_white"
	base_icon_state = "textured_white"
	floor_tile = /obj/item/stack/tile/iron/white/textured

/turf/open/floor/iron/white/textured/edge
	icon_state = "textured_white_edge"
	base_icon_state = "textured_white_edge"
	floor_tile = /obj/item/stack/tile/iron/white/textured_edge

/turf/open/floor/iron/white/textured/half
	icon_state = "textured_white_half"
	base_icon_state = "textured_white_half"
	floor_tile = /obj/item/stack/tile/iron/white/textured_half

/turf/open/floor/iron/white/textured/corner
	icon_state = "textured_white_corner"
	base_icon_state = "textured_white_corner"
	floor_tile = /obj/item/stack/tile/iron/white/textured_corner

/turf/open/floor/iron/white/textured/large
	icon_state = "textured_white_large"
	base_icon_state = "textured_white_large"
	floor_tile = /obj/item/stack/tile/iron/white/textured_large

/turf/open/floor/iron/white/smooth/small
	icon_state = "white_small"
	base_icon_state = "white_small"
	floor_tile = /obj/item/stack/tile/iron/white/small

/turf/open/floor/iron/white/smooth/diagonal
	icon_state = "white_diagonal"
	base_icon_state = "white_diagonal"
	floor_tile = /obj/item/stack/tile/iron/white/diagonal

/turf/open/floor/iron/white/smooth/herringbone
	icon_state = "white_herringbone"
	base_icon_state = "white_herringbone"
	floor_tile = /obj/item/stack/tile/iron/white/herringbone

/turf/open/floor/plasteel/smooth
	icon_state = "smooth"
	base_icon_state = "smooth"
	floor_tile = /obj/item/stack/tile/iron/smooth

/turf/open/floor/plasteel/smooth/edge
	icon_state = "smooth_edge"
	base_icon_state = "smooth_edge"
	floor_tile = /obj/item/stack/tile/iron/smooth_edge

/turf/open/floor/plasteel/smooth/half
	icon_state = "smooth_half"
	base_icon_state = "smooth_half"
	floor_tile = /obj/item/stack/tile/iron/smooth_half

/turf/open/floor/plasteel/smooth/corner
	icon_state = "smooth_corner"
	base_icon_state = "smooth_corner"
	floor_tile = /obj/item/stack/tile/iron/smooth_corner

/turf/open/floor/plasteel/smooth/large
	icon_state = "smooth_large"
	base_icon_state = "smooth_large"
	floor_tile = /obj/item/stack/tile/iron/smooth_large

/turf/open/floor/iron/terracotta
	icon_state = "terracotta"
	base_icon_state = "terracotta"
	floor_tile = /obj/item/stack/tile/iron/terracotta

/turf/open/floor/iron/terracotta/small
	icon_state = "terracotta_small"
	base_icon_state = "terracotta_small"
	floor_tile = /obj/item/stack/tile/iron/terracotta/small

/turf/open/floor/iron/terracotta/diagonal
	icon_state = "terracotta_diagonal"
	base_icon_state = "terracotta_diagonal"
	floor_tile = /obj/item/stack/tile/iron/terracotta/diagonal

/turf/open/floor/iron/terracotta/herringbone
	icon_state = "terracotta_herringbone"
	base_icon_state = "terracotta_herringbone"
	floor_tile = /obj/item/stack/tile/iron/terracotta/herringbone

/turf/open/floor/iron/kitchen
	icon_state = "kitchen"
	base_icon_state = "kitchen"
	floor_tile = /obj/item/stack/tile/iron/kitchen

/turf/open/floor/iron/kitchen/small
	icon_state = "kitchen_small"
	base_icon_state = "kitchen_small"
	floor_tile = /obj/item/stack/tile/iron/kitchen/small

/turf/open/floor/iron/kitchen/diagonal
	icon_state = "kitchen_diagonal"
	base_icon_state = "kitchen_diagonal"
	floor_tile = /obj/item/stack/tile/iron/kitchen/diagonal

/turf/open/floor/iron/kitchen/herringbone
	icon_state = "kitchen_herringbone"
	base_icon_state = "kitchen_herringbone"
	floor_tile = /obj/item/stack/tile/iron/kitchen/herringbone
