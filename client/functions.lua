function notify(text)
  SetNotificationTextEntry 'STRING'
  AddTextComponentString(text)
  DrawNotification(false, false)
end

function checkValues()
  if not Config.Alerts.Use then
    return
  end

  for name, data in pairs(ATL.Character.status) do
    local alert = Config.Alerts.Data[name]
    if alert then
      print(name .. ' : ' .. data.value)
      for value, alertData in pairs(alert) do
        if data.value <= value then
          notify(alertData.text)
          alertData.effect()
          break
        end
      end
    end
  end
end
