-- AndeisteOS 1.0
-- Peripheral import

-- Drawers
algaeDrawers         = peripheral.wrap("storagedrawers:standard_drawers_1_5")
clayDrawers          = peripheral.wrap("storagedrawers:standard_drawers_1_1")
algaeBrickDrawers    = peripheral.wrap("storagedrawers:standard_drawers_1_3")
andesiteDrawers      = peripheral.wrap("storagedrawers:standard_drawers_1_0")
andesiteAlloyDrawers = peripheral.wrap("storagedrawers:standard_drawers_1_6")
andesiteAlloyUOutput = peripheral.wrap("storagedrawers:standard_drawers_1_7")

-- Monitor
monitor = peripheral.wrap("monitor_3")


-- Clear screen
monitor.setBackgroundColour(colours.black)
monitor.setTextColour(colours.white)
monitor.clear()


-- Print header and labels
monitor.setCursorPos(1, 1)
monitor.blit(
    " AndesiteOS"..string.rep(" ", 18),
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


-- Print content
while true do
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
    os.sleep(1)
end
