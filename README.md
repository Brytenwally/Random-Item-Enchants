# Random Item Enchantments

An Eluna Lua script for AzerothCore that dynamically injects multi-attribute properties onto weapons and armor based on item level (iLvl) tables[cite: 1].

## Requirements

* **AzerothCore** (WOTLK 3.3.5a)
* **mod-ale** (Requires at least this commit https://github.com/azerothcore/mod-ale/pull/387 or my forked version https://github.com/Brytenwally/mod-ale)

## Setup

### 1. Script Installation
Place the `Random Item Enchantments.lua` file inside your server's **`../lua_scripts/`** directory[cite: 1].
Restart the server or type `.reload ale`

### Configuration
Modify the `CONFIG` block at the top of the script to change values[cite: 1]:

* **AllowedQualities**: Filter which item rarities can roll bonus stats (e.g., Green, Blue, Purple)[cite: 1].
* **AllowedClasses**: Restricts the engine to specific item types (e.g., Weapons and Armor)[cite: 1].
* **GlobalEnchantChance**: The percentage chance that an eligible item will trigger a random stat roll (set to 100 for guaranteed rolls)[cite: 1].
* **SlotCountChances**: Adjust the weight distribution determining how many simultaneous bonus stats an item can receive (supports 1 to 5 distinct stat slots)[cite: 1].
* **EnchantSlots**: Configures the targeted equipment memory positions where data splicing takes place (slots 7 through 11)[cite: 1].

### In-Game Usage

* Stats are automatically rolled and applied to eligible items instantly upon generation[cite: 1].
* Players will immediately see a clean, color-coded chat announcement displaying the exact stats their item rolled[cite: 1].
* Chat feedback adapts visually: 1 stat displays as **Green**, 2–3 stats display as **Blue**, 4 stats display as **Purple**, and a perfect 5-stat roll flashes as **Orange**[cite: 1].
