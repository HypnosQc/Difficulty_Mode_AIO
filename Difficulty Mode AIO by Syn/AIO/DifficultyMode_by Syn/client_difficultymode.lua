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
local CDF = CreateFrame("Frame","CDF",UIParent,"")
CDF:SetPoint("CENTER", 0, 50)
CDF:SetWidth(851)
CDF:SetHeight(681)

local CDFClose = CreateFrame("button", nil, CDF, "UIPanelCloseButton")
CDFClose:SetPoint("TOPRIGHT", -165, -40)
CDFClose:SetWidth(35)
CDFClose:SetHeight(35)
CDFClose:SetFrameLevel(frameLevel+3)

-----------------------------------------------------------------------------------|
----------------------------------|Background|-------------------------------------|
-----------------------------------------------------------------------------------|
local BGJB = CreateFrame("button", nil, CDF)
BGJB:SetPoint("CENTER", CDF, "CENTER", -1, -18)
BGJB:SetWidth(1843.2)
BGJB:SetHeight(921.6)

local ktex = BGJB:CreateTexture()
ktex:SetTexture("Interface/ChooseDifficulty/ChooseDifficultybyDeathorous_Background")
ktex:SetTexCoord(0, 1, 0, 1)
ktex:SetAllPoints()
BGJB:SetNormalTexture(ktex)

-----------------------------------------------------------------------------------|
------------------------------------|Buttons|--------------------------------------|
-----------------------------------------------------------------------------------|
local BNM = CreateFrame("Button", "BNM", CDF)
BNM:SetPoint("CENTER", -175, -100)
BNM:EnableMouse(true)
BNM:SetWidth(211.2)
BNM:SetHeight(221.76)
BNM:SetFrameLevel(frameLevel+3)
BNM:SetScript("OnMouseUp", function() AIO.Handle("ChooseDifficulty", "ChooseDifficulty_NormalMode", 1)
	CDF:Hide()
end)

local ltex = BNM:CreateTexture()
ltex:SetTexture("Interface/ChooseDifficulty/ChooseDifficultybyDeathorous_Normal")
ltex:SetTexCoord(0, 1, 0, 1)
ltex:SetAllPoints()


local BMON = CreateFrame("Button", "BMON", CDF)
BMON:SetPoint("CENTER", 0, -50)
BMON:EnableMouse(true)
BMON:SetWidth(211.2)
BMON:SetHeight(221.76)
BMON:SetFrameLevel(frameLevel+3)
BMON:SetScript("OnMouseUp", function() AIO.Handle("ChooseDifficulty", "ChooseDifficulty_NightmareMode", 1)
	CDF:Hide()
end)

local mtex = BMON:CreateTexture()
mtex:SetTexture("Interface/ChooseDifficulty/ChooseDifficultybyDeathorous_Nightmare")
mtex:SetTexCoord(0, 1, 0, 1)
mtex:SetAllPoints()



local BHAM = CreateFrame("Button", "BHAM", CDF)
BHAM:SetPoint("CENTER", 175, -75)
BHAM:EnableMouse(true)
BHAM:SetWidth(211.2)
BHAM:SetHeight(221.76)
BHAM:SetFrameLevel(frameLevel+3)
BHAM:SetScript("OnMouseUp", function() AIO.Handle("ChooseDifficulty", "ChooseDifficulty_HellMode", 1)
	CDF:Hide()
end)

local ntex = BHAM:CreateTexture()
ntex:SetTexture("Interface/ChooseDifficulty/ChooseDifficultybyDeathorous_Hell")
ntex:SetTexCoord(0, 1, 0, 1)
ntex:SetAllPoints()

CDF:Hide()
function MyHandlers.CDF(player)
    CDF:Show()
end
