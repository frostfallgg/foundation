--!strict
--!native

local List = {}

do
	local _container = List
	local function GetRandomElement<T>(this: { T }): T
		return this[math.random(1, #this)]
	end
	_container.GetRandomElement = GetRandomElement

	local function Shuffle<T>(this: { T })
		local len = #this
		for i = len, 2, -1 do
			local j = math.random(i)
			this[i], this[j] = this[j], this[i]
		end
	end
	_container.Shuffle = Shuffle
end

return {
	List = List,
}
