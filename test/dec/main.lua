cc.FileUtils:getInstance():setPopupNotify(false)
require("socket")
require("config")
require("cocos.init")

local slot1, slot2 = xpcall(slot0, __G__TRACKBACK__)

if not slot1 then
	print(slot2)
end

return
