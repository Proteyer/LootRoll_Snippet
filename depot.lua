local instanceID = 555666
local itemID = 999999
local countedLoot = nil

local rolledStuff = {} --	itemID, allocation = {lootMaster, dispatcher, itemLink, winner}, rolls = {name, rolled, maxroll}

rolledStuff[555666] = {}
rolledStuff[555666][999999] = {}
rolledStuff[555666][999999]["allocation"] = {}
rolledStuff[555666][999999]["allocation"][1] = { "Nagisa-DieAldor", "Kerbaal-DieAldor", "|cXXXXXXXX|", "Aiska-DieAldor" }
rolledStuff[555666][999999]["allocation"][2] = { "Nagisa-DieAldor", "Tyurru-DieAldor", "|cXXXXXXXX|", }
rolledStuff[555666][999999]["rolls"] = {}
rolledStuff[555666][999999]["rolls"][1] = { "Aiska-DieAldor", 78, 100 }
rolledStuff[555666][999999]["rolls"][2] = { "Squip-DieAldor", 25, 50 }

function printDispatcher(ID)
	local i = 1
	while i <= #ID do
		print(ID[i][2])
		i = i + 1
	end
end

--print(rolledStuff[instanceID][itemID]["allocation"][1][2])
printDispatcher(rolledStuff[instanceID][itemID]["allocation"])
