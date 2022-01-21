-- AndeisteOS 2.0
print("AndesiteOS 2.0 init")
local ok, err = pcall(function ()
    -- Peripheral import

    -- Drawers
    algaeDrawers         = peripheral.wrap("storagedrawers:standard_drawers_1_5")
    clayDrawers          = peripheral.wrap("storagedrawers:standard_drawers_1_1")
    algaeBrickDrawers    = peripheral.wrap("storagedrawers:standard_drawers_1_3")
    andesiteDrawers      = peripheral.wrap("storagedrawers:standard_drawers_1_0")
    andesiteAlloyDrawers = peripheral.wrap("storagedrawers:standard_drawers_1_6")
    andesiteAlloyUOutput = peripheral.wrap("storagedrawers:standard_drawers_1_7")

    kineticMechDrawers   = peripheral.wrap("storagedrawers:standard_drawers_1_9")
    factoryOutput        = peripheral.wrap("storagedrawers:standard_drawers_1_20")
    woodDrawers          = peripheral.wrap("storagedrawers:standard_drawers_1_11")
    sawBarrel            = peripheral.wrap("minecraft:barrel_4")

    -- Monitor
    monitor = peripheral.wrap("monitor_3")
    monKin  = peripheral.wrap("monitor_4")


    -- Clear screen
    monitor.setBackgroundColour(colours.black)
    monitor.setTextColour(colours.white)
    monitor.clear()
    monKin.setBackgroundColour(colours.black)
    monKin.setTextColour(colours.white)
    monKin.clear()


    -- Print header and labels - Andesite alloy monitor
    monitor.setCursorPos(1, 1)
    monitor.blit(
        " AndesiteOS 2.0"..string.rep(" ", 14),
        string.rep(colours.toBlit(colours.black ), 29),
        string.rep(colours.toBlit(colours.yellow), 29)
    )
    monitor.setCursorPos(1, 3)
    monitor.blit(
        " Algae"..string.rep(" ", 23),
        string.rep(colours.toBlit(colours.orange), 29),
        string.rep(colours.toBlit(colours.black), 29)
    )
    monitor.setCursorPos(1, 5)
    monitor.blit(
        " Clay"..string.rep(" ", 24),
        string.rep(colours.toBlit(colours.orange), 29),
        string.rep(colours.toBlit(colours.black), 29)
    )
    monitor.setCursorPos(1, 7)
    monitor.blit(
        " Andesite"..string.rep(" ", 20),
        string.rep(colours.toBlit(colours.orange), 29),
        string.rep(colours.toBlit(colours.black), 29)
    )
    monitor.setCursorPos(1, 9)
    monitor.blit(
        " Andesite Alloy - Production ",
        string.rep(colours.toBlit(colours.orange), 29),
        string.rep(colours.toBlit(colours.black), 29)
    )
    monitor.setCursorPos(1, 11)
    monitor.blit(
        " Andesite Alloy - User Output",
        string.rep(colours.toBlit(colours.orange), 29),
        string.rep(colours.toBlit(colours.black), 29)
    )
    -- Print header and labels - Kinetic mechanism monitor
    monKin.setCursorPos(1, 1)
    monKin.blit(
        " AndesiteOS 2.0"..string.rep(" ", 14),
        string.rep(colours.toBlit(colours.black ), 29),
        string.rep(colours.toBlit(colours.yellow), 29)
    )
    monKin.setCursorPos(1, 3)
    monKin.blit(
        " Oak Log"..string.rep(" ", 21),
        string.rep(colours.toBlit(colours.orange), 29),
        string.rep(colours.toBlit(colours.black), 29)
    )
    monKin.setCursorPos(1, 5)
    monKin.blit(
        " Saw"..string.rep(" ", 25),
        string.rep(colours.toBlit(colours.orange), 29),
        string.rep(colours.toBlit(colours.black), 29)
    )
    monKin.setCursorPos(1, 7)
    monKin.blit(
        " Kinetic mehcanism"..string.rep(" ", 11),
        string.rep(colours.toBlit(colours.orange), 29),
        string.rep(colours.toBlit(colours.black), 29)
    )
    monKin.setCursorPos(1, 9)
    monKin.blit(
        " KinMech output to PrecMech  ",
        string.rep(colours.toBlit(colours.orange), 29),
        string.rep(colours.toBlit(colours.black), 29)
    )

    -- Print content
    while true do
        -- Kinetic factory output
        if kineticMechDrawers.getItemDetail(2) ~= nil then
            if kineticMechDrawers.getItemDetail(2).count > 128 then
                kineticMechDrawers.pushItems(peripheral.getName(factoryOutput), 2, 16)
            end
        end
        -- Algae
        if algaeDrawers.getItemDetail(2) ~= nil then
            countString = algaeDrawers.getItemDetail(2).count
            monitor.setCursorPos(1, 4)
            monitor.blit(
                " "..countString..string.rep(" ", 28 - string.len(countString)),
                string.rep(colours.toBlit(colours.white), 29),
                string.rep(colours.toBlit(colours.black), 29)
            )
        else
            monitor.setCursorPos(1, 4)
            monitor.blit(
                " 0"..string.rep(" ", 27),
                string.rep(colours.toBlit(colours.white), 29),
                string.rep(colours.toBlit(colours.red), 29)
            )
        end
        -- Clay
        if clayDrawers.getItemDetail(2) ~= nil then
            countString = clayDrawers.getItemDetail(2).count
            monitor.setCursorPos(1, 6)
            monitor.blit(
                " "..countString..string.rep(" ", 28 - string.len(countString)),
                string.rep(colours.toBlit(colours.white), 29),
                string.rep(colours.toBlit(colours.black), 29)
            )
        else
            monitor.setCursorPos(1, 6)
            monitor.blit(
                " 0"..string.rep(" ", 27),
                string.rep(colours.toBlit(colours.white), 29),
                string.rep(colours.toBlit(colours.red), 29)
            )
        end
        -- Andesite
        if andesiteDrawers.getItemDetail(2) ~= nil then
            countString = andesiteDrawers.getItemDetail(2).count
            monitor.setCursorPos(1, 8)
            monitor.blit(
                " "..countString..string.rep(" ", 28 - string.len(countString)),
                string.rep(colours.toBlit(colours.white), 29),
                string.rep(colours.toBlit(colours.black), 29)
            )
        else
            monitor.setCursorPos(1, 8)
            monitor.blit(
                " 0"..string.rep(" ", 27),
                string.rep(colours.toBlit(colours.white), 29),
                string.rep(colours.toBlit(colours.red), 29)
            )
        end
        -- Andesite Alloy - Production
        andesiteAlloyDrawers.pushItems(peripheral.getName(andesiteAlloyUOutput), 2)
        if andesiteAlloyDrawers.getItemDetail(2) ~= nil then
            countString = andesiteAlloyDrawers.getItemDetail(2).count
            monitor.setCursorPos(1, 10)
            monitor.blit(
                " "..countString..string.rep(" ", 28 - string.len(countString)),
                string.rep(colours.toBlit(colours.white), 29),
                string.rep(colours.toBlit(colours.black), 29)
            )
        else
            monitor.setCursorPos(1, 10)
            monitor.blit(
                " 0"..string.rep(" ", 27),
                string.rep(colours.toBlit(colours.white), 29),
                string.rep(colours.toBlit(colours.red), 29)
            )
        end
        -- Andesite Alloy - User Output
        if andesiteAlloyUOutput.getItemDetail(2) ~= nil then
            countString = andesiteAlloyUOutput.getItemDetail(2).count
            monitor.setCursorPos(1, 12)
            monitor.blit(
                " "..countString..string.rep(" ", 28 - string.len(countString)),
                string.rep(colours.toBlit(colours.white), 29),
                string.rep(colours.toBlit(colours.black), 29)
            )
        else
            monitor.setCursorPos(1, 12)
            monitor.blit(
                " 0"..string.rep(" ", 27),
                string.rep(colours.toBlit(colours.white), 29),
                string.rep(colours.toBlit(colours.red), 29)
            )
        end
        -- Oak Log
        if woodDrawers.getItemDetail(2) ~= nil then
            countString = woodDrawers.getItemDetail(2).count
            monKin.setCursorPos(1, 4)
            monKin.blit(
                " "..countString..string.rep(" ", 28 - string.len(countString)),
                string.rep(colours.toBlit(colours.white), 29),
                string.rep(colours.toBlit(colours.black), 29)
            )
        else
            monKin.setCursorPos(1, 4)
            monKin.blit(
                " 0"..string.rep(" ", 27),
                string.rep(colours.toBlit(colours.white), 29),
                string.rep(colours.toBlit(colours.red), 29)
            )
        end
        -- Saw
        countString = 0
        for k, v in pairs(sawBarrel.list()) do countString = countString + 1 end
        if countString ~= 0 then
            monKin.setCursorPos(1, 6)
            monKin.blit(
                " "..countString..string.rep(" ", 28 - string.len(countString)),
                string.rep(colours.toBlit(colours.white), 29),
                string.rep(colours.toBlit(colours.black), 29)
            )
        else
            monKin.setCursorPos(1, 6)
            monKin.blit(
                " 0"..string.rep(" ", 27),
                string.rep(colours.toBlit(colours.white), 29),
                string.rep(colours.toBlit(colours.red), 29)
            )
        end
        -- Kinetic Mechanism
        if kineticMechDrawers.getItemDetail(2) ~= nil then
            countString = kineticMechDrawers.getItemDetail(2).count
            monKin.setCursorPos(1, 8)
            monKin.blit(
                " "..countString..string.rep(" ", 28 - string.len(countString)),
                string.rep(colours.toBlit(colours.white), 29),
                string.rep(colours.toBlit(colours.black), 29)
            )
        else
            monKin.setCursorPos(1, 8)
            monKin.blit(
                " 0"..string.rep(" ", 27),
                string.rep(colours.toBlit(colours.white), 29),
                string.rep(colours.toBlit(colours.red), 29)
            )
        end
        if factoryOutput.getItemDetail(2) ~= nil then
            countString = factoryOutput.getItemDetail(2).count
            monKin.setCursorPos(1, 10)
            monKin.blit(
                " "..countString..string.rep(" ", 28 - string.len(countString)),
                string.rep(colours.toBlit(colours.white), 29),
                string.rep(colours.toBlit(colours.black), 29)
            )
        else
            monKin.setCursorPos(1, 10)
            monKin.blit(
                " 0"..string.rep(" ", 27),
                string.rep(colours.toBlit(colours.white), 29),
                string.rep(colours.toBlit(colours.red), 29)
            )
        end
        os.sleep(1)
    end
end)

if not ok then
    printError(err)
    sleep(5)
    os.reboot()
  end