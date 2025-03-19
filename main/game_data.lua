local M = {}

local state = {
    highscore = 0,
    exp = 0,
    crystals = 5,
    saved = false,
    switchPower = 0,
} --all scripts share


function M.setHighScore(score)
    state.highscore = score;
end

function M.getHighScore()
    return state.highscore;
end

function M.setSwitchPower(num)
    state.switchPower = num;
end

function M.getSwitchPower()
    return state.switchPower;
end

function M.setExp(num)
    state.exp = num;
end

function M.getExp()
    return state.exp;
end

function M.setCrystals(num)
    state.crystals = num;
end

function M.getCrystals()
    return state.crystals;
end

function M.setSaved(value)
    print("setting saved as "..tostring(value))
    state.saved = value;
end

function M.getSaved()
    print("the value of saved is "..tostring(state.saved))
    return state.saved;
end

function M.setStateTable(table)
    for k,v in pairs(table) do
        state[k] = table[k] or state[k] --restore default if no value is given
    end
end

function M.getStateTable()
    return state;
end

return M

