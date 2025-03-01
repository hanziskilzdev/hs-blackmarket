ped = false

CreateThread(function()

    while true do

        if not ped then
            ped = true

            RequestModel(GetHashKey('a_m_m_og_boss_01')) 
            while not HasModelLoaded(GetHashKey('a_m_m_og_boss_01')) do
                Wait(1)
            end

            ped = CreatePed(4, GetHashKey('a_m_m_og_boss_01'), 58.2940, -1860.4207, 21.7805, 326.8190, false, true) -- Ped Lokation
            FreezeEntityPosition(ped, true)
            SetEntityInvincible(ped, true)
            SetBlockingOfNonTemporaryEvents(ped, true)
        end
        Wait(100)

    end 
    
end)

exports.ox_target:addSphereZone({

    coords = vec3(58.2718, -1860.4620, 22.7129), -- Target Lokation
    radius = 1,
    debug = drawZones,

    options = {

        {
            name = 'blackmarket_script',
            event = 'hs-blackmarket:show_menu',
            icon = 'fa-solid fa-person',
            label = 'Tilgå Black Market',
            canInteract = function(entity, distance, coords, name)
                return true
            end
        },

    }

})

AddEventHandler('hs-blackmarket:show_menu', function()

    lib.registerContext({

        id = 'open_black_market',
        title = 'Black Market',

        options = {

            {
                title = 'Deagle',
                description = '1.000.000 DKK',
                icon = 'gun',

                onSelect = function()

                    local input = lib.inputDialog('Black Market', {
                        {type = 'input', label = 'Antal', description = 'Antal du ønsker af den valgte genstand', required = true}
                    })

                    local item = 'WEAPON_PISTOL50'
                    local amount = tonumber(input[1])
                    local price = 1000000

                    TriggerServerEvent('give_item', item, amount, price)

                end,
            },

            {
                title = 'Skudsikkervest',
                description = '50.000 DKK',
                icon = 'vest',

                onSelect = function()

                    local input = lib.inputDialog('Black Market', {
                        {type = 'input', label = 'Antal', description = 'Antal du ønsker af den valgte genstand', required = true}
                    })

                    local item = 'armour'
                    local amount = tonumber(input[1])
                    local price = 50000

                    TriggerServerEvent('give_item', item, amount, price)

                end,
            },

            {
                title = 'Lockpick',
                description = '5000 DKK',
                icon = 'lock',

                onSelect = function()

                    local input = lib.inputDialog('Black Market', {
                        {type = 'input', label = 'Antal', description = 'Antal du ønsker af den valgte genstand', required = true}
                    })

                    local item = 'lockpick'
                    local amount = tonumber(input[1])
                    local price = 50000

                    TriggerServerEvent('give_item', item, amount, price)

                end,
            },

        }

    })

    lib.showContext('open_black_market')

end)

RegisterNetEvent('hs-blackmarket:need_money')
AddEventHandler('hs-blackmarket:need_money', function() 

    TriggerEvent('ox_lib:notify', {type = 'error', description = 'Du har ikke råd!' })
    
end)

RegisterNetEvent('hs-blackmarket:need_space')
AddEventHandler('hs-blackmarket:need_space', function() 

    TriggerEvent('ox_lib:notify', {type = 'error', description = 'Du har ikke nok plads i dit inventory!' })
    
end)

