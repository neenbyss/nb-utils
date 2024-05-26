function addBlip(props)
    local blip = AddBlipForCoord(props.coords.x, props.coords.y, props.coords.z)
    SetBlipSprite(blip, props.sprite)
    SetBlipColour(blip, 1)
    SetBlipDisplay(blip, 4)
    SetBlipAlpha(blip, 250)
    SetBlipScale(blip, 0.8)
    SetBlipAsShortRange(blip, false)
    PulseBlip(blip)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(props.text)
    EndTextCommandSetBlipName(blip)

    if props.router then
        SetBlipRoute(blip, true)
    end

    return blip
end

function drawTxt(props)
    SetTextFont(props.font)
    SetTextProportional(0)
    SetTextScale(props.scale, props.scale)
    SetTextColour(props.color.r, props.color.g, props.color.b, props.color.a)
    SetTextDropShadow(0, 0, 0, 0, 255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextCentre(props.centre)
    SetTextEntry("STRING")
    AddTextComponentString(props.text)
    DrawText(props.coords.x, props.coords.y)
end

function drawMarker(props)
    DrawMarker(props.type,
        props.coords.x, props.coords.y, props.coords.z,
        0.0, 0.0, 0.0,
        0.0, 0.0, 0.0,
        props.size.x, props.size.y, props.size.z,
        props.color.r, props.color.g, props.color.b, props.color.a,
        false, false, false, props.rotate, false, false, false)
end

function getDistancePlayer(compare)
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    return #(coords - compare)
end

exports("getDistancePlayer", getDistancePlayer)
exports("drawMarker", drawMarker)
exports("drawTxt", drawTxt)
exports("addBlip", addBlip)
