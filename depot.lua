local instanceID = 555666
local countedLoot = nil

local rolledStuff = {
	itemID, allocation = {itemLink, dispatcher, winner}, rolls = {name, rolled, maxroll}
}

rolledStuff[instanceID] = {
	{
		999999,
		{
			{ "|cXXXXXXXX|", "Kerbaal-DieAldor", "Aiska-DieAldor" },
			{ "|cXXXXXXXX|", "Tyurru-DieAldor" }
		},
		{
			{ "Squip-DieAldor", 35, 50},
			{ "Aiska-DieAldor", 15, 100}
		}
	}
}

function printDispatcher(ID)
	local i = 1
	while rolledStuff[ID][1][2][i] do
		print(rolledStuff[ID][1][2][i][2])
		i = i + 1
	end
end
printDispatcher(instanceID)
