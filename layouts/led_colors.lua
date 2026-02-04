require "keybow"

-- LED Color Controller for Keybow Mini
-- Key 0 (left):   All LEDs off
-- Key 1 (middle): All LEDs red
-- Key 2 (right):  All LEDs green

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

function handle_minikey_00(pressed)
    if pressed then
        set_all(0, 0, 0)
    end
end

function handle_minikey_01(pressed)
    if pressed then
        set_all(255, 0, 0)
    end
end

function handle_minikey_02(pressed)
    if pressed then
        set_all(0, 255, 0)
    end
end
