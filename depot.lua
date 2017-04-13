local instanceID = 555666
local itemID = 999999
local mainNeed = {}
local secondNeed = {}
local transmogNeed = {}
local mainneedmaxroll = 100
local secondneedmaxroll = 50
local transmogmaxroll = 25
local countedLoot = nil

local rolledStuff = {} --itemID, allocation = {itemLink, lootMaster, dispatcher, winner}, rolls = {name, rolled, maxroll}

rolledStuff[555666] = {
	[999999] = {
		["allocation"] = {
			{ "Nagisa-DieAldor", "Kerbaal-DieAldor", "|cXXXXXXXX|", "Aiska-DieAldor" },
			{ "Nagisa-DieAldor", "Tyurru-DieAldor", "|cYYYYYYY|", "Squip-DieAldor"}
		},
		["rolls"] = {
			{ "Aiska-DieAldor", 78, 100 },
			{ "Cassadora-DieAldor", 18, 25 },
			{ "Jumji-DieAldor", 9, 50 },
			{ "Squip-DieAldor", 12, 50 }
		}
	}
}

function printDispatcher(tab)
	local i = 1
	while i <= #tab do
		print(tab[i][2])
		i = i + 1
	end
end
printDispatcher(rolledStuff[instanceID][itemID].allocation)
-- printDispatcher(rolledStuff[instanceID][itemID]["allocation"])

function splitRollingGroups(roller)
	local i, j, a, b = 1, 1, 1, 1
	while roller[i] do
		if roller[i][3] == mainneedmaxroll then
			mainNeed[j] = { roller[i][1], roller[i][2], roller[i][3] }
			j = j + 1
		elseif roller[i][3] == secondneedmaxroll then
			secondNeed[a] = { roller[i][1], roller[i][2], roller[i][3] }
			a = a + 1
		elseif roller[i][3] == transmogmaxroll then
			transmogNeed[b] = { roller[i][1], roller[i][2], roller[i][3] }
			b = b + 1
		end
		i = i + 1
	end
end

splitRollingGroups(rolledStuff[instanceID][itemID].rolls)

table.sort(mainNeed, function(a, b) return a[2] > b[2] end)
table.sort(secondNeed, function(a, b) return a[2] > b[2] end)
table.sort(transmogNeed, function(a, b) return a[2] > b[2] end)

function PrintResult()
	for k,v in ipairs(mainNeed) do
		print(v[1] .. " rolled " .. v[2] .. " from " .. v[3])
	end
print("--------- New Result ---------")	
	for k,v in ipairs(secondNeed) do
		print(v[1] .. " rolled " .. v[2] .. " from " .. v[3])
	end
print("--------- New Result ---------")	
	for k,v in ipairs(transmogNeed) do
		print(v[1] .. " rolled " .. v[2] .. " from " .. v[3])
	end
end

PrintResult()

--[[1. tabelle : lsite von {item, donator, sender, rollActionid, winnerId}
<23:30:23> "Kerbaal": 2. tablle: id => liste von rolls
<23:30:32> "Kerbaal": roll: name, rollNumber, max
<23:34:04> "Kerbaal": { 1 => {roll1, roll2, roll3}, 2 =}]]

function GetInstanceID() 
-- Idee mittels GetInstanceInfo() Namen und Schwierigkeit ermitteln und dann über GetSavedInstanceInfo(index) vergleich um die ID zu ermitteln
-- Über GetSavedInstanceInfo(index) in dauer von GetNumSavedInstances() iterieren bis man die ID gefunden hat
	local instanceName, type, difficultyIndex, instanceDifficultyName, instanceMaxPlayers, dynamicDifficulty, isDynamic, mapID = GetInstanceInfo()
	local numInstances = GetNumSavedInstances()
	for i = 1, numInstances do
		local savedInstanceName, id, reset, difficulty, locked, extended, instanceIDMostSig, isRaid, maxPlayers, savedInstanceDifficultyName, numEncounters, encounterProgress = GetSavedInstanceInfo(i)
		if savedInstanceName == instanceName and savedInstanceDifficultyName == instanceDifficultyName then	
			return id
		end
		i = i + 1
	end
end
x = GetInstanceID()
print(GetInstanceID())
---------- Items connected to Rolls ID -------
--[[
HereticRollActions = {}
HereticLootSequence = {}
HereticRoll = {}
HereticList = {}
HereticItem = {}

HereticList.__index = HereticList
function HereticList:New(instanceID, master)
	local obj = {
	instanceID = instanceID,
	instanceMapID = 0,
	instanceDifficulty = "",
	encounterID = 0,
	master = master,
	entries = {}
	}
	setmetatable(obj, self)
	return obj
end

HereticRoll.__index = HereticRoll
function HereticRoll:New(name, roll, maxRoll)
	local obj = {
	name = name,
	roll = roll,
	maxRoll = maxRoll,
	wonCount = 0 or 0
	}
	setmetatable(obj, self)
	return obj
end

HereticItem.__index = HereticItem
function HereticItem:New(itemLink, donator, winner, rollActionID)
	local obj = {
	itemLink = itemLink or "",
	donator = donator or "",
	winner = winner or {},
	rollActionID = rollActionID or 0,
	}
	setmetatable(obj, self)
	return obj
end

function HereticList:Test()
	for i = 1, 2 do
		local newItemList = HereticList:New(10000+i, "Nagisa-DieAldor")
		for j = 1, 5 do 
			local newItem = HereticItem:New("c|X" .. j, "Donator" .. j, "Winner" .. j, j)
			table.insert(newItemList.entries, newItem)
			local newRollList = HereticList:New(10000+i, "Nagisa-DieAldor")
			newRollList.itemLink = "c|X" .. j
			for k = 1, 3 do
				local newRoll = HereticRoll:New("Roller" .. k, k+k, 100)
				table.insert(newRollList.entries, newRoll)
			end
			table.insert(HereticRollActions, newRollList)
		end
		table.insert(HereticLootSequence, newItemList)
	end
end

HereticList:Test()
for i = 1, #HereticLootSequence do
	for k,v in ipairs(HereticLootSequence[i].entries) do
		print(v.itemLink .. " from " .. v.donator .. " won by " .. v.winner .. " by rollAction: " .. v.rollActionID)
		for key,value in ipairs(HereticRollActions[v.rollActionID].entries) do
			print(value.name .. " rolled " .. value.roll .. " from " .. value.maxRoll)
		end
	end
end
]]
