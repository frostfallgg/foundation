-- Compiled with roblox-ts v3.0.0
local TS = _G[script]
local exports = {}
for _k, _v in TS.import(script, script, "action") or {} do
	exports[_k] = _v
end
for _k, _v in TS.import(script, script, "testing") or {} do
	exports[_k] = _v
end
for _k, _v in TS.import(script, script, "benchmarker") or {} do
	exports[_k] = _v
end
for _k, _v in TS.import(script, script, "draw") or {} do
	exports[_k] = _v
end
for _k, _v in TS.import(script, script, "native", "list") or {} do
	exports[_k] = _v
end
for _k, _v in TS.import(script, script, "native", "math") or {} do
	exports[_k] = _v
end
for _k, _v in TS.import(script, script, "native", "hashmap") or {} do
	exports[_k] = _v
end
for _k, _v in TS.import(script, script, "data-structures", "native", "priority-queue") or {} do
	exports[_k] = _v
end
for _k, _v in TS.import(script, script, "data-structures", "native", "queue") or {} do
	exports[_k] = _v
end
return exports
