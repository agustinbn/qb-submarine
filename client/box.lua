local Boxes = {}
local LootedBoxes = {}

CreateBox = function(coords, open)
  local model <const> = Settings.Boxes.Objects[open and 2 or 1]
  LoadModel(model)
  local boxObj <const> = CreateObject(GetHashKey(model), coords, true, false)
  SetEntityHeading(boxObj, coords.w)
  FreezeEntityPosition(boxObj, true)
  PlaceObjectOnGroundProperly(boxObj)
  return boxObj
end

RobBox = function(object)
  local boxId <const> = GetBoxId(object)
  if not LootedBoxes[boxId] then
    if Framework.Functions.HasItem("lockpick", 1) then
      Framework.Functions.Progressbar("box_looting", Langs["searching_tools"], 3000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
      }, {
        animDict = "weapons@first_person@aim_rng@generic@projectile@thermal_charge@",
        anim = "plant_floor",
        flags = 16,
      }, {}, {}, function()
        TriggerEvent("qb-lockpick:client:openLockpick", function(success)
          if success then
            Wait(200)
            SetOpenBox(object)
            GiveReward(Settings.Boxes.Rewards[math.random(#Settings.Boxes.Rewards)], Settings.Values.RewardsQuantity[math.random(#Settings.Values.RewardsQuantity)])
            TriggerServerEvent("qb-submarine:server:setLootedBox", boxId)
          else
            if math.random(1, 100) < 40 then
              TriggerServerEvent("qb-submarine:server:removeLockpick")
              TriggerEvent('inventory:client:ItemBox', Framework.Shared.Items["lockpick"], "remove")
            end
            Framework.Functions.Notify(Langs["fail"], "error")
          end
        end)
      end)
    else
      Framework.Functions.Notify(Langs["no_lockpick"], "error")
    end
  end
end

SetOpenBox = function(selectedBox)
  local boxCoords <const> = GetEntityCoordsAsVector4(selectedBox)
  DeleteObject(selectedBox)
  Wait(200)
  local openedBox <const> = CreateBox(boxCoords, true)
  ReplaceBox(selectedBox, openedBox)
end

SpawnBoxes = function()
  for _, v in pairs(Settings.Boxes.Spawns) do
    if #Boxes == #Settings.Boxes.Spawns then break end
    local newBox <const> = CreateBox(v, false)
    CreateBoxTarget(newBox)
    Boxes[#Boxes+1] = newBox 
  end
end

DeleteAllBoxes = function()
  for k, v in pairs(Boxes) do
    DeleteObject(v)
    Boxes[k] = nil
  end
end

DeleteBox = function(boxObj)
  for k, v in pairs(Boxes) do
    if v == boxObj then
      DeleteObject(v)
      Boxes[k] = nil
      break
    end
  end
end

ReplaceBox = function(oldBox, newBox)
  for k, v in pairs(Boxes) do
    if v == oldBox then
      Boxes[k] = newBox
      break
    end
  end
end

GetBoxId = function(box)
  local boxId = nil
  for k, v in pairs(Boxes) do
    if v == box then
      boxId = k
      break
    end
  end
  return boxId
end

GiveReward = function(reward, quantity)
  TriggerServerEvent("qb-submarine:server:giveReward", reward, quantity)
  TriggerEvent('inventory:client:ItemBox', Framework.Shared.Items[reward], "add")
end

RestartBoxes = function()
  if #Boxes > 0 then
    DeleteAllBoxes()
    Citizen.SetTimeout(500, SpawnBoxes)
  end
end

RegisterNetEvent("qb-submarine:client:sendLooted", function(v)
  LootedBoxes = v
end)