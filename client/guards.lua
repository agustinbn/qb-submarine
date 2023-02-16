local Guards = {}

CreateGuard = function(coords)
  local model <const> = Settings.Guards.Peds[#Settings.Guards.Peds]
  LoadModel(model)
  local guardPed <const> = CreatePed(GetPedType(model), GetHashKey(model), coords.x, coords.y, coords.z, math.random(0, 360), true, true)
  FreezeEntityPosition(guardPed, false)
  SetEntityInvincible(guardPed, false)
  SetPedSeeingRange(guardPed, 60.0)
  SetPedHearingRange(guardPed, 60.0)
  SetPedCombatAttributes(guardPed, 46, 1)
  SetPedFleeAttributes(guardPed, 0, 0)
  SetPedCombatRange(guardPed,2)
  SetPedRelationshipGroupHash(guardPed, GetHashKey(0x06C3F072))
  SetPedDiesInWater(guardPed, false)
  SetRelationshipBetweenGroups(5, GetHashKey("PLAYER"),GetHashKey("0x06C3F072"))
  SetRelationshipBetweenGroups(5, GetHashKey("0x06C3F072"), GetHashKey("PLAYER"))
  local selectedWeapon <const> = GetHashKey(Settings.Guards.Guns[math.random(#Settings.Guards.Guns)])
  GiveWeaponToPed(guardPed, selectedWeapon, math.random(20, 100), false, false)
  SetCurrentPedWeapon(guardPed, selectedWeapon, true)
  return guardPed
end

SpawnGuards = function()
  for _, v in pairs(Settings.Guards.Spawns) do
    if #Guards == #Settings.Guards.Spawns then break end
    local newGuard <const> = CreateGuard(v)
    Guards[#Guards+1] = newGuard
  end
end

DeleteGuard = function(guardPed)
  for k, v in pairs(Guards) do
    if v == guardPed then
      DeletePed(v)
      Guards[k] = nil
      break
    end
  end
end

DeleteAllGuards = function()
  for k, v in pairs(Guards) do
    DeletePed(v)
    Guards[k] = nil
  end
end

RestartGuards = function()
  if #Guards > 0 then
    DeleteAllGuards()
    Citizen.SetTimeout(500, SpawnGuards)
  end
end