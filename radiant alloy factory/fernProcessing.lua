-- Fern processing

print("Fern Processing factory control")
local ok, err = pcall(
    function ()
        local p = peripheral

        -- Leaf buffer barrels
        local grnLeafBuffer = p.wrap("minecraft:barrel_21")
        local cynLeafBuffer = p.wrap("minecraft:barrel_20")
        local prpLeafBuffer = p.wrap("minecraft:barrel_19")

        -- Fern fire production chutes
        local grnLeafChute = p.wrap("create:chute_17")
        local cynLeafChute = p.wrap("create:chute_18")
        local prpLeafChute = p.wrap("create:chute_19")

        -- Fern cutting chutes
        local grnFernChute = p.wrap("create:chute_3")
        local cynFernChute = p.wrap("create:chute_4")
        local prpFernChute = p.wrap("create:chute_5")

        -- Blend production millstones
        local grnLeafMillstone = p.wrap("create:millstone_4")
        local cynLeafMillstone = p.wrap("create:millstone_5")
        local prpLeafMillstone = p.wrap("create:millstone_6")

        -- Fern buffer barrel
        local fernBuffer = p.wrap("minecraft:barrel_22")

        -- Blend buffer barrel
        local blendBuffer = p.wrap("minecraft:barrel_25")

        -- Blend processing deployers
        local grnBlendDeployer = p.wrap("create:chute_11")
        local cynBlendDeployer = p.wrap("create:chute_12")
        local prpBlendDeployer = p.wrap("create:chute_13")

        -- Knifes barrel
        local knifesBarrel = p.wrap("minecraft:barrel_24")

        -- Knifes deployers
        local knifesDeployers = {
            p.wrap("create:chute_14"),
            p.wrap("create:chute_15"),
            p.wrap("create:chute_16")
        }

        -- Fern Reserve
        local fernReserve = p.wrap("storagedrawers:standard_drawers_4_6")
        -- local fernReserve = p.wrap("minecraft:barrel_28")

        while true do
            -- Fern leafs -> Fern production and Blend production
            for slot, item in pairs(grnLeafBuffer.list()) do
                if item.count >= 2 then
                    grnLeafBuffer.pushItems(p.getName(grnLeafChute), slot, math.floor(item.count / 2))
                    grnLeafBuffer.pushItems(p.getName(grnLeafMillstone), slot)
                end
            end
            for slot, item in pairs(cynLeafBuffer.list()) do
                if item.count >= 2 then
                    cynLeafBuffer.pushItems(p.getName(cynLeafChute), slot, math.floor(item.count / 2))
                    cynLeafBuffer.pushItems(p.getName(cynLeafMillstone), slot)
                end
            end
            for slot, item in pairs(prpLeafBuffer.list()) do
                if item.count >= 2 then
                    prpLeafBuffer.pushItems(p.getName(prpLeafChute), slot, math.floor(item.count / 2))
                    prpLeafBuffer.pushItems(p.getName(prpLeafMillstone), slot)
                end
            end

            -- Fern -> Fern cutting and Reserve


            for slot, item in pairs(fernBuffer.list()) do
                -- Green fern
                if item.name == "tconstruct:earth_slime_fern" then
                    if fernReserve.getItemDetail(2) ~= nil then
                        if fernReserve.getItemDetail(2).count <= 32 then
                            fernBuffer.pushItems(p.getName(fernReserve), slot, 1, 2)
                            fernBuffer.pushItems(p.getName(grnFernChute), slot)
                        else
                            fernBuffer.pushItems(p.getName(grnFernChute), slot)
                        end
                    elseif fernReserve.getItemDetail(2) == nil then
                        fernBuffer.pushItems(p.getName(fernReserve), slot, 1, 2)
                        fernBuffer.pushItems(p.getName(grnFernChute), slot)
                    end
                -- Cyan fern
                elseif item.name == "tconstruct:sky_slime_fern" then
                    if fernReserve.getItemDetail(3) ~= nil then
                        if fernReserve.getItemDetail(3).count <= 32 then
                            fernBuffer.pushItems(p.getName(fernReserve), slot, 1, 3)
                            fernBuffer.pushItems(p.getName(cynFernChute), slot)
                        else
                            fernBuffer.pushItems(p.getName(cynFernChute), slot)
                        end
                    elseif fernReserve.getItemDetail(3) == nil then
                        fernBuffer.pushItems(p.getName(fernReserve), slot, 1, 3)
                        fernBuffer.pushItems(p.getName(cynFernChute), slot)
                    end
                -- Purple fern
                elseif item.name == "tconstruct:ender_slime_fern" then
                    if fernReserve.getItemDetail(4) ~= nil then
                        if fernReserve.getItemDetail(4).count <= 32 then
                            fernBuffer.pushItems(p.getName(fernReserve), slot, 1, 4)
                            fernBuffer.pushItems(p.getName(prpFernChute), slot)
                        else
                            fernBuffer.pushItems(p.getName(prpFernChute), slot)
                        end
                    elseif fernReserve.getItemDetail(4) == nil then
                        fernBuffer.pushItems(p.getName(fernReserve), slot, 1, 4)
                        fernBuffer.pushItems(p.getName(prpFernChute), slot)
                    end
                end
            end

            -- Fern blend -> Blend processing
            for slot, item in pairs(blendBuffer.list()) do
                if item.name == "kubejs:earth_slime_fern_paste" then
                    blendBuffer.pushItems(p.getName(grnBlendDeployer), slot)
                elseif item.name == "kubejs:sky_slime_fern_paste" then
                    blendBuffer.pushItems(p.getName(cynBlendDeployer), slot)
                elseif item.name == "kubejs:ender_slime_fern_paste" then
                    blendBuffer.pushItems(p.getName(prpBlendDeployer), slot)
                end
            end

            -- Knifes to deployers
            for slot, item in pairs(knifesBarrel.list()) do
                knifesBarrel.pushItems(p.getName(knifesDeployers[1]), slot, 1, 1)
                knifesBarrel.pushItems(p.getName(knifesDeployers[2]), slot, 1, 1)
                knifesBarrel.pushItems(p.getName(knifesDeployers[3]), slot, 1, 1)
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