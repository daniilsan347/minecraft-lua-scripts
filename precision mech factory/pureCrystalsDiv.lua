local crushingLine = peripheral.wrap("back")
local tubeLine = peripheral.wrap("left")
local storage = peripheral.wrap("bottom")

while true do
    if storage.getItemDetail(2) ~= nil then
        count = storage.getItemDetail(2).count
        if count >= 2 then
            crushingLine.pullItems(peripheral.getName(storage), 2, 1)
            tubeLine.pullItems(peripheral.getName(storage), 2, 1)
        end
    end
    os.sleep(2)
end