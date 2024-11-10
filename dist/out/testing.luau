-- Compiled with roblox-ts v3.0.0
local TS = _G[script]
local _services = TS.import(script, TS.getModule(script, "@rbxts", "services"))
local Players = _services.Players
local RunService = _services.RunService
local Testing = {}
do
	local _container = Testing
	local function SetLocalCharacterSpeed(speed)
		if speed == nil then
			speed = 24
		end
		if not RunService:IsClient() then
			return nil
		end
		local character = Players.LocalPlayer.Character or (Players.LocalPlayer.CharacterAdded:Wait())
		local _exitType, _returns = TS.try(function()
			local humanoid = character:WaitForChild("Humanoid")
			humanoid.WalkSpeed = speed
		end, function(e)
			warn(`Could not find Humanoid on {character.Name}`)
			return TS.TRY_RETURN, {}
		end)
		if _exitType then
			return unpack(_returns)
		end
	end
	_container.SetLocalCharacterSpeed = SetLocalCharacterSpeed
end
return {
	Testing = Testing,
}
