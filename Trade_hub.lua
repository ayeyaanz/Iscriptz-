local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "TradeHub"
ScreenGui.Parent = game.CoreGui

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 250, 0, 120)
Frame.Position = UDim2.new(0.5, -125, 0.5, -60)
Frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Frame.Parent = ScreenGui

local Button = Instance.new("TextButton")
Button.Size = UDim2.new(0, 230, 0, 50)
Button.Position = UDim2.new(0, 10, 0, 35)
Button.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
Button.TextColor3 = Color3.new(1, 1, 1)
Button.Text = "Activate Trade Freeze"
Button.Parent = Frame

Button.MouseButton1Click:Connect(function()
    print("Trying to freeze trade...")

    local tradeUI = LocalPlayer.PlayerGui:FindFirstChild("TradeUI")
    if not tradeUI then
        warn("Trade UI not found! Make sure you are in a trade.")
        return
    end

    local unconfirmButton = tradeUI:FindFirstChild("UnconfirmButton")
    local declineButton = tradeUI:FindFirstChild("DeclineButton")
    local removeItemButtons = tradeUI:FindFirstChild("RemoveItemButtons")

    if unconfirmButton then
        unconfirmButton.Active = false
        unconfirmButton.Visible = false
        print("Unconfirm button disabled")
    else
        print("Unconfirm button not found")
    end

    if declineButton then
        declineButton.Active = false
        declineButton.Visible = false
        print("Decline button disabled")
    else
        print("Decline button not found")
    end

    if removeItemButtons then
        for _, btn in pairs(removeItemButtons:GetChildren()) do
            btn.Active = false
            btn.Visible = false
        end
        print("Remove item buttons disabled")
    else
        print("Remove item buttons not found")
    end

    print("Trade freeze attempt complete")
end)
