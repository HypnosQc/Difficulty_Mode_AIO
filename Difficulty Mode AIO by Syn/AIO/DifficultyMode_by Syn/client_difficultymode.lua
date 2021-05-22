-----------------------------------------------------------------------------------|
-----------------------------|Created by Syn|-------------------------------|
-----------------------------------------------------------------------------------|

local AIO = AIO or require("AIO")
if AIO.AddAddon() then
    return
end

local MyHandlers = AIO.AddHandlers("ChooseDifficulty", {})
-----------------------------------------------------------------------------------|
------------------------------------|Frames|---------------------------------------|
-----------------------------------------------------------------------------------|
local ChooseDifficultyFrame = CreateFrame("Frame","ChooseDifficultyFrame",UIParent,"")
ChooseDifficultyFrame:SetPoint("CENTER", 0, 50)
ChooseDifficultyFrame:SetWidth(851)
ChooseDifficultyFrame:SetHeight(681)

local ChooseDifficultyFrameClose = CreateFrame("button", nil, ChooseDifficultyFrame, "UIPanelCloseButton")
ChooseDifficultyFrameClose:SetPoint("TOPRIGHT", -165, -40)
ChooseDifficultyFrameClose:SetWidth(35)
ChooseDifficultyFrameClose:SetHeight(35)
ChooseDifficultyFrameClose:SetFrameLevel(frameLevel+3)

-----------------------------------------------------------------------------------|
----------------------------------|Background|-------------------------------------|
-----------------------------------------------------------------------------------|
local BackgroundButton = CreateFrame("button", nil, ChooseDifficultyFrame)
BackgroundButton:SetPoint("CENTER", ChooseDifficultyFrame, "CENTER", -1, -18)
BackgroundButton:SetWidth(1843.2)
BackgroundButton:SetHeight(921.6)

local ktex = BackgroundButton:CreateTexture()
ktex:SetTexture("Interface/ChooseDifficulty/ChooseDifficulty_Background")
ktex:SetTexCoord(0, 1, 0, 1)
ktex:SetAllPoints()
BackgroundButton:SetNormalTexture(ktex)

-----------------------------------------------------------------------------------|
------------------------------------|Buttons|--------------------------------------|
-----------------------------------------------------------------------------------|
local buttonNormalMode = CreateFrame("Button", "buttonNormalMode", ChooseDifficultyFrame)
buttonNormalMode:SetPoint("CENTER", -175, -100)
buttonNormalMode:EnableMouse(true)
buttonNormalMode:SetWidth(211.2)
buttonNormalMode:SetHeight(221.76)
buttonNormalMode:SetFrameLevel(frameLevel+3)
buttonNormalMode:SetScript("OnMouseUp", function() AIO.Handle("ChooseDifficulty", "ChooseDifficulty_NormalMode", 1)
	ChooseDifficultyFrame:Hide()
end)
buttonNormalMode:SetScript("OnShow", function(self) buttonNormalMode:SetAlpha(1.0) end)
buttonNormalMode:SetScript("OnEnter", function(self) buttonNormalMode:SetAlpha(0.80) end)
buttonNormalMode:SetScript("OnLeave", function(self) buttonNormalMode:SetAlpha(1.0) end)

local ltex = buttonNormalMode:CreateTexture()
ltex:SetTexture("Interface/ChooseDifficulty/ChooseDifficulty_Normal")
ltex:SetTexCoord(0, 1, 0, 1)
ltex:SetAllPoints()


local buttonNightmareMode = CreateFrame("Button", "buttonNightmareMode", ChooseDifficultyFrame)
buttonNightmareMode:SetPoint("CENTER", 0, -50)
buttonNightmareMode:EnableMouse(true)
buttonNightmareMode:SetWidth(211.2)
buttonNightmareMode:SetHeight(221.76)
buttonNightmareMode:SetFrameLevel(frameLevel+3)
buttonNightmareMode:SetScript("OnMouseUp", function() AIO.Handle("ChooseDifficulty", "ChooseDifficulty_NightmareMode", 1)
	ChooseDifficultyFrame:Hide()
end)
buttonNightmareMode:SetScript("OnShow", function(self) buttonNightmareMode:SetAlpha(1.0) end)
buttonNightmareMode:SetScript("OnEnter", function(self) buttonNightmareMode:SetAlpha(0.80) end)
buttonNightmareMode:SetScript("OnLeave", function(self) buttonNightmareMode:SetAlpha(1.0) end)

local mtex = buttonNightmareMode:CreateTexture()
mtex:SetTexture("Interface/ChooseDifficulty/ChooseDifficulty_Nightmare")
mtex:SetTexCoord(0, 1, 0, 1)
mtex:SetAllPoints()



local buttonHellMode = CreateFrame("Button", "buttonHellMode", ChooseDifficultyFrame)
buttonHellMode:SetPoint("CENTER", 175, -75)
buttonHellMode:EnableMouse(true)
buttonHellMode:SetWidth(211.2)
buttonHellMode:SetHeight(221.76)
buttonHellMode:SetFrameLevel(frameLevel+3)
buttonHellMode:SetScript("OnMouseUp", function() AIO.Handle("ChooseDifficulty", "ChooseDifficulty_HellMode", 1)
	ChooseDifficultyFrame:Hide()
end)
buttonHellMode:SetScript("OnShow", function(self) buttonHellMode:SetAlpha(1.0) end)
buttonHellMode:SetScript("OnEnter", function(self) buttonHellMode:SetAlpha(0.80) end)
buttonHellMode:SetScript("OnLeave", function(self) buttonHellMode:SetAlpha(1.0) end)

local ntex = buttonHellMode:CreateTexture()
ntex:SetTexture("Interface/ChooseDifficulty/ChooseDifficulty_Hell")
ntex:SetTexCoord(0, 1, 0, 1)
ntex:SetAllPoints()

ChooseDifficultyFrame:Hide()
function MyHandlers.ChooseDifficultyFrame(player)
    ChooseDifficultyFrame:Show()
end
