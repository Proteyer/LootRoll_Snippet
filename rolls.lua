local rolls = {}
local mainneed = {}
local secondneed = {}
local transmogneed = {}
local mainneedmaxroll = 100
local secondneedmaxroll = 50
local transmogmaxroll = 25

rolls[1] = { -- WhoRolled, Rolled, MaxRoll
	{ "Xerephine", 25, 100 },
	{ "Jumji", 30, 50 },
	{ "Without", 45, 100 },
	{ "Jack", 10, 50 },
	{ "Clawdite", 18, 25},
	{ "Luretta", 20, 25},
	{ "Pixí", 50, 50}
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
		elseif roller[i][3] == transmogmaxroll then
			transmogneed[b] = { roller[i][1], roller[i][2], roller[i][3] }
			b = b + 1
		end
		i = i + 1
	end
end

SplitRollingGroups(rolls[1])

table.sort(mainneed, function(a, b) return a[2] > b[2] end)
table.sort(secondneed, function(a, b) return a[2] > b[2] end)
table.sort(transmogneed, function(a, b) return a[2] > b[2] end)

function PrintResult()
	for k,v in ipairs(mainneed) do
		print(v[1] .. " rolled " .. v[2] .. " from " .. v[3])
	end
print("--------- New Result ---------")	
	for k,v in ipairs(secondneed) do
		print(v[1] .. " rolled " .. v[2] .. " from " .. v[3])
	end
print("--------- New Result ---------")	
	for k,v in ipairs(transmogneed) do
		print(v[1] .. " rolled " .. v[2] .. " from " .. v[3])
	end
end

PrintResult()