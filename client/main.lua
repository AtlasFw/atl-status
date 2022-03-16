local function initStatus()
  CreateThread(function()
    while true do
      TriggerServerEvent 'atl-status:server:removeInterval'
      Wait(10000)
    end
  end)
end

--[[ 
  test
]]
local function drawText2d(text, x, y, scale, r, g, b, a)
  SetTextFont(0)
  SetTextProportional(1)
  SetTextScale(scale, scale)
  SetTextColour(r, g, b, a)
  SetTextDropShadow(0, 0, 0, 0, 255)
  SetTextEdge(1, 0, 0, 0, 255)
  SetTextDropShadow()
  SetTextOutline()
  SetTextEntry 'STRING'
  AddTextComponentString(text)
  DrawText(x, y)
end

CreateThread(function()
  while true do
    if IsControlJustPressed(0, 45) then
      TriggerServerEvent('atl-status:server:subtract', 'thirst', 1)
    end
    if IsControlJustPressed(0, 46) then
      TriggerServerEvent('atl-status:server:add', 'thirst', 1)
    end
    drawText2d(' ' .. json.encode(ATL.Character.status), 0.2, 0.5, 0.3, 255, 255, 255, 255)
    Wait(1)
  end
end)

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

RegisterNetEvent('atl-status:client:sync', function(status)
  ATL.Character.status = status
end)
