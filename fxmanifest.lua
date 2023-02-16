fx_version 'cerulean'
game 'gta5'

author "AgustinBN"
description 'Submarine Heist'
version '1.0.0'

lua54 'yes'

client_scripts {
  "client/framework.lua",
  "client/utils.lua",
  "client/targets.lua",
  "client/events.lua",
  "client/guards.lua",
  "client/information.lua",
  "client/box.lua",
  "client/tools.lua",
  "client/sell.lua",
  "client/events.lua",
}

server_script "server.lua"

shared_scripts {
  "langs.lua",
  "settings.lua",
}

escrow_ignore {
  "settings.lua",
  "langs.lua"
}

dependencies {
  "PolyZone",
  "mhacking",
  "qb-target",
}