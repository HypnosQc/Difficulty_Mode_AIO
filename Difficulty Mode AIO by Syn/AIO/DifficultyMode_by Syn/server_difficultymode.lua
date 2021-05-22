-----------------------------------------------------------------------------------|
-----------------------------|Created by Syn|-------------------------------|
-----------------------------------------------------------------------------------|

local AIO = AIO or require("AIO")

local MyHandlers = AIO.AddHandlers("ChooseDifficulty", {})

local NPCID = 11326

function DifficultyMode_OnCharacterCreate(event, player)
	local playerGUID = player:GetGUIDLow()
	CharDBQuery("INSERT INTO `character_difficulty_mode` (`playerGUID`, `ActiveDifficultyMode`) VALUES ("..playerGUID..", 1);")
end

function DifficultyMode_OnCharacterDelete(event, guid)
	CharDBQuery("DELETE FROM character_difficulty_mode WHERE playerGUID = "..guid.."")
end

function DifficultyMode_OnLogin(event, player)
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
	elseif ( playerActiveDifficultyMode == "4" ) then
		player:SetPhaseMask( 4, true )
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
	AIO.Handle(player, "ChooseDifficulty", "ChooseDifficultyFrame")
	return false
end

local function ChooseDifficultyOnCommand(event, player, command)
	inCombat = player:IsInCombat()
	
    if(command == "choosedifficulty") then
		if ( inCombat == false ) then
			AIO.Handle(player, "ChooseDifficulty", "ChooseDifficultyFrame")
			return false
		else
			player:SendBroadcastMessage("You can not use this command in combat.")
			return;
		end
	end
end

local function ChooseDifficulty_OnGossipHello(event, player, object)
	inCombat = player:IsInCombat()
	
	if ( inCombat == false ) then
		AIO.Handle(player, "ChooseDifficulty", "ChooseDifficultyFrame")
		return false
	else
		player:SendBroadcastMessage("You can not use this NPC in combat.")
		return;
	end
end

RegisterPlayerEvent(1, DifficultyMode_OnCharacterCreate)
RegisterPlayerEvent(2, DifficultyMode_OnCharacterDelete)
RegisterPlayerEvent(3, DifficultyMode_OnLogin)

RegisterPlayerEvent(42, ChooseDifficultyOnCommand)

RegisterCreatureGossipEvent(NPCID, 1, ChooseDifficulty_OnGossipHello)
