-- Smelt-o-tron 4k

print("Smelt-o-tron 4k initializing...")
local ok, err = pcall(function()
    -- DEPOTS WRAPPIGN
    local washing_depots = {
        peripheral.wrap("create:depot_0"),
        peripheral.wrap("create:depot_1"),
        peripheral.wrap("create:depot_2"),
        peripheral.wrap("create:depot_3")
    }
    local smoking_depots = {
        peripheral.wrap("create:depot_4"),
        peripheral.wrap("create:depot_5"),
        peripheral.wrap("create:depot_6"),
        peripheral.wrap("create:depot_7")
    }
    local smelting_depots = {
        peripheral.wrap("create:depot_8"),
        peripheral.wrap("create:depot_9"),
        peripheral.wrap("create:depot_10"),
        peripheral.wrap("create:depot_11")
    }

    -- BARRELS WRAPPING
    -- Washing barrels
    local washing_input  = peripheral.wrap("metalbarrels:iron_tile_0")
    local washing_output = peripheral.wrap("metalbarrels:iron_tile_1")
    -- Smoking barrels
    local smoking_input  = peripheral.wrap("metalbarrels:iron_tile_2")
    local smoking_output = peripheral.wrap("metalbarrels:iron_tile_3")
    -- Smelting barrels
    local smelting_input  = peripheral.wrap("metalbarrels:iron_tile_4")
    local smelting_output = peripheral.wrap("metalbarrels:iron_tile_5")

    -- Depots status table
    local depots_status = {
        washing_depots = {
            timer_status = {0, 0, 0, 0},
            timer_begin  = {0, 0, 0, 0},
            strings = {"", "", "", ""}
        },
        smoking_depots = {
            timer_status = {0, 0, 0, 0},
            timer_begin  = {0, 0, 0, 0},
            strings = {"", "", "", ""}
        },
        smelting_depots = {
            timer_status = {0, 0, 0, 0},
            timer_begin  = {0, 0, 0, 0},
            strings = {"", "", "", ""}
        }
    }

    -- Monitor wrapping
    local monitor = peripheral.wrap("monitor_0")
    print("Smelt-o-tron 4k initialized.")

    print("Clearing depots...")
    for i, depot in ipairs(washing_depots) do
        for slot, item in pairs(depot.list()) do
            depot.pushItems(peripheral.getName(washing_output), slot, 64)
        end
    end
    for i, depot in ipairs(smoking_depots) do
        for slot, item in pairs(depot.list()) do
            depot.pushItems(peripheral.getName(smoking_output), slot, 64)
        end
    end
    for i, depot in ipairs(smelting_depots) do
        for slot, item in pairs(depot.list()) do
            depot.pushItems(peripheral.getName(smelting_output), slot, 64)
        end
    end
    print("Depots cleared.")

    print("Monitor initializing...")
    monitor.setTextScale(1)
    monitor.setBackgroundColor(colors.black)
    monitor.setTextColor(colors.white)
    monitor.clear()
    monitor.setPaletteColor(colors.brown, 0x9d0208)
    monitor.setCursorPos(1, 1)
    print("Monitor initialized.")


    term.blit(string.rep(" ", 51), string.rep("f", 51), string.rep("5", 51))
    local x, y = term.getCursorPos()
    term.setCursorPos(1, y + 1)
    term.blit(string.rep(" ", 14) .. "Smelt-o-tron 4k started" .. string.rep(" ", 14), string.rep("f", 51), string.rep("5", 51))
    x, y = term.getCursorPos()
    term.setCursorPos(1, y + 1)
    term.blit(string.rep(" ", 51), string.rep("f", 51), string.rep("5", 51))

    -- Main loop
    while true do
        -- WASHING LOGIC
        -- Pushing items to the washing depots
        for slot, item in pairs(washing_input.list()) do
            for i, depot in ipairs(washing_depots) do
                if #depot.list() == 0 then
                    if item.count >= 1 and item.count <= 16 then
                        depots_status.washing_depots.timer_status[i] = 1
                    elseif item.count >= 17 and item.count <= 32 then
                        depots_status.washing_depots.timer_status[i] = 2
                    elseif item.count >= 33 and item.count <= 48 then
                        depots_status.washing_depots.timer_status[i] = 3
                    elseif item.count >= 49 and item.count <= 64 then
                        depots_status.washing_depots.timer_status[i] = 4
                    end

                    monitor.setCursorPos(1, 0 + i)
                    depots_status.washing_depots.strings[i] = item.count .. "x " .. washing_input.getItemDetail(slot).displayName
                    monitor.blit("proc", "0000", "bbbb"); monitor.setCursorPos(6, 0 + i)
                    monitor.write(depots_status.washing_depots.strings[i])

                    depots_status.washing_depots.timer_begin[i] = os.clock()
                    washing_input.pushItems(peripheral.getName(washing_depots[i]), slot, 64, 1)
                    break
                end
            end
        end

        -- Displaying the progress of the washing depots
        for i, depot in ipairs(washing_depots) do
            local proccessed_string = depots_status.washing_depots.strings[i]
            local progress = 0

            if depots_status.washing_depots.timer_status[i] == 1 then
                progress = math.ceil((os.clock() - depots_status.washing_depots.timer_begin[i]) * 3.2)
                if progress > 24 then
                    progress = 24
                end
            elseif depots_status.washing_depots.timer_status[i] == 2 then
                progress = math.ceil((os.clock() - depots_status.washing_depots.timer_begin[i]) * 1.6)
                if progress > 24 then
                    progress = 24
                end
            elseif depots_status.washing_depots.timer_status[i] == 3 then
                progress = math.ceil((os.clock() - depots_status.washing_depots.timer_begin[i]) * 1.07)
                if progress > 24 then
                    progress = 24
                end
            elseif depots_status.washing_depots.timer_status[i] == 4 then
                progress = math.ceil((os.clock() - depots_status.washing_depots.timer_begin[i]) * 0.8)
                if progress > 24 then
                    progress = 24
                end
            end

            monitor.setCursorPos(6, 0 + i)
            monitor.blit(proccessed_string .. string.rep(" ", 24 - string.len(proccessed_string)),
            string.rep("0", 24),
            string.rep("b", progress) .. string.rep("f", 24 - progress))

            if depots_status.washing_depots.timer_status[i] == 0 then
                monitor.setCursorPos(1, 0 + i)
                monitor.clearLine()
                monitor.blit("idle", "ffff", "3333")
            end
        end

        -- Pulling items from the washing depots
        for i, depot in ipairs(washing_depots) do
            local timer_status = depots_status.washing_depots.timer_status[i]
            local timer_begin  = depots_status.washing_depots.timer_begin[i]
            if timer_status > 0 and timer_status <= 4 then
                if timer_status == 1 and (os.clock() - timer_begin > 7.5 + 0.1) then
                    depots_status.washing_depots.timer_status[i] = 0
                    for slot, item in pairs(depot.list()) do
                        depot.pushItems(peripheral.getName(washing_output), slot, 64)
                    end
                elseif timer_status == 2 and (os.clock() - timer_begin > 15 + 0.1) then
                    depots_status.washing_depots.timer_status[i] = 0
                    for slot, item in pairs(depot.list()) do
                        depot.pushItems(peripheral.getName(washing_output), slot, 64)
                    end
                elseif timer_status == 3 and (os.clock() - timer_begin > 22.5 + 0.1) then
                    depots_status.washing_depots.timer_status[i] = 0
                    for slot, item in pairs(depot.list()) do
                        depot.pushItems(peripheral.getName(washing_output), slot, 64)
                    end
                elseif timer_status == 4 and (os.clock() - timer_begin > 30 + 0.1) then
                    depots_status.washing_depots.timer_status[i] = 0
                    for slot, item in pairs(depot.list()) do
                        depot.pushItems(peripheral.getName(washing_output), slot, 64)
                    end
                end
            end
        end


        -- SMOKING LOGIC
        -- Pushing items to the smoking depots
        for slot, item in pairs(smoking_input.list()) do
            for i, depot in ipairs(smoking_depots) do
                if #depot.list() == 0 then
                    if item.count >= 1 and item.count <= 16 then
                        depots_status.smoking_depots.timer_status[i] = 1
                    elseif item.count >= 17 and item.count <= 32 then
                        depots_status.smoking_depots.timer_status[i] = 2
                    elseif item.count >= 33 and item.count <= 48 then
                        depots_status.smoking_depots.timer_status[i] = 3
                    elseif item.count >= 49 and item.count <= 64 then
                        depots_status.smoking_depots.timer_status[i] = 4
                    end

                    monitor.setCursorPos(1, 4 + i)
                    depots_status.smoking_depots.strings[i] = item.count .. "x " .. smoking_input.getItemDetail(slot).displayName
                    monitor.blit("proc", "ffff", "1111"); monitor.setCursorPos(6, 4 + i)
                    monitor.write(depots_status.smoking_depots.strings[i])

                    depots_status.smoking_depots.timer_begin[i] = os.clock()
                    smoking_input.pushItems(peripheral.getName(smoking_depots[i]), slot, 64, 1)
                    break
                end
            end
        end

        -- Displaying the progress of the smoking depots
        for i, depot in ipairs(smoking_depots) do
            local proccessed_string = depots_status.smoking_depots.strings[i]
            local progress = 0

            if depots_status.smoking_depots.timer_status[i] == 1 then
                progress = math.ceil((os.clock() - depots_status.smoking_depots.timer_begin[i]) * 3.2)
                if progress > 24 then
                    progress = 24
                end
            elseif depots_status.smoking_depots.timer_status[i] == 2 then
                progress = math.ceil((os.clock() - depots_status.smoking_depots.timer_begin[i]) * 1.6)
                if progress > 24 then
                    progress = 24
                end
            elseif depots_status.smoking_depots.timer_status[i] == 3 then
                progress = math.ceil((os.clock() - depots_status.smoking_depots.timer_begin[i]) * 1.07)
                if progress > 24 then
                    progress = 24
                end
            elseif depots_status.smoking_depots.timer_status[i] == 4 then
                progress = math.ceil((os.clock() - depots_status.smoking_depots.timer_begin[i]) * 0.8)
                if progress > 24 then
                    progress = 24
                end
            end

            monitor.setCursorPos(6, 4 + i)
            monitor.blit(proccessed_string .. string.rep(" ", 24 - string.len(proccessed_string)),
            string.rep("f", progress) .. string.rep("0", 24 - progress),
            string.rep("1", progress) .. string.rep("f", 24 - progress))

            if depots_status.smoking_depots.timer_status[i] == 0 then
                monitor.setCursorPos(1, 4 + i)
                monitor.clearLine()
                monitor.blit("idle", "ffff", "4444")
            end
        end

        -- Pulling items from the smoking depots
        for i, depot in ipairs(smoking_depots) do
            local timer_status = depots_status.smoking_depots.timer_status[i]
            local timer_begin  = depots_status.smoking_depots.timer_begin[i]
            if timer_status > 0 and timer_status <= 4 then
                if timer_status == 1 and (os.clock() - timer_begin > 7.5 + 0.1) then
                    depots_status.smoking_depots.timer_status[i] = 0
                    for slot, item in pairs(depot.list()) do
                        depot.pushItems(peripheral.getName(smoking_output), slot, 64)
                    end
                elseif timer_status == 2 and (os.clock() - timer_begin > 15 + 0.1) then
                    depots_status.smoking_depots.timer_status[i] = 0
                    for slot, item in pairs(depot.list()) do
                        depot.pushItems(peripheral.getName(smoking_output), slot, 64)
                    end
                elseif timer_status == 3 and (os.clock() - timer_begin > 22.5 + 0.1) then
                    depots_status.smoking_depots.timer_status[i] = 0
                    for slot, item in pairs(depot.list()) do
                        depot.pushItems(peripheral.getName(smoking_output), slot, 64)
                    end
                elseif timer_status == 4 and (os.clock() - timer_begin > 30 + 0.1) then
                    depots_status.smoking_depots.timer_status[i] = 0
                    for slot, item in pairs(depot.list()) do
                        depot.pushItems(peripheral.getName(smoking_output), slot, 64)
                    end
                end
            end
        end


        -- SMELTING LOGIC
        -- Pushing items to the smelting depots
        for slot, item in pairs(smelting_input.list()) do
            for i, depot in ipairs(smelting_depots) do
                if #depot.list() == 0 then
                    if item.count >= 1 and item.count <= 16 then
                        depots_status.smelting_depots.timer_status[i] = 1
                    elseif item.count >= 17 and item.count <= 32 then
                        depots_status.smelting_depots.timer_status[i] = 2
                    elseif item.count >= 33 and item.count <= 48 then
                        depots_status.smelting_depots.timer_status[i] = 3
                    elseif item.count >= 49 and item.count <= 64 then
                        depots_status.smelting_depots.timer_status[i] = 4
                    end

                    monitor.setCursorPos(1, 8 + i)
                    depots_status.smelting_depots.strings[i] = item.count .. "x " .. smelting_input.getItemDetail(slot).displayName
                    monitor.blit("proc", "0000", "cccc"); monitor.setCursorPos(6, 8 + i)
                    monitor.write(depots_status.smelting_depots.strings[i])

                    depots_status.smelting_depots.timer_begin[i] = os.clock()
                    smelting_input.pushItems(peripheral.getName(smelting_depots[i]), slot, 64, 1)
                    break
                end
            end
        end

        -- Displaying the progress of the smelting depots
        for i, depot in ipairs(smelting_depots) do
            local proccessed_string = depots_status.smelting_depots.strings[i]
            local progress = 0

            if depots_status.smelting_depots.timer_status[i] == 1 then
                progress = math.ceil((os.clock() - depots_status.smelting_depots.timer_begin[i]) * 3.2)
                if progress > 24 then
                    progress = 24
                end
            elseif depots_status.smelting_depots.timer_status[i] == 2 then
                progress = math.ceil((os.clock() - depots_status.smelting_depots.timer_begin[i]) * 1.6)
                if progress > 24 then
                    progress = 24
                end
            elseif depots_status.smelting_depots.timer_status[i] == 3 then
                progress = math.ceil((os.clock() - depots_status.smelting_depots.timer_begin[i]) * 1.07)
                if progress > 24 then
                    progress = 24
                end
            elseif depots_status.smelting_depots.timer_status[i] == 4 then
                progress = math.ceil((os.clock() - depots_status.smelting_depots.timer_begin[i]) * 0.8)
                if progress > 24 then
                    progress = 24
                end
            end

            monitor.setCursorPos(6, 8 + i)
            monitor.blit(proccessed_string .. string.rep(" ", 24 - string.len(proccessed_string)),
            string.rep("0", 24),
            string.rep("c", progress) .. string.rep("f", 24 - progress))

            if depots_status.smelting_depots.timer_status[i] == 0 then
                monitor.setCursorPos(1, 8 + i)
                monitor.clearLine()
                monitor.blit("idle", "ffff", "eeee")
            end
        end

        -- Pulling items from the smelting depots
        for i, depot in ipairs(smelting_depots) do
            local timer_status = depots_status.smelting_depots.timer_status[i]
            local timer_begin  = depots_status.smelting_depots.timer_begin[i]
            if timer_status > 0 and timer_status <= 4 then
                if timer_status == 1 and (os.clock() - timer_begin > 7.5 + 0.1) then
                    depots_status.smelting_depots.timer_status[i] = 0
                    for slot, item in pairs(depot.list()) do
                        depot.pushItems(peripheral.getName(smelting_output), slot, 64)
                    end

                    monitor.setCursorPos(1, 8 + i)
                    monitor.clearLine()
                    monitor.blit("idle", "0000", "eeee")
                elseif timer_status == 2 and (os.clock() - timer_begin > 15 + 0.1) then
                    depots_status.smelting_depots.timer_status[i] = 0
                    for slot, item in pairs(depot.list()) do
                        depot.pushItems(peripheral.getName(smelting_output), slot, 64)
                    end

                    monitor.setCursorPos(1, 8 + i)
                    monitor.clearLine()
                    monitor.blit("idle", "0000", "eeee")
                elseif timer_status == 3 and (os.clock() - timer_begin > 22.5 + 0.1) then
                    depots_status.smelting_depots.timer_status[i] = 0
                    for slot, item in pairs(depot.list()) do
                        depot.pushItems(peripheral.getName(smelting_output), slot, 64)
                    end

                    monitor.setCursorPos(1, 8 + i)
                    monitor.clearLine()
                    monitor.blit("idle", "0000", "eeee")
                elseif timer_status == 4 and (os.clock() - timer_begin > 30 + 0.1) then
                    depots_status.smelting_depots.timer_status[i] = 0
                    for slot, item in pairs(depot.list()) do
                        depot.pushItems(peripheral.getName(smelting_output), slot, 64)
                    end

                    monitor.setCursorPos(1, 8 + i)
                    monitor.clearLine()
                    monitor.blit("idle", "0000", "eeee")
                end
            end
        end
    end
end)

if not ok then
    print("Smelting-o-tron 4k error: " .. err)
    os.reboot(30)
end
