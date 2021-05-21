-----------------------------------------------------------------------------------|
-----------------------------|Created by Syn|-------------------------------|
-----------------------------------------------------------------------------------|

local AIO = AIO or require("AIO")

local MyHandlers = AIO.AddHandlers("ChooseDifficulty", {})

function DMOCC(event, player)
	local playerGUID = player:GetGUIDLow()
	CharDBQuery("INSERT INTO `character_difficulty_mode` (`playerGUID`, `ActiveDifficultyMode`) VALUES ("..playerGUID..", 1);")
end

function DMOCD(event, guid)
	CharDBQuery("DELETE FROM character_difficulty_mode WHERE playerGUID = "..guid.."")
end

function DMOL(event, player)
	local playerGUID = player:GetGUIDLow()
	
	local AAA = CharDBQuery( "SELECT ActiveDifficultyMode FROM character_difficulty_mode WHERE playerGUID = "..playerGUID)
	local playerActiveDifficultyMode = AAA:GetString(0)
	
	if ( AAA == nil ) then
		return;
	end
	
	if ( playerActiveDifficultyMode == "1" ) then
		player:SetPhaseMask( 1, true )
	elseif ( playerActiveDifficultyMode == "2" ) then
		player:SetPhaseMask( 2, true )
	end
end

function MyHandlers.ChooseDifficulty_NormalMode(player, spellid)
	local playerGUID = player:GetGUIDLow()
	local playerPhase = player:GetPhaseMask()
	
	if ( playerPhase == 1 ) then
		player:SendBroadcastMessage("This difficulty mode is already set.")
	else
		player:SetPhaseMask( 1, true )
		CharDBQuery("UPDATE character_difficulty_mode SET ActiveDifficultyMode = 1 WHERE playerGUID = "..playerGUID)
		player:SendBroadcastMessage("Difficulty Normal chosen.")
	end
end

function MyHandlers.ChooseDifficulty_NightmareMode(player, spellid)
	local playerGUID = player:GetGUIDLow()
	local playerPhase = player:GetPhaseMask()
	
	if ( playerPhase == 2 ) then
		player:SendBroadcastMessage("This difficulty mode is already set.")
	else
		player:SetPhaseMask( 2, true )
		CharDBQuery("UPDATE character_difficulty_mode SET ActiveDifficultyMode = 2 WHERE playerGUID = "..playerGUID)
		player:SendBroadcastMessage("Difficulty Nightmare chosen.")
	end
end

function MyHandlers.ChooseDifficulty_HellMode(player, spellid)
	local playerGUID = player:GetGUIDLow()
	local playerPhase = player:GetPhaseMask()
	
	if ( playerPhase == 4 ) then
		player:SendBroadcastMessage("This difficulty mode is already set.")
	else
		player:SetPhaseMask( 4, true )
		CharDBQuery("UPDATE character_difficulty_mode SET ActiveDifficultyMode = 4 WHERE playerGUID = "..playerGUID)
		player:SendBroadcastMessage("Difficulty Hell chosen.")
	end
end

function MyHandlers.displayChooseDifficulty(player, spellid)
	AIO.Handle(player, "ChooseDifficulty", "CDF")
	return false
end

local function CDOC(event, player, command)
    if(command == "choosedifficulty") then
		AIO.Handle(player, "ChooseDifficulty", "CDF")
		return false
	end
end

RegisterPlayerEvent(1, DMOCC)
RegisterPlayerEvent(2, DMOCD)
RegisterPlayerEvent(4, DMOL)

RegisterPlayerEvent(42, CDOC)