for slot3 = 1, 100, 1 do
	print("Numeric loop")
end

for slot3 = 1, 100, 2 do
	print("numeric for with step")
end

for slot3 = 1, 100, 1 do
	for slot7 = 1, 100, 1 do
		print("Nested numeric loop")
	end
end

for slot3 = 1, 100, 1 do
	print("Numeric loop with break")

	break
end

for slot3 = 1, 100, 1 do
	for slot7 = 1, 100, 1 do
		print("Nested numeric loop with outer break")
	end

	break
end

for slot3 = 1, 100, 1 do
	for slot7 = 1, 100, 1 do
		print("Nested numeric loop with inner break")

		break
	end
end

for slot3 = 1, 100, 1 do
	for slot7 = 1, 100, 1 do
		break
	end
end

for slot3 = 0, 0, 1 do
	print("Zero loop")
end

for slot3, slot4 in pairs(t) do
	print("iterator for")
	print(slot3, slot4)
end

for slot3, slot4 in ipairs(t) do
	print("iterator for with another iterator")
	print(slot3, slot4)
end

for slot3, slot4, slot5, slot6, slot7 in iterate_over(t) do
	print("iterator for with crazy custom iterator")
	print(slot3, slot4, slot5, slot6, slot7)
end

a, b, c = pairs(t)

for slot3, slot4 in a, b, c do
	print("iterator for with dissected iterator")
	print(slot3, slot4)
end

x = 3

while x > 0 do
	print("while")

	x = x - 1
end

y = 0
x = y

print("while with emmidiate break")

while x do
	break
end

while x and false do
	print("while x and false")
end

while x or false do
	print("while x or false")
end

while x do
	print("while x and true")
end

while not x do
	print("while x or true")
end

print("Something")

while true do
	print("while true")

	if x then
		print("something")
	end
end

print("Something")

while true do
	if x then
		print("something")
	end
end

print("Something")

while true do
	if x then
		print("something")

		break
	end
end

while true do
	if x then
		break
	end
end

while false do
	print("while false")
end

while x do
	print("while with copy check")

	x = y
end

while x > 100 do
	print("while")

	while x > 100 do
		print("Enclosed nested while")
	end

	print("Enclosure")
end

while x > 100 do
	print("Enclosure")

	while x > 100 do
		print("Enclosed from ahead nested while")
	end
end

while x > 100 do
	while x > 100 do
		print("Enclosed from below nested while")
	end

	print("Enclosure")
end

while x > 100 do
	while x > 100 do
		print("Nested while")
	end
end

while x < 100 or y < 100 do
	print("while with expression")

	x = y
end

while x and y do
	print("while with variables expression")

	x = y
end

while x < 100 or y < 100 do
	while x < 100 or y < 100 do
		print("Nested while with expression")
	end
end

if x < 100 and y < 100 then
	while x < 100 or y < 100 do
		while x < 100 or y < 100 do
			print("Nested while with expression within if")
		end
	end
end

while x < 100 or y < 100 do
	if x < 100 and y < 100 then
		while x < 100 or y < 100 do
			print("Nested while with expression with if in middle")
		end
	end
end

while x < 100 or y < 100 do
	if x < 100 or y < 100 then
		while x < 100 or y < 100 do
			print("Nested while with expression with if in middle")
		end
	end
end

while x < 100 or y < 100 do
	if x < 100 or y < 100 then
		while x < 100 or y < 100 do
			print("Nested while with expression with break in middle")
		end

		break
	end
end

while x < 100 or y < 100 do
	if x < 100 or y < 100 then
		while x < 100 or y < 100 do
			print("Nested while with expression with break in the end")

			break
		end
	end
end

while x < 100 or y < 100 do
	if (x < 100 or (y < 100 and z < 100) or x > 300) and z == 3 then
		while x < 100 or y < 100 do
			print("Nested while with really complex expression")
		end
	end
end

while (x < 100 or (y < 100 and z < 100) or x > 300) and z == 3 do
	if (x < 100 or (y < 100 and z < 100) or x > 300) and z == 3 then
		while x < 100 or y < 100 do
			print("Nested while with really complex expression")
		end
	end
end

while x < 100 and y < 100 do
	if x < 100 or y < 100 then
		while (x < 100 or (y < 100 and z < 100) or x > 300) and z == 3 do
			print("Nested while with really complex expression")
		end
	end
end

while (x < 100 or (y < 100 and z < 100) or x > 300) and z == 3 do
	if (x < 100 or (y < 100 and z < 100) or x > 300) and z == 3 then
		while (x < 100 or (y < 100 and z < 100) or x > 300) and z == 3 do
			if (x < 100 or (y < 100 and z < 100) or x > 300) and z == 3 then
				print("Nested while with really complex expression")
			end
		end
	end
end

while (x < 100 or (y < 100 and z < 100) or x > 300) and z == 3 do
	if (x < 100 or (y < 100 and z < 100) or x > 300) and z == 3 then
		while (x < 100 or (y < 100 and z < 100) or x > 300) and z == 3 do
			if (x < 100 or (y < 100 and z < 100) or x > 300) and z == 3 then
				print("Nested while with really complex expression")

				break
			end
		end
	end
end

repeat
	print("repeat until with copy check")

	x = y
until not x

repeat
	print("repeat until with copy check")

	x = y
until not x

repeat
	print("Repeat until with break")

	break
until x < 3

repeat
	print("Enclosed")

	repeat
		print("Nested repeat until")
	until x < 3

	print("Enclosed")
until x < 3

repeat
	repeat
		print("Nested repeat until")
	until x < 3

	print("Enclosed")
until x < 3

repeat
	repeat
		print("Nested repeat until")
	until x < 3
until x < 3

repeat
	print("repeat until")

	x = x + 1
until x > 5 or x < 3

repeat
	print("Repeat until with expression")
until x < 3 and y < 3

repeat
	print("Repeat until with expression")

	repeat
		print("Repeat until with expression")
	until x < 3 or y < 3
until x < 3 and y < 3

repeat
	if (x < 100 or (y < 100 and z < 100) or x > 300) and z == 3 then
		print("Repeat until with expression")

		repeat
			if (x < 100 or (y < 100 and z < 100) or x > 300) and z == 3 then
				print("Repeat until with expression")
			end
		until x < 3 or y < 3
	end
until x < 3 and y < 3

if x then
	for slot3 = 1, 2, 3 do
		print("something")

		if y then
			break
		end

		print("something")
	end
else
	print("else")
end

return
