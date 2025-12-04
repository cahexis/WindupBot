local UserInputService = game:GetService("UserInputService")
local char = game.Players.LocalPlayer.Character
local rep = game:GetService("ReplicatedStorage")
local remote = rep.Windup
local cooldown = false

-- below is the code used for spawning the windup robot, having a cooldown to prevent spamming it.
UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
	if input.UserInputType == Enum.UserInputType.Keyboard then 
		if input.KeyCode == Enum.KeyCode.Z then 
			if cooldown == false then
				remote:FireServer()
				cooldown = true
				wait(4)
				cooldown = false
			end
		end
	end
end)
