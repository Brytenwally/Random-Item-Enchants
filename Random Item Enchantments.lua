-- ============================================================================
-- CONFIGURATION
-- ============================================================================
local CONFIG = {
    AllowedQualities = { [2] = true, [3] = true, [4] = true }, -- Green, Blue, Purple
    AllowedClasses   = { [2] = true, [4] = true },             -- Weapons, Armor
    GlobalEnchantChance = 100,                                 -- Forced 100% Drop Modification

    -- Cumulative percentages adding up to 100%
    SlotCountChances = {
        OneSlot    = 40,  -- Highly Common (40%)
        TwoSlots   = 35,  -- Common (35%)
        ThreeSlots = 18,  -- Rare (18%)
        FourSlots  = 6,   -- Epic (6%)
        FiveSlots  = 1,   -- Legendary/Ultra-Rare (1%)
    },
    
    -- Targets expanded memory positions unlocked via your C++ recompile!
    EnchantSlots = { 7, 8, 9, 10, 11 },
}

-- ============================================================================
-- STATIC DATA REFERENCE: ENCHANT ID TO STAT TEXT STRINGS
-- ============================================================================
local ENCHANT_NAMES = {
    [66] = "+1 Stamina", [68] = "+1 Strength", [69] = "+2 Strength", [72] = "+2 Stamina", [74] = "+1 Agility",
    [75] = "+2 Agility", [79] = "+1 Intellect", [80] = "+2 Intellect", [82] = "+1 Spirit", [83] = "+2 Spirit",
    [90] = "+4 Agility", [92] = "+6 Agility", [94] = "+4 Intellect", [96] = "+6 Intellect", [98] = "+4 Spirit",
    [100] = "+6 Spirit", [102] = "+4 Stamina", [104] = "+6 Stamina", [106] = "+4 Strength", [108] = "+6 Strength",
    [343] = "+8 Agility", [350] = "+8 Intellect", [351] = "+8 Spirit", [352] = "+8 Strength", [353] = "+8 Stamina",
    [358] = "+10 Agility", [359] = "+10 Intellect", [360] = "+10 Spirit", [361] = "+10 Stamina", [362] = "+10 Strength",
    [368] = "+12 Agility", [369] = "+12 Intellect", [370] = "+12 Spirit", [371] = "+12 Stamina", [372] = "+12 Strength",
    [404] = "+14 Agility", [406] = "+14 Intellect", [408] = "+14 Spirit", [411] = "+14 Stamina", [412] = "+14 Strength",
    [983] = "+16 Agility", [1043] = "+16 Strength", [1045] = "+18 Strength", [1047] = "+20 Strength", [1049] = "+22 Strength",
    [1051] = "+24 Strength", [1053] = "+26 Strength", [1055] = "+28 Strength", [1069] = "+16 Stamina", [1071] = "+18 Stamina",
    [1073] = "+20 Stamina", [1075] = "+22 Stamina", [1077] = "+24 Stamina", [1079] = "+26 Stamina", [1081] = "+28 Stamina",
    [1095] = "+18 Agility", [1097] = "+20 Agility", [1099] = "+22 Agility", [1101] = "+24 Agility", [1103] = "+26 Agility",
    [1105] = "+28 Agility", [1119] = "+16 Intellect", [1121] = "+18 Intellect", [1123] = "+20 Intellect", [1125] = "+22 Intellect",
    [1127] = "+24 Intellect", [1129] = "+26 Intellect", [1131] = "+28 Intellect", [1145] = "+16 Spirit", [1147] = "+18 Spirit",
    [1149] = "+20 Spirit", [1151] = "+22 Spirit", [1153] = "+24 Spirit", [1155] = "+26 Spirit", [1157] = "+28 Spirit"
}

-- ============================================================================
-- 15 ITEM LEVEL (iLvl) BRACKETS POPULATED VIA SpellItemEnchantment_3.csv
-- ----------------------------------------------------------------------------
-- Pools follow your exact progression: +1, +2, +4, +6, +8, +10, +12, +14, ...
-- Order within pools: { Agility, Strength, Intellect, Stamina, Spirit }
-- ============================================================================
local ILEVEL_BRACKETS = {
    -- iLvl 1-20 (+1 Stats)
    [1]  = { minLevel = 1,   maxLevel = 20,  pool = { 74, 68, 79, 66, 82 } },   
    -- iLvl 21-40 (+2 Stats)
    [2]  = { minLevel = 21,  maxLevel = 40,  pool = { 75, 69, 80, 72, 83 } },   
    -- iLvl 41-60 (+4 Stats)
    [3]  = { minLevel = 41,  maxLevel = 60,  pool = { 90, 106, 94, 102, 98 } },  
    -- iLvl 61-80 (+6 Stats)
    [4]  = { minLevel = 61,  maxLevel = 80,  pool = { 92, 108, 96, 104, 100 } }, 
    -- iLvl 81-100 (+8 Stats)
    [5]  = { minLevel = 81,  maxLevel = 100, pool = { 343, 352, 350, 353, 351 } },
    -- iLvl 101-120 (+10 Stats)
    [6]  = { minLevel = 101, maxLevel = 120, pool = { 358, 362, 359, 361, 360 } },
    -- iLvl 121-140 (+12 Stats)
    [7]  = { minLevel = 121, maxLevel = 140, pool = { 368, 372, 369, 371, 370 } },
    -- iLvl 141-160 (+14 Stats)
    [8]  = { minLevel = 141, maxLevel = 160, pool = { 404, 412, 406, 411, 408 } },
    -- iLvl 161-180 (+16 Stats)
    [9]  = { minLevel = 161, maxLevel = 180, pool = { 983, 1043, 1119, 1069, 1145 } },
    -- iLvl 181-200 (+18 Stats)
    [10] = { minLevel = 181, maxLevel = 200, pool = { 1095, 1045, 1121, 1071, 1147 } },
    -- iLvl 201-220 (+20 Stats)
    [11] = { minLevel = 201, maxLevel = 220, pool = { 1097, 1047, 1123, 1073, 1149 } },
    -- iLvl 221-240 (+22 Stats)
    [12] = { minLevel = 221, maxLevel = 240, pool = { 1099, 1049, 1125, 1075, 1151 } },
    -- iLvl 241-260 (+24 Stats)
    [13] = { minLevel = 241, maxLevel = 260, pool = { 1101, 1051, 1127, 1077, 1153 } },
    -- iLvl 261-299 (+26 Stats)
    [14] = { minLevel = 261, maxLevel = 299, pool = { 1103, 1053, 1129, 1079, 1155 } },
    -- iLvl 300+ (+28 Stats)
    [15] = { minLevel = 300, maxLevel = 999, pool = { 1105, 1055, 1131, 1081, 1157 } },
}

