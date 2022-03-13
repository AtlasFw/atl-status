RegisterNetEvent('atl:status:update', function()
  local playerId = source
  local player = ATL.GetPlayer(playerId)
  local status = {}
  for name, data in pairs(player.status) do
    if name == 'health' then
      status[name] = {
        value = GetEntityHealth(GetPlayerPed(playerId)),
      }
    elseif name == 'armor' then
      status[name] = {
        value = GetPedArmour(GetPlayerPed(playerId)),
      }
    else
      local value = player.getStatus(name).value
      local rate = player.getStatus(name).rate
      local newValue = nil

      if value <= 0 then
        newValue = 0
      else
        newValue = value + rate
      end

      status[name] = {
        value = newValue,
        rate = rate,
      }
    end
  end
  player.setStatus(status)
end)
