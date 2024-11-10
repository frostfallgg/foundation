-- Compiled with roblox-ts v3.0.0
local TS = _G[script]
local Workspace = TS.import(script, TS.getModule(script, "@rbxts", "services")).Workspace
local DEFAULT_STATIC_PART_PROPS = {
	color = Color3.fromRGB(51, 125, 54),
	size = 1,
	transparency = 0,
}
local container = Workspace:FindFirstChild("draw-container")
if not container then
	container = Instance.new("Folder")
	container.Name = "draw-container"
	container.Parent = Workspace
end
local Draw = {}
do
	local _container = Draw
	local function StaticPart(position, props)
		local _object = table.clone(DEFAULT_STATIC_PART_PROPS)
		setmetatable(_object, nil)
		if props then
			for _k, _v in props do
				_object[_k] = _v
			end
		end
		local propsToUse = _object
		local part = Instance.new("Part")
		part.Size = Vector3.new(propsToUse.size, propsToUse.size, propsToUse.size)
		part.Transparency = propsToUse.transparency
		part.Color = propsToUse.color
		part.Anchored = true
		part.CanCollide = false
		part.CanTouch = false
		part.CastShadow = false
		part.CanQuery = false
		part.Shape = Enum.PartType.Ball
		part.Material = Enum.Material.SmoothPlastic
		part.Position = position
		part.Parent = container
		return part
	end
	_container.StaticPart = StaticPart
	local function ClearAll()
		for _, child in container:GetChildren() do
			child:Destroy()
		end
	end
	_container.ClearAll = ClearAll
end
return {
	Draw = Draw,
}
