/////////////////////////////////////////
/////////////////HUDs////////////////////
/////////////////////////////////////////

/datum/design/health_hud
	name = "Health Scanner HUD"
	desc = "A heads-up display that scans the humans in view and provides accurate data about their health status."
	id = "health_hud"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 500, /datum/material/glass = 500)
	build_path = /obj/item/clothing/glasses/hud/health
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_MEDICAL

/datum/design/health_hud_night
	name = "Night Vision Health Scanner HUD"
	desc = "An advanced medical head-up display that allows doctors to find patients in complete darkness."
	id = "health_hud_night"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 600, /datum/material/glass = 600, /datum/material/uranium = 1000, /datum/material/silver = 350)
	build_path = /obj/item/clothing/glasses/hud/health/night
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_MEDICAL

/datum/design/security_hud
	name = "Security HUD"
	desc = "A heads-up display that scans the humans in view and provides accurate data about their ID status."
	id = "security_hud"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 500, /datum/material/glass = 500)
	build_path = /obj/item/clothing/glasses/hud/security
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/security_hud_night
	name = "Night Vision Security HUD"
	desc = "A heads-up display which provides id data and vision in complete darkness."
	id = "security_hud_night"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 600, /datum/material/glass = 600, /datum/material/uranium = 1000, /datum/material/gold = 350)
	build_path = /obj/item/clothing/glasses/hud/security/night
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/diagnostic_hud
	name = "Diagnostic HUD"
	desc = "A HUD used to analyze and determine faults within robotic machinery."
	id = "diagnostic_hud"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 500, /datum/material/glass = 500)
	build_path = /obj/item/clothing/glasses/hud/diagnostic
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/diagnostic_hud_night
	name = "Night Vision Diagnostic HUD"
	desc = "Upgraded version of the diagnostic HUD designed to function during a power failure."
	id = "diagnostic_hud_night"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 600, /datum/material/glass = 600, /datum/material/uranium = 1000, /datum/material/plasma = 300)
	build_path = /obj/item/clothing/glasses/hud/diagnostic/night
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/sci_goggles
	name = "Science Goggles"
	desc = "Goggles fitted with a portable analyzer capable of determining the research worth of an item or components of a machine."
	id = "scigoggles"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 500, /datum/material/glass = 500)
	build_path = /obj/item/clothing/glasses/science
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/mesons
	name = "Optical Meson Scanners"
	desc = "Used by engineering and mining staff to see basic structural and terrain layouts through walls, regardless of lighting condition."
	id = "mesons"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 500, /datum/material/glass = 500)
	build_path = /obj/item/clothing/glasses/meson
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_CARGO | DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/engine_goggles
	name = "Engineering Scanner Goggles"
	desc = "Goggles used by engineers. The Meson Scanner mode lets you see basic structural and terrain layouts through walls, regardless of lighting condition. The T-ray Scanner mode lets you see underfloor objects such as cables and pipes."
	id = "engine_goggles"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 500, /datum/material/glass = 500, /datum/material/plasma = 100)
	build_path = /obj/item/clothing/glasses/meson/engine
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/tray_goggles
	name = "Optical T-Ray Scanners"
	desc = "Used by engineering staff to see underfloor objects such as cables and pipes."
	id = "tray_goggles"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 500, /datum/material/glass = 500)
	build_path = /obj/item/clothing/glasses/meson/engine/tray
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/nvgmesons
	name = "Night Vision Optical Meson Scanners"
	desc = "Prototype meson scanners fitted with an extra sensor which amplifies the visible light spectrum and overlays it to the UHD display."
	id = "nvgmesons"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 600, /datum/material/glass = 600, /datum/material/plasma = 350, /datum/material/uranium = 1000)
	build_path = /obj/item/clothing/glasses/meson/night
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_CARGO

/datum/design/night_vision_goggles
	name = "Night Vision Goggles"
	desc = "Goggles that let you see through darkness unhindered."
	id = "night_vision_goggles"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 600, /datum/material/glass = 600, /datum/material/plasma = 350, /datum/material/uranium = 1000)
	build_path = /obj/item/clothing/glasses/night
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE | DEPARTMENTAL_FLAG_SECURITY

/datum/design/prescription_kit
	name = "Prescription Lens Kit"
	desc = "A do-it-yourself kit that lets you add a prescription overlay to any HUDs or other eyewear. Even the ones that shouldn't."
	id = "prescription_kit"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 500, /datum/material/glass = 200, /datum/material/silver = 100) // silver because i guess all the prescription HUDs had it?
	build_path = /obj/item/prescription_kit
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_ALL

