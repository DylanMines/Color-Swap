local M = {}
local game_save = require("main.game.game_save")

function M.getDifficulty()
    local size = game_save.getSize()
    return ((size.x * 1.2) * (size.y * 1.2) * size.z) - 25
end

function M.getScore()
    local difficulty = M.getDifficulty()
	local score = math.floor((difficulty/game_save.getTime()) * 1005)
	--print(difficulty,message.time)
	if score < 10 then
		score = 10
	end
	return score

end

function M.getCrystals()
    print(M.getDifficulty(),game_save.getTime())
    local num = (2*M.getDifficulty())/game_save.getTime() + 1.5
    return math.floor(num) --0.5 to round
end

return M