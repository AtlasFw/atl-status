local function add(status, value)
  local playerId = source
  local player = ATL.GetPlayer(playerId)

  if not player.status[status] or status == 'health' or status == 'armor' then
    return
  end

  if type(value) ~= 'number' or value > 100 or value <= 0 then
    return
  end

  player.addStatus(status, value)
end

local function subtract(status, value)
  local playerId = source
  local player = ATL.GetPlayer(playerId)

  if not player.status[status] or status == 'health' or status == 'armor' then
    return
  end

  if type(value) ~= 'number' or value > 100 or value <= 0 then
    return
  end

  player.reduceStatus(status, value)
end

local function subtractInterval()
  local playerId = source
  local player = ATL.GetPlayer(playerId)
  local playerPed = GetPlayerPed(playerId)
  local status = {}

  for name, data in pairs(player.status) do
    if name == 'health' then
      status[name] = {
        value = GetEntityHealth(playerPed),
      }
    elseif name == 'armor' then
      status[name] = {
        value = GetPedArmour(playerPed),
      }
    else
      local value = player.getStatus(name).value
      local rate = player.getStatus(name).rate
      local newValue = value + rate

      if newValue > 100 then
        newValue = 100
      elseif newValue < 0 then
        newValue = 0
      end

      status[name] = {
        value = newValue,
        rate = rate,
      }
    end
  end
  player.setStatus(status)
end

RegisterNetEvent('atl-status:server:subtractInterval', subtractInterval)
RegisterNetEvent('atl-status:server:add', add)
RegisterNetEvent('atl-status:server:subtract', subtract)
