Settings = {
  Core = "qb-core", -- If you have renamed qb-core script. Put it here.
  Events = {
    Notifications = "QBCore:Notify",
  },
  Target = "qb-target", -- If you have renamed qb-target script. Put it here.

  Values ={
    Interval = 5, -- Time between to rob again. Also to the first heist since the server has started. (In Minutes)
    RewardsQuantity = {1, 4}, -- {Min Quantity, Max Quantity} of boxes rewards.
    Minigame = {
      Time = 30,
      TextLength = 5
    }
  },

  Guards = {
    Peds = { -- Ped List to spawn. You can add more.
      "s_m_m_prisguard_01",
      "s_m_y_marine_01",
      "s_m_y_marine_02",
      "s_m_y_dockwork_01",
      "s_m_y_blackops_01",
      "s_m_y_armymech_01",
      "s_m_m_marine_01",
    },

    Guns = { -- Ped guns. You can add more.
      "weapon_carbinerifle",
      "weapon_combatpistol",
    },

    Spawns = { -- Ped Spawns. You can add more or delete.
      vector3(474.60455322265625, -3135.64892578125, 6.07005882263183),
      vector3(522.5430908203125, -3120.306884765625, 6.06979084014892),
      vector3(545.3341064453125, -3149.162841796875, 6.06978893280029),
      vector3(527.7921752929688, -3182.259033203125, 16.39510917663574),
      vector3(529.6342163085938, -3196.80712890625, 11.38560962677002),
      vector3(526.43798828125, -3192.865478515625, 11.38533496856689),
      vector3(528.0137329101562, -3212.49609375, 11.4098892211914),
      vector3(530.6485595703125, -3241.364501953125, 11.38871574401855),
      vector3(530.8434448242188, -3248.5439453125, 7.7795672416687),
      vector3(528.1766357421875, -3232.37353515625, 7.782723903656),
      vector3(527.9439697265625, -3246.408447265625, 4.98142766952514),      
      vector3(528.4002075195312, -3212.370849609375, 4.98100328445434),
      vector3(526.9951782226562, -3229.114501953125, 4.98100709915161),
      vector3(499.8662414550781, -3168.37353515625, 6.06946277618408),
      vector3(536.607666015625, -3120.406982421875, 6.06946277618408)
    },
  },

  Tools = {
    Enabled = true,
    Spawns = {
      {
        Items = {"diving_gear", "diving_fill"},
        Zone = {
          name = "tools1",
          coords = vector3(528.56, -3192.65, 11.39),
          length = 1.85,
          width = 1,
          heading=359,
          debugPoly = false,
          minZ=7.94,
          maxZ=11.94
        },
      },
    }
  },

  Information = {
    Rewards = {
      ["trojan_usb"] = 100,
      ["electronickit"] = 100,
      ["security_card_01"] = 100,
      ["security_card_02"] = 100,
    },
    
    Zones = {
      ["boxzone1"] = {
        name = "boxzone1",
        coords = vector3(528.07, -3236.95, 11.38),
        length = 2,
        width = 2,
        heading = 0,
        debugPoly = false,
        minZ = 5.93,
        maxZ = 11.53,
      },
  
      ["boxzone2"] = {
        name = "boxzone2",
        coords = vector3(524.66, -3235.14, 11.38),
        length = 1,
        width = 3,
        heading = 270,
        debugPoly = false,
        minZ=8.28,
        maxZ=12.28,
      },
  
      ["boxzone3"] = {
        name = "boxzone3",
        coords = vector3(532.06, -3239.39, 11.39),
        length = 1.4,
        width = 1,
        heading = 358,
        debugPoly = false,
        minZ=8.19,
        maxZ=12.19,
      },
    },
  },
  
  Boxes = {
    Objects = {"prop_box_wood05a", "prop_box_wood05b"},

    Rewards = { -- You can add more.
      "goldbar",
      "diamond",
    },

    Spawns = { -- You can add more boxes to rob.
      vector4(528.2991333007812, -3255.953125, 4.98083972930908, 2.52),
      vector4(526.7968139648438, -3185.68701171875, 7.77749919891357, 0.0),
      vector4(528.2176513671875, -3173.45849609375, 8.19928932189941, 358.8)
    },
  },

  Sell = {
    Enabled = true,
    Model = "hc_hacker",
    Coords = vector4(675.728759765625, -1005.3507080078124, 21.38450050354004, 92.92),
  },
}