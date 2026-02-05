require "keybow"

-- LED Color Controller for Keybow Mini
-- Controlled via physical keys OR serial commands from Stream Deck
--
-- Physical keys:
--   Key 0 (left):   All LEDs off
--   Key 1 (middle): All LEDs red
--   Key 2 (right):  All LEDs green
--
-- Serial commands (sent from host):
--   "off\n"         All LEDs off
--   "red\n"         All LEDs red
--   "green\n"       All LEDs green
--   "rgb:R,G,B\n"   Custom color (0-255 each)

function setup()
    keybow.use_mini()
    keybow.auto_lights(false)
    keybow.clear_lights()
end

function set_all(r, g, b)
    for i = 0, 2 do
        keybow.set_pixel(i, r, g, b)
    end
end

-- Physical key handlers

function handle_minikey_00(pressed)
    if pressed then
        set_all(0, 0, 0)
        keybow_serial_write("state:off\n")
    end
end

function handle_minikey_01(pressed)
    if pressed then
        set_all(255, 0, 0)
        keybow_serial_write("state:red\n")
    end
end

function handle_minikey_02(pressed)
    if pressed then
        set_all(0, 255, 0)
        keybow_serial_write("state:green\n")
    end
end

-- Serial command handler (called each tick)

function tick()
    local cmd = keybow_serial_read()
    if cmd == nil or cmd == "" then return end

    -- Trim whitespace
    cmd = cmd:gsub("%s+", "")

    if cmd == "off" then
        set_all(0, 0, 0)
    elseif cmd == "red" then
        set_all(255, 0, 0)
    elseif cmd == "green" then
        set_all(0, 255, 0)
    elseif cmd:sub(1, 4) == "rgb:" then
        local r, g, b = cmd:match("rgb:(%d+),(%d+),(%d+)")
        if r and g and b then
            set_all(tonumber(r), tonumber(g), tonumber(b))
        end
    end
end
