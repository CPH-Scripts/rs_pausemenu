
RegisterCommand('openpausemenu', function()
    PauseMenu()
end)

RegisterKeyMapping('openpausemenu', 'Open Pause Menu', 'keyboard', 'ESCAPE')
TriggerEvent('chat:removeSuggestion', '/openpausemenu')

function PauseMenu()
    if not IsPauseMenuActive() and not IsNuiFocused() then 
        TriggerServerEvent('pausemenu:getData')
    end
end

RegisterCommand('openmap', function()
    openMap()
end)

RegisterKeyMapping('openmap', 'Open Map', 'keyboard', 'P')
TriggerEvent('chat:removeSuggestion', '/openmap')

function openMap() 
    if not IsPauseMenuActive() and not IsNuiFocused() then 
        ActivateFrontendMenu(GetHashKey('FE_MENU_VERSION_MP_PAUSE'), 0, -1) 
        SetNuiFocus(false, false)
    end
end

RegisterNetEvent('pausemenu:setData')
AddEventHandler('pausemenu:setData', function(money, bank, jobname, joblabel, firstname, lastname)
    if not lastname then
        lastname = ""
    end
    SendNUIMessage({
        type = 'menu',
        status = true,
        money = money,
        bank = bank,
        jobname = jobname,
        joblabel = joblabel,
        firstname = firstname,
        lastname = lastname
    })
    SetNuiFocus(true, true)
end)   


CreateThread(function()
    while true do 
        SetPauseMenuActive(false) 
        Wait(0)
    end
end)

RegisterNUICallback('closeGame', function()
    TriggerServerEvent('quitServer')
    SetNuiFocus(false, false)
end)

RegisterNUICallback('openSettings', function()
    ActivateFrontendMenu(GetHashKey('FE_MENU_VERSION_LANDING_MENU'), 0, -1) 
    SetNuiFocus(false, false)
end)

RegisterNUICallback('openMap', function()
    ActivateFrontendMenu(GetHashKey('FE_MENU_VERSION_MP_PAUSE'), 0,- 1) 
    SetNuiFocus(false, false)
end)

RegisterNUICallback('closeMenu', function()
    SetNuiFocus(false, false)
end)
