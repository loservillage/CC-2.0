GLOBAL_LIST_EMPTY(eora_conjurable_solid)

/obj/effect/proc_holder/spell/invoked/conjure_ingredient
	name = "Conjure Ingredient"
	desc = "Conjure an ingredient of your choice."
	invocation = "Eora, bless me with the means to provide!"
	req_items = list(/obj/item/clothing/neck/roguetown/psicross)
	recharge_time = 5 SECONDS
	warnie = "spellwarning"
	antimagic_allowed = FALSE
	cost = 1
	spell_tier = 1
	miracle = TRUE
	associated_skill = /datum/skill/magic/holy

/obj/effect/proc_holder/spell/invoked/conjure_ingredient/cast(list/targets, mob/living/user = usr)
	if(!ishuman(user))
		to_chat(user, "No?")
		return
	if(GLOB.eora_conjurable_solid.len == 0)
		populate_eora_conj_list()
	var/mob/living/carbon/human/caster = usr
	var/ingredient_choice = input(user, "Choose an ingredient", "Conjure Ingredient") as anything in GLOB.eora_conjurable_solid
	if(!ingredient_choice)
		return
	ingredient_choice = GLOB.eora_conjurable_solid[ingredient_choice]
	var/datum/eora_conjurable_solid/ing = new ingredient_choice()
	if(ing.cost > caster.devotion.devotion)
		to_chat(user, span_warning("As much as it pains Eora, she rejects your pleas for your lack of devotion."))
		return
	caster.devotion.devotion -= ing.cost
	var/obj/item/R = new ing.item_type(user.drop_location())
	user.put_in_hands(R)
	return TRUE

/proc/populate_eora_conj_list()
	var/list/datum/eora_conjurable_solid/subtypes = subtypesof(/datum/eora_conjurable_solid)
	for(var/i in subtypes)
		var/datum/eora_conjurable_solid/ithing = i
		GLOB.eora_conjurable_solid[ithing.name] = ithing


/datum/eora_conjurable_solid
	var/name
	var/item_type
	var/cost

///Foodstuffs
/datum/eora_conjurable_solid/salt
	name = "Salt (50)"
	item_type = /obj/item/reagent_containers/powder/salt
	cost = 50

/datum/eora_conjurable_solid/wheat
	name = "Wheat Grains (30)"
	item_type = /obj/item/reagent_containers/food/snacks/grown/wheat
	cost = 30

/datum/eora_conjurable_solid/oats
	name = "Oat Grains (30)"
	item_type = /obj/item/reagent_containers/food/snacks/grown/oat
	cost = 30

/datum/eora_conjurable_solid/garlick
	name = "Garlick (30)"
	item_type = /obj/item/reagent_containers/food/snacks/grown/garlick/rogue
	cost = 30

/datum/eora_conjurable_solid/meat
	name = "Meat (80)"
	item_type = /obj/item/reagent_containers/food/snacks/rogue/meat/steak
	cost = 80

/datum/eora_conjurable_solid/fishmince
	name = "Minced Fish (30)"
	item_type = /obj/item/reagent_containers/food/snacks/rogue/meat/mince/fish
	cost = 30

/datum/eora_conjurable_solid/poultry
	name = "Bird Meat (80)"
	item_type = /obj/item/reagent_containers/food/snacks/rogue/meat/poultry
	cost = 80

/datum/eora_conjurable_solid/rabbit
	name = "Cabbit Meat (50)"
	item_type = /obj/item/reagent_containers/food/snacks/rogue/meat/rabbit
	cost = 50

/datum/eora_conjurable_solid/egg
	name = "Egg (50)"
	item_type = /obj/item/reagent_containers/food/snacks/egg
	cost = 50

/datum/eora_conjurable_solid/fat
	name = "Fat (50)"
	item_type = /obj/item/reagent_containers/food/snacks/fat
	cost = 50

/datum/eora_conjurable_solid/tallow
	name = "Tallow (20)"
	item_type = /obj/item/reagent_containers/food/snacks/tallow
	cost = 20

/datum/eora_conjurable_solid/butter
	name = "Butter (130)"
	item_type = /obj/item/reagent_containers/food/snacks/butter
	cost = 130

/datum/eora_conjurable_solid/cheese
	name = "Cheese (50)"
	item_type = /obj/item/reagent_containers/food/snacks/rogue/cheese
	cost = 50

/datum/eora_conjurable_solid/onion
	name = "Onion (30)"
	item_type = /obj/item/reagent_containers/food/snacks/grown/onion/rogue
	cost = 30

