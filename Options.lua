SetMasterOptions = SetMasterOptions or {}
local This = SetMasterOptions

This.Saved = This.Saved or {}

This.Defaults = This.Defaults or {}

local NoDataColor = "d64022"

function This:GetOptions()
	return self.Saved
end

local Localize = SetMasterGlobal.Localize

-- Localization cache
local NameLocalized = Localize("Meta", "Name")

local Panel = {
	type = "panel",
	name = NameLocalized,
	displayName = NameLocalized,
	author = "Bolt-Action Balrog",
	version = SetMasterGlobal.Version,
	slashCommand = "/setmaster",
	registerForRefresh = "false",
	registerForDefaults = "false"
}

local OptionIndicies = {
	Colorblind = 1,
	CharacterData = 2
}

local Options = {
	[OptionIndicies.Colorblind] = {
		type = "checkbox",
		name = Localize("Options", "Colorblind", "Name"),
		tooltip = Localize("Options", "Colorblind", "Tooltip"),
		getFunc = function()
			return This.Saved.bColorBlind
		end,
		setFunc = function(bValue)
			This.Saved.bColorBlind = bValue
		end,
		width = "full"
	},
	[OptionIndicies.CharacterData] = {
		type = "submenu",
		name = "Character Data",
		tooltip = "Managed the saved inventory data of each of your characters.",
		controls = {
			-- Populated dynamically
		}
	}
}

function This:Initialize()
	local Defaults = self.Defaults
	Defaults.bColorBlind = false
	Defaults.bSmartAnchored = true
	Defaults.ItemDatabase = {}
	Defaults.Characters = {}
	
	self.Saved = ZO_SavedVars:NewAccountWide("SetMasterSavedOptions", SetMasterGlobal.SaveDataVersion, nil, self.Defaults)
end

local function GetCharacterBagUsed(CharacterData, BagId)
	return PlayerSetDatabase.IsCharacterBagIgnored(CharacterData, BagId) == false
end

local function SetCharacterBagUsed(CharacterData, BagId, bUseBag)
	if bUseBag == true then
		CharacterData.IgnoredBags[BagId] = nil
	else
		CharacterData.IgnoredBags[BagId] = true
	end
end

local function CreateCharacterMenuEntry(CharacterIndex, CharacterData, CharacterSubmenuControls)
	table.insert(CharacterSubmenuControls, {
			type = "header",
			name = PlayerSetDatabase.GetCharacterName(CharacterData),
			width = "full",
		})
	table.insert(CharacterSubmenuControls, {
			type = "description",
			title = nil,
			text = (function() 
				local DateScanned = CharacterData.DateScanned
				if DateScanned == nil then
					return "|c" .. NoDataColor .. "No data! Login to this character to load bag data.|"
				end
				return "Date scanned: " .. DateScanned
			end)(),
			width = "full",
		})
	table.insert(CharacterSubmenuControls, {
		type = "checkbox",
		name = "Equipped",
		tooltip = "Display items equipped this character.",
		getFunc = function() 
			return GetCharacterBagUsed(CharacterData, BAG_WORN)
		end,
		setFunc = function(Value) 
			SetCharacterBagUsed(CharacterData, BAG_WORN, Value)
		end,
		width = "half",
	})
	table.insert(CharacterSubmenuControls, {
		type = "checkbox",
		name = "Backpack",
		tooltip = "Display items in this character's backpack",
		getFunc = function() 
			return GetCharacterBagUsed(CharacterData, BAG_BACKPACK)
		end,
		setFunc = function(Value) 
			SetCharacterBagUsed(CharacterData, BAG_BACKPACK, Value)
		end,
		width = "half",
	})
end

function This:Finalize()
	local Characters = PlayerSetDatabase.Characters
	local CharacterDataSubmenu = Options[OptionIndicies.CharacterData]
	
	-- Sort characters by character id so there's a deterministic ordering in the menu
	local CharacterIds = {}
	for CharacterId, CharacterData in pairs(Characters) do
		table.insert(CharacterIds, CharacterId)
	end
	table.sort(CharacterIds, function(a, b) 
		return tonumber(a) < tonumber(b)
	end)
	
	for _, CharacterId in ipairs(CharacterIds) do
		local CharacterData = Characters[CharacterId]
		CreateCharacterMenuEntry(CharacterId, CharacterData, CharacterDataSubmenu.controls)
	end

	local AddonMenu = LibAddonMenu2
	AddonMenu:RegisterAddonPanel(NameLocalized, Panel)
	AddonMenu:RegisterOptionControls(NameLocalized, Options)
end













