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

### Ejemplo completo

```lua
CreateThread(function()
    -- Agrega un blip en el mapa
    exports['nb-utils']:addBlip({
        sprite = 1,
        text = "Hola",
        coords = vector4(752.18, 6461.51, 31.1, 96.96),
        router = false
    })
end)

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