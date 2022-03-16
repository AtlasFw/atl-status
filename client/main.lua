local function initStatus()
  CreateThread(function()
    while true do
      TriggerServerEvent 'atl-status:server:update'
      Wait(60000)
    end
  end)
end

RegisterNetEvent('atl-core:client:characterLoaded', function(character)
  if not character then
    return
  end
  ATL.Character = character

  SetEntityHealth(PlayerPedId(), ATL.Character.status.health.value)
  SetPedArmour(PlayerPedId(), ATL.Character.status.armor.value)
  Wait(500)
  initStatus()
end)

RegisterNetEvent('atl-status:client:update', function(status)
  ATL.Character.status = status
end)
