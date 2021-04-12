local Localization = {
	Meta = 
	{
		Name = "Set Master"
	},
	Options = 
	{
		Colorblind = 
		{
			Name = "Colorblind Mode",
			Tooltip = "Enable if you are colorblind or have trouble distinguishing colors"
		}
	},
	SetOwnership = 
	{
		UniqueSlots = "Unique Slots:"
	},
	OwnerName = 
	{
		Account = "Account",
		House = "House Storage"
	},
	Weight = 
	{
		HeavyAbbreviation = "H",
		MediumAbbreviation = "M",
		LightAbbreviation = "L"
	},
	MeleeWeaponTypes = 
	{
		AxeAbbreviation = "A",
		HammerAbbreviation = "M",
		SwordAbbreviation= "S"
	},
	DestructionStaffWeaponTypes = 
	{
		FireAbbreviation = "F",
		FrostAbbreviation = "I",
		LightningAbbreviation= "L"
	},
	Tooltip = 
	{
		EnableSmartAnchor = "Enable smart anchor",
		DisableSmartAnchor = "Disable smart anchor",
		Close = "Close"
	},
	BagName = {},
	TraitName = {},
	QualityName = {}
}

Localization.BagName[BAG_BACKPACK] = "Backpack"
Localization.BagName[BAG_WORN] = "Equipped"
Localization.BagName[BAG_BANK] = "Bank"
Localization.BagName[BAG_SUBSCRIBER_BANK] = Localization.BagName[BAG_BANK]
Localization.BagName[BAG_GUILDBANK] = "Guild Bank"
Localization.BagName[BAG_HOUSE_BANK_ONE] = "House 1"
Localization.BagName[BAG_HOUSE_BANK_TWO] = "House 2"
Localization.BagName[BAG_HOUSE_BANK_THREE] = "House 3"
Localization.BagName[BAG_HOUSE_BANK_FOUR] = "House 4"
Localization.BagName[BAG_HOUSE_BANK_FIVE] = "House 5"
Localization.BagName[BAG_HOUSE_BANK_SIX] = "House 6"
Localization.BagName[BAG_HOUSE_BANK_SEVEN] = "House 7"
Localization.BagName[BAG_HOUSE_BANK_EIGHT] = "House 8"
Localization.BagName[BAG_HOUSE_BANK_NINE] = "House 9"
Localization.BagName[BAG_HOUSE_BANK_TEN] = "House 10"



Localization.TraitName[ITEM_TRAIT_TYPE_NONE] = "No Trait"

Localization.TraitName[ITEM_TRAIT_TYPE_ARMOR_STURDY] = "Sturdy"
Localization.TraitName[ITEM_TRAIT_TYPE_ARMOR_IMPENETRABLE] = "Impenetrable"
Localization.TraitName[ITEM_TRAIT_TYPE_ARMOR_REINFORCED] = "Reinforced"
Localization.TraitName[ITEM_TRAIT_TYPE_ARMOR_WELL_FITTED] = "Well-Fitted"
Localization.TraitName[ITEM_TRAIT_TYPE_ARMOR_TRAINING] = "Training"
Localization.TraitName[ITEM_TRAIT_TYPE_ARMOR_INFUSED] = "Infused"
Localization.TraitName[ITEM_TRAIT_TYPE_ARMOR_PROSPEROUS] = "Invigorating"
Localization.TraitName[ITEM_TRAIT_TYPE_ARMOR_DIVINES] = "Divines"
Localization.TraitName[ITEM_TRAIT_TYPE_ARMOR_NIRNHONED] = "Nirnhoned"

Localization.TraitName[ITEM_TRAIT_TYPE_JEWELRY_ARCANE] = "Arcane"
Localization.TraitName[ITEM_TRAIT_TYPE_JEWELRY_HEALTHY] = "Healthy"
Localization.TraitName[ITEM_TRAIT_TYPE_JEWELRY_ROBUST] = "Robust"
Localization.TraitName[ITEM_TRAIT_TYPE_JEWELRY_TRIUNE] = "Triune"
Localization.TraitName[ITEM_TRAIT_TYPE_JEWELRY_INFUSED] = "Infused"
Localization.TraitName[ITEM_TRAIT_TYPE_JEWELRY_PROTECTIVE] = "Protective"
Localization.TraitName[ITEM_TRAIT_TYPE_JEWELRY_SWIFT] = "Swift"
Localization.TraitName[ITEM_TRAIT_TYPE_JEWELRY_HARMONY] = "Harmony"
Localization.TraitName[ITEM_TRAIT_TYPE_JEWELRY_BLOODTHIRSTY] = "Bloodthirsty"

Localization.TraitName[ITEM_TRAIT_TYPE_WEAPON_POWERED] = "Powered"
Localization.TraitName[ITEM_TRAIT_TYPE_WEAPON_CHARGED] = "Charged"
Localization.TraitName[ITEM_TRAIT_TYPE_WEAPON_PRECISE] = "Precise"
Localization.TraitName[ITEM_TRAIT_TYPE_WEAPON_INFUSED] = "Infused"
Localization.TraitName[ITEM_TRAIT_TYPE_WEAPON_DEFENDING] = "Defending"
Localization.TraitName[ITEM_TRAIT_TYPE_WEAPON_TRAINING] = "Training"
Localization.TraitName[ITEM_TRAIT_TYPE_WEAPON_SHARPENED] = "Sharpened"
Localization.TraitName[ITEM_TRAIT_TYPE_WEAPON_DECISIVE] = "Decisive"
Localization.TraitName[ITEM_TRAIT_TYPE_WEAPON_NIRNHONED] = "Nirnhoned"



Localization.QualityName[ITEM_QUALITY_NORMAL] = "Normal"
Localization.QualityName[ITEM_QUALITY_MAGIC] = "Fine"
Localization.QualityName[ITEM_QUALITY_ARCANE] = "Superior"
Localization.QualityName[ITEM_QUALITY_ARTIFACT] = "Epic"
Localization.QualityName[ITEM_QUALITY_LEGENDARY] = "Legendary"
		
SetMasterGlobal.SetLocalizationTable(Localization)