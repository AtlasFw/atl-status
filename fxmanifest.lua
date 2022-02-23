fx_version 'cerulean'
game 'gta5'
use_fxv2_oal 'yes'
lua54 'yes'

name 'atl-status'
author 'Atlas Framework Developers'

client_scripts {
    'client/*.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',

    'server/*.lua',
}

provide 'status' -- Instead of saying 'stop atl-core', you can just say 'stop core'