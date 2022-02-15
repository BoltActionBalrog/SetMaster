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
	
	-- The megaserver key didn't exist yet. Access the db directly
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

local function Update2(Options)
	local OldCharacters = Options.Characters
	
	local CurrentCharacters = {} -- Id -> Name
	for CharacterIndex in SetMasterGlobal.Range(1, GetNumCharacters()) do
		local CurrentName, _, _, _, _, _, CurrentCharacterId, _ = GetCharacterInfo(CharacterIndex)
		
		CurrentCharacters[CurrentCharacterId] = CurrentName
	end
	
	for CharacterId, CharacterData in pairs(OldCharacters) do
		local NewCharacterName = CurrentCharacters[CharacterId]
		if NewCharacterName == nil
				or NewCharacterName ~= CharacterData.Name then
			-- A character was either deleted, renamed, or belongs to another megaserver.
			-- We have to wipe the database because we can't know which one.
			Options.ItemDatabase = {}
			Options.Characters = {}
			return
		end
	end

	-- Place the current megaserver's name as a key at the root of the item database.
	local MegaserverName = GetWorldName()
	local TransferTable = {}
	for ItemId, OwnerInfo in pairs(Options.ItemDatabase) do
		TransferTable[ItemId] = OwnerInfo
	end
	
	Options.ItemDatabase = {}
	Options.ItemDatabase[MegaserverName] = TransferTable
end
This:RegisterUpdateFunction(2, Update2)

function This:UpdateData()
	local Options = SetMasterOptions:GetOptions()
	
	local CurrentDataVersion = SetMasterGlobal.DataVersion
	local OldDataVersion = Options.DataVersion or 0

	for VersionItr in SetMasterGlobal.Range(OldDataVersion + 1, CurrentDataVersion) do
		self.UpdateFunctions[VersionItr](Options)
	end
	
	Options.DataVersion = CurrentDataVersion
end