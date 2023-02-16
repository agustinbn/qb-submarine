RegisterNetEvent("qb-submarine:client:respawnAll")
AddEventHandler("qb-submarine:client:respawnAll", function(Loaded)
  if Loaded then
    RestartGuards()
    RestartBoxes()
  else
    SpawnGuards()
    SpawnBoxes()
  end
end)

AddEventHandler("onResourceStop", function(resourceName)
  if resourceName == GetCurrentResourceName() then
    DeleteAllBoxes()
    DeleteAllGuards()
  end
end)