Framework = exports[Settings.Core]:GetCoreObject()

local Loaded = false
local TakenTools = {}
local LootedBoxes = {}
local RobbedInformation = {}

RegisterNetEvent("qb-submarine:server:takeTools", function()
  local src = source
  if #TakenTools <= 3 then
    if not TakenTools[src] then
      TakenTools[src] = true
      for k, v in pairs(Settings.Tools.Spawns) do
        for n,m in pairs(v.Items) do
          TriggerClientEvent('inventory:client:ItemBox', src, Framework.Shared.Items[m], "add")
          TriggerEvent("qb-submarine:server:giveReward", m, 1, src)
        end
      end
      TriggerClientEvent("qb-submarine:client:sendTaken", -1, TakenTools)
    else
      TriggerClientEvent(Settings.Events["Notifications"], src, Langs["already_have_tools"])
    end
  end
end)

RegisterNetEvent("qb-submarine:server:setLootedBox", function(boxId)
  if not LootedBoxes[boxId] then
    LootedBoxes[boxId] = true
    TriggerClientEvent("qb-submarine:client:sendLooted", -1, LootedBoxes)
  end
end)

RegisterNetEvent("qb-submarine:server:setInformationRobbed", function(robId)
  if not RobbedInformation[robId] then
    RobbedInformation[robId] = true
    TriggerClientEvent("qb-submarine:client:sendRobbed", -1, RobbedInformation)
  end
end)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(60000 * Settings.Values.Interval)
    if not Loaded then
      TriggerClientEvent("qb-submarine:client:respawnAll", -1, false)
      if Settings.Sell.Enabled then
        TriggerClientEvent("qb-submarine:client:createSeller", -1)
      end
      Loaded = true
    else
      TriggerClientEvent("qb-submarine:client:respawnAll", -1, true)
    end
    ResetAll()
  end
end)

RegisterNetEvent('qb-submarine:server:giveReward', function(reward, quantity, customSrc)
  local src = customSrc == nil and source or customSrc
  local Player = Framework.Functions.GetPlayer(src)
  if Player then
    Player.Functions.AddItem(reward, quantity)
  end
end)

RegisterNetEvent('qb-submarine:server:removeLockpick', function(customSrc)
  local src = customSrc == nil and source or customSrc
  local Player = Framework.Functions.GetPlayer(src)
  if Player then
    Player.Functions.RemoveItem('lockpick', 1)
  end
end)

RegisterNetEvent("qb-submarine:server:sellInformation", function()
  local src = source
  local Player = Framework.Functions.GetPlayer(src)
  if Player then
    local hasInformation = false
    for k, v in pairs(Player.PlayerData.items) do
      for n, m in pairs(Settings.Information.Rewards) do
        if v.name == n then
          Player.Functions.AddMoney("cash", m, "sell information")
          Player.Functions.RemoveItem(n, v.amount)
          TriggerClientEvent('inventory:client:ItemBox', src, Framework.Shared.Items[n], "remove")
          TriggerClientEvent(Settings.Events.Notifications, src, Langs["sell_information"])
          hasInformation = true
          break
        end
      end
    end
    if not hasInformation then
      TriggerClientEvent(Settings.Events.Notifications, src, Langs["no_information"])
    end
  end
end)

ResetAll = function()
  TakenTools = {}
  TriggerClientEvent("qb-submarine:client:sendTaken", -1, TakenTools)
  LootedBoxes = {}
  TriggerClientEvent("qb-submarine:client:sendLooted", -1, LootedBoxes)
  RobbedInformation = {}
  TriggerClientEvent("qb-submarine:client:sendRobbed", -1, RobbedInformation)
end