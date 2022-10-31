print("true or true")

b = true or true

print("false and false")

b = false and false

print("false and or")

b = (false and x) or y

print("false and ((and) or)")

b = false and ((x and z) or y)

print("precalculated true expression")

c = true or (x and y) or true

print("precalculated false expression")

d = false and ((x and y) or true)

print("precalculated false expression with function")

e = error() and false and ((x and y) or true)

print("precalculated true expression with function")

e = error() and ((x and y) or true)

print("precalculated? false expression with variable")

f = false and ((x and y) or true)

print("precalculated false expression with nil")

f = nil and ((x and y) or true)

print("simple or expression")

b = x or y

print("simple or not expression")

b = not x or y

print("simple and expression")

b = x and y

print("simple or expression with binary comparison")

b = x < 100 or y

print("simple and expression with binary comparison")

b = x < 100 and y

print("simple and expression with binary comparison and function call")

b = x < 100 and print(y)

print("simple and expression with double binary comparison")

b = x < 100 and y > 100

print("(and) or expression")

b = (x and y) or (error() and ((x and y) or true))

print("(or) and expression")

b = (x or y) and error() and ((x and y) or true)

print("(and) and expression")

b = x and y and error() and ((x and y) or true)

print("(or) or expression")

b = x or y or (error() and ((x and y) or true))

print("or (and) expression")

b = x or (y and x)
b = x < 100 or (y < 100 and x < 100)

print("and (or) expression")

b = x and (y or x)

print("and (and) expression")

b = x and y and x

print("or (or) expression")

b = x or y or x

print("ond (or) and expression")

b = x and (y or x) and error() and ((x and y) or true)

print("or (and) or expression")

b = x or (y and x) or (error() and ((x and y) or true))

print("and of two ors")

b = (x or (error() and ((x and y) or true))) and (y or (error() and ((x and y) or true)))

print("or of two ands")

b = (x and error() and ((x and y) or true)) or (y and error() and ((x and y) or true))

print("x or string")

local slot1 = "nothing"
slot1 = x or "something"
local slot2 = nil

print("x and string")

slot2 = x and "something"

print("and (or) and (or) expression with comparisons")

b = x < 100 and (y < 100 or x < 100) and (slot0 < 100 or x < 100)

print("and (or) and or or expression with comparisons")

b = (x < 100 and (y < 100 or x < 100) and slot0 < 100) or x < 100 or y < 100

print("and (or) and and and expression with comparisons")

b = x < 100 and (y < 100 or x < 100) and slot0 < 100 and x < 100 and y < 100

print("or (and) or (and) expression with comparisons")

b = x < 100 or (y < 100 and x < 100) or (slot0 < 100 and x < 100)

print("and (and) and (and) expression with comparisons")

b = x < 100 and y < 100 and x < 100 and slot0 < 100 and x < 100

print("or (or) or (or) expression with comparisons")

b = x < 100 or y < 100 or x < 100 or slot0 < 100 or x < 100

print("4 and expression with comparisons")

b = x < 100 and y < 100 and x < 100 and slot0 < 100 and x < 100

print("4 or expression with comparisons")

b = x < 100 or y < 100 or x < 100 or slot0 < 100 or x < 100

print("and (or or) and (or or) expression with comparisons")

b = x < 100 and (y < 100 or x < 100 or slot0 < 100) and (y < 100 or x < 100 or slot0 < 100)

print("and (or and or) and (or and or) expression with comparisons")

b = x < 100 and (y < 100 or (x < 100 and x > 100) or slot0 < 100) and (y < 100 or (x < 100 and x > 100) or slot0 < 100)

print("or (and or and) or (and or and) expression with comparisons")

b = x < 100 or (y < 100 and (x < 100 or x > 100) and slot0 < 100) or (y < 100 and (x < 100 or x > 100) and slot0 < 100)

print("(((or) and) or)")

a = ((x < 100 or y < 100) and x < 100) or slot0 < 100

print("(((or or) and) or)")

a = ((x < 100 or y < 100 or slot0 < 100) and x < 100) or slot0 < 100

print("(((or and) and) or)")

a = ((x < 100 or (y < 100 and slot0 < 100)) and x < 100) or slot0 < 100

print("(((or and) and) or) and error()")

a = (((x < 100 or (y < 100 and slot0 < 100)) and x < 100) or slot0 < 100) and error()

print("(or (and (or)))")

a = x < 100 or (y < 100 and (x < 100 or slot0 < 100))

print("(not or (and (or)))")

a = x >= 100 or (y < 100 and (x < 100 or slot0 < 100))
local slot3 = (scaleinfo.floorValue and math.floor(1)) or math.ceil(1)

function (slot5)
	print(slot5)
end(("" == "" and slot5) or "test")

local slot6 = (menu.isOffer and (duration or -1)) or (timeout and timeout ~= -1 and timeout) or missiontime or -1
local slot7 = slot5 < 100
local slot8 = 0
slot8 = ffi.string(messageDetails.messageType) ~= ""
local slot9, slot10, slot11, slot12, slot13, slot14 = nil

if is_magic then
	slot9 = slot4(slot14 or Helper.defaultArrowRowBackgroundColor)
else
	slot9 = bar(slot14)
end

local slot15 = 0
slot15 = (slot0 == 3 and slot5 < ((y == 0 and is_magic and 3) or 2) and "a") or "b"
local slot16 = (nil and slot20(slot18 == "station" and slot19)) or slot21()

if not commander then
	if false then
		local slot22 = (IsSameComponent(commander, menu.playership) and "") or " [" .. ReadText(1001, 1001) .. "]"

		if IsSameComponent(commander, menu.playership) then
			slot22 = ""
		else
			slot22 = " [" .. ReadText(1001, 1001) .. "]"
		end
	end
end

local slot23 = (isfirst and slot20(slot21((table[trade.ware] and "-") or "+", slot18 > 1))) or ""
local slot24 = (not nil and ((slot25 < 50 and slot25 < 100 and slot0) or (slot27 and 4) or 3)) or slot25

setElementPosition(iconelement, slot25, slot26, width % 2 ~= 0, height % 2 ~= 0)

if slot2 then
	local slot28 = slot25 or (slot26 or slot0) < 100

	slot21((slot25 and slot26) or slot0)
end

menu.logbook = function ()
	local slot29 = {
		font = slot24 or slot25,
		fontsize = slot24 or slot25
	}

	return slot29
end(slot25 or slot26) or {}

if nil then
	if slot30 then
		local slot34 = {
			slot29 or slot30,
			slot31(slot29 or slot30) .. slot29 or ""
		}
		local slot33 = slot34
	end

	slot32()
end

return
