SaveDataUpdater = {}
local This = SaveDataUpdater

This.UpdateFunctions = {}

function This:RegisterUpdateFunction(NewVersion, func)
	if self.UpdateFunctions[NewVersion] ~= nil then
		d("Set Master: Attempt to stomp save data updater version: " .. NewVersion)
		return
	end
	
	self.UpdateFunctions[NewVersion] = func
end

local function Update1(Options)
	-- Delete item database entries that are empty. A bug didn't delete them.
	local IsTableEmpty = SetMasterGlobal.IsTableEmpty
	
	for ItemId, ItemInfo in pairs(Options.ItemDatabase) do
	
		for OwnerName, OwnerInfo in pairs(ItemInfo) do
			if IsTableEmpty(OwnerInfo) then
				ItemInfo[OwnerName] = nil
			end
		end
	
		if IsTableEmpty(ItemInfo) then
			Options.ItemDatabase[ItemId] = nil
		end
	end
end
This:RegisterUpdateFunction(1, Update1)

function This:UpdateData()
	local Options = SetMasterOptions:GetOptions()
	
	local CurrentDataVersion = SetMasterGlobal.SaveDataVersion
	local OldDataVersion = Options.DataVersion or 0

	for VersionItr = OldDataVersion + 1, CurrentDataVersion do
		self.UpdateFunctions[VersionItr](Options)
	end
	
	SetMasterOptions:GetOptions().DataVersion = CurrentDataVersion
end