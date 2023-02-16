local RobbedInformation = {}

RegisterNetEvent("qb-submarine:client:sendRobbed", function(v)
  RobbedInformation = v
end)

RobInformation = function(zoneId)
  if not RobbedInformation[zoneId] then
    TriggerEvent("mhacking:show")
    TriggerEvent("mhacking:start", Settings.Values.Minigame.TextLength, Settings.Values.Minigame.Time, function(success)
      if success then
        TriggerEvent('mhacking:hide')
        for i=1,(#Settings.Information.Rewards-math.random(#Settings.Information.Rewards)) do
          if i > 0 then
            GiveReward(Settings.Information.Rewards[i], 1)
          end
        end
        TriggerServerEvent("qb-submarine:server:setInformationRobbed", zoneId)
        Framework.Functions.Notify(Langs["rob_information_finish"], "sucess")
      else
        TriggerEvent('mhacking:hide')
        Framework.Functions.Notify(Langs["fail"], "error")
      end
    end)
  else
    Framework.Functions.Notify(Langs["already_robbed"], "error")
  end
end