/datum/eora_conjurable_solid/turnip
	name = "Turnip (30)"
	item_type = /obj/item/reagent_containers/food/snacks/grown/vegetable/turnip
	cost = 30

/datum/eora_conjurable_solid/cabbage
	name = "Cabbage (30)"
	item_type = /obj/item/reagent_containers/food/snacks/grown/cabbage/rogue
	cost = 30
	
/datum/eora_conjurable_solid/potato
	name = "Potato (30)"
	item_type = /obj/item/reagent_containers/food/snacks/grown/potato/rogue
	cost = 30

/datum/eora_conjurable_solid/rice
	name = "Rice (30)"
	item_type = /obj/item/reagent_containers/food/snacks/grown/rice
	cost = 30

/datum/eora_conjurable_solid/cucumber
	name = "Cucumber (30)"
	item_type = /obj/item/reagent_containers/food/snacks/grown/cucumber
	cost = 30

/datum/eora_conjurable_solid/eggplant
	name = "Eggplant (30)"
	item_type = /obj/item/reagent_containers/food/snacks/grown/eggplant
	cost = 30

/datum/eora_conjurable_solid/carrot
	name = "Carrot (30)"
	item_type = /obj/item/reagent_containers/food/snacks/grown/carrot
	cost = 30

/datum/eora_conjurable_solid/poppy
	name = "Poppy (40)"
	item_type = /obj/item/reagent_containers/food/snacks/grown/rogue/poppy
	cost = 40

/datum/eora_conjurable_solid/rocknut
	name = "Rocknut (40)"
	item_type = /obj/item/reagent_containers/food/snacks/grown/nut
	cost = 40

/datum/eora_conjurable_solid/sugarcane
	name = "Sugarcane (30)"
	item_type = /obj/item/reagent_containers/food/snacks/grown/sugarcane
	cost = 30

/datum/eora_conjurable_solid/coffee
	name = "Coffee Beans (30)"
	item_type = /obj/item/reagent_containers/food/snacks/grown/coffeebeans
	cost = 30

/datum/eora_conjurable_solid/tea
	name = "Dried Tea Leaves (30)"
	item_type = /obj/item/reagent_containers/food/snacks/grown/rogue/tealeaves_dry
	cost = 30
///Foodstuffs end

//Fruits

/datum/eora_conjurable_solid/apple
	name = "Apple (30)"
	item_type = /obj/item/reagent_containers/food/snacks/grown/apple
	cost = 30

/datum/eora_conjurable_solid/pear
	name = "Pear (30)"
	item_type = /obj/item/reagent_containers/food/snacks/grown/fruit/pear
	cost = 30

/datum/eora_conjurable_solid/lemon
	name = "Lemon (30)"
	item_type = /obj/item/reagent_containers/food/snacks/grown/fruit/lemon
	cost = 30

/datum/eora_conjurable_solid/lime
	name = "Lime (30)"
	item_type = /obj/item/reagent_containers/food/snacks/grown/fruit/lime
	cost = 30

/datum/eora_conjurable_solid/lime
	name = "Lime (30)"
	item_type = /obj/item/reagent_containers/food/snacks/grown/fruit/lime
	cost = 30

/datum/eora_conjurable_solid/tangerine
	name = "Tangerine (30)"
	item_type = /obj/item/reagent_containers/food/snacks/grown/fruit/tangerine
	cost = 30

/datum/eora_conjurable_solid/plum
	name = "Plum (30)"
	item_type = /obj/item/reagent_containers/food/snacks/grown/fruit/plum
	cost = 30

/datum/eora_conjurable_solid/strawberry
	name = "Strawberry (30)"
	item_type = /obj/item/reagent_containers/food/snacks/grown/fruit/strawberry
	cost = 30

/datum/eora_conjurable_solid/blackberry
	name = "Blackberry (30)"
	item_type = /obj/item/reagent_containers/food/snacks/grown/fruit/blackberry
	cost = 30

/datum/eora_conjurable_solid/raspberry
	name = "Raspberry (30)"
	item_type = /obj/item/reagent_containers/food/snacks/grown/fruit/raspberry
	cost = 30

/datum/eora_conjurable_solid/tomato
	name = "Tomato (30)"
	item_type = /obj/item/reagent_containers/food/snacks/grown/fruit/tomato
	cost = 30

/datum/eora_conjurable_solid/jacksberry
	name = "Jacksberries (30)"
	item_type = /obj/item/reagent_containers/food/snacks/grown/berries/rogue
	cost = 30
