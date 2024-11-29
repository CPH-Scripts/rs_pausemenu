-- Leaked by Poseidon Leaks
-- https://discord.gg/poseidon-leaks
-- https://poseidonleaks.eu/
lua54 'yes'
escrow_ignore {
	'config.lua',
    'client.lua',
	'server.lua'
}

game 'gta5'
version '1.0'
fx_version 'adamant'
description 'Pause Menu - discord.gg/poseidon-leaks'

client_scripts {
    'config.lua',
	'client.lua'
}

server_scripts {
    'config.lua',
    'server.lua'
}

ui_page('html/index.html')

files({
    'html/*.png',
    'html/*.css',
    'html/*.html',
    'html/*.js',
})

dependency '/assetpacks'