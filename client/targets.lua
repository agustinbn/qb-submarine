CreateBoxTarget = function(object)
  return exports[Settings.Target]:AddTargetEntity(object, {
    options = {{
      type = "client",
      action = function(ent)
        RobBox(ent)
      end,
      icon = "fas fa-box-circle-check",
      label = Langs["loot_box"],
      object = object
    }},
    distance = 1.0
  })
end

CreateThread(function()
  for k,v in pairs(Settings.Information.Zones) do
    exports[Settings.Target]:AddBoxZone(v.name, v.coords, v.length, v.width, {
      name=v.name,
      heading = v.heading,
      debugPoly = v.debugPoly,
      minZ = v.minZ,
      maxZ = v.maxZ
    }, {
      options = {{
        type = "client",
        icon = "fas fa-box-circle-check",
        label = Langs["rob_information"],
        action = function()
          RobInformation(v.name)
        end,
      }},
      distance = 1.5
    })
  end

  if Settings.Tools.Enabled then
    for k,v in pairs(Settings.Tools.Spawns) do
      exports[Settings.Target]:AddBoxZone(v.Zone.name, v.Zone.coords, v.Zone.length, v.Zone.width, {
        name=v.Zone.name,
        heading = v.Zone.heading,
        debugPoly = v.Zone.debugPoly,
        minZ = v.Zone.minZ,
        maxZ = v.Zone.maxZ
      }, {
        options = {{
          type = "server",
          icon = "fas fa-box-circle-check",
          label = Langs["take_tools"],
          event = "qb-submarine:server:takeTools"
        }},
        distance = 1.5
      })
    end
  end
end)