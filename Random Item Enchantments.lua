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
    [66] = '+1 Stamina',          [68] = '+1 Strength',         [69] = '+2 Strength',
    [72] = '+2 Stamina',          [74] = '+1 Agility',          [75] = '+2 Agility',
    [79] = '+1 Intellect',        [80] = '+2 Intellect',        [82] = '+1 Spirit',
    [83] = '+2 Spirit',           [90] = '+4 Agility',          [92] = '+6 Agility',
    [94] = '+4 Intellect',        [96] = '+6 Intellect',        [98] = '+4 Spirit',
    [100] = '+6 Spirit',          [102] = '+4 Stamina',         [104] = '+6 Stamina',
    [106] = '+4 Strength',        [108] = '+6 Strength',        [110] = '+1 Defense Rating',
    [111] = '+2 Defense Rating',  [113] = '+4 Defense Rating',  [115] = '+6 Defense Rating',
    [195] = '+14 Critical Strike', [196] = '+28 Critical Strike', [206] = '+1 Spell Power',
    [207] = '+2 Spell Power',     [208] = '+4 Spell Power',     [212] = '+8 Spell Power',
    [343] = '+8 Agility',          [350] = '+8 Intellect',       [351] = '+8 Spirit',
    [352] = '+8 Strength',         [353] = '+8 Stamina',         [358] = '+10 Agility',
    [359] = '+10 Intellect',       [360] = '+10 Spirit',         [361] = '+10 Stamina',
    [362] = '+10 Strength',        [368] = '+12 Agility',        [369] = '+12 Intellect',
    [370] = '+12 Spirit',          [371] = '+12 Stamina',        [372] = '+12 Strength',
    [404] = '+14 Agility',         [406] = '+14 Intellect',      [408] = '+14 Spirit',
    [411] = '+14 Stamina',         [412] = '+14 Strength',       [432] = '+12 Spell Power',
    [931] = '+10 Haste Rating',    [983] = '+16 Agility',        [1043] = '+16 Strength',
    [1045] = '+18 Strength',       [1047] = '+20 Strength',      [1049] = '+22 Strength',
    [1051] = '+24 Strength',       [1053] = '+26 Strength',      [1055] = '+28 Strength',
    [1069] = '+16 Stamina',        [1071] = '+18 Stamina',       [1073] = '+20 Stamina',
    [1075] = '+22 Stamina',        [1077] = '+24 Stamina',       [1079] = '+26 Stamina',
    [1081] = '+28 Stamina',        [1095] = '+18 Agility',        [1097] = '+20 Agility',
    [1099] = '+22 Agility',        [1101] = '+24 Agility',       [1103] = '+26 Agility',
    [1105] = '+28 Agility',        [1119] = '+16 Intellect',      [1121] = '+18 Intellect',
    [1123] = '+20 Intellect',      [1125] = '+22 Intellect',      [1127] = '+24 Intellect',
    [1129] = '+26 Intellect',      [1131] = '+28 Intellect',      [1145] = '+16 Spirit',
    [1147] = '+18 Spirit',         [1149] = '+20 Spirit',        [1151] = '+22 Spirit',
    [1153] = '+24 Spirit',         [1155] = '+26 Spirit',        [1157] = '+28 Spirit',
    [1563] = '+2 Attack Power',    [1583] = '+4 Attack Power',   [1585] = '+8 Attack Power',
    [1587] = '+12 Attack Power',   [1589] = '+16 Attack Power',  [1591] = '+20 Attack Power',
    [1593] = '+24 Attack Power',   [1595] = '+28 Attack Power',  [1597] = '+32 Attack Power',
    [1599] = '+36 Attack Power',   [1603] = '+44 Attack Power',  [1605] = '+48 Attack Power',
    [1607] = '+52 Attack Power',   [1609] = '+56 Attack Power',  [1943] = '+12 Defense Rating',
    [1944] = '+8 Defense Rating',  [1946] = '+10 Defense Rating', [1949] = '+14 Defense Rating',
    [1951] = '+16 Defense Rating', [1952] = '+20 Defense Rating', [1953] = '+22 Defense Rating',
    [1957] = '+18 Defense Rating', [1961] = '+24 Defense Rating', [1962] = '+26 Defense Rating',
    [1964] = '+28 Defense Rating', [2078] = '+12 Dodge Rating',  [2318] = '+14 Spell Power',
    [2320] = '+16 Spell Power',    [2321] = '+18 Spell Power',   [2323] = '+20 Spell Power',
    [2325] = '+22 Spell Power',    [2328] = '+26 Spell Power',   [2330] = '+28 Spell Power',
    [2335] = '+34 Spell Power',    [2338] = '+37 Spell Power',   [2340] = '+40 Spell Power',
    [2366] = '+2 Mana per 5 sec',  [2371] = '+4 Mana per 5 sec',  [2376] = '+6 Mana per 5 sec',
    [2381] = '+10 Mana per 5 sec', [2382] = '+8 Mana per 5 sec',  [2391] = '+12 Mana per 5 sec',
    [2396] = '+14 Mana per 5 sec', [2695] = '+6 Critical Strike', [2697] = '+6 Hit Rating',
    [2730] = '+8 Dodge Rating',    [2735] = '+8 Critical Strike', [2754] = '+8 Parry Rating',
    [2764] = '+8 Hit Rating',      [2773] = '+16 Critical Strike', [2783] = '+14 Hit Rating',
    [2784] = '+12 Hit Rating',     [2857] = '+2 Critical Strike', [2864] = '+4 Critical Strike',
    [2871] = '+4 Dodge Rating',    [2873] = '+4 Hit Rating',      [2881] = '+1 Mana per 5 sec',
    [2886] = '+2 Hit Rating',      [2907] = '+2 Parry Rating',    [2913] = '+10 Critical Strike',
    [2926] = '+2 Dodge Rating',    [3120] = '+10 Dodge Rating',   [3121] = '+10 Parry Rating',
    [3128] = '+10 Hit Rating',     [3217] = '+12 Critical Strike', [3234] = '+20 Hit Rating',
    [3267] = '+4 Haste Rating',    [3270] = '+8 Haste Rating',    [3295] = '+16 Haste Rating',
    [3309] = '+6 Haste Rating',    [3358] = '+6 Dodge Rating',    [3359] = '+4 Parry Rating',
    [3377] = '+12 Parry Rating',   [3386] = '+12 Haste Rating',   [3450] = '+16 Dodge Rating',
    [3451] = '+16 Parry Rating',   [3460] = '+16 Hit Rating',     [3521] = '+40 Attack Power',
    [3522] = '+20 Dodge Rating',   [3523] = '+20 Parry Rating',   [3527] = '+20 Critical Strike',
    [3531] = '+20 Haste Rating',   [3646] = '+14 Dodge Rating',   [3648] = '+14 Parry Rating',
    [3659] = '+14 Haste Rating',   [3739] = '+34 Haste Rating',   [3740] = '+34 Dodge Rating',
    [3741] = '+34 Parry Rating',   [3742] = '+34 Hit Rating',     [3871] = '+6 Parry Rating'
}

