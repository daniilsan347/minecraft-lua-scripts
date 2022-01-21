local ok, err = pcall(
    function ()
        local p = peripheral

        local gunpowderProd = p.wrap("storagedrawers:standard_drawers_1_35")
        local gunpowderTNT = p.wrap("storagedrawers:standard_drawers_1_39")

        local enderDustProd = p.wrap("storagedrawers:standard_drawers_1_37")
        local singularityProd = p.wrap("storagedrawers:standard_drawers_1_43")
        local enderAndSingularityQuant = p.wrap("storagedrawers:standard_drawers_2_0")

        local TNTProd = p.wrap("storagedrawers:standard_drawers_1_44")
        local TNTQuant = p.wrap("create:chute_9")

        local flintStoneProd = p.wrap("minecraft:barrel_27")
        local flintStoneQuant = p.wrap("create:chute_10")

        local quantProd = p.wrap("create:smart_chute_0")
        local quantChroma = p.wrap("storagedrawers:standard_drawers_1_41")

        local dyeProd = p.wrap("minecraft:barrel_26")
        local dyeChroma = p.wrap("storagedrawers:standard_drawers_1_42")

        while true do
            if gunpowderProd.getItemDetail(2) ~= nil then
                gunpowderProd.pushItems(p.getName(gunpowderTNT), 2, 64, 2)
            end

            if enderDustProd.getItemDetail(2) ~= nil and singularityProd.getItemDetail(2) ~= nil then
                if enderDustProd.getItemDetail(2).count >= 16 and singularityProd.getItemDetail(2).count >= 16 then
                    enderAndSingularityQuant.pullItems(p.getName(enderDustProd), 2, 16, 2)
                    enderAndSingularityQuant.pullItems(p.getName(singularityProd), 2, 16, 3)
                    TNTProd.pushItems(p.getName(TNTQuant), 2, 1)
                end
            end

            for slot, item in pairs(flintStoneProd.list()) do
                flintStoneProd.pushItems(p.getName(flintStoneQuant), slot)
            end

            for slot, item in pairs(dyeProd.list()) do
                if item.name == "minecraft:magenta_dye" then
                    dyeProd.pushItems(p.getName(dyeChroma), slot)
                end
            end
        end
    end
)

-- If crash
if not ok then
    printError(err)
    sleep(5)
---@diagnostic disable-next-line: undefined-field
    os.reboot()
  end