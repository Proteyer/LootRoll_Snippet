local instanceID = 555666
local itemID = 999999
local countedLoot = nil

local rolledStuff = {} --	itemID, ["allocation"] = {lootMaster, dispatcher, itemLink, winner}, rolls = {name, rolled, maxroll}

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

function printDispatcher(ID)
	local i = 1
	while i <= #ID do
		print(ID[i][2])
		i = i + 1
	end
end

--print(rolledStuff[instanceID][itemID]["allocation"][1][2])
--print(rolledStuff[instanceID][itemID]["rolls"][1][1])
--printDispatcher(rolledStuff[instanceID][itemID]["allocation"])