/////////////////////////////////////////
//////////////////Misc///////////////////
/////////////////////////////////////////

/datum/design/welding_mask
	name = "Welding Gas Mask"
	desc = "A gas mask with built in welding goggles and face shield. Looks like a skull, clearly designed by a nerd."
	id = "weldingmask"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 3000, /datum/material/glass = 1000)
	build_path = /obj/item/clothing/mask/gas/welding
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE | DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/bright_helmet
	name = "Workplace-Ready Firefighter Helmet"
	desc = "By applying state of the art lighting technology to a fire helmet with industry standard photo-chemical hardening methods, this hardhat will protect you from robust workplace hazards."
	id = "bright_helmet"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 4000, /datum/material/glass = 1000, /datum/material/plastic = 3000, /datum/material/silver = 500)
	build_path = /obj/item/clothing/head/hardhat/red/upgraded
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE | DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_SECURITY | DEPARTMENTAL_FLAG_CARGO

/datum/design/mauna_mug
	name = "Mauna Mug"
	desc = "This awesome mug will ensure your coffee never stays cold!"
	id = "mauna_mug"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 1000, /datum/material/glass = 100)
	build_path = /obj/item/reagent_containers/glass/maunamug
	category = list("Equipment")

/datum/design/rolling_table
	name = "Rolly poly"
	desc = "We duct-taped some wheels to the bottom of a table. It's goddamn science alright?"
	id = "rolling_table"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 4000)
	build_path = /obj/structure/table/rolling
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_ALL

/datum/design/portaseeder
	name = "Portable Seed Extractor"
	desc = "For the enterprising botanist on the go. Less efficient than the stationary model, it creates one seed per plant."
	id = "portaseeder"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 1000, /datum/material/glass = 400)
	build_path = /obj/item/storage/bag/plants/portaseeder
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SERVICE

/datum/design/emptybottle
	name = "Glass Bottle"
	desc = "A small, empty bottle for storing liquids."
	id = "emptyglassbottle"
	build_type = PROTOLATHE
	materials = list(/datum/material/glass = 400)
	build_path = /obj/item/reagent_containers/food/drinks/bottle/blank/small
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SERVICE

/datum/design/largeemptybottle
	name = "Large Glass Bottle"
	desc = "A large, empty bottle for storing liquids."
	id = "largeemptyglassbottle"
	build_type = PROTOLATHE
	materials = list(/datum/material/glass = 2000)
	build_path = /obj/item/reagent_containers/food/drinks/bottle/blank
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SERVICE

/datum/design/emptypitcher
	name = "Pitcher"
	desc = "A large Pitcher to hold vast amounts of liquid."
	id = "emptypitcher"
	build_type = PROTOLATHE
	materials = list(/datum/material/glass = 3600)
	build_path = /obj/item/reagent_containers/food/drinks/bottle/blank/pitcher
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SERVICE

/datum/design/air_horn
	name = "Air Horn"
	desc = "Damn son, where'd you find this?"
	id = "air_horn"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 4000, /datum/material/bananium = 1000)
	build_path = /obj/item/bikehorn/airhorn
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_ALL	//HONK!

/datum/design/magboots
	name = "Magnetic Boots"
	desc = "Magnetic boots, often used during extravehicular activity to ensure the user remains safely attached to the vehicle."
	id = "magboots"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 4500, /datum/material/silver = 1500, /datum/material/gold = 2500)
	build_path = /obj/item/clothing/shoes/magboots
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/sci_goggles
	name = "Science Goggles"
	desc = "Goggles fitted with a portable analyzer capable of determining the research worth of an item or components of a machine."
	id = "scigoggles"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 500, /datum/material/glass = 500)
	build_path = /obj/item/clothing/glasses/science
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/diskplantgene
	name = "Plant Data Disk"
	desc = "A disk for storing plant genetic data."
	id = "diskplantgene"
	build_type = PROTOLATHE | AUTOLATHE
	materials = list(/datum/material/iron=200, /datum/material/glass=100)
	build_path = /obj/item/disk/plantgene
	category = list("Electronics","Imported")
	departmental_flags = DEPARTMENTAL_FLAG_SERVICE

