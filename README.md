# Documentación nb-utils

## Introducción

Este documento proporciona una descripción detallada de las funciones `exports` utilizadas en el script de FiveM. Estas funciones permiten agregar blips en el mapa, dibujar marcadores y texto en el juego, y medir distancias entre el jugador y un punto específico.

## Funciones

### 1. `exports['nb-utils']:addBlip`

#### Descripción
Añade un blip en el mapa.

#### Parámetros
- `sprite` (número): El ícono del blip.
- `text` (cadena): El texto que aparecerá al lado del blip.
- `coords` (vector4): Las coordenadas del blip, incluyendo la dirección.
- `router` (booleano): Indica si el blip debe mostrarse en el minimapa como una ruta.

#### Uso
```lua
exports['nb-utils']:addBlip({
    sprite = 1,
    text = "Hola",
    coords = vector4(752.18, 6461.51, 31.1, 96.96),
    router = false
})
```

### 2. `exports['nb-utils']:drawMarker`

#### Descripción
Dibuja un marcador en el juego.

#### Parámetros
- `type` (número): El tipo de marcador.
- `coords` (vector3): Las coordenadas del marcador.
- `size` (tabla): El tamaño del marcador en los ejes x, y, z.
- `color` (tabla): El color del marcador en formato RGBA.
- `rotate` (booleano): Indica si el marcador debe rotar.

#### Uso
```lua
exports['nb-utils']:drawMarker({
    type = 1,
    coords = vector3(1189.81, -3248.83, 5.03),
    size = {x = 1.0, y = 1.0, z = 1.0},
    color = { r = 255, g = 0, b = 0, a = 222 },
    rotate = true
})
```

### 3. `exports['nb-utils']:getDistancePlayer`

#### Descripción
Calcula la distancia entre el jugador y un punto específico.

#### Parámetros
- `coords` (vector3): Las coordenadas del punto al que se quiere medir la distancia.

#### Retorno
- (número): La distancia entre el jugador y el punto.

#### Uso
```lua
local distance = exports['nb-utils']:getDistancePlayer(vector3(1189.81, -3248.83, 5.03))
```

### 4. `exports['nb-utils']:drawTxt`

#### Descripción
Dibuja texto en la pantalla del juego.

#### Parámetros
- `text` (cadena): El texto que se mostrará.
- `font` (número): El tipo de fuente del texto.
- `center` (número): El alineamiento del texto.
- `coords` (tabla): Las coordenadas en la pantalla (x, y).
- `scale` (número): El tamaño del texto.
- `color` (tabla): El color del texto en formato RGBA.

#### Uso
```lua
exports['nb-utils']:drawTxt({
    text = "Hola esto es una prueba",
    font = 2,
    center = 3,
    coords = {x = 0.38, y = 0.40},
    scale = 0.5,
    color = { r = 255, g =255, b =255, a = 255 },
})
```

### 5. `exports['nb-utils']:bodyObject`

Adjuntar un objeto a la mano derecha del personaje del jugador.

```lua
exports['nb-utils']:bodyObject({
    model = "hw1_06_ldr_", 
    boneName = "hand_right",
    offset = {x = -2.5, y = -0.50, z = 0.0},
    rotation = {x = 0.0, y = 90.0, z = 0.0}
})
```

#### Ejemplo de Uso con `boneCustom`

Adjuntar un objeto a un índice de hueso personalizado.

```lua
exports['nb-utils']:bodyObject({
    model = "hw1_06_ldr_", 
    boneCustom = 28422,
    offset = {x = -2.5, y = -0.50, z = 0.0},
    rotation = {x = 0.0, y = 90.0, z = 0.0}
})
```

#### Parámetros de la Función

- **`model`** (string): El nombre del modelo del objeto a adjuntar. Debe ser el hash key del modelo.
- **`boneName`** (string, opcional): El nombre del hueso al que se adjuntará el objeto. Este nombre se mapea a un índice de hueso predefinido.
- **`boneCustom`** (number, opcional): El índice personalizado del hueso. Si se proporciona, se usará en lugar de `boneName`.
- **`offset`** (table): Desplazamiento del objeto desde el punto de anclaje. Debe contener las claves `x`, `y` y `z`.
- **`rotation`** (table): Rotación del objeto. Debe contener las claves `x`, `y` y `z`.