-- ============================================================================
-- 15 ITEM LEVEL (iLvl) BRACKETS POPULATED VIA SpellItemEnchantment_3.csv
-- ----------------------------------------------------------------------------
-- Pools follow your exact progression: +1, +2, +4, +6, +8, +10, +12, +14, ...
-- Order within pools: { Agility, Strength, Intellect, Stamina, Spirit }
-- ============================================================================
local ILEVEL_BRACKETS = {
    [1]  = { minLevel = 1,   maxLevel = 20,  pool = { 74, 68, 79, 66, 82, 2857, 3267, 2886, 110, 2926, 2907, 1563, 206, 2881 } },
    [2]  = { minLevel = 21,  maxLevel = 40,  pool = { 75, 69, 80, 72, 83, 2857, 3267, 2886, 111, 2926, 2907, 1583, 207, 2366 } },
    [3]  = { minLevel = 41,  maxLevel = 60,  pool = { 90, 106, 94, 102, 98, 2864, 3267, 2873, 113, 2871, 3359, 1585, 208, 2371 } },
    [4]  = { minLevel = 61,  maxLevel = 80,  pool = { 92, 108, 96, 104, 100, 2695, 3309, 2697, 115, 3358, 3871, 1587, 212, 2376 } },
    [5]  = { minLevel = 81,  maxLevel = 100, pool = { 343, 352, 350, 353, 351, 2735, 3270, 2764, 1944, 2730, 2754, 1589, 432, 2382 } },
    [6]  = { minLevel = 101, maxLevel = 120, pool = { 358, 362, 359, 361, 360, 2913, 931, 3128, 1946, 3120, 3121, 1591, 2318, 2381 } },
    [7]  = { minLevel = 121, maxLevel = 140, pool = { 368, 372, 369, 371, 370, 3217, 3386, 2784, 1943, 2078, 3377, 1593, 2320, 2391 } },
    [8]  = { minLevel = 141, maxLevel = 160, pool = { 404, 412, 406, 411, 408, 195, 3659, 2783, 1949, 3646, 3648, 1595, 2321, 2396 } },
    [9]  = { minLevel = 161, maxLevel = 180, pool = { 983, 1043, 1119, 1069, 1145, 2773, 3295, 3460, 1951, 3450, 3451, 1597, 2323, 2396 } },
    [10] = { minLevel = 181, maxLevel = 200, pool = { 1095, 1045, 1121, 1071, 1147, 2773, 3295, 3460, 1957, 3450, 3451, 1599, 2325, 2396 } },
    [11] = { minLevel = 201, maxLevel = 220, pool = { 1097, 1047, 1123, 1073, 1149, 3527, 3531, 3234, 1952, 3522, 3523, 3521, 2328, 2396 } },
    [12] = { minLevel = 221, maxLevel = 240, pool = { 1099, 1049, 1125, 1075, 1151, 3527, 3531, 3234, 1953, 3522, 3523, 1603, 2330, 2396 } },
    [13] = { minLevel = 241, maxLevel = 260, pool = { 1101, 1051, 1127, 1077, 1153, 3527, 3531, 3234, 1961, 3522, 3523, 1605, 2335, 2396 } },
    [14] = { minLevel = 261, maxLevel = 299, pool = { 1103, 1053, 1129, 1079, 1155, 196, 3531, 3234, 1962, 3522, 3523, 1607, 2338, 2396 } },
    [15] = { minLevel = 300, maxLevel = 999, pool = { 1105, 1055, 1131, 1081, 1157, 196, 3739, 3742, 1964, 3740, 3741, 1609, 2340, 2396 } }
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

    -- 2. Locate the matching base Item Level (iLvl) Bracket
    local baseBracketId = 0
    for id, bracket in ipairs(ILEVEL_BRACKETS) do
        if itemLevel >= bracket.minLevel and itemLevel <= bracket.maxLevel then
            baseBracketId = id
            break
        end
    end
    if baseBracketId == 0 then baseBracketId = (itemLevel >= 300) and 15 or 1 end

    -- 3. Determine Random Property Density
    local slotRoll = math.random(1, 100)
    local slotsToEnchant = 1
    if slotRoll <= CONFIG.SlotCountChances.FiveSlots then slotsToEnchant = 5
    elseif slotRoll <= (CONFIG.SlotCountChances.FiveSlots + CONFIG.SlotCountChances.FourSlots) then slotsToEnchant = 4
    elseif slotRoll <= (CONFIG.SlotCountChances.FiveSlots + CONFIG.SlotCountChances.FourSlots + CONFIG.SlotCountChances.ThreeSlots) then slotsToEnchant = 3
    elseif slotRoll <= (CONFIG.SlotCountChances.FiveSlots + CONFIG.SlotCountChances.FourSlots + CONFIG.SlotCountChances.ThreeSlots + CONFIG.SlotCountChances.TwoSlots) then slotsToEnchant = 2 end

    -- 4. Select Attributes with Granular Luck (10% per stat slot)
    local usedStatIndices = {}
    local actualEnchantsApplied = 0
    local rolledStatTexts = {}

    for i = 1, slotsToEnchant do
        local targetSlot = CONFIG.EnchantSlots[i]
        
        -- Pick a random stat category (1: Agi, 2: Str, 3: Int, 4: Sta, 5: Spi)
        local statIndex = math.random(1, 14)
        
        -- 10% Chance for individual "Lucky Stat Shift"
        local targetBracketId = baseBracketId
        if math.random(1, 100) <= 10 then
            local offset = (math.random(1, 2) == 1) and 1 or -1
            local potentialId = baseBracketId + offset
            if potentialId >= 1 and potentialId <= 15 then
                targetBracketId = potentialId
            end
        end
        
        local enchantId = ILEVEL_BRACKETS[targetBracketId].pool[statIndex]
        
        if enchantId then
            item:SetEnchantment(enchantId, targetSlot)
            actualEnchantsApplied = actualEnchantsApplied + 1
            table.insert(rolledStatTexts, ENCHANT_NAMES[enchantId] or "Stat")
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
