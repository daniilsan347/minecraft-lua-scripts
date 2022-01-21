local ok, err = pcall(
    function ()
        local storageInterface = peripheral.wrap("minecraft:barrel_29")
        local boneMealDrawers  = peripheral.wrap("storagedrawers:standard_drawers_1_36")
        local boneMealChute    = peripheral.wrap("create:chute_21")

        local millstone = peripheral.wrap("create:millstone_7")
        local dyeBuffer = peripheral.wrap("minecraft:barrel_26")
        local nullifier = peripheral.wrap("thermal:device_nullifier_1")
        while true do
            for slot, item in pairs(storageInterface.list()) do
                if item.name == "biomesoplenty:wildflower" then
                    storageInterface.pushItems(peripheral.getName(millstone), slot, 64)
                elseif item.name == "minecraft:bone_meal" then
                    storageInterface.pushItems(peripheral.getName(boneMealDrawers), slot, 64, 2)
                else
                    storageInterface.pushItems(peripheral.getName(nullifier), slot, 64)
                end
            end

            for slot, item in pairs(dyeBuffer.list()) do
                if item.name ~= "minecraft:magenta_dye" then
                    storageInterface.pushItems(peripheral.getName(nullifier), slot, 64)
                end
            end
            boneMealDrawers.pushItems(peripheral.getName(boneMealChute), 2, 16)
        end
    end
)

if not ok then
    printError(err)
    sleep(5)
---@diagnostic disable-next-line: undefined-field
    os.reboot()
  end