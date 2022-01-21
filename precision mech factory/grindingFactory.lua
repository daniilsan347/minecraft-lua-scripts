local ok, err = pcall(function ()
    print("Grinding factory script init")
    local p = peripheral

    local clayInput = p.wrap("storagedrawers:standard_drawers_1_29")
    local ironNuggetsInput = p.wrap("storagedrawers:fractional_drawers_3_0")
    local ironNuggetsOutput = p.wrap("storagedrawers:standard_drawers_1_33")
    local clayOutput = p.wrap("storagedrawers:standard_drawers_1_34")

    while true do
        if clayInput.getItemDetail(2).count >= 1152 and clayOutput.getItemDetail(2).count <= 128 then
            clayOutput.pullItems(p.getName(clayInput), 2, 128, 2)
        end
        if ironNuggetsInput.getItemDetail(4).count >= 1152 and ironNuggetsOutput.getItemDetail(2).count <= 128 then
            ironNuggetsOutput.pullItems(p.getName(ironNuggetsInput), 4, 128, 2)
        end
    end
end)

if not ok then
    printError(err)
    sleep(5)
    os.reboot()
  end