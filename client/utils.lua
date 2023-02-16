LoadModel = function(model)
  RequestModel(GetHashKey(model))
  while not HasModelLoaded(GetHashKey(model)) do RequestModel(GetHashKey(model)); Wait(5); end
end

GetEntityCoordsAsVector4 = function(entity)
  local coords <const> = GetEntityCoords(entity)
  local heading <const> = GetEntityHeading(entity)
  return vector4(coords.x, coords.y, coords.z, heading)
end