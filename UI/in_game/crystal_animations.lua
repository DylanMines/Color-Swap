local M = {}

local function createNode() 
    local pos = vmath.vector3(math.random(50,590),math.random(50,1086),1)
    local size = vmath.vector3(120,160,0)
    local node = gui.new_box_node(pos, size)
    gui.set_layer(node, "foreground")
    gui.set_texture(node, "crystal")
    gui.play_flipbook(node, "00")
    return node
end

local function updateText()
    local crystalTextNode = gui.get_node("text/crystals")
    gui.set_text(crystalTextNode, gui.get_text(gui.get_node("text/crystals"))+1)
end

local function endAnimation(node)
    gui.play_flipbook(gui.get_node("crystals"), "crystal_click")   
    gui.delete_node(node)
    updateText()
end

local function moveCrystal(node)
    gui.animate(node, "size", vmath.vector3(60,80,0), gui.EASING_INCUBIC, 1.5)
    gui.animate(node, "position", vmath.vector3(421,55,1), gui.EASING_INCUBIC, 1.5, 0,function ()
        endAnimation(node)
    end)
end

function M.playCrystalAnimation(numCrystals)
    local counter = 0
    timer.delay(0.35, true, function (self, handle, time_elapsed)
        counter = counter + 1
        moveCrystal(createNode())
        
        if counter >= numCrystals then timer.cancel(handle) end
    end)
end

return M