### 6. `exports['nb-utils']:createObject`

```
exports['nb-utils']:createObject({
        model = "hw1_06_ldr_",
        coords = vector4(623.18, -244, 42, 240.88)
    })
```

### 1. `exports['nb-utils']:sendDiscordWebhook`

#### Descripción
Envía un mensaje o un embed a un webhook de Discord.

#### Parámetros
- `config` (tabla): Tabla de configuración que contiene los detalles del webhook y el mensaje.

##### Campos de `config`
- `url` (cadena, requerido): La URL del webhook de Discord.
- `msg` (cadena, opcional): El contenido del mensaje a enviar.
- `name` (cadena, opcional): El nombre del bot que enviará el mensaje. Por defecto es "Webhook Bot".
- `avatar` (cadena, opcional): La URL del avatar del bot.
- `embeds` (tabla, opcional): Una tabla que contiene los embeds a enviar. Los campos típicos de un embed incluyen:
  - `title` (cadena, opcional): El título del embed.
  - `description` (cadena, opcional): La descripción del embed.
  - `color` (número, opcional): El color del embed en formato decimal.
  - `fields` (tabla, opcional): Una tabla de campos, donde cada campo es una tabla con los siguientes elementos:
    - `name` (cadena, requerido): El nombre del campo.
    - `value` (cadena, requerido): El valor del campo.
    - `inline` (booleano, opcional): Indica si el campo debe mostrarse en línea. Por defecto es `false`.
  - `footer` (tabla, opcional): Una tabla con los siguientes elementos:
    - `text` (cadena, requerido): El texto del pie de página.
    - `icon_url` (cadena, opcional): La URL del ícono del pie de página.
  - `timestamp` (cadena, opcional): La fecha y hora en formato ISO 8601.

#### Uso

Enviar un mensaje simple:
```lua
sendDiscordWebhook({
    url = "https://discord.com/api/webhooks/your_webhook_id/your_webhook_token",
    msg = "Este es un mensaje de prueba desde Lua en FiveM!",
    name = "Test Bot",
    avatar = "https://your-avatar-url.com/avatar.png"
})
```

Enviar un mensaje con un embed:
```lua
sendDiscordWebhook({
    url = "https://discord.com/api/webhooks/your_webhook_id/your_webhook_token",
    name = "Test Bot",
    avatar = "https://your-avatar-url.com/avatar.png",
    embeds = {{
        title = "Título del Embed",
        description = "Descripción del embed",
        color = 16711680, -- Color en formato decimal (hex: 0xFF0000)
        fields = {{
            name = "Campo 1",
            value = "Valor del campo 1",
            inline = true
        }, {
            name = "Campo 2",
            value = "Valor del campo 2",
            inline = true
        }},
        footer = {
            text = "Texto del pie de página",
            icon_url = "https://your-footer-icon-url.com/icon.png"
        },
        timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ") -- Fecha y hora en formato ISO 8601
    }}
})
```


### Ejemplo completo

```lua

CreateThread(function ()
    while true do
        Wait(0)
        -- Dibuja un marcador en el juego
        exports['nb-utils']:drawMarker({
            type = 1,
            coords = vector3(1189.81, -3248.83, 5.03),
            size = {x = 1.0, y = 1.0, z = 1.0},
            color = { r = 255, g = 0, b = 0, a = 222 },
            rotate = true
        })

        local ped = PlayerPedId()
        local distance = exports['nb-utils']:getDistancePlayer(vector3(1189.81, -3248.83, 5.03))
        
        if distance <= 1.5 then
            -- Dibuja texto en la pantalla
            exports['nb-utils']:drawTxt({
                text = "Hola esto es una prueba",
                font = 2,
                center = 3,
                coords = {x = 0.38, y = 0.40},
                scale = 0.5,
                color = { r = 255, g =255, b =255, a = 255 },
            })
            
            if IsControlJustReleased(ped, 38) then
                print('press')
                -- Notificación utilizando el framework (opcional)
                if QBCore and QBCore.Functions then
                    QBCore.Functions.Notify("presionastes", "primary", 500)
                end
            end
        end
    end
end)
```

Nota: El uso de `QBCore.Functions.Notify` es opcional y depende del framework que se esté utilizando. Si no se usa QBCore, esta línea puede ser removida o reemplazada por la función de notificación correspondiente a su framework.