/datum/design/roastingstick
	name = "Advanced Roasting Stick"
	desc = "A roasting stick for cooking sausages in exotic ovens."
	id = "roastingstick"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron=1000, /datum/material/glass=500, /datum/material/bluespace = 250)
	build_path = /obj/item/melee/roastingstick
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SERVICE

/datum/design/locator
	name = "Bluespace Locator"
	desc = "Used to track portable teleportation beacons and targets with embedded tracking implants."
	id = "locator"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron=1000, /datum/material/glass=500, /datum/material/silver = 500)
	build_path = /obj/item/locator
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/donksoft_refill
	name = "Donksoft Toy Vendor Refill"
	desc = "A refill canister for Donksoft Toy Vendors."
	id = "donksoft_refill"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 25000, /datum/material/glass = 15000, /datum/material/plasma = 20000, /datum/material/gold = 10000, /datum/material/silver = 10000)
	build_path = /obj/item/vending_refill/donksoft
	category = list("Equipment")

/datum/design/eng_gloves
	name = "Tinkers Gloves"
	desc = "Overdesigned engineering gloves that have automated construction subroutines dialed in, allowing for faster construction while worn."
	id = "eng_gloves"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron=2000, /datum/material/silver=1500, /datum/material/gold = 1000)
	build_path = /obj/item/clothing/gloves/color/latex/engineering
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/lavarods
	name = "Lava-Resistant Metal Rods"
	id = "lava_rods"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron=1000, /datum/material/plasma=500, /datum/material/titanium=2000)
	build_path = /obj/item/stack/rods/lava
	category = list("initial", "Stock Parts")
	departmental_flags = DEPARTMENTAL_FLAG_CARGO | DEPARTMENTAL_FLAG_SCIENCE | DEPARTMENTAL_FLAG_ENGINEERING

/////////////////////////////////////////
////////////Janitor Designs//////////////
/////////////////////////////////////////

/datum/design/broom
	name = "Broom"
	desc = "Just your everyday standard broom."
	id = "broom"
	build_type = PROTOLATHE | AUTOLATHE
	materials = list(/datum/material/iron = 1000, /datum/material/glass = 600)
	build_path = /obj/item/broom
	category = list("initial", "Equipment", "Misc")
	departmental_flags = DEPARTMENTAL_FLAG_SERVICE

/datum/design/mop
	name = "Mop"
	desc = "Just your everyday standard mop."
	id = "mop"
	build_type = PROTOLATHE | AUTOLATHE
	materials = list(/datum/material/iron = 1200, /datum/material/glass = 100)
	build_path = /obj/item/mop
	category = list("initial", "Equipment", "Misc")
	departmental_flags = DEPARTMENTAL_FLAG_SERVICE

/datum/design/advmop
	name = "Advanced Mop"
	desc = "An upgraded mop with a large internal capacity for holding water or other cleaning chemicals."
	id = "advmop"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 2500, /datum/material/glass = 200)
	build_path = /obj/item/mop/advanced
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SERVICE

/datum/design/Dirtscanner
	name = "Dirt Scanner (Sniffer)"
	id = "dirtscanner"
	build_type = AUTOLATHE | PROTOLATHE
	materials = list(/datum/material/iron = 150)
	build_path = /obj/item/t_scanner/dirt_scanner
	category = list("initial", "Equipment", "Misc")
	departmental_flags = DEPARTMENTAL_FLAG_SERVICE

/datum/design/advbroom
	name = "Advanced Broom"
	desc = "Новейшая разработка отдела РнД. Позволяет вам эффективно подметать мусор, не вставая с кресла.."
	id = "advbroom"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 2500, /datum/material/glass = 200)
	build_path = /obj/item/gun/energy/broom
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SERVICE

/datum/design/light_replacer
	name = "Light Replacer"
	desc = "A device to automatically replace lights. Refill with working light bulbs."
	id = "light_replacer"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 1500, /datum/material/silver = 150, /datum/material/glass = 3000)
	build_path = /obj/item/lightreplacer
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SERVICE | DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/light_replacer_blue
	name = "Bluespace Light Replacer"
	desc = "A device to automatically replace lights at a distance. Refill with working light bulbs."
	id = "light_replacer_blue"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 1500, /datum/material/silver = 150, /datum/material/glass = 3000, /datum/material/bluespace = 300)
	build_path = /obj/item/lightreplacer/blue
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SERVICE | DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/normtrash
	name = "Trashbag"
	desc = "It's a bag for trash, you put garbage in it."
	id = "normtrash"
	build_type = PROTOLATHE
	materials = list(/datum/material/plastic = 2000)
	build_path = /obj/item/storage/bag/trash
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SERVICE

