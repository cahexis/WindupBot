local bot = script.Parent
local hum = bot.Humanoid
local root = bot.HumanoidRootPart
local hitbox = bot.hitbox
local death = true
hum:Move(root.CFrame.LookVector*10)
bot.WindupWalk:Play()

hitbox.Touched:Connect(function(hit)
	local explosion = Instance.new("Explosion")
	explosion.BlastRadius = 10
	explosion.BlastPressure = 10
	local player = game:GetService("Players"):GetPlayerFromCharacter(hit.Parent)
	if not player and hit.Name ~= "Baseplate" then
		root.CFrame*= CFrame.Angles(0, math.rad(180), 0)
		hum:Move(root.CFrame.LookVector)
		wait(1)	
	elseif player then
		if death == true then
			explosion.Parent = bot
			explosion.Position = Vector3.new(root.Position.X, root.Position.Y,root.Position.Z)
			hum.PlatformStand = true
			bot:BreakJoints()
			death = false
			bot.WindupWalk:Stop()
			wait(5)
			bot:Destroy()
		end
		wait(1)
	end
end)
