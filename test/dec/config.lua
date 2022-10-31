DEBUG = 2
CC_USE_FRAMEWORK = true
CC_SHOW_FPS = DEBUG > 0
CC_DISABLE_GLOBAL = true
local slot0 = {
	autoscale = "FIXED_WIDTH",
	height = 600,
	width = 1300,
	callback = function (slot2)
		if slot2.width / slot2.height <= 1.34 then
			local slot4 = {
				autoscale = "FIXED_WIDTH"
			}

			return slot4
		end
	end
}
CC_DESIGN_RESOLUTION = slot0
PORT = 5000
HOST = "192.168.0.15"

return
