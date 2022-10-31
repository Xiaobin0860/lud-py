class("MyApp", cc.load("mvc").AppBase).onCreate = function (slot2)
	math.randomseed(os.time())

	local slot4 = {
		device.writablePath .. "src/app/p/"
	}

	pb.Reset(slot4)
end

return class("MyApp", cc.load("mvc").AppBase)
