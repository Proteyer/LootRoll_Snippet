local RolledItems = {}
RolledItems[InstanceID] = {
	{ItemID = "123456", poster="Xerephine", winner="Shalsoul"},
	{ItemID = "234567", poster="Nagisa", winner="Snow"},
	{ItemID = "345678", poster="Kerbaal", winner="Aiska"},
	{ItemID = "456789", poster="Jumji"}
}

local instanceID = 555666
local countedLoot = nil

local rolledStuff = {
	itemID, dispatcher = {uniqueKey, itemLink, name}, winner = {uniqueKey, name}, rolls = {name, rolled, maxroll}
}

rolledStuff[instanceID] = {
	{
		999999,
		{
			{ "Hash from itemLink & name", "|cXXXXXXXX|", "Kerbaal-DieAldor" },
			{ "Hash from itemLink & name", "|cXXXXXXXX|", "Tyurru-DieAldor" }
		},
		{ 
			{ "Hash from itemLink & name", "Aiska-DieAldor" }
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
		print(rolledStuff[ID][1][2][i][3])
		i = i + 1
	end
end
printDispatcher(instanceID)