-- ============================================================================
-- REAL-TIME C++ MEMORY INTERCEPTOR (HOOK 53)
-- ============================================================================
local function OnStoreNewItem(event, player, item, count)
    if not item then return end

    local quality    = item:GetQuality()
    local class      = item:GetClass()
    local itemLevel  = item:GetItemLevel()

    -- 1. Validation Filtering
    if not CONFIG.AllowedQualities[quality] or not CONFIG.AllowedClasses[class] then
        return
    end

    -- 2. Locate the matching Item Level (iLvl) Bracket Row
    local targetBracket = nil
    
    for id, bracket in ipairs(ILEVEL_BRACKETS) do
        if itemLevel >= bracket.minLevel and itemLevel <= bracket.maxLevel then
            targetBracket = bracket
            break
        end
    end

    -- Fallback safety check if item level slips outside standard boundaries
    if not targetBracket then
        if itemLevel >= 300 then
            targetBracket = ILEVEL_BRACKETS[15]
        else
            targetBracket = ILEVEL_BRACKETS[1]
        end
    end

    -- 3. Check if the pool is populated yet
    local activePool = targetBracket.pool
    if #activePool == 0 then return end

    -- 4. Determine Random Property Density (5-Slot Cascading Resolution)
    local slotRoll = math.random(1, 100)
    local slotsToEnchant = 1

    if slotRoll <= CONFIG.SlotCountChances.FiveSlots then
        slotsToEnchant = 5
    elseif slotRoll <= (CONFIG.SlotCountChances.FiveSlots + CONFIG.SlotCountChances.FourSlots) then
        slotsToEnchant = 4
    elseif slotRoll <= (CONFIG.SlotCountChances.FiveSlots + CONFIG.SlotCountChances.FourSlots + CONFIG.SlotCountChances.ThreeSlots) then
        slotsToEnchant = 3
    elseif slotRoll <= (CONFIG.SlotCountChances.FiveSlots + CONFIG.SlotCountChances.FourSlots + CONFIG.SlotCountChances.ThreeSlots + CONFIG.SlotCountChances.TwoSlots) then
        slotsToEnchant = 2
    end

    -- 5. Select Attributes and Mutate Core Memory Pointers (Slots 7 to 11)
    local usedPoolIndices = {}
    local actualEnchantsApplied = 0
    local rolledStatTexts = {}

    for i = 1, slotsToEnchant do
        local targetSlot = CONFIG.EnchantSlots[i]
        local poolIndex
        local protectionCounter = 0
        
        -- Safeguard: Since #activePool is 5, this forces distinct stats up to 5 slots!
        repeat
            poolIndex = math.random(1, #activePool)
            protectionCounter = protectionCounter + 1
        until not usedPoolIndices[poolIndex] or protectionCounter > #activePool
        
        usedPoolIndices[poolIndex] = true
        local enchantId = activePool[poolIndex]
        
        if enchantId then
            -- Direct C++ RAM manipulation targeting Slots 7 through 11
            item:SetEnchantment(enchantId, targetSlot)
            actualEnchantsApplied = actualEnchantsApplied + 1
            
            -- Capture text string for chat module output
            local statText = ENCHANT_NAMES[enchantId] or ("Stat (ID: " .. enchantId .. ")")
            table.insert(rolledStatTexts, statText)
        end
    end

    -- 6. Chat Log Feedback with Color Grading
    if actualEnchantsApplied > 0 then
        local colorTag = "|cff00ff00" -- Standard Green (1 stat slot)
        if actualEnchantsApplied == 2 or actualEnchantsApplied == 3 then
            colorTag = "|cff0070de" -- Rare Blue (2-3 stat slots)
        elseif actualEnchantsApplied == 4 then
            colorTag = "|cffa335ee" -- Epic Purple (4 stat slots)
        elseif actualEnchantsApplied == 5 then
            colorTag = "|cffff8000" -- Legendary Orange (5 perfect stat slots)
        end
        
        local statsString = table.concat(rolledStatTexts, ", ")
        player:SendBroadcastMessage(string.format("%s[InstantEnchants]:|r Your %s rolled: [%s]", colorTag, item:GetItemLink(), statsString))
    end
end

-- Hook 53: PLAYER_EVENT_ON_STORE_NEW_ITEM
RegisterPlayerEvent(53, OnStoreNewItem)
print("[Eluna]: Omnipresent 15-Bracket Primary Stat Suffix Matrix fully deployed. Quiet mode active.")