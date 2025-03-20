local M = {} --Initalize modules

--Begin button---
M.Buttons = {} --Initalize the button module
function M.Buttons.initButton(node,type)
    local tex = "00_"..type
    gui.set_texture(node, "Buttons")
    gui.play_flipbook(node, tex)
end

function M.Buttons.Press(node,type,callback)
    local function complete()
        M.Buttons.initButton(node, type)
        if callback then callback() end
    end
    gui.play_flipbook(node, type.."_press",complete)
end
function M.Buttons.Hover(node,type,hovering,callback)
    if hovering then
        gui.play_flipbook(node, type.."_hover")
    else
        gui.play_flipbook(node, type.."_normal")
    end
end
---End button---

---Begin clock---
M.Clock = {} --Initalize the clock module
function M.Clock.setTime(node, time)
    gui.set_rotation(node, vmath.vector3(0,0,-time*6))
end

function M.Clock.setFlash(node, flashing)
    if flashing then gui.animate(node, "color", vmath.vector4(1,0.5,0.5,1), gui.EASING_LINEAR, 1.3,0,nil,gui.PLAYBACK_LOOP_PINGPONG) 
    else gui.cancel_animation(node, "color") end
end
---End clock---

---Begin text input---
M.TextInput = {} --Initalize the text input module
function M.TextInput.editText(text_editing,node)
	if text_editing ~= nil then
		gui.set_color(text_editing, vmath.vector4(0.3,0.3,0.3,1))
	end
	gui.show_keyboard(gui.KEYBOARD_TYPE_NUMBER_PAD, false)
	text_editing = node
	gui.set_color(text_editing, vmath.vector4(0,0,0,1))
    return text_editing
end

function M.TextInput.endText(text_editing)
    gui.set_color(text_editing,vmath.vector4(0.3,0.3,0.3,1))
	text_editing = nil
	gui.hide_keyboard()
end

---End text input---

---Begin string format---
M.StringFormat = {} --Initalize the String Format module
function M.StringFormat.getCommaValue(amount)
	local formatted = amount
	while true do  
		formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')
		if (k==0) then
			break
		end
	end
	return formatted
end
---End string format---

---Begin visible---
M.Visibility = {}
function M.Visibility.toggle(node)
    local is_visible = gui.get_visible(node)
    gui.set_visible(node, not is_visible)
    gui.set_enabled(node, not is_visible)
end
function M.Visibility.set(node,set)
    gui.set_visible(node, set)
    gui.set_enabled(node, set)
end
---End visible---

---Begin stars---
M.Stars = {}


---End stars---

---Begin submenus
M.Submenu = {}
function M.Submenu.get_submenu_node(menu_type,node_name)
	return gui.get_node(menu_type.."/"..node_name)
end

function M.Submenu.toggle_menu(menu_type,location,enable,duration)
    duration = duration or 0.8
    local node
    if menu_type == "Top" then
        node = gui.get_node("ui_top")
	elseif menu_type == "Pause" then
		node = gui.get_node("pause_menu")
	elseif menu_type == "Win" then
		node = gui.get_node("win_menu")
    else
        node = M.Submenu.get_submenu_node(menu_type,"main")
    end
    if enable == true then
        gui.set_enabled(node, true)
    end
	gui.animate(node, "position", location, gui.EASING_INOUTQUAD, duration,0,function()
        if enable == false then
            --print("disabled")
            gui.set_enabled(node, false)
        end
    end)
end
--End submenus---

---Begin colors---
M.Colors = {}
M.Colors.hex = function(hex, alpha) 
	local redColor,greenColor,blueColor=hex:match('#?(..)(..)(..)')
	redColor, greenColor, blueColor = tonumber(redColor, 16)/255, tonumber(greenColor, 16)/255, tonumber(blueColor, 16)/255
	redColor, greenColor, blueColor = math.floor(redColor*100)/100, math.floor(greenColor*100)/100, math.floor(blueColor*100)/100
	if alpha == nil then
		return vmath.vector4(redColor, greenColor, blueColor,1)
	end
	return vmath.vector4(redColor, greenColor, blueColor,alpha)
end

M.Colors.rgb = function (r, g, b)
	local redColor,greenColor,blueColor=r/255, g/255, b/255
	redColor, greenColor, blueColor = math.floor(redColor*100)/100, math.floor(greenColor*100)/100, math.floor(blueColor*100)/100
	return redColor, greenColor, blueColor
end
M.Colors.rgba = function(r, g, b, alpha)
	local redColor,greenColor,blueColor=r/255, g/255, b/255
	redColor, greenColor, blueColor = math.floor(redColor*100)/100, math.floor(greenColor*100)/100, math.floor(blueColor*100)/100
	return redColor, greenColor, blueColor, alpha
end
M.Colors.hsbToRgb = function (hue,saturation,value) 
    if s == 0 then -- If it's achromatic, just return the value
		return vmath.vector4(value, value, value, 1)
	end

	-- Get the hue sector
	local hue_sector = math.floor(hue / 60)
	local hue_sector_offset = (hue / 60) - hue_sector

	local p = value * (1 - saturation)
	local q = value * (1 - saturation * hue_sector_offset)
	local t = value * (1 - saturation * (1 - hue_sector_offset))

	if hue_sector == 0 then
		return vmath.vector4(value, t, p, 1)
	elseif hue_sector == 1 then
		return vmath.vector4(q, value, p, 1)
	elseif hue_sector == 2 then
		return vmath.vector4(p, value, t, 1)
	elseif hue_sector == 3 then
		return vmath.vector4(p, q, value, 1)
	elseif hue_sector == 4 then
		return vmath.vector4(t, p, value, 1)
	elseif hue_sector == 5 then
		return vmath.vector4(value, p, q, 1)
	end
    
end

return M --Return all modules

