local PotentialWinner = {}
local rolls = {}
local mainneed = {}
local secondneed = {}
local mainneedmaxroll = 100
local secondneedmaxroll = 50

local InstanceID = 555666
local RolledItems = {}
local Looted = {}
local CountedLoot = nil

rolls[1] = { -- WhoRolled, Rolled, MaxRoll
	{ "Xerephine", 25, 100 },
	{ "Jumji", 30, 100 },
	{ "Clawdite", 15, 100}
}

Looted[InstanceID] = { -- Character Name, Number of Items, Collection of Items
	{ "Xerephine", 2, "12346:345678" },
	{ "Jumji", 1, "456789"},
	{ "Snow", 2, ""}
}

function SplitRollingGroups(roller)
	local i, j, a, b = 1, 1, 1, 1
	while roller[i] do
		if roller[i][3] == mainneedmaxroll then
			mainneed[j] = { roller[i][1], roller[i][2], roller[i][3] }
			j = j + 1
		elseif roller[i][3] == secondneedmaxroll then
			secondneed[a] = { roller[i][1], roller[i][2], roller[i][3] }
			a = a + 1
		end
		i = i + 1
	end
end

SplitRollingGroups(rolls[1])

table.sort(mainneed, function(a, b) return a[2] > b[2] end)
table.sort(secondneed, function(a, b) return a[2] > b[2] end)
table.sort(Looted[InstanceID], function(a, b) return a[2] < b[2] end)

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

function SuggestedWinner()
	if mainneed then
		for i=1, #mainneed do
			CountOfItems(mainneed[i][1])
			if CountedLoot == 0 then
				table.insert(PotentialWinner,1, { mainneed[i][1], mainneed[i][2], 0})
			else	
				for j=1, #Looted[InstanceID] do
					if Looted[InstanceID][i][1] == mainneed[j][1] then
						table.insert(PotentialWinner, { mainneed[j][1], mainneed[j][2], Looted[InstanceID][i][2]})
					end
					j = j + 1
				end
			end
			i = i + 1
		end
	elseif secondneed then
		for i=1, #secondneed do
			CountOfItems(secondneed[i][1])
			if CountedLoot == 0 then
				table.insert(PotentialWinner,1, { secondneed[i][1], secondneed[i][2], 0})
			else	
				for j=1, #Looted[InstanceID] do
					if Looted[InstanceID][i][1] == secondneed[j][1] then
						table.insert(PotentialWinner, { secondneed[j][1], secondneed[j][2], Looted[InstanceID][i][2]})
					end
					j = j + 1
				end
			end
			i = i + 1
		end
	end
end
SuggestedWinner()
for k,v in ipairs(PotentialWinner) do
	print(v[1] .. " wins with " .. v[2] .. " on " .. v[3] .. " Items.")
end