/datum/design/blutrash
	name = "Trashbag of Holding"
	desc = "An advanced trash bag with bluespace properties; capable of holding a plethora of garbage."
	id = "blutrash"
	build_type = PROTOLATHE
	materials = list(/datum/material/gold = 1500, /datum/material/uranium = 250, /datum/material/plasma = 1500)
	build_path = /obj/item/storage/bag/trash/bluespace
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SERVICE

/datum/design/buffer
	name = "(janicart) Floor Buffer Upgrade"
	desc = "A floor buffer that can be attached to vehicular janicarts."
	id = "buffer"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 3000, /datum/material/glass = 200)
	build_path = /obj/item/janicart_upgrade/buffer
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SERVICE

/datum/design/vacuum
	name = "(janicart) Vacuum upgrade"
	desc = "A vacuum that can be attached to vehicular janicarts."
	id = "vacuum"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 3000, /datum/material/glass = 200)
	build_path = /obj/item/janicart_upgrade/vacuum
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SERVICE

/datum/design/paint_remover
	name = "Paint Remover"
	desc = "Removes stains from the floor, and not much else."
	id = "paint_remover"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 1000)
	reagents_list = list(/datum/reagent/acetone = 60)
	build_path = /obj/item/paint/paint_remover
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SERVICE

/datum/design/spraybottle
	name = "Spray Bottle"
	desc = "A spray bottle, with an unscrewable top."
	id = "spraybottle"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 3000, /datum/material/glass = 200)
	build_path = /obj/item/reagent_containers/spray
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SERVICE

/datum/design/beartrap
	name = "Bear Trap"
	desc = "A trap used to catch space bears and other legged creatures."
	id = "beartrap"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 5000, /datum/material/titanium = 1000)
	build_path = /obj/item/restraints/legcuffs/beartrap
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SERVICE

/////////////////////////////////////////
////////////Holosign Designs/////////////
/////////////////////////////////////////

/datum/design/holosign
	name = "Holographic Sign Projector"
	desc = "A holograpic projector used to project various warning signs."
	id = "holosign"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 2000, /datum/material/glass = 1000)
	build_path = /obj/item/holosign_creator
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SERVICE

/datum/design/holosignsec
	name = "Security Holobarrier Projector"
	desc = "A holographic projector that creates holographic security barriers."
	id = "holosignsec"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 5000, /datum/material/glass = 1000, /datum/material/gold = 1000, /datum/material/silver = 1000)
	build_path = /obj/item/holosign_creator/security
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/holosignengi
	name = "Engineering Holobarrier Projector"
	desc = "A holographic projector that creates holographic engineering barriers."
	id = "holosignengi"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 5000, /datum/material/glass = 1000, /datum/material/gold = 1000, /datum/material/silver = 1000)
	build_path = /obj/item/holosign_creator/engineering
	category = list("Tool Designs")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/holosignatmos
	name = "ATMOS Holofan Projector"
	desc = "A holographic projector that creates holographic barriers that prevent changes in atmospheric conditions."
	id = "holosignatmos"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 5000, /datum/material/glass = 1000, /datum/material/gold = 1000, /datum/material/silver = 1000)
	build_path = /obj/item/holosign_creator/atmos
	category = list("Tool Designs")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING
/*
/datum/design/holosignfirelock
	name = "ATMOS Holofirelock Projector"
	desc = "A holographic projector that creates holographic barriers that prevent changes in temperature conditions."
	id = "holosignfirelock"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 5000, /datum/material/glass = 1000, /datum/material/gold = 1000, /datum/material/silver = 1000)
	build_path = /obj/item/holosign_creator/firelock
	category = list("Tool Designs")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING
*/
/datum/design/holosigncombifan
	name = "ATMOS Holo-Combifan Projector"
	desc = "A holographic projector that creates holographic barriers that prevent changes in atmospheric and temperature conditions."
	id = "holosigncombifan"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 7500, /datum/material/glass = 2500, /datum/material/silver = 2500, /datum/material/gold = 2500, /datum/material/titanium = 1750)
	build_path = /obj/item/holosign_creator/combifan
	category = list("Tool Designs")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/forcefield_projector
	name = "Forcefield Projector"
	desc = "A device which can project temporary forcefields to seal off an area."
	id = "forcefield_projector"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 2500, /datum/material/glass = 1000)
	build_path = /obj/item/forcefield_projector
	category = list("Tool Designs")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/holobarrier_med
	name = "PENLITE holobarrier projector"
	desc = "PENLITE holobarriers, a device that halts individuals with malicious diseases."
	build_type = PROTOLATHE
	build_path = /obj/item/holosign_creator/medical
	materials = list(/datum/material/iron = 500, /datum/material/glass = 500, /datum/material/silver = 100) //a hint of silver since it can troll 2 antags (bad viros and sentient disease)
	id = "holobarrier_med"
	category = list("Medical Designs")
	departmental_flags = DEPARTMENTAL_FLAG_MEDICAL

