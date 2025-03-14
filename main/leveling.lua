local M = {}

function M.get_level(exp)
	local level = math.sqrt((exp/30)+2490)-50
	return math.max(0, math.floor(level))
end

function M.get_required_exp(level)
	local exp = (30*math.pow(level, 2))+(3000*level)+300
	return math.max(0, math.floor(exp))
end

return M