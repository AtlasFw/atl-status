Config = {
  Alerts = {
    Use = true,

    Data = {
      hunger = {
        [10] = {
          text = 'You are starving 10!',
          effect = function()
            CreateThread(function()
              local stop = false

              SetTimeout(5000, function()
                stop = true
              end)

              while not stop do
                Wait(1)
                SetPedMoveRateOverride(PlayerPedId(), 0.5)
              end
            end)
          end,
        },
        [20] = {
          text = 'You are starving 20!',
          effect = function()
            CreateThread(function()
              while true do
                Wait(1)
                SetPedMoveRateOverride(PlayerPedId(), 0.5)
                SetTimeout(1000, function()
                  return
                end)
              end
            end)
          end,
        },
      },
    },
  },
}
