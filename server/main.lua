ESX = exports["es_extended"]:getSharedObject()
ESX.RegisterUsableItem('bulletproof_vest_police', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem('bulletproof_vest_police', 1)
    TriggerClientEvent('vest_script:useVest1', source)
end)

ESX.RegisterUsableItem('bulletproof_vest_sheriff', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem('bulletproof_vest_sheriff', 1)
    TriggerClientEvent('vest_script:useVest2', source)
end)