///////////////////////////////
////////////Tools//////////////
///////////////////////////////

/datum/design/quantum_keycard
	name = "Quantum Keycard"
	desc = "Allows for the construction of a quantum keycard."
	id = "quantum_keycard"
	build_type = PROTOLATHE
	materials = list(/datum/material/glass = 500, /datum/material/iron = 500, /datum/material/silver = 500, /datum/material/bluespace = 1000)
	build_path = /obj/item/quantum_keycard
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE | DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/anomaly_neutralizer
	name = "Anomaly Neutralizer"
	desc = "An advanced tool capable of instantly neutralizing anomalies, designed to capture the fleeting aberrations created by the engine."
	id = "anomaly_neutralizer"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 2000, /datum/material/gold = 2000, /datum/material/plasma = 5000, /datum/material/uranium = 2000)
	build_path = /obj/item/anomaly_neutralizer
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE | DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/pHmeter
	name = "Chemical Analyser"
	desc = "A a electrode attached to a small circuit box that will tell you the pH of a solution."
	id   = "pHmeter"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 1000, /datum/material/silver = 100, /datum/material/plastic = 100)
	build_path = /obj/item/fermichem/pHmeter
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_MEDICAL | DEPARTMENTAL_FLAG_SCIENCE

/////////////////////////////////////////
/////////////////Armour//////////////////
/////////////////////////////////////////

/datum/design/reactive_armour
	name = "Reactive Armour Shell"
	desc = "An experimental suit of armour capable of utilizing an implanted anomaly core to protect the user."
	id = "reactive_armour"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 10000, /datum/material/diamond = 5000, /datum/material/uranium = 8000, /datum/material/silver = 4500, /datum/material/gold = 5000)
	build_path = /obj/item/reactive_armour_shell
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE | DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/knight_armour
	name = "Knight Armour"
	desc = "A royal knight's favorite garments. Can be trimmed by any friendly person."
	id = "knight_armour"
	build_type = AUTOLATHE
	materials = list(MAT_CATEGORY_RIGID = 10000)
	build_path = /obj/item/clothing/suit/armor/riot/knight/greyscale
	category = list("Imported")

/datum/design/knight_helmet
	name = "Knight Helmet"
	desc = "A royal knight's favorite hat. If you hold it upside down it's actually a bucket."
	id = "knight_helmet"
	build_type = AUTOLATHE
	materials = list(MAT_CATEGORY_RIGID = 5000)
	build_path = /obj/item/clothing/head/helmet/knight/greyscale
	category = list("Imported")

/////////////////////////////////////////
/////////////Security////////////////////
/////////////////////////////////////////

