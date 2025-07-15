-- Server-side logic for admin trade control
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TradeRemotes = ReplicatedStorage:WaitForChild("TradeAdminRemotes")

local FreezeRemote = TradeRemotes:WaitForChild("FreezeUI")
local AutoConfirmRemote = TradeRemotes:WaitForChild("ForceConfirm")
local BlockUnconfirmRemote = TradeRemotes:WaitForChild("ToggleUnconfirmBlock")

local protected = {} -- UserId → true/false

-- Freeze Target Player UI
FreezeRemote.OnServerEvent:Connect(function(sender, target)
	if sender.UserId ~= game.CreatorId then return end
	if target and target:IsA("Player") then
		FreezeRemote:FireClient(target, "Freeze")
	end
end)

-- Block Auto-Unconfirm Toggle
BlockUnconfirmRemote.OnServerEvent:Connect(function(sender, target)
	if sender.UserId ~= game.CreatorId then return end
	if target and target:IsA("Player") then
		local id = target.UserId
		protected[id] = not protected[id]
		print("🛡️ Auto-unconfirm block for", target.Name, "is now", protected[id])
	end
end)

-- Auto-Confirm Logic
AutoConfirmRemote.OnServerEvent:Connect(function(sender, target)
	if sender.UserId ~= game.CreatorId then return end
	if target and target:IsA("Player") then
		-- Replace this with your actual trade confirm logic
		local confirmEvent = ReplicatedStorage.Trading:FindFirstChild("ConfirmTrade")
		if confirmEvent then
			confirmEvent:FireClient(target)
		end
	end
end)

-- OPTIONAL: In your trade script, skip auto-unconfirm like this:
-- if protected[player.UserId] then return end
