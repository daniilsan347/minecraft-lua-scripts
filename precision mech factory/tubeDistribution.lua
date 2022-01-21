local drawers = peripheral.wrap("storagedrawers:standard_drawers_1_14")
local barrel1 = peripheral.wrap("minecraft:barrel_11")
local barrel2 = peripheral.wrap("minecraft:barrel_12")

while true do
    if drawers.getItemDetail(2) ~= nil then
        count = drawers.getItemDetail(2).count
        if count >= 2 then
            barrel1.pullItems(peripheral.getName(drawers), 2, 1)
            barrel2.pullItems(peripheral.getName(drawers), 2, 1)
        end
    end
    os.sleep(2)
end