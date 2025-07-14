local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local function freezeTradeUI()
    local tradeUI = LocalPlayer.PlayerGui:FindFirstChild("TradeUI")
    if not tradeUI then
        warn("Trade UI not found! Make sure you are in a trade.")
        return
    end

    for _, buttonName in pairs({"Confirm", "Cancel", "Decline"}) do
        local button = tradeUI:FindFirstChild(buttonName)
        if button then
            button.Active = false
            button.Visible = false
            print(buttonName .. " button disabled and hidden")
        else
            print(buttonName .. " button not found")
        end
    end
end

local function autoConfirm()
    spawn(function()
        while true do
            local tradeUI = LocalPlayer.PlayerGui:FindFirstChild("TradeUI")
            if tradeUI then
                local confirmButton = tradeUI:FindFirstChild("Confirm")
                if confirmButton and confirmButton.Visible and confirmButton.Active then
                    confirmButton:Activate()
                    print("Confirm button clicked")
                else
                    print("Confirm button not clickable or not found")
                end
            else
                print("Trade UI not found")
            end
            wait(1)
        end
    end)
end

freezeTradeUI()
autoConfirm()