/datum/design/seclite
	name = "Seclite"
	desc = "A robust flashlight used by security."
	id = "seclite"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 2500)
	build_path = /obj/item/flashlight/seclite
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/detective_scanner
	name = "Forensic Scanner"
	desc = "Used to remotely scan objects and biomass for DNA and fingerprints. Can print a report of the findings."
	id = "detective_scanner"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 5000, /datum/material/glass = 1000, /datum/material/gold = 2500, /datum/material/silver = 2000)
	build_path = /obj/item/detective_scanner
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/pepperspray
	name = "Pepper Spray"
	desc = "Manufactured by UhangInc, used to blind and down an opponent quickly. Printed pepper sprays do not contain reagents."
	id = "pepperspray"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 5000, /datum/material/glass = 1000)
	build_path = /obj/item/reagent_containers/spray/pepper/empty
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/bola_energy
	name = "Energy Bola"
	desc = "A specialized hard-light bola designed to ensnare fleeing criminals and aid in arrests."
	id = "bola_energy"
	build_type = PROTOLATHE
	materials = list(/datum/material/silver = 500, /datum/material/plasma = 500, /datum/material/titanium = 500)
	build_path = /obj/item/restraints/legcuffs/bola/energy
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/body_camera
	name = "Body Camera"
	desc = "A specialized camera to carry on your suit"
	id = "body_camera"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 1000, /datum/material/glass = 400, /datum/material/gold = 200)
	build_path = /obj/item/clothing/accessory/bodycamera
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/zipties
	name = "Zipties"
	desc = "Plastic, disposable zipties that can be used to restrain temporarily but are destroyed after use."
	id = "zipties"
	build_type = PROTOLATHE
	materials = list(/datum/material/plastic = 250)
	build_path = /obj/item/restraints/handcuffs/cable/zipties
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/evidencebag
	name = "Evidence Bag"
	desc = "An empty evidence bag."
	id = "evidencebag"
	build_type = PROTOLATHE
	materials = list(/datum/material/plastic = 100)
	build_path = /obj/item/evidencebag
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/////////////////////////////////////////
/////////////////Meteors/////////////////
/////////////////////////////////////////

/datum/design/meteor_defence
	name = "Meteor Defence"
	desc = "A blue print of a early model of the Meteor defence turret."
	id = "meteor_defence"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 50000, /datum/material/glass = 50000, /datum/material/silver = 8500, /datum/material/gold = 8500, /datum/material/titanium = 7500, /datum/material/uranium = 7500)
	build_path = /obj/machinery/satellite/meteor_shield/sci
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/meteor_disk
	name = "Meteor Defence Upgrade Disk"
	desc = "A disk containing debugging programming to solve and monitor meteors more effectively."
	id = "meteor_disk"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 1500, /datum/material/glass = 1500, /datum/material/silver = 2500, /datum/material/gold = 1000)
	build_path = /obj/item/disk/meteor
	category = list("Electronics")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/board/meteor_console
	name = "Computer Design (Meteor Satellite Console)"
	desc = "Allows for the construction of circuit boards used to build a new Meteor Satellite monitor console."
	id = "meteor_console"
	build_path = /obj/item/circuitboard/computer/sat_control
	category = list("Computer Boards")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING



/////////////////////////////////////////
////////////Tackle Gloves////////////////
/////////////////////////////////////////

/datum/design/tackle_dolphin
	name = "Dolphin Gloves"
	id = "tackle_dolphin"
	build_type = PROTOLATHE
	materials = list(/datum/material/plastic = 2500)
	build_path = /obj/item/clothing/gloves/tackler/dolphin
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/tackle_rocket
	name = "Rocket Gloves"
	id = "tackle_rocket"
	build_type = PROTOLATHE
	materials = list(/datum/material/plasma = 1000, /datum/material/plastic = 2000)
	build_path = /obj/item/clothing/gloves/tackler/rocket
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/////////////////////////////////////////
/////////////Internal Tanks//////////////
/////////////////////////////////////////

/datum/design/oxygen_tank
	name = "Oxygen Tank"
	desc = "An empty oxygen tank."
	id = "oxygen_tank"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 2000)
	build_path = /obj/item/tank/internals/oxygen/empty
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/plasma_tank
	name = "Plasma Tank"
	desc = "An empty plasma tank."
	id = "plasma_tank"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 2000)
	build_path = /obj/item/tank/internals/plasma/empty
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/emergency_oxygen
	name = "Emergency Oxygen Tank"
	desc = "A small emergency oxygen tank."
	id = "emergency_oxygen"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 1000)
	build_path = /obj/item/tank/internals/emergency_oxygen/empty
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/plasma_belt_tank
	name = "Plasmaman Belt Tank"
	desc = "A small tank of plasma for plasmamen."
	id = "plasmaman_tank_belt"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 1000)
	build_path = /obj/item/tank/internals/plasmaman/belt/empty
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/emergency_oxygen_engi
	name = "Engineering Emergency Oxygen Tank"
	desc = "An emergency oxygen tank for engineers."
	id = "emergency_oxygen_engi"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 1000)
	build_path = /obj/item/tank/internals/emergency_oxygen/engi/empty
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING

/////////////////////////////////////////
/////////////////Tape////////////////////
/////////////////////////////////////////

