/mob/living/carbon/human/species/harpy
	race = /datum/species/harpy

/datum/species/harpy
	name = "Harpy"
	id = SPEC_ID_HARPY
	desc = "Harpies, or less ceremoniously known as 'magpies,' resemble the despised hollow-kin in appearance at first glance. \
	One would rightfully assume they are similar in nature- with accuracy even, much to the harpies' chagrin. \
	Harpies have been uplifted and reconnected to divinity by Eora, having developed culture of music and song which caught the attention of such a goddess. \
	Their songs and voices may be their own, or proud mimicking other voices they've heard with unnatural accuracy. \
	\
	Whilst harpies may fly, their freedom is weighed by corruption of fleshcrafting to this day. Complete open-air freedom is still foreign to them. \
	Harpies tend to live and gather in colonies at the tops of great sequoia forests and in nearby cliffs. Due to their laden flight, they must employ use of updrafts and proximity to large objects or structures to bolster their limited range and air-dancing performances. \
	Their serene songs and blissful music can be heard echoing far below, guiding travelers and thieves both to respite... or treasure. For as lifted into grace as they might be, these 'magpies' earn such a nickname from instinctual Matthiosan greed and love for anything that shines. \
	Yet if one can work past that distrust and compensate them well, harpies make for unparalleled couriers. \
	\
	Harpies and Feculents often find themselves in conflict, mirroring the quarrels of their patrons, whether of conscious faith or not."

	skin_tone_wording = "Heritage"
	default_color = "FFFFFF"

	species_traits = list(EYECOLOR, HAIR, FACEHAIR, LIPS, STUBBLE, OLDGREY)

	use_skintones = TRUE
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_MAGIC | MIRROR_PRIDE | RACE_SWAP | SLIME_EXTRACT

	limbs_icon_m = 'modular_causticcove/icons/roguetown/harpies/m/harpy.dmi'
	limbs_icon_f = 'modular_causticcove/icons/roguetown/harpies/f/harpy.dmi'

	soundpack_m = /datum/voicepack/male
	soundpack_f = /datum/voicepack/female

	offset_features = list(
		OFFSET_ID = list(0,1), OFFSET_GLOVES = list(0,1), OFFSET_WRISTS = list(0,1),\
		OFFSET_CLOAK = list(0,1), OFFSET_FACEMASK = list(0,1), OFFSET_HEAD = list(0,1), \
		OFFSET_FACE = list(0,1), OFFSET_BELT = list(0,1), OFFSET_BACK = list(0,1), \
		OFFSET_NECK = list(0,1), OFFSET_MOUTH = list(0,1), OFFSET_PANTS = list(0,1), \
		OFFSET_SHIRT = list(0,1), OFFSET_ARMOR = list(0,1), OFFSET_HANDS = list(0,1), OFFSET_UNDIES = list(0,1), \
		OFFSET_ID_F = list(0,-1), OFFSET_GLOVES_F = list(0,0), OFFSET_WRISTS_F = list(0,0), OFFSET_HANDS_F = list(0,0), \
		OFFSET_CLOAK_F = list(0,0), OFFSET_FACEMASK_F = list(0,-1), OFFSET_HEAD_F = list(0,-1), \
		OFFSET_FACE_F = list(0,-1), OFFSET_BELT_F = list(0,0), OFFSET_BACK_F = list(0,-1), \
		OFFSET_NECK_F = list(0,-1), OFFSET_MOUTH_F = list(0,-1), OFFSET_PANTS_F = list(0,0), \
		OFFSET_SHIRT_F = list(0,0), OFFSET_ARMOR_F = list(0,0), OFFSET_UNDIES_F = list(0,-1), \
		)

	race_bonus = list(STAT_STRENGTH = -4, STAT_PERCEPTION = 2, STAT_INTELLIGENCE = 1, STAT_CONSTITUTION = -4, STAT_ENDURANCE = 0, STAT_SPEED = 3, STAT_FORTUNE = 0)

	enflamed_icon = "widefire"

	organs = list(
		ORGAN_SLOT_BRAIN = /obj/item/organ/brain,
		ORGAN_SLOT_HEART = /obj/item/organ/heart,
		ORGAN_SLOT_LUNGS = /obj/item/organ/lungs,
		ORGAN_SLOT_EYES = /obj/item/organ/eyes,
		ORGAN_SLOT_EARS = /obj/item/organ/ears,
		ORGAN_SLOT_TONGUE = /obj/item/organ/tongue,
		ORGAN_SLOT_LIVER = /obj/item/organ/liver,
		ORGAN_SLOT_STOMACH = /obj/item/organ/stomach,
		ORGAN_SLOT_APPENDIX = /obj/item/organ/appendix,
		ORGAN_SLOT_VOICE = /obj/item/organ/vocal_cords/harpy,
		ORGAN_SLOT_TAIL = /obj/item/organ/tail,
	)

	bodypart_features = list(
		/datum/bodypart_feature/hair/head,
		/datum/bodypart_feature/hair/facial,
	)

	customizers = list(
		/datum/customizer/organ/eyes/humanoid,
		/datum/customizer/bodypart_feature/hair/head/humanoid,
		/datum/customizer/bodypart_feature/hair/facial/humanoid,
		/datum/customizer/bodypart_feature/accessory,
		/datum/customizer/bodypart_feature/face_detail,
		/datum/customizer/bodypart_feature/underwear,
		/datum/customizer/organ/tail/harpy,
		/datum/customizer/organ/wings/harpy,
		/datum/customizer/organ/testicles/anthro,
		/datum/customizer/organ/penis/anthro,
		/datum/customizer/organ/belly/animal,
		/datum/customizer/organ/butt/human,
		/datum/customizer/organ/breasts/animal,
		/datum/customizer/organ/vagina/anthro,
	)

	descriptor_choices = list(
		/datum/descriptor_choice/height,
		/datum/descriptor_choice/body,
		/datum/descriptor_choice/stature,
		/datum/descriptor_choice/face,
		/datum/descriptor_choice/face_exp,
		/datum/descriptor_choice/skin,
		/datum/descriptor_choice/voice,
		/datum/descriptor_choice/prominent_one_wild,
		/datum/descriptor_choice/prominent_two_wild,
		/datum/descriptor_choice/prominent_three_wild,
		/datum/descriptor_choice/prominent_four_wild,
	)

