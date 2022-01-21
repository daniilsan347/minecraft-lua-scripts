-- FarmOS

-- Peripherals init
local inputBarrel = peripheral.wrap("minecraft:barrel_3")
local trashBarrel = peripheral.wrap("minecraft:barrel_2")
local drawers1    = peripheral.wrap("storagedrawers:standard_drawers_4_3")
local drawers2    = peripheral.wrap("storagedrawers:standard_drawers_4_2")
local drawers3    = peripheral.wrap("storagedrawers:standard_drawers_4_4")

-- Item moving
local destSlotDrawer = {
    -- Drawers 1
    ["minecraft:wheat"]              = {peripheral.getName(drawers1), 2},
    ["minecraft:wheat_seeds"]        = {peripheral.getName(drawers1), 3},
    ["minecraft:potato"]             = {peripheral.getName(drawers1), 4},
    ["buddycards:buddybeans"]        = {peripheral.getName(drawers1), 5},
    -- Drawers 2
    ["farmersdelight:cabbage"]       = {peripheral.getName(drawers2), 2},
    ["farmersdelight:cabbage_seeds"] = {peripheral.getName(drawers2), 3},
    ["farmersdelight:tomato"]        = {peripheral.getName(drawers2), 4},
    ["minecraft:carrot"]             = {peripheral.getName(drawers2), 5},
    -- Drawers 3
    ["supplementaries:flax"]         = {peripheral.getName(drawers3), 2},
    ["supplementaries:flax_seeds"]   = {peripheral.getName(drawers3), 3}
}

while true do
    local itemList = inputBarrel.list()
    for k, v in pairs(itemList) do
        if destSlotDrawer[v.name] ~= nil then
            inputBarrel.pushItems(destSlotDrawer[v.name][1], k, 64, destSlotDrawer[v.name][2])
            print("Moved", v.name)
        else
            print("Dumped", v.name)
            inputBarrel.pushItems(peripheral.getName(trashBarrel), k)
        end
    end
    os.sleep(60)
end