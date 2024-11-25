--!strict
--!native

local HashMap = {}

do
	local _container = HashMap
	local function GetArbitraryKey<T, U>(this: { [T]: U }): T | nil
		for key, _ in this do
			return key
		end
		return nil
	end
	_container.GetArbitraryKey = GetArbitraryKey

	local function GetArbitraryValue<T, U>(this: { [T]: U }): U | nil
		for _, value in this do
			return value
		end
		return nil
	end
	_container.GetArbitraryValue = GetArbitraryValue
end

return {
	HashMap = HashMap,
}
