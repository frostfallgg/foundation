-- !strict
-- !native

local GuiUtils = {}

do
	local _container = GuiUtils
	local function UDim2Offset(udim: UDim2, offsetX: number, offsetY: number)
		return UDim2.new(udim.X.Scale, udim.X.Offset + offsetX, udim.Y.Scale, udim.Y.Offset + offsetY)
	end
	_container.UDim2Offset = UDim2Offset
end

return {
	GuiUtils = GuiUtils,
}
