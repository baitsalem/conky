function conky_showints()


	local interfaces = findInterface()
	local result = ''

	local lines = {}
	for s in interfaces:gmatch("[^\r\n]+") do
    		table.insert(lines, s)
	end

	 for _, interface in ipairs(lines) do
		
		result = result .. parse_interface(interface)
	 end
	 return conky_parse(result)
end

function parse_interface(interface)

	return '${color7}Lan: ${color4}'.. interface .. ' ${color}${alignr}${color7}IP:${color2}${addr ' .. interface ..'}\n' .. '${color7}Download: ${color2}' .. '${downspeed ' .. interface .. '}k/s ${alignr}$alignr${color7}Upload: ${color3}' .. '${upspeed ' .. interface .. '}k/s\n' .. '${color lightgray}${downspeedgraph ' .. interface .. ' 30,120}${alignr}${upspeedgraph ' .. interface .. ' 30,120}$color\n'

end


function conky_showwints()


	local interfaces = findWInterface()
	local result = ''

	local lines = {}
	for s in interfaces:gmatch("[^\r\n]+") do
    		table.insert(lines, s)
	end

	 for _, interface in ipairs(lines) do
		
		result = result .. parse_winterface(interface)
	 end
	 return conky_parse(result)
end

function parse_winterface(interface)

	return '${color7}Wifi: ${color4}'.. interface .. ' ${color}${alignr}${color7}IP:${color2}${addr ' .. interface ..'}\n' .. '${color7}ESSID: ${color1}${wireless_essid ' .. interface .. '}${color7}${alignr}Rate:${color1}${wireless_bitrate ' .. interface .. '}\n' .. '${color7}Quality:${color1}${wireless_link_qual_perc ' .. interface .. '}%${alignr}${color}${wireless_link_bar 8,75' .. interface .. '}\n' .. '${color7}Download: ${color2}' .. '${downspeed ' .. interface .. '}k/s ${alignr}$alignr${color7}Upload: ${color3}' .. '${upspeed ' .. interface .. '}k/s\n' .. '${color lightgray}${downspeedgraph ' .. interface .. ' 30,120}${alignr}${upspeedgraph ' .. interface .. ' 30,120}$color\n'

end


-- Find the string representing the connection's interface (e.g.  enp0s0)
function findInterface()
  local handle = io.popen('ip a | grep "state UP" | cut -d: -f2 | tr -d " " | grep -E "en.*"')
  local result = handle:read('*a'):gsub('\n$','')
  handle:close()
  return result
end

function findWInterface()
  local handle = io.popen('ip a | grep "state UP" | cut -d: -f2 | tr -d " " | grep -E "wl.*"')
  local result = handle:read('*a'):gsub('\n$','')
  handle:close()
  return result
end


function conky_battery()
  return conky_parse('${battery_percent ' .. findBatteryName() .. '}')
end

function conky_batterybar(value)
  return conky_parse('${battery_bar ' .. findBatteryName() .. ' ' .. value .. '}')
end

function findBatteryName()
  local handle = io.popen('ls /sys/class/power_supply | grep "BAT" | tail -1')
  local result = handle:read('*a'):gsub('\n$','')
  handle:close()
  return result
end


-- Find local IP address according to active connections

-- Find up/download speed
--[[function conky_myspeed(upordown)
  return conky_parse('${' .. upordown .. 'speed ' .. findInterface() .. '}')
end

-- Generate up/download speed graph
function conky_myspeedgraph(upordown, h, w)
  return conky_parse('${'..upordown..'speedgraph '..findInterface()..' '..h..','..w..'}')
end


-- Wired interfaces
function conky_myaddr()
  return conky_parse('${addr ' .. findInterface() .. '}')
end
]]


--[[
-- wireless interfaces
function conky_mywaddr()
  return conky_parse('${addr ' .. findWInterface() .. '}')
end

-- Find up/download speed
function conky_mywspeed(upordown)
  return conky_parse('${' .. upordown .. 'speed ' .. findWInterface() .. '}')
end

-- Generate up/download speed graph
function conky_mywspeedgraph(upordown, h, w)
  return conky_parse('${'..upordown..'speedgraph '..findWInterface()..' '..h..','..w..'}')
end

function conky_myssid()
  return conky_parse('${wireless_essid ' .. findWInterface() .. '}')
end

function conky_wbitrate()
  return conky_parse('${wireless_bitrate ' .. findWInterface() .. '}')
end

function conky_wlinkqual()
  return conky_parse('${wireless_link_qual_perc ' .. findWInterface() .. '}')
end

function conky_wlinkbar(value)
  return conky_parse('${wireless_link_bar ' .. value .. ' ' .. findWInterface() .. '}')
end


function conky_wireintexist()
  local handle = io.popen('ip a | grep "state UP" | cut -d: -f2 | tr -d " " | grep -E "en.*"')
  local result = handle:read('*a'):gsub('\n$','')
  handle:close()
  return result
end

function conky_wirelessintexist()
  local handle = io.popen('ip a | grep "state UP" | cut -d: -f2 | tr -d " " | grep -E "wl.*"')
  local result = handle:read('*a'):gsub('\n$','')
  handle:close()
  return result
end
]]


