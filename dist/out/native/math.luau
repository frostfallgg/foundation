--!strict
--!native

local Math = {}

do
	local _container = Math
	local function Mean(input: { number }): number
		local sum = 0
		for _, x in input do
			sum += x
		end
		return sum / #input
	end
	_container.Mean = Mean

	local function Median(input: { number }): number
		table.sort(input)
		if #input % 2 == 0 then
			return (input[#input / 2] + input[#input / 2 + 1]) / 2
		else
			return input[#input / 2 + 1]
		end
	end
	_container.Median = Median
end

return {
	Math = Math,
}
