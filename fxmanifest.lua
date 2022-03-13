fx_version 'cerulean'
game 'gta5'
use_fxv2_oal 'yes'
lua54 'yes'

name 'atl-status'
author 'Atlas Framework Developers'
version '0.0.1'

shared_scripts {
  '@atl-core/import.lua',
}

client_scripts {
  'client/main.lua',
}

server_scripts {
  'server/main.lua',
}

dependencies {
  'atl-core',
}

provide 'status' -- Instead of saying 'stop atl-core', you can just say 'stop core'
