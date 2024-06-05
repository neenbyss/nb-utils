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

function loadAnimationTime(props)
    local ped = PlayerPedId()
    if not HasAnimDictLoaded(props.diccionary) then
        RequestAnimDict(props.diccionary)
    end
    while not HasAnimDictLoaded(props.diccionary) do
        Wait(1)
    end
    TaskPlayAnim(ped, props.diccionary, props.animation, 8.0, 8.0, -1, props.active and 50 or 0, false, false, false)
    if not props.active and props.duration then
        Wait(props.duration)
        ClearPedTasks(ped)
    end
end

function bodyObject(props)
    local boneIndices = {
        hand_right = 28422,
        hand_left = 60309,
        head = 31086,
        neck = 39317,
        spine_root = 0,
        spine1 = 24816,
        spine2 = 24817,
        spine3 = 24818,
        upper_arm_right = 45509,
        upper_arm_left = 61163,
        forearm_right = 40269,
        forearm_left = 28252,
        thigh_right = 51826,
        thigh_left = 58271,
        calf_right = 36864,
        calf_left = 63931,
        foot_right = 52301,
        foot_left = 14201,
        toe_right = 20781,
        toe_left = 21054,
        pelvis = 11816,
        clavicle_right = 10706,
        clavicle_left = 64729,
        upper_leg_right = 43312,
        upper_leg_left = 6884,
        lower_leg_right = 63931,
        lower_leg_left = 6842
    }


    local playerPed = PlayerPedId()
    local pcoords = GetEntityCoords(playerPed)

    local boneIndex
    if props.boneCustom then
        boneIndex = props.boneCustom
    elseif props.boneName then
        boneIndex = boneIndices[props.boneName]
        if not boneIndex then
            print("Bone name not found: " .. props.boneName)
            return
        end
    else
        print("No bone specified")
        return
    end

    local fobject = CreateObject(GetHashKey(props.model), pcoords, true, true, true)

    AttachEntityToEntity(fobject, playerPed, GetPedBoneIndex(playerPed, boneIndex),
        props.offset.x, props.offset.y, props.offset.z,
        props.rotation.x, props.rotation.y, props.rotation.z,
        true, true, true, false, false, true)

    return fobject
end

function createObject(props)
    local object = CreateObjectNoOffset(GetHashKey(props.model), props.coords.x,
        props.coords.y, props.coords.z, false, false, false)
    SetEntityHeading(object, props.coords.w)

    return object
end

function DrawText3D(props)
    local onScreen, _x, _y = World3dToScreen2d(props.coords.x, props.coords.y, props.coords.z)
    local px, py, pz = table.unpack(GetGameplayCamCoords())
    
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(props.text)
    DrawText(_x, _y)
    local factor = (string.len(props.text)) / 370
    DrawRect(_x, _y + 0.0125, 0.015 + factor, 0.03, 0, 0, 0, 75)
end

exports("getDistancePlayer", getDistancePlayer)
exports("drawMarker", drawMarker)
exports("drawTxt", drawTxt)
exports("addBlip", addBlip)
exports("loadAnimationTime", loadAnimationTime)
exports("bodyObject", bodyObject)
exports("createObject", createObject)
exports("DrawText3D", DrawText3D)