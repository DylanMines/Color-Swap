local M = {}

local state = { --private static dictionary for my java head
    time = 0,
    size = vmath.vector3(0),
    template = {},
    board = {},
    pieces = {
        red = true,
        blue = true,
        green = true;
        yellow = false,
        cyan = false,
        purple = false;
    }
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

function M.setPieces(pieces)
    state.pieces = pieces
end

function M.getPiece(piece)
    return state.pieces[piece]
end

function M.getPieceDictionary()
    return state.pieces
end

function M.setStateTable(table)
    for k,v in pairs(table) do
        state[k] = table[k] or state[k] --restore default if no value is given
    end
end

function M.getStateTable()
    return state;
end

return M;