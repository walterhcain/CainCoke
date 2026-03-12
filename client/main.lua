local QBCore = exports['qb-core']:GetCoreObject()

local dealer = nil
local thug1 = nil
local thug2 = nil
local thug3 = nil
local thug4 = nil
local boat = nil
local area = 0
local canBuy = false

RegisterNetEvent('cain-coke:client:sendMail', function(area)
    TriggerServerEvent('qb-phone:server:sendNewMail', {
        sender = "Alonso",
        subject = "Package Incoming",
        message = "You've impressed us. If you want in on our business, we have a shipment coming in. Bring money to the meet.",
        button = {
            enabled = true,
            buttonEvent = "cain-missions:client:setWaypoint",
            buttonData = Config.Locations[area].shop.coords
        }
    })
end)

RegisterNetEvent('cain-coke:client:spawnDealer', function(areax)
    --Dealer
    area = areax
    local hashkey = GetHashKey(Config.Locations[area].shop.model)
    local PlayerData = QBCore.Functions.GetPlayerData()
    RequestModel(hashkey)
	while not HasModelLoaded(hashkey) do
		Wait(10)
	end
	local str = "You got the money?"
    local resp = "I'm here for the package."
    if PlayerData.metadata["dealerrep"] < Config.DrugRepRequired or PlayerData.job == "leo" then
        str = "What the hell do you want?"
    end
    if PlayerData.metadata["dealerrep"] < Config.DrugRepRequired or PlayerData.job == "leo" then
        resp = "Nothing...I guess..."
    end
    
	dealer = exports['rep-talkNPC']:CreateNPC({
        npc = Config.Locations[area].shop.model,
        coords = Config.Locations[area].shop.coords,
        heading = Config.Locations[area].shop.coords.w,
        name = "Sebastián",
        animName = "mini@strip_club@idles@bouncer@base",
        animDist = "base",
        tag = "Cartel Enforcer",
        color = "#C19E1C",
        startMSG = str
    }, {
        [1] = {
            label = resp,
            shouldClose = false,
            action = function()
                if PlayerData.metadata["dealerrep"] < Config.DrugRepRequired or PlayerData.job == "leo" then
                    TriggerEvent('rep-talkNPC:client:close')
                else
                    exports['rep-talkNPC']:changeDialog("It's $"..Config.CokePrice.." for the kilo. You got the money?", {
                        [1] = {
                            label = "Yeah, I've got it here.",
                            shouldClose = false,
                            action = function()
                                if QBCore.Functions.HasItem("cash", Config.CokePrice) then
                                    TriggerServerEvent('cain-coke:server:buyCoke')
                                    TriggerEvent('rep-talkNPC:client:close')
                                else
                                    exports['rep-talkNPC']:updateMessage("Don't test me. You either have the money, or you don't.")
                                end
                            end
                        },
                        [2] = {
                            label = "I'll come back later with the money.",
                            shouldClose = true,
                            action = function()
                                TriggerEvent('rep-talkNPC:client:close')
                            end
                        }
                    })
                end
            end
        },
        [2] = {
            label = "Goodbye",
            shouldClose = true,
            action = function()
                TriggerEvent('rep-talkNPC:client:close')
            end
        }
    })
    SetPedFleeAttributes(dealer, 0, 0)
	SetPedCombatAttributes(dealer, 46, 1)
	SetPedCombatAbility(dealer, 100)
	SetPedCombatMovement(dealer, 2)
	SetPedCombatRange(dealer, 2)
	SetPedKeepTask(dealer, true)
	GiveWeaponToPed(dealer, Config.Locations[area].shop.gun,250,false,true)
    SetPedRelationshipGroupHash(dealer, GetHashKey("ALONSO"))
end)

