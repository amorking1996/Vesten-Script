ESX = exports["es_extended"]:getSharedObject()

Citizen.CreateThread(function()
    while ESX == nil do
        Citizen.Wait(0)
    end
end)

-- Function to handle vest usage
local function useVest(vestIndex)
    local playerPed = PlayerPedId()
    local vest = Config.Vests[vestIndex]
    
    if not vest then
        print("Invalid vest index")
        return
    end

    -- Play animation
    RequestAnimDict(Config.Animation.dict)
    while not HasAnimDictLoaded(Config.Animation.dict) do
        Citizen.Wait(100)
    end

    TaskPlayAnim(playerPed, Config.Animation.dict, Config.Animation.anim, 8.0, -8.0, -1, 49, 0, false, false, false)

    Citizen.Wait(Config.Animation.duration)  -- Wait until the animation is played

    ClearPedTasks(playerPed)

    -- Equip vest
    TriggerEvent('skinchanger:getSkin', function(skin)
        local clothesSkin = {
            ['bproof_1'] = vest.bproof_1,
            ['bproof_2'] = vest.bproof_2
        }
        TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)
        exports['okokNotify']:Alert("Weste", vest.label .. " wurde angezogen", 2000, 'info')
    end)
end

RegisterNetEvent('vest_script:useVest1')
AddEventHandler('vest_script:useVest1', function()
    useVest(1)
end)

RegisterNetEvent('vest_script:useVest2')
AddEventHandler('vest_script:useVest2', function()
    useVest(2)
end)
