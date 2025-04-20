local UserInputService = game:GetService("UserInputService")
local char = game.Players.LocalPlayer.Character
local rep = game:GetService("ReplicatedStorage")
local remote = rep.Windup
local cooldown = false


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