RegisterNetEvent('cain-coke:client:spawnDealers', function(areax)
    
    area = areax
    
    --Thug1
    local hashkey = GetHashKey(Config.Locations[area].thug1.model)
    
    RequestModel(hashkey)
	while not HasModelLoaded(hashkey) do
		Wait(10)
	end
    
    thug1 = CreatePed(26, hashkey, Config.Locations[area].thug1.coords.x, Config.Locations[area].thug1.coords.y, Config.Locations[area].thug1.coords.z, Config.Locations[area].thug1.coords.w, true, false)
	--Thug2
    hashkey = GetHashKey(Config.Locations[area].thug2.model)
    
    RequestModel(hashkey)
	while not HasModelLoaded(hashkey) do
		Wait(10)
	end
    
    thug2 = CreatePed(26, hashkey, Config.Locations[area].thug2.coords.x, Config.Locations[area].thug2.coords.y, Config.Locations[area].thug2.coords.z, Config.Locations[area].thug2.coords.w, true, false)
    --Thug3
    hashkey = GetHashKey(Config.Locations[area].thug3.model)
    
    RequestModel(hashkey)
	while not HasModelLoaded(hashkey) do
		Wait(10)
	end
    
    thug3 = CreatePed(26, hashkey, Config.Locations[area].thug3.coords.x, Config.Locations[area].thug3.coords.y, Config.Locations[area].thug3.coords.z, Config.Locations[area].thug3.coords.w, true, false)
    --Thug4
    hashkey = GetHashKey(Config.Locations[area].thug4.model)
    
    RequestModel(hashkey)
	while not HasModelLoaded(hashkey) do
		Wait(10)
	end
    
    thug4 = CreatePed(26, hashkey, Config.Locations[area].thug4.coords.x, Config.Locations[area].thug4.coords.y, Config.Locations[area].thug4.coords.z, Config.Locations[area].thug4.coords.w, true, false)
    --Boat
    if Config.Locations[area].boat.coords then
        hashkey = GetHashKey(Config.Locations[area].boat.model)
        
        RequestModel(hashkey)
	    while not HasModelLoaded(hashkey) do
		    Wait(10)
	    end
        
        boat = CreateVehicle(hashkey, Config.Locations[area].boat.coords.x, Config.Locations[area].boat.coords.y, Config.Locations[area].boat.coords.z, Config.Locations[area].boat.coords.w, true, true)
        SetVehicleEngineOn(boat, 0, true)
        SetVehicleDoorsLocked(boat, 2)
    end

    AddRelationshipGroup("ALONSO")
    --Dealer
    
    --Thug1
    SetPedFleeAttributes(thug1, 0, 0)
	SetPedCombatAttributes(thug1, 46, 1)
	SetPedCombatAbility(thug1, 100)
	SetPedCombatMovement(thug1, 2)
	SetPedCombatRange(thug1, 2)
	SetPedKeepTask(thug1, true)
	GiveWeaponToPed(thug1, Config.Locations[area].thug1.gun,250,false,true)
    SetPedRelationshipGroupHash(thug1, GetHashKey("ALONSO"))
    --Thug2
    SetPedFleeAttributes(thug2, 0, 0)
	SetPedCombatAttributes(thug2, 46, 1)
	SetPedCombatAbility(thug2, 100)
	SetPedCombatMovement(thug2, 2)
	SetPedCombatRange(thug2, 2)
	SetPedKeepTask(thug2, true)
	GiveWeaponToPed(thug2, Config.Locations[area].thug2.gun,250,false,true)
    SetPedRelationshipGroupHash(thug2, GetHashKey("ALONSO"))
    --Thug3
    SetPedFleeAttributes(thug3, 0, 0)
	SetPedCombatAttributes(thug3, 46, 1)
	SetPedCombatAbility(thug3, 100)
	SetPedCombatMovement(thug3, 2)
	SetPedCombatRange(thug3, 2)
	SetPedKeepTask(thug3, true)
	GiveWeaponToPed(thug3, Config.Locations[area].thug3.gun,250,false,true)
    SetPedRelationshipGroupHash(thug3, GetHashKey("ALONSO"))
    --Thug4
    SetPedFleeAttributes(thug4, 0, 0)
	SetPedCombatAttributes(thug4, 46, 1)
	SetPedCombatAbility(thug4, 100)
	SetPedCombatMovement(thug4, 2)
	SetPedCombatRange(thug4, 2)
	SetPedKeepTask(thug4, true)
	GiveWeaponToPed(thug4, Config.Locations[area].thug4.gun,250,false,true)
    SetPedRelationshipGroupHash(thug4, GetHashKey("ALONSO"))

    SetRelationshipBetweenGroups(3, GetHashKey("ALONSO"), GetHashKey("PLAYER"))
    SetRelationshipBetweenGroups(0, GetHashKey("ALONSO"), GetHashKey("ALONSO"))

   --SET TARGET FOR DEALER
end)

RegisterNetEvent('cain-coke:client:setBuy', function(bool)
    canBuy = bool
    if bool == false then
        exports['qb-target']:RemoveTargetEntity(dealer)
        FreezeEntityPosition(dealer, false)
        SetEntityInvincible(dealer, false)
        SetBlockingOfNonTemporaryEvents(dealer, false)
        SetPedDiesWhenInjured(dealer, true)
        TaskWanderStandard(dealer, 10.0, 10)
        TaskWanderStandard(thug1, 10.0, 10)
        TaskWanderStandard(thug2, 10.0, 10)
        TaskWanderStandard(thug3, 10.0, 10)
        TaskWanderStandard(thug4, 10.0, 10)
    end
end)

RegisterNetEvent('cain-coke:client:cleanup', function()
    if dealer then
        DeletePed(dealer)
        dealer = nil
    end
    if thug1 then
        DeletePed(thug1)
        thug1 = nil
    end
    if thug2 then
        DeletePed(thug2)
        thug2 = nil
    end
    if thug3 then
        DeletePed(thug3)
        thug3 = nil
    end
    if thug4 then
        DeletePed(thug4)
        thug4 = nil
    end
    if boat then
        DeleteVehicle(boat)
        boat = nil
    end

end)