/datum/design/sticky_tape
	name = "Sticky Tape"
	id = "sticky_tape"
	build_type = PROTOLATHE
	materials = list(/datum/material/plastic = 500)
	build_path = /obj/item/stack/sticky_tape
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SERVICE

/datum/design/super_sticky_tape
	name = "Super Sticky Tape"
	id = "super_sticky_tape"
	build_type = PROTOLATHE
	materials = list(/datum/material/plastic = 3000)
	build_path = /obj/item/stack/sticky_tape/super
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SERVICE

/datum/design/pointy_tape
	name = "Pointy Tape"
	id = "pointy_tape"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 1500, /datum/material/plastic = 1000)
	build_path = /obj/item/stack/sticky_tape/pointy
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SERVICE

/////////////////////////////////////////
/////////////////Shuttle Upgrades////////
/////////////////////////////////////////

/datum/design/shuttle_speed_upgrade
	name = "Shuttle Route Optimisation Upgrade"
	desc = "A disk that allows for calculating shorter routes when inserted into a flight control console."
	id = "disk_shuttle_route"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 1000, /datum/material/glass = 1000)
	build_path = /obj/item/shuttle_route_optimisation
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE | DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/shuttle_speed_upgrade_hyper
	name = "Shuttle Bluespace Hyperlane Optimisation Upgrade"
	desc = "A disk that allows for calculating shorter routes when inserted into a flight control console. This one abuses bluespace hyperlanes for increased efficiency."
	id = "disk_shuttle_route_hyper"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 1000, /datum/material/glass = 1000)
	build_path = /obj/item/shuttle_route_optimisation/hyperlane
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE | DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/shuttle_speed_upgrade_void
	name = "Shuttle Voidspace Optimisation Upgrade"
	desc = "A disk that allows for calculating shorter routes when inserted into a flight control console. This one access voidspace for increased efficiency."
	id = "disk_shuttle_route_void"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 1000, /datum/material/glass = 1000)
	build_path = /obj/item/shuttle_route_optimisation/void
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE | DEPARTMENTAL_FLAG_ENGINEERING

// Ключи Связи для наушников.

/datum/design/encryptionkey_sec
	name = "Security Radio Encryption Key"
	desc = "An encryption key for a radio headset!"
	id = "encryptionkey_sec"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 1000, /datum/material/glass = 100)
	build_path = /obj/item/encryptionkey/headset_sec
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/encryptionkey_eng
	name = "Engineering Radio Encryption Key"
	desc = "An encryption key for a radio headset!"
	id = "encryptionkey_eng"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 1000, /datum/material/glass = 100)
	build_path = /obj/item/encryptionkey/headset_eng
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING

/datum/design/encryptionkey_med
	name = "Medical Radio Encryption Key"
	desc = "An encryption key for a radio headset!"
	id = "encryptionkey_med"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 1000, /datum/material/glass = 100)
	build_path = /obj/item/encryptionkey/headset_med
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_MEDICAL

/datum/design/encryptionkey_medsci
	name = "Medical Research Radio Encryption Key"
	desc = "An encryption key for a radio headset!"
	id = "encryptionkey_medsci"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 1000, /datum/material/glass = 100)
	build_path = /obj/item/encryptionkey/headset_medsci
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE | DEPARTMENTAL_FLAG_MEDICAL

/datum/design/encryptionkey_sci
	name = "Science Radio Encryption Key"
	desc = "An encryption key for a radio headset!"
	id = "encryptionkey_sci"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 1000, /datum/material/glass = 100)
	build_path = /obj/item/encryptionkey/headset_sci
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/encryptionkey_cargo
	name = "Сargo Radio Encryption Key"
	desc = "An encryption key for a radio headset!"
	id = "encryptionkey_cargo"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 1000, /datum/material/glass = 100)
	build_path = /obj/item/encryptionkey/headset_cargo
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_CARGO

/datum/design/encryptionkey_mining
	name = "Mining Radio Encryption Key"
	desc = "An encryption key for a radio headset!"
	id = "encryptionkey_mining"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 1000, /datum/material/glass = 100)
	build_path = /obj/item/encryptionkey/headset_mining
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_CARGO

/datum/design/encryptionkey_service
	name = "Service Radio Encryption Key"
	desc = "An encryption key for a radio headset!"
	id = "encryptionkey_service"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 1000, /datum/material/glass = 100)
	build_path = /obj/item/encryptionkey/headset_service
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SERVICE