/datum/species/harpy/get_hairc_list()
	return sortList(list(
	"black - raven" = "1a1d21",
	"black - magpie" = "1d1b2b",

	"brown - hawk" = "201616",
	"brown - falcon" = "2b201b",

	"red - sparrow" = "2d1300",
	"red - robin" = "612929",
	"red - cardinal" = "822b2b",

	"grey - osprey" = "7c828a",

	"white - swan" = "d3d9e3",
	"white - egret" = "dee9ed",
	"white - owl" = "f4f4f4",

	"yellow - parakeet" = "d5ba7b",
	"yellow - goldfinch" = "c69b71",

	"pink - cockatoo" = "ead6e2",

	"blue - jay" = "a1b4d4"
	))

/datum/species/harpy/check_roundstart_eligible()
	return TRUE

/datum/species/harpy/qualifies_for_rank(rank, list/features)
	return TRUE

/datum/species/harpy/on_species_gain(mob/living/carbon/foreign, datum/species/old_species)
	..()
	foreign.AddComponent(/datum/component/abberant_eater, list(/obj/item/natural/worms) + typesof(/obj/item/seeds), TRUE)
	foreign.grant_language(/datum/language/common)

/datum/species/harpy/get_skin_list()
	return list(
		"Grenzelhoft" = SKIN_COLOR_GRENZELHOFT,
		"Hammerhold" = SKIN_COLOR_HAMMERHOLD,
		"Avar" = SKIN_COLOR_AVAR,
		"Rockhill" = SKIN_COLOR_ROCKHILL,
		"Otava" = SKIN_COLOR_OTAVA,
		"Etrusca" = SKIN_COLOR_ETRUSCA,
		"Gronn" = SKIN_COLOR_GRONN,
		"North Raneshen (Chorodiaki)" = SKIN_COLOR_GIZA,
		"West Raneshen (Vrdaqnan)" = SKIN_COLOR_SHALVISTINE,
		"East Raneshen (Nshkormh)" = SKIN_COLOR_LALVESTINE,
		"Naledi" = SKIN_COLOR_NALEDI,
		"Naledi South" = SKIN_COLOR_NALEDI_LIGHT,
		"Kazengun" = SKIN_COLOR_KAZENGUN,
	)
