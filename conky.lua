-- Find local IP address according to active connections
function conky_myaddr()
  return conky_parse('${addr ' .. findInterface() .. '}')
end

-- Find up/download speed
function conky_myspeed(upordown)
  print(findInterface())
  return conky_parse('${' .. upordown .. 'speed ' .. findInterface() .. '}')
end

-- Generate up/download speed graph
function conky_myspeedgraph(upordown, h, w)
  return conky_parse('${'..upordown..'speedgraph '..findInterface()..' '..h..','..w..'}')
end

-- Find the string representing the connection's interface (e.g.  eth0)
function findInterface()
  local handle = io.popen('ip a | grep "state UP" | cut -d: -f2 | tr -d " " | grep -E "en.*"')
  local result = handle:read('*a'):gsub('\n$','')
  handle:close()
  return result
end


function conky_mywaddr()
  return conky_parse('${addr ' .. findWInterface() .. '}')
end

-- Find up/download speed
function conky_mywspeed(upordown)
  print(findInterface())
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


function findWInterface()
  local handle = io.popen('ip a | grep "state UP" | cut -d: -f2 | tr -d " " | grep -E "wl.*"')
  local result = handle:read('*a'):gsub('\n$','')
  handle:close()
  return result
end


