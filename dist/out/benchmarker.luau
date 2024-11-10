-- Compiled with roblox-ts v3.0.0
local TS = _G[script]
local Math = TS.import(script, script.Parent, "native", "math").Math
local DEFAULT_CONFIG, Order
local Benchmarker
do
	Benchmarker = setmetatable({}, {
		__tostring = function()
			return "Benchmarker"
		end,
	})
	Benchmarker.__index = Benchmarker
	function Benchmarker.new(...)
		local self = setmetatable({}, Benchmarker)
		return self:constructor(...) or self
	end
	function Benchmarker:constructor(config)
		local _object = table.clone(DEFAULT_CONFIG)
		setmetatable(_object, nil)
		if config then
			for _k, _v in config do
				_object[_k] = _v
			end
		end
		local compiledConfig = _object
		self.Precision = compiledConfig.precision
		self.RunIterations = compiledConfig.runIterations
		self.WarmupIterations = compiledConfig.warmupIterations
		self.StoredFunctions = {}
	end
	function Benchmarker:RegisterFunction(name, func)
		self.StoredFunctions[name] = func
	end
	function Benchmarker:RunAll(comparisonOrder)
		if comparisonOrder == nil then
			comparisonOrder = Order.Median
		end
		local results = {}
		for name, func in pairs(self.StoredFunctions) do
			local runtimes = {}
			do
				local i = 0
				local _shouldIncrement = false
				while true do
					if _shouldIncrement then
						i += 1
					else
						_shouldIncrement = true
					end
					if not (i < self.WarmupIterations) then
						break
					end
					func()
				end
			end
			do
				local i = 0
				local _shouldIncrement = false
				while true do
					if _shouldIncrement then
						i += 1
					else
						_shouldIncrement = true
					end
					if not (i < self.RunIterations) then
						break
					end
					local start = os.clock()
					func()
					local _arg0 = os.clock() - start
					table.insert(runtimes, _arg0)
				end
			end
			local _arg0 = self:ProcessRuntimes(name, runtimes)
			table.insert(results, _arg0)
		end
		self:PrintResults(results, comparisonOrder)
	end
	function Benchmarker:UnregisterFunction(name)
		self.StoredFunctions[name] = nil
	end
	function Benchmarker:PrintResults(results, order)
		table.sort(results, function(a, b)
			return a[order] < b[order]
		end)
		local getOuput = function(result)
			local medianOutput = string.format(`%s: %.{self.Precision}fms`, result[Order.Median])
			local maxOutput = string.format(`%s: %.{self.Precision}fms`, result[Order.Max])
			local minOutput = string.format(`%s: %.{self.Precision}fms`, result[Order.Min])
			return medianOutput, maxOutput, minOutput
		end
		for i = 0, #results - 1 do
			local result = results[i + 1]
			local medianOutput, maxOutput, minOutput = getOuput(result)
			if i > 1 then
				local fasterResult = results[i]
				local percentageFaster = ((result[order] - fasterResult[order]) / fasterResult[order]) * 100
				print(`{i + 1}: {result.name} - {string.format("%.2f%%", percentageFaster)} then {fasterResult.name} ({order})`)
				print(`[Median: {medianOutput}], [Max: {maxOutput}], [Min: {minOutput}]`)
			else
				print(`{i + 1}: {result.name}`)
				print(`[Median: {medianOutput}], [Max: {maxOutput}], [Min: {minOutput}]`)
			end
		end
	end
	function Benchmarker:ProcessRuntimes(name, runtimes)
		table.sort(runtimes, function(a, b)
			return a < b
		end)
		local result = {
			[Order.Max] = runtimes[#runtimes],
			[Order.Median] = Math.Median(runtimes),
			[Order.Min] = runtimes[1],
			name = name,
		}
		return result
	end
end
Order = {
	Median = "Median",
	Max = "Max",
	Min = "Min",
}
DEFAULT_CONFIG = {
	precision = 10,
	runIterations = 10,
	warmupIterations = 5,
}
return {
	Benchmarker = Benchmarker,
}
