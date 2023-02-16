CreateSeller = function()
  local model <const> = Settings.Sell.Model
  local coords <const> = Settings.Sell.Coords
  LoadModel(model)
  local sellerPed <const> = CreatePed(GetPedType(model), GetHashKey(model), coords.x, coords.y, coords.z, coords.w, true, true)
  FreezeEntityPosition(sellerPed, true)
  SetEntityInvincible(sellerPed, true)
  SetBlockingOfNonTemporaryEvents(sellerPed, true)
  TaskStartScenarioInPlace(sellerPed, "WORLD_HUMAN_SMOKING", 0, false)
  SetModelAsNoLongerNeeded(sellerPed)
  exports['qb-target']:AddTargetEntity(sellerPed, {
    options = {{
        type = "server",
        event = "qb-submarine:server:sellInformation",
        icon = "fas fa-box-circle-check",
        label = Langs["sell_information_option"],

    }},
    distance = 2.0
  })
end

RegisterNetEvent("qb-submarine:server:createSeller", CreateSeller)