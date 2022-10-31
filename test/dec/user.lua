local slot0 = {
	init = function (slot2)
		slot0.client_id = slot2.client_id
		slot0.money = slot2.money
		slot0.diamond = slot2.diamond
		slot0.vip = slot2.vip
		slot0.nick = slot2.nick
		local slot4 = {}
		slot0.attendants = slot4
		slot4 = {}
		slot0.items = slot4
		slot4 = {}
		slot0.equipments = slot4
	end,
	initAfterCreateRole = function (slot2)
		slot0.role = slot2.role
		slot0.nick = slot2.nick

		for slot6 = 1, #slot2.main_property, 1 do
			slot0.attendants[slot2.main_property[slot6].attendant.unique_id] = slot2.main_property[slot6]
		end
	end,
	getAllLoginData = function (slot2)
		print(slot2)

		for slot6 = 1, #slot2.attendants, 1 do
			slot0.attendants[slot2.attendants[slot6].attendant.unique_id] = slot2.attendants[slot6]
		end

		if slot2.items then
			for slot6 = 1, #slot2.items, 1 do
				slot0.items[slot2.items[slot6].item_id] = slot2.items[slot6]
			end
		end

		if slot2.equipments then
			for slot6 = 1, #slot2.equipments, 1 do
				slot0.equipments[slot2.equipments[slot6].unique_id] = slot2.equipments[slot6]
			end
		end
	end,
	syncAttendant = function (slot2, slot3, slot4)
		if slot4 then
			slot0.attendants[slot2][slot4]:Copy(slot3)
		else
			if not slot0.attendants[slot2] then
				pb.Import("Property")

				slot0.attendants[slot2] = pb.New("Property.FullAttendant")
			end

			slot5:Copy(slot3)
		end

		print(slot0.attendants[slot2])

		return slot0.attendants[slot2]
	end,
	syncItem = function (slot2)
		if not slot0.items[slot2.item_id] then
			pb.Import("Property")

			slot0.items[slot2.item_id] = pb.New("Property.ItemCount")

			slot0.items[slot2.item_id]:Copy(slot2)
		elseif slot2.item_count == 0 then
			slot0.items[slot2.item_id] = nil
		else
			slot3.item_count = slot2.item_count
		end

		print(slot0.items[slot2.item_id])
	end,
	syncEquipment = function (slot2)
		if not slot0.equipments[slot2.unique_id] then
			pb.Import("Property")

			slot0.equipments[slot3] = pb.New("Property.FullEquipment")
		end

		slot4:Copy(slot2)
		print(slot0.equipments[slot3])
	end,
	getItemCount = function (slot2)
		if slot0.items[slot2] then
			return slot0.items[slot2].item_count
		end

		return 0
	end,
	getItemByType = function (slot2)
		local slot3 = {}
		local slot5 = slot2 * 1000 + 1000

		for slot9, slot10 in pairs(slot0.items) do
			if slot4 <= slot10.item_id and slot10.item_id < slot5 then
				slot3[slot10.item_id] = slot10
			end
		end

		return slot3
	end,
	getMajor = function ()
		return slot0.attendants[""]
	end,
	getHeroPropertyStr = function (slot2)
		local slot3 = {
			spd = "速度",
			anti_blk = "抗格挡",
			spd_per = "速度百分比",
			hp_per = "生命百分比",
			arp_value = "破甲值",
			anti_crt = "抗暴击",
			def = "防御",
			crt_value = "暴击值",
			arp = "破甲",
			anti_arp = "抗破甲",
			crt = "暴击",
			atk = "攻击",
			def_per = "防御百分比",
			blk_value = "格挡值",
			atk_per = "攻击百分比",
			blk = "格挡",
			hp = "生命"
		}

		return slot3[slot2] or ""
	end,
	getHeroBasePropFields = function ()
		local slot2 = {
			"hp",
			"spd",
			"atk",
			"def"
		}

		return slot2
	end,
	getHeroSpePropFields = function ()
		local slot2 = {
			"crt",
			"blk",
			"arp"
		}

		return slot2
	end,
	getHeroSpePropFieldsAll = function ()
		local slot2 = {
			"crt",
			"anti_crt",
			"crt_value",
			"blk",
			"anti_blk",
			"blk_value",
			"arp",
			"anti_arp",
			"arp_value"
		}

		return slot2
	end,
	sortAttendants = function (slot2, slot3)
		local slot4 = nil

		if (slot3 or "level") == "rank" then
			function slot4(slot5, slot6)
				local slot7 = nil
				local slot8 = slot2.attendants[slot5]
				local slot9 = slot2.attendants[slot6]

				if slot5 == "" then
					slot7 = true
				elseif slot6 == "" then
					slot7 = false
				elseif slot8.property.class_ == slot9.property.class_ then
					if slot8.attendant.level == slot9.attendant.level then
						if slot8.attendant.quality == slot9.attendant.quality then
							if slot8.property.rank == slot9.property.rank then
								slot7 = slot8.attendant.id < slot9.attendant.id
							else
								return slot9.property.rank < slot8.property.rank
							end
						else
							slot7 = slot9.attendant.quality < slot8.attendant.quality
						end
					else
						slot7 = slot9.attendant.level < slot8.attendant.level
					end
				else
					return slot9.property.class_ < slot8.property.class_
				end
			end
		elseif slot3 == "level" then
			function slot4(slot5, slot6)
				local slot7 = nil
				local slot8 = slot2.attendants[slot5]
				local slot9 = slot2.attendants[slot6]

				if slot5 == "" then
					slot7 = true
				elseif slot6 == "" then
					slot7 = false
				elseif slot8.attendant.level == slot9.attendant.level then
					if slot8.attendant.quality == slot9.attendant.quality then
						if slot8.property.class_ == slot9.property.class_ then
							if slot8.property.rank == slot9.property.rank then
								slot7 = slot8.attendant.id < slot9.attendant.id
							else
								return slot9.property.rank < slot8.property.rank
							end
						else
							slot7 = slot9.property.class_ < slot8.property.class_
						end
					else
						slot7 = slot9.attendant.quality < slot8.attendant.quality
					end
				else
					return slot9.attendant.level < slot8.attendant.level
				end
			end
		elseif slot3 == "stage" then
			function slot4(slot5, slot6)
				local slot7 = nil
				local slot8 = slot2.attendants[slot5]
				local slot9 = slot2.attendants[slot6]

				if slot5 == "" then
					slot7 = true
				elseif slot6 == "" then
					slot7 = false
				elseif slot8.property.rank == slot9.property.rank then
					if slot8.attendant.level == slot9.attendant.level then
						if slot8.attendant.quality == slot9.attendant.quality then
							if slot8.property.class_ == slot9.property.class_ then
								slot7 = slot8.attendant.id < slot9.attendant.id
							else
								return slot9.property.class_ < slot8.property.class_
							end
						else
							slot7 = slot9.attendant.quality < slot8.attendant.quality
						end
					else
						slot7 = slot9.attendant.level < slot8.attendant.level
					end
				else
					return slot9.property.rank < slot8.property.rank
				end
			end
		elseif slot3 == "quality" then
			function slot4(slot5, slot6)
				local slot7 = nil
				local slot8 = slot2.attendants[slot5]
				local slot9 = slot2.attendants[slot6]

				if slot5 == "" then
					slot7 = true
				elseif slot6 == "" then
					slot7 = false
				elseif slot8.attendant.quality == slot9.attendant.quality then
					if slot8.attendant.level == slot9.attendant.level then
						if slot8.property.class_ == slot9.property.class_ then
							if slot8.property.rank == slot9.property.rank then
								slot7 = slot8.attendant.id < slot9.attendant.id
							else
								return slot9.property.rank < slot8.property.rank
							end
						else
							slot7 = slot9.property.class_ < slot8.property.class_
						end
					else
						slot7 = slot9.attendant.level < slot8.attendant.level
					end
				else
					return slot9.attendant.quality < slot8.attendant.quality
				end
			end
		end

		if slot4 then
			table.sort(slot2, slot4)
		end
	end
}

return slot0
