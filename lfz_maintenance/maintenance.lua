if Config.maintenance then 
    print("MAINTENANCE : ^2Activée^0")
    function AutorisationMaintenance(joueur)
        for _, pid in pairs(GetPlayerIdentifiers(joueur)) do
            if Config.autorisationMaintenance[string.lower(pid)] then
                return true
            end
        end
        return false
    end

    local function OnPlayerConnecting(name, setKickReason, deferrals)
        deferrals.defer()
        Wait(0)
    
        deferrals.update(string.format("Vérification des maintenances... ", name))
        Wait(1000)
    
        if AutorisationMaintenance(source) then
            deferrals.done()
        else
            deferrals.done("\n["..Config.serverName.."] Le serveur est en maintenance, consultez les informations sur notre discord. (" ..Config.discordLink..")")
        end
    
    end
    AddEventHandler("playerConnecting", OnPlayerConnecting)
end



