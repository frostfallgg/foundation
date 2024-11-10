-- Compiled with roblox-ts v3.0.0
local TS = _G[script]
local ContextActionService = TS.import(script, TS.getModule(script, "@rbxts", "services")).ContextActionService
local Action = {}
do
	local _container = Action
	local function Bind(actionName, callback, ...)
		local inputTypes = { ... }
		ContextActionService:BindAction(actionName, callback, false, unpack(inputTypes))
		return function()
			return ContextActionService:UnbindAction(actionName)
		end, actionName
	end
	_container.Bind = Bind
	local function BindWithTouch(actionName, callback, ...)
		local inputTypes = { ... }
		ContextActionService:BindAction(actionName, callback, true, unpack(inputTypes))
		return function()
			return ContextActionService:UnbindAction(actionName)
		end, actionName
	end
	_container.BindWithTouch = BindWithTouch
end
return {
	Action = Action,
}
