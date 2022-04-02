local function initStatus()
  CreateThread(function()
    while true do
      Wait(60000)
      TriggerServerEvent 'atl-status:server:subtractInterval'
      checkValues()
    end
  end)
end

RegisterNetEvent('atl-core:client:onCharacterLoaded', function(character)
  if not character then
    return
  end
  ATL.Character = character

  SetEntityHealth(PlayerPedId(), ATL.Character.status.health.value)
  SetPedArmour(PlayerPedId(), ATL.Character.status.armor.value)
  Wait(500)
  initStatus()
end)

RegisterNetEvent('atl-core:client:onStatusUpdate', function(status)
  ATL.Character.status = status
end)
