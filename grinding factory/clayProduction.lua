-- Clay production
local ok, err = pcall(function ()
    local p            = peripheral
    local depots       = {peripheral.find("create:depot")}

    local inputBarrel  = peripheral.wrap("minecraft:barrel_18")

    while true do
        local itemList = inputBarrel.list()
        for slot, items in pairs(itemList) do
            if items.name == "minecraft:sand" then
                for id, depot in pairs(depots) do
                    if depot.getItemDetail(1) == nil then
                        depot.pullItems(p.getName(inputBarrel), slot, 15, 1)
                    end
                end
            end
        end
    end
end)

-- In case of error, print it and reboot
if not ok then
    printError(err)
    sleep(5)
    os.reboot()
  end