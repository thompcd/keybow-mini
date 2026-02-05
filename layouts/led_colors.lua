require "keybow"

-- LED Color Controller for Keybow Mini
-- Key 0 (left):   Red
-- Key 1 (middle): Green
-- Key 2 (right):  Blue
-- Hold any key 3+ seconds: All LEDs off

-- Track press times for hold detection
local press_time = {}
local HOLD_THRESHOLD = 3.0  -- seconds

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

function get_time()
    return os.clock()
end

function handle_key(index, pressed, r, g, b)
    if pressed then
        press_time[index] = get_time()
    else
        local held = get_time() - (press_time[index] or 0)
        if held >= HOLD_THRESHOLD then
            -- Long hold: turn all off
            set_all(0, 0, 0)
        else
            -- Short press: set color
            set_all(r, g, b)
        end
        press_time[index] = nil
    end
end

function handle_minikey_00(pressed)
    handle_key(0, pressed, 255, 0, 0)  -- Red
end

function handle_minikey_01(pressed)
    handle_key(1, pressed, 0, 255, 0)  -- Green
end

function handle_minikey_02(pressed)
    handle_key(2, pressed, 0, 0, 255)  -- Blue
end
