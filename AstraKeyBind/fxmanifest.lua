game 'rdr3'
fx_version 'adamant'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'


version '1.0.0'
author 'NEUK'

shared_script "module/shared/config.lua"

client_script {
    'module/client/main.lua',
}
