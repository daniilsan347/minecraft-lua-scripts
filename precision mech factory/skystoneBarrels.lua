local leftBarrel   = peripheral.wrap("minecraft:barrel_10")
local rightDrawers = peripheral.wrap("storagedrawers:standard_drawers_1_13")

local millstone0   = peripheral.wrap("create:millstone_0")
local millstone1   = peripheral.wrap("create:millstone_1")
local millstone2   = peripheral.wrap("create:millstone_2")
local millstone3   = peripheral.wrap("create:millstone_3")

local operate = false

while true do
    if rightDrawers.getItemDetail(2) ~= nil then
        if rightDrawers.getItemDetail(2).count <= 256 then
            if operate ~= true then
                operate = true
                print("Amount of sky dust is less than 4 stacks, start processing")
            end
        elseif rightDrawers.getItemDetail(2).count >= 1920 then
            if operate ~= false then
                operate = false
                print("Amount of sky dust is more than 30 stacks, halt processing")
            end
        end

    end
    local itemList = leftBarrel.list()
    for key, value in pairs(itemList) do
        if value.name == "appliedenergistics2:sky_dust" then
            leftBarrel.pushItems(peripheral.getName(rightDrawers), key)
        elseif value.name == "appliedenergistics2:sky_stone_block" and operate then
            leftBarrel.pushItems(peripheral.getName(millstone0), key, 1)
            leftBarrel.pushItems(peripheral.getName(millstone1), key, 1)
            leftBarrel.pushItems(peripheral.getName(millstone2), key, 1)
            leftBarrel.pushItems(peripheral.getName(millstone3), key, 1)
        end
    end
    os.sleep(3)
end