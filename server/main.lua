local QBCore = exports['qb-core']:GetCoreObject()
local area
local player

local function spawnDealers()
    for _, playerx in ipairs(GetPlayers()) do
        player = QBCore.Functions.GetPlayer(tonumber(playerx))
        if player ~= nil then
            if player.PlayerData.metadata["dealerrep"] >= Config.DrugRepRequired then
                TriggerClientEvent('cain-coke:client:spawnDealers', playerx, area)
                TriggerClientEvent('cain-coke:client:spawnDealer', -1, area)
                return
            end
        end
    end
end


local function cleanup()
    TriggerClientEvent('cain-coke:client:cleanup', -1)
end

local function sendEmail()
    for _,playery in ipairs(GetPlayers()) do 
        player = QBCore.Functions.GetPlayer(tonumber(playery))
        if player.PlayerData.metadata["dealerrep"] >= Config.DrugRepRequired then
            TriggerClientEvent('cain-coke:client:sendMail', playery, area)
        end
    end
end

local function startThread()
    Citizen.CreateThread(function()
        Wait(math.random(Config.WaitMin, Config.WaitMax))
        area = math.random(1, #Config.Locations)
        TriggerClientEvent('cain-coke:client:setBuy', -1, true)
        spawnDealers()
        sendEmail()
        Wait(math.random(Config.WaitMin+3600000, Config.WaitMax+3600000))
        cleanup()
        area = math.random(1, #Config.Locations)
        TriggerClientEvent('cain-coke:client:setBuy', -1, true)
        spawnDealers()
        sendEmail()
    end)
end

RegisterNetEvent('cain-coke:server:buyCoke', function()
    local src = source
    local pl = QBCore.Functions.GetPlayer(src)
    pl.Functions.RemoveItem("cash", Config.CokePrice)
    pl.Functions.AddItem("coke_kilo", 1)
    TriggerClientEvent('cain-coke:client:setBuy', -1, false)
end)


AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end
    startThread()
end)

AddEventHandler('onResourceStop', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
    end
    cleanup()
end)
