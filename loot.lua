local InstanceID = 555666
local Looted = {}
local Looter = "Jumji"

Looted[InstanceID] = { -- Character Name, Number of Items, Collection of Items
	{ "Xerephine", 2, "12346:345678" },
	{ "Jumji", 1, "456789"}
}

function CountOfItems(Character)
	for i=1, #Looted[InstanceID] do
		if Looted[InstanceID][i][1] == Character then
			CountedLoot = Looted[InstanceID][i][2]
			break
		else
			CountedLoot = 0
		end
	end
end

function WonAnItem(Character, ItemID)
	local i = 1
	CountOfItems(Character)
	if CountedLoot == 0 then
		table.insert (Looted[InstanceID], { Character, 1, ItemID })
	else
		while Looted[InstanceID][i] do
			if Looted[InstanceID][i][1] == Character then
				Looted[InstanceID][i][2] = Looted[InstanceID][i][2] + 1
				Looted[InstanceID][i][3] = Looted[InstanceID][i][3] .. ":" .. ItemID
			end
			i = i + 1
		end
	end
end
CountOfItems(Looter)
print(Looter .. " looted " .. CountedLoot)

WonAnItem(Looter,"999887")

function PrintResults()
	for k,v in ipairs(Looted[InstanceID]) do
		print(v[1] .. " already got " .. v[2] .. " items: " .. v[3])
	end
end

PrintResults()
CountOfItems(Looter)
print(Looter .. " looted " .. CountedLoot)