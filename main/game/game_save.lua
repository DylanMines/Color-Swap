local M = {}

local state = { --private static dictionary for my java head
    time = 0,
    size = vmath.vector3(0),
    template = {},
    board = {}
}

function M.setTime(num)
    state.time = num;
end

function M.getTime()
    return state.time;
end

function M.setSize(num)
    state.size = num;
end

function M.getSize()
    return state.size;
end

function M.setTemplate(table)
    state.template = table;
end

function M.addToTemplate(num)
    table.insert(state.template, num)
end

function M.getTemplate()
    return state.template;
end

function M.setBoard(table)
    state.board = table;
end

function M.addToBoard(num)
    table.insert(state.board, num)
end

function M.getBoard()
    return state.board;
end

function M.setStateTable(table)
    state = table;
end

function M.getStateTable()
    return state;
end

return M;