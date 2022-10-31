local slot0 = cc.Director:getInstance().getScheduler
cc = cc.Director.getInstance():getScheduler()
local slot1 = class
cls = class(...)
local notLogged = {}

cls.logOff = function (...)
	for i = 1, math.huge, 1 do
		local netMsg = select(i, ...)

		if netMsg then
			notLogged[netMsg] = true
		else
			break
		end
	end
end

cls.logOn = function (...)
	for i = 1, math.huge, 1 do
		local netMsg = select(i, ...)

		if netMsg then
			notLogged[netMsg] = nil
		else
			break
		end
	end
end

local weakRef = {
	__mode = "k"
}
local slot4 = setmetatable
local slot5 = {}
socketOf = setmetatable(slot5, weakRef)
slot5 = setmetatable
local slot6 = {}
ccFnIdOf = setmetatable(slot6, weakRef)
slot6 = setmetatable
local slot7 = {}
bufferOf = setmetatable(slot7, weakRef)

function onConnected(self)
	local function get()
		local all, err, part = socketOf[self]:receive("*a")
		local data = bufferOf[self] .. (all or part)
		local len = #data

		while len >= 4 do
			all = luabpack.bunpack("i", data:sub(1, 4))

			if all < 0 then
				all = 4294967296.0 + all
			end

			all = 4 + all

			if len < all then
				break
			end

			local msg, msgType = data:sub(5, all)
			msgType, msg = my.decPack(msg)

			if not notLogged[msgType] then
				printInfo("recv %d", msgType)
			end

			local onGet = self[msgType]

			if onGet then
				self[msgType] = nil

				onGet(msgType, msg)
			end

			data = data:sub(all + 1)
			len = len - all
		end

		bufferOf[self] = data

		if err == "closed" then
			self:close()
		end
	end

	socketOf[self]:settimeout(0)

	ccFnIdOf[self] = cc:scheduleScriptFunc(get, 0, false)
	bufferOf[self] = ""

	if self.onOpen then
		self:onOpen(socketOf[self])
	end
end

cls.ctor = function (self, name)
	assert(name ~= nil and self.class[name] == nil)

	self.class[name] = self
	self.name = name
	socketOf[self] = socket.tcp()
end

cls.setMsgHandler = function (self, msgType, fn)
	local old = self[msgType]
	self[msgType] = fn

	return old
end

cls.open = function (self, host, port, timeout)
	timeout = timeout or 3

	if ccFnIdOf[self] then
		return "opened"
	end

	if not socketOf[self] then
		self:ctor(self.name)
	end

	socketOf[self]:settimeout(timeout)

	local ok, err = socketOf[self]:connect(host, port)

	if ok then
		return onConnected(self)
	end

	print(host .. ":" .. port, "connect error:", err)

	if err == "connection refused" then
		err = "timeout"
	end

	self:close()

	return err
end

local function slot8(self)
	local usrFn = nil

	if ccFnIdOf[self] then
		usrFn = self.onClose

		cc:unscheduleScriptEntry(ccFnIdOf[self])

		ccFnIdOf[self] = nil
	end

	if socketOf[self] then
		socketOf[self]:close()

		socketOf[self] = nil
	end

	bufferOf[self] = nil
	self.class[self.name] = nil

	if usrFn then
		for k in pairs(self) do
			if type(k) == "number" then
				self[k] = nil
			end
		end

		usrFn(self)
	end
end

cls.close = slot8
test_last_packet = nil

cls.test_resend = function (self)
	if not test_last_packet then
		return
	end

	socketOf[self]:send(test_last_packet)
end

cls.put = function (self, msgType, msg, onGet)
	if onGet then
		if self[msgType + 1] then
			return "duplicated request"
		end

		self:setMsgHandler(msgType + 1, onGet)
	end

	local packet = pb.ImportAndNew("Packet", "Packet")
	packet.c = msgType
	local log = not notLogged[msgType]

	if msg then
		if log then
			printInfo("send msg %d", msgType)
		end

		packet.s = msg:SerializeToString()

		if log then
			printInfo(msg)
		end
	elseif log then
		printInfo("send cmd %d", msgType)
	end

	my.pack(packet)

	packet = my.encPack(packet)
	packet = luabpack.bpack("i", #packet) .. packet
	local len, err = socketOf[self]:send(packet)

	if err == "closed" then
		self:close()
	end

	if DEBUG > 0 then
		test_last_packet = packet

		if not err and len > 1400 then
			local tag = "!":rep(36)

			printLog(tag, "message=%d, length=%d", msgType, len)
		end
	end
end

return cls
