-- !strict
-- !native

local Vector2Math = {}

do
	local _container = Vector2Math
	local function Add(a: Vector2, b: Vector2): Vector2
		return Vector2.new(a.X + b.X, a.Y + b.Y)
	end
	_container.Add = Add

	local function Sub(a: Vector2, b: Vector2): Vector2
		return Vector2.new(a.X - b.X, a.Y - b.Y)
	end
	_container.Sub = Sub

	local function Mul(a: Vector2, b: Vector2): Vector2
		return Vector2.new(a.X * b.X, a.Y * b.Y)
	end
	_container.Mul = Mul

	local function Div(a: Vector2, b: Vector2): Vector2
		return Vector2.new(a.X / b.X, a.Y / b.Y)
	end
	_container.Div = Div

	local function Dot(a: Vector2, b: Vector2): number
		return a.X * b.X + a.Y * b.Y
	end
	_container.Dot = Dot
end

return {
	Vector2Math = Vector2Math,
}
