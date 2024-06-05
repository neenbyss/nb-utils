function sendDiscordWebhook(config)
    -- Verificar si la URL es proporcionada
    if not config.url then
        print("Error: No se proporcionó una URL de webhook")
        return
    end

    -- Construir el payload JSON manualmente
    local payload = {
        content = config.msg or nil, -- Mensaje, nil si no se proporciona
        username = config.name or "Webhook Bot", -- Nombre del bot, por defecto "Webhook Bot"
        avatar_url = config.avatar or nil, -- URL del avatar, nil si no se proporciona
        embeds = config.embeds or nil -- Embeds, nil si no se proporciona
    }

    -- Convertir la tabla a una cadena JSON
    local payload_json = json.encode(payload)

    -- Realizar la solicitud HTTP POST usando el recurso nativo de FiveM
    PerformHttpRequest(config.url, function(err, text, headers)
        -- if err then
        --     print("Error al enviar el webhook: " .. tostring(err))
        -- end
    end, 'POST', payload_json, {['Content-Type'] = 'application/json'})
end

exports("sendDiscordWebhook", sendDiscordWebhook)