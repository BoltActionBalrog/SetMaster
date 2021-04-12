SetMasterOptions = SetMasterOptions or {}
local This = SetMasterOptions

This.Saved = This.Saved or {}

This.Defaults = This.Defaults or {}

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

local Options = {
	[1] = {
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
	[2] = {
		type = "submenu",
		name = "Character Data",
		tooltip = "Managed the saved inventory data of each of your characters.",
		controls = {
			-- Populated dynamically
		}
	}
}

local function ConstructCharacterSubmenuEntry(CharacterData)
	
end

function This:Initialize()
	local Defaults = self.Defaults
	Defaults.bColorBlind = false
	Defaults.bSmartAnchored = true
	Defaults.ItemDatabase = {}
	Defaults.Characters = {}
	
	self.Saved = ZO_SavedVars:NewAccountWide("SetMasterSavedOptions", SetMasterGlobal.SaveDataVersion, nil, self.Defaults)
end

function This:Finalize()
	local AddonMenu = LibAddonMenu2
	AddonMenu:RegisterAddonPanel(NameLocalized, Panel)
	AddonMenu:RegisterOptionControls(NameLocalized, Options)
end