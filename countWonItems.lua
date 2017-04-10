local instanceID = 555666
local itemID = 999999
local encounterID = 778899

local rolledStuff = {}

rolledStuff[555666] = {
	["encounter"] = { 
		{ 778899, ["items"] = { 
				{ 999999,
					["allocation"] = {
						{ "Nagisa-DieAldor", "Kerbaal-DieAldor", "|cXXXXXXXX|", { "Aiska-DieAldor", 78, 100 }},
						{ "Nagisa-DieAldor", "Luretta-DieAldor", "|cXXXXXXXX|", { "Shalsoul-DieAldor", 55, 100 }},
						{ "Nagisa-DieAldor", "Tyurru-DieAldor", "|cYYYYYYY|", { "Squip-DieAldor", 12, 50 }}
					},
					["rolls"] = {
						{ "Cassadora-DieAldor", 18, 25 },
						{ "Aiska-DieAldor", 78, 100 },
						{ "Jumji-DieAldor", 9, 50 },
						{ "Squip-DieAldor", 12, 50 }
					}
				},
				{ 666666,
					["allocation"] = {
						{ "Nagisa-DieAldor", "Luretta-DieAldor", "|cXXXXXXXX|", { "Shalsoul-DieAldor", 55, 100 }},
					},
					["rolls"] = {
						{ "Shalsoul-DieAldor", 55, 100 },
						{ "Ixxion-DieAldor", 18, 25 },
					}
				}
			}
		}
	}
}
function GetWonCount(name, roll, maxRoll)
	local count = 0
	for i = 1, #rolledStuff[instanceID].encounter do
		for j = 1, #rolledStuff[instanceID].encounter[i].items do
			for k = 1, #rolledStuff[instanceID].encounter[i].items[j].allocation do
				if name == rolledStuff[instanceID].encounter[i].items[j].allocation[k][4][1] and
				maxRoll == rolledStuff[instanceID].encounter[i].items[j].allocation[k][4][3] then
					count = count + 1
				end
			end
		end
	end
	return count
end
	
	for i = 1, #rolledStuff[instanceID].encounter do
		for j = 1, #rolledStuff[instanceID].encounter[i].items do
			for k = 1, #rolledStuff[instanceID].encounter[i].items[j].rolls do
				print(rolledStuff[instanceID].encounter[i].items[j].rolls[k][1] .. " " .. GetWonCount(rolledStuff[instanceID].encounter[i].items[j].rolls[k][1], rolledStuff[instanceID].encounter[i].items[j].rolls[k][2], rolledStuff[instanceID].encounter[i].items[j].rolls[k][3]))
			end
		end
	end


function printDispatcher(tab)
	local i = 1
	while i <= #tab do
		print(tab[i][2])
		i = i + 1
	end
end


printDispatcher(rolledStuff[instanceID].encounter[1].items[1].allocation)
print(rolledStuff[instanceID].encounter[1].items[1].allocation)
