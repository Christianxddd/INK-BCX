-- Interfaz de usuario de obsidiana de Carrega

repositorio local = "https://raw.githubusercontent.com/deividcomsono/Obsidian/main/"

Biblioteca local = loadstring(juego:HttpGet(repo .. "Library.lua"))()

ThemeManager local = loadstring(juego:HttpGet(repo .. "addons/ThemeManager.lua"))()

SaveManager local = loadstring(juego:HttpGet(repo .. "addons/SaveManager.lua"))()

-- Cria a janela principal

Ventana local = Biblioteca:CreateWindow({

Título = "CENTRO MEOWL",

Pie de página = "v7.40.39 [BETA HUB]",

Icono = 95816097006870,

NotifySide = "Derecha",

ShowCustomCursor = verdadero,

})

-- Director de Aba

local MainTab = Ventana:AddTab("Principal", "casa")

-- Função de teleporte

Jugadores locales = juego:GetService("Jugadores")

local LocalPlayer = Jugadores.LocalPlayer

Espacio de trabajo local = juego:GetService("Espacio de trabajo")

función local teleportToCFrame(cframe)

si LocalPlayer.Character y LocalPlayer.Character:FindFirstChild("HumanoidRootPart") entonces

Jugador local.Personaje.ParteRaízHumanoid.CFrame = cframe

fin

fin

-- Crianza de GroupBoxes 2x2

Cuadros de grupo locales = {}

nombres locales = {

"Juego automático", "Funciones aleatorias", "FUNCIONES F2P", "Luz roja, luz verde",

"Dalgona", "Luces apagadas / Juego especial", "Escondite", "Tira y afloja",

"Saltar la cuerda", "Puente de cristal", "Mingle", "Cena final",

"El juego del calamar", "El juego del calamar", "Rebel Features"

}

-- Alternando entre izquierda y derecha para diseño 2x2

para i, nombre en ipairs(nombres) hacer

si i % 2 == 1 entonces

GroupBoxes[nombre] = MainTab:AddLeftGroupbox(nombre)

demás

GroupBoxes[nombre] = MainTab:AddRightGroupbox(nombre)

fin

fin

-- ============================

-- Ejemplo de botones y conmutadores

-- ============================

-- Saltar la cuerda

Cuadros de grupo["JumpRope"]:AgregarBotón({

Texto = "TP Fin",

Información sobre herramientas = "Teletransportarse rápidamente a la ubicación final."

Func = función()

teletransportarseACFrame(CFrame.new(737.156372, 193.805084, 920.952515))

fin

})

Cuadros de grupo["JumpRope"]:AgregarBotón({

Texto = "TP Inicio",

Información sobre herramientas = "Teletransportarse instantáneamente de regreso al punto de inicio."

Func = función()

teletransportarseACFrame(CFrame.new(615.284424, 192.274277, 920.952515))

fin

})

-- Puente de cristal

GroupBoxes["Puente de cristal"]:AddButton({

Texto = "TP FIN",

Información sobre herramientas = "Teletransportarse instantáneamente a la ubicación FIN."

Func = función()

teletransportarseACFrame(CFrame.new(-211.855881, 517.039062, -1534.7373))

fin

})

  

  -- Escondite: Muerte automática

GroupBoxes["Escondite"]:AddToggle("AUTO KILL HIDE", {

    Texto = "AUTO KILL OCULTACIÓN",

    Devolución de llamada = función(Valor)

        AutoKillEnabled = Valor

        Si FollowConnection entonces

            SeguirConexión:Desconectar()

            FollowConnection = nulo

        fin

        Si AutoKillEnabled entonces

            si LocalPlayer.Character y LocalPlayer.Character:FindFirstChild("HumanoidRootPart") entonces

                HRP = JugadorLocal.Personaje.ParteRaízHumanoid

                objetivoJugador local = nulo

                para _, jugador en ipairs(Players:GetPlayers()) hacer

                    si jugador ~= LocalPlayer y jugador.Character y jugador.Character:FindFirstChild("BlueVest") entonces

                        targetPlayer = jugador

                        romper

                    fin

                fin

                Si targetPlayer y targetPlayer.Character entonces

                    objetivo localTorso = jugador_objetivo.Personaje:BuscarPrimerHijo("ParteRaízHumanoide")

                        o targetPlayer.Character:FindFirstChild("Torso superior")

                    Si targetTorso entonces

                        FollowConnection = RunService.RenderStepped:Connect(función()

                            Si AutoKillEnabled y targetPlayer.Character y targetTorso y HRP y HRP.Parent entonces

                                frontPos local = targetTorso.CFrame * CFrame.new(0,0,-5)

                                HRP.CFrame = posición frontal

                            fin

                        fin)

                    fin

                fin

            fin

        fin

    fin

})

-- Escondite: Puerta de salida de TP

GroupBoxes["Ocultar y buscar"]:AddButton({

Texto = "TP PUERTA DE SALIDA",

Información sobre herramientas = "Se teletransporta a la puerta de salida más cercana."

Func = función()

jugador local = LocalPlayer

si no es player.Character o no player.Character:FindFirstChild("HumanoidRootPart") entonces devuelve end

hrp local = jugador.Personaje.ParteRaízHumanoid

mapa local = Espacio de trabajo:WaitForChild("HideAndSeekMap")

Puertas nuevas locales = mapa:WaitForChild("PUERTAS NUEVAS FIJAS")

puerta más cercana local = nula

distancia más corta local = math.huge

para _, piso en ipairs(newDoors:GetChildren()) hacer

carpetaSalida local = piso:BuscarPrimerHijo("PUERTASSALIDA")

si exitFolder entonces

para _, puerta en ipairs(exitFolder:GetChildren()) hacer

si puerta:GetAttribute("ActuallyWorks") entonces

primario local = puerta.PrimaryPart o puerta:FindFirstChild("DoorRoot")

Si es primaria entonces

distancia local = (hrp.Posición - primaria.Posición).Magnitud

si distancia < distanciamáscorta entonces

distanciamáscorta = distancia

closerDoor = principal

fin

fin

fin

fin

fin

fin

Si es la puerta más cercana entonces

objetivo localCFrame = puertamáscercana.CFrame + puertamáscercana.CFrame.LookVector * 3

hrp.CFrame = CFrame.new(targetCFrame.Posición, puertamáscercana.Posición)

demás

warn("¡Nenhuma porta funcional encontrada!")

fin

fin

})

-- Teleporte PERBET (Desplegable)

GroupBoxes["Funciones aleatorias"]:AddDropdown("TeleportPerbetDropdown", {

  

    Texto = "TP PERBET",

    Valores = { "ninguno", "PERBET 1", "PERBET 2", "PERBET 3", "PERBET 4", "PERBET 5", "PERBET 6" },

    Valor = "ninguno",

    Devolución de llamada = función(opción)

        Posiciones locales = {

            ["ninguno"] = nulo,

            ["PERBET 1"] = "FREEPEABERT1",

            ["PERBET 2"] = "FREEPEABERT2",

            ["PERBET 3"] = "FREEPEABERT3",

            ["PERBET 4"] = "FREEPEABERT4",

            ["PERBET 5"] = "FREEPEABERT5",

            ["PERBET 6"] = "FREEPEABERT6",

        }

        objetivo localNombre = Posiciones[opción]

        si targetName entonces

            objeto local = espacio de trabajo:FindFirstChild(nombreDeObjetivo)

            cframe local = (obj y ((obj.PrimaryPart y obj.PrimaryPart.CFrame) o (obj:IsA("BasePart") y obj.CFrame))) o nulo

            Si cframe entonces

                Jugador local.Personaje.ParteRaízHumanoid.CFrame = cframe

                print("Teletransportado a: " .. opción)

            demás

                warn("❌ No encontré ningún objeto sin espacio de trabajo: " .. targetName)

            fin

        demás

            print("Nenhuma posição selecionada.")

        fin

    fin

})

-- SALTO AUTOMÁTICO

autoSkipEnabled local = falso

GroupBoxes["Funciones aleatorias"]:AddToggle("AutoSkipToggle", {

    Texto = "SALTO AUTOMÁTICO",

    Devolución de llamada = función(estado)

        autoSkipEnabled = estado

        Si el estado entonces

            spawn(función()

                mientras que autoSkipEnabled lo hace

                    argumentos locales = {"Omitido"}

                    pcall(función()

                        juego:GetService("Almacenamiento replicado"):WaitForChild("Controles remotos"):WaitForChild("Control remoto de diálogo"):FireServer(descomprimir(args))

                    fin)

                    esperar(0.5)

                fin

            fin)

        fin

    fin

})

-- TIRO AUTOMÁTICO

AutoPullEnabled local = falso

función local AutoPull()

    Remoto local = juego:GetService("Almacenamiento replicado"):WaitForChild("Remotos"):WaitForChild("Enlazable temporal alcanzado")

    Remoto:FireServer({{ IHateYou = true }})

fin

juego:GetService("RunService").Heartbeat:Connect(función()

    si AutoPullEnabled entonces AutoPull() finaliza

fin)

GroupBoxes["Tira y afloja"]:AddToggle("AutoPullToggle", {

    Texto = "EXTRACCIÓN AUTOMÁTICA",

    Devolución de llamada = función(estado) AutoPullEnabled = estado fin

})

-- Paso fantasma

Potencia original local = Jugador local: Obtener atributo("_Potencia equipada")

GroupBoxes["FUNCIONES F2P"]:AddToggle("PhantomStepToggle", {

    Texto = "Paso fantasma",

    Devolución de llamada = función(estado)

        Si el estado entonces

            Jugador local: Establecer atributo("_Potencia equipada", "PASO FANTASMA")

            print("Phantom Step On")

        demás

            Jugador local: Establecer atributo("_EquippedPower", potencia original)

            print("Paso fantasma fuera")

        fin

    fin

})

-- Estrellarse

función local toggleFasterSprint(estado)

    local boostsFolder = LocalPlayer:FindFirstChild("Boosts")

    Si no es boostsFolder, devuelve warn("Boosts no encontrados") fin

    local sprintBoost = boostsFolder:FindFirstChild("Sprint más rápido")

    si no es sprintBoost o no es sprintBoost:IsA("NumberValue") entonces devuelve warn("Sprint más rápido no encontrado") fin

    sprintBoost.Value = estado y 5 o 0

    print("Sprint más rápido " .. (estado y "Activado" o "Desactivado"))

fin

GroupBoxes["CARACTERÍSTICAS F2P"]:AddToggle("DashToggle", {

    Texto = "Guión",

    Devolución de llamada = función(estado) alternarFasterSprint(estado) fin

})

-- Artista de parkour

GroupBoxes["CARACTERÍSTICAS F2P"]:AddToggle("ParkourArtistToggle", {

    Texto = "Artista de Parkour",

    Devolución de llamada = función(estado)

        Si el estado entonces

            LocalPlayer:SetAttribute("_EquippedPower", "ARTISTA DE PARKOUR")

            imprimir("Artista de parkour en marcha")

        demás

            Jugador local: Establecer atributo("_EquippedPower", potencia original)

            print("Artista de parkour fuera")

        fin

    fin

})

-- Plataformas de vidrio

showGlassPlatforms local = falso

Plataformas de vidrio locales = {}

función local isFakeGlass(parte) devuelve parte:GetAttribute("GlassPart") y parte:GetAttribute("ActuallyKilling") ~= nil fin

función local createPlatforms()

    para _, plataforma en ipairs(glassPlatforms) hacer si plataforma y plataforma.Padre entonces plataforma:Destroy() fin fin

    Plataformas de vidrio = {}

    para _, parte en ipairs(workspace:GetDescendants()) hacer

        si parte:IsA("BasePart") y isFakeGlass(parte) entonces

            plataforma local = Instancia.new("Parte")

            plataforma.Tamaño = Vector3.nuevo(10,0.5,10)

            plataforma.CFrame = parte.CFrame * CFrame.new(0,2,0)

            plataforma.Anclado = verdadero

            plataforma.CanCollide = verdadero

            plataforma.Transparencia = 0.3

            plataforma.Material = Enum.Material.Neon

            plataforma.Color = Color3.fromRGB(255,0,0)

            plataforma.Padre = espacio de trabajo

            tabla.insertar(vidrioPlataformas, plataforma)

        fin

    fin

fin

función local removePlatforms()

    para _, plataforma en ipairs(glassPlatforms) hacer si plataforma y plataforma.Padre entonces plataforma:Destroy() fin fin

    Plataformas de vidrio = {}

fin

GroupBoxes["Puente de cristal"]:AddToggle("GlassPlatformsToggle", {

    Texto = "Plataformas de cristal",

    Devolución de llamada = función(estado)

        showGlassPlatforms = estado

        Si el estado entonces

            tarea.spawn(función()

                mientras showGlassPlatforms lo hace

                    crearPlataformas()

                    tarea.esperar(1)

                fin

            fin)

        demás

            eliminarPlataformas()

        fin

    fin

})

-- Serviços necessários

Jugadores locales = juego:GetService("Jugadores")

local LocalPlayer = Jugadores.LocalPlayer

RunService local = juego:GetService("RunService")

Espacio de trabajo local = juego:GetService("Espacio de trabajo")

-- Variáveis ​​globais

showGlassESP local = falso

Partes de caja locales = {}

BoxEnabled local = falso

-- Função para teleporte

función local teleportTo(cframe)

    personaje local = LocalPlayer.Character o LocalPlayer.CharacterAdded:Wait()

    hrp local = personaje:WaitForChild("HumanoidRootPart")

    hrp.CFrame = cframe + Vector3.new(0, 10, 0)

fin

-- ===============================

-- 🟩 PUENTE DE CRISTAL

-- ===============================

GroupBoxes["Puente de cristal"]:AddToggle("GlassVision", {

    Texto = "Visión de cristal",

    Predeterminado = falso,

    Información sobre herramientas = "Mostrar vidrio falso y vidrio real."

    Devolución de llamada = función(Valor)

        showGlassESP = Valor

        función local isRealGlass(parte)

            si parte:GetAttribute("GlassPart") entonces

                si parte:GetAttribute("ActuallyKilling") ~= nil entonces

                    devuelve falso -- falso

                fin

                devuelve verdadero -- real

            fin

            devolver falso

        fin

        función local updateGlassColors()

            para _, parte en ipairs(workspace:GetDescendants()) hacer

                si parte:IsA("BasePart") y parte:GetAttribute("GlassPart") entonces

                    si showGlassESP entonces

                        si isRealGlass(parte) entonces

                            parte.Color = Color3.fromRGB(0, 255, 0) -- verde real

                        demás

                            part.Color = Color3.fromRGB(255, 0, 0) -- vermelho falso

                        fin

                        parte.Material = Enumeración.Material.Neón

                        parte:SetAttribute("Explotar es malo", verdadero)

                    demás

                        parte.Color = Color3.fromRGB(163, 162, 165)

                        parte.Material = Enumeración.Material.Vidrio

                        parte:SetAttribute("Explotar es malo", nulo)

                    fin

                fin

            fin

        fin

        Si Valor entonces

            tarea.spawn(función()

                mientras showGlassESP lo hace

                    actualizarColoresDeVidrio()

                    tarea.esperar(0.5)

                fin

            fin)

        demás

            actualizarColoresDeVidrio()

        fin

    fin

})

-- ===============================

-- 🟦 CARACTERÍSTICAS ALEATORIAS

-- ===============================

-- Vendaje TP

GroupBoxes["Funciones aleatorias"]:AddButton({

    Texto = "Vendaje TP",

    Descripción emergente = "TP VENDA y elige él.",

    Func = función()

        función local getClosestBandage()

            personaje local = LocalPlayer.Character

            si no es un carácter o no es un carácter:FindFirstChild("HumanoidRootPart") entonces devuelve nil fin

            hrp local = personaje.HumanoidRootPart

            local más cercano, minDistance = nulo, math.huge

            para _, vendaje en ipairs(Workspace.Effects:GetChildren()) hacer

                si vendaje.Nombre == "DroppedBandage" y vendaje:IsA("Modelo") entonces

                    primaria local = vendaje.PartePrimaria o vendaje:BuscarPrimerHijoQueEsA("ParteBase")

                    Si es primaria entonces

                        distancia local = (hrp.Posición - primaria.Posición).Magnitud

                        si distancia < minDistancia entonces

                            minDistancia = distancia

                            más cercano = vendaje

                        fin

                    fin

                fin

            fin

            volver más cercano

        fin

        personaje local = LocalPlayer.Character

        si no es un carácter o no es un carácter:FindFirstChild("HumanoidRootPart") entonces devuelve fin

        hrp local = personaje.HumanoidRootPart

        Posición original local = hrp.CFrame

        vendaje local = obtenerVendajeMásCercano()

        Si vendaje entonces

            primaria local = vendaje.PartePrimaria o vendaje:BuscarPrimerHijoQueEsA("ParteBase")

            Si es primaria entonces

                hrp.CFrame = primario.CFrame + Vector3.new(0, 3, 0)

                tarea.esperar(0.5)

                hrp.CFrame = posiciónoriginal

            fin

        demás

            warn("¡No se encontró DroppedBandage!")

        fin

    fin

})

-- Velocidad de giro de entrada

GroupBoxes["Funciones aleatorias"]:AddInput("SwingSpeedInput", {

    Texto = "Velocidad",

    Valor predeterminado = "10",

    Información sobre herramientas = "Velocidad omitida sin parchear. ",

    Marcador de posición = "Ingrese la velocidad (0-50)...",

    Devolución de llamada = función(entrada)

        valor local = tonumber(entrada)

        Si no es valor entonces

            warn("Entrada inválida, ingrese un número!")

            devolver

        fin

        si valor < 0 entonces

            valor = 0

        de lo contrario, si el valor es > 50 entonces

            valor = 50

        fin

        carpetaLiveFolder local = espacio de trabajo:WaitForChild("Live")

        modeloDeJugadorLocal = CarpetaEnVivo:EsperaRico(JugadorLocal.Nombre)

        Velocidad de swing local = ModeloJugador:BuscarPrimerHijo("Velocidad de Swing")

        si swingSpeed ​​y swingSpeed:IsA("NumberValue") entonces

            swingSpeed.Value = valor

            print("Velocidad de giro establecida en:", valor)

        demás

            warn("¡SwingSpeed ​​no encontrado o no válido para este jugador!")

        fin

    fin

})

-- ===============================

-- 🟥 LUZ ROJA, LUZ VERDE

-- ===============================

GroupBoxes["Luz roja, luz verde"]:AddButton({

    Texto = "TP INICIO",

    Información sobre herramientas = "TP INICIO de rlgl.",

    Func = función()

        teletransportarseA(CFrame.new(-49.8884354, 1020.104, -512.157776))

    fin

})

GroupBoxes["Luz roja, luz verde"]:AddButton({

    Texto = "TP LUGAR SEGURO",

    Información sobre herramientas = "TP LUGAR SEGURO en rlgl.",

    Func = función()

        teletransportarseA(CFrame.new(197.452408, 51.3870239, -95.6055298))

    fin

})

-- ===============================

-- 💡 LUCES APAGADAS / JUEGO ESPECIAL

-- ===============================

GroupBoxes["Luces apagadas / Juego especial"]:AddButton({

    Texto = "TP LUGAR SEGURO",

    Información sobre herramientas = "TP A un lugar seguro.",

    Func = función()

        teletransportarseA(CFrame.new(195.255814, 112.202904, -85.3726807))

    fin

})

-- ===============================

-- 🟧 MEZCLARSE

-- ===============================

Cuadros de grupo["Mezclar"]:AgregarBotón({

    Texto = "Sacar a la persona",

    Información sobre herramientas = "Sacar a una persona."

    Func = función()

        teletransportarseA(CFrame.new(1210.03967, 414.071106, -574.103088))

    fin

})

-- ===============================

-- 🦑 EL JUEGO DEL CALAMAR

-- ===============================

GroupBoxes["El juego del calamar"]:AddToggle("DontExitSquid", {

    Texto = "NO SALGAS DEL CALAMAR",

    Predeterminado = falso,

    Devolución de llamada = función(Valor)

        BoxEnabled = Valor

        para _, parte en ipairs(BoxParts) hacer

            parte:Destruir()

        fin

        Partes de la caja = {}

        Si Valor entonces

            char local = LocalPlayer.Character o LocalPlayer.CharacterAdded:Wait()

            hrp local = char:WaitForChild("ParteRaízHumanoid")

            tamaño local = Vector3.new(50, 50, 50)

            espesor local = 3

            función local createWall(pos, tamaño)

                parte local = Instancia.new("Parte")

                parte.Tamaño = tamaño

                parte.Anclado = verdadero

                parte.CanCollide = verdadero

                parte.Transparencia = 0.5

                parte.Material = Enumeración.Material.CampoDeFuerza

                parte.Color = Color3.fromRGB(255, 0, 0)

                parte.CFrame = hrp.CFrame:ToWorldSpace(CFrame.new(pos))

                part.Parent = Espacio de trabajo

                tabla.insertar(BoxParts, parte)

            fin

            createWall(Vector3.new(25, 0, 0), Vector3.new(grosor, tamaño.Y, tamaño.Z))

            createWall(Vector3.new(-25, 0, 0), Vector3.new(grosor, tamaño.Y, tamaño.Z))

            createWall(Vector3.new(0, 0, 25), Vector3.new(tamaño.X, tamaño.Y, grosor))

            createWall(Vector3.new(0, 0, -25), Vector3.new(tamaño.X, tamaño.Y, grosor))

            createWall(Vector3.new(0, 25, 0), Vector3.new(tamaño.X, grosor, tamaño.Z))

            createWall(Vector3.new(0, -25, 0), Vector3.new(tamaño.X, grosor, tamaño.Z))

        fin

    fin

})

-- Servicios

Jugadores locales = juego:GetService("Jugadores")

local LocalPlayer = Jugadores.LocalPlayer

RunService local = juego:GetService("RunService")

Espacio de trabajo local = juego:GetService("Espacio de trabajo")

-- Variáveis ​​de controle

AutoKillAllEnabled local = falso

Conexión local FollowAll

Luces activas locales = {}

-- ===============================

-- 🟨 PESTAÑA LIGERA: MATAR JUGADORES AUTOMÁTICAMENTE

-- ===============================

GroupBoxes["Luces apagadas / Juego especial"]:AddToggle("AutoKillAll", {

    Texto = "MATAR JUGADORES AUTOMÁTICAMENTE",

    Descripción emergente = "Eliminar automáticamente a jugadores aleatorios."

    Predeterminado = falso,

    Devolución de llamada = función(Valor)

        AutoKillAllEnabled = Valor

        Si FollowAllConnection entonces

            SeguirTodasConexión:Desconectar()

            FollowAllConnection = nulo

        fin

        Si AutoKillAllEnabled entonces

            personaje local = LocalPlayer.Character

            si carácter y carácter:FindFirstChild("HumanoidRootPart") entonces

                HRP local = personaje.HumanoidRootPart

                FollowAllConnection = RunService.RenderStepped:Connect(función()

                    Si no es AutoKillAllEnabled o no es HRP o no es HRP.Parent, entonces devuelve el final

                    Jugador local más cercano, distancia más corta = nula, matemática.enorme

                    para _, jugador en ipairs(Players:GetPlayers()) hacer

                        si jugador ~= LocalPlayer y jugador.Character y jugador.Character:FindFirstChild("Humanoid") y jugador.Character.Humanoid.Health > 0 entonces

                            torso local = jugador.Personaje:BuscarPrimerHijo("ParteRaízHumanoid")

                            Si torso entonces

                                distancia local = (HRP.Posición - torso.Posición).Magnitud

                                si distancia < distanciamáscorta entonces

                                    distanciamáscorta = distancia

                                    jugadormás cercano = jugador

                                fin

                            fin

                        fin

                    fin

                    Si closerPlayer y closerPlayer.Character entonces

                        objetivo localTorso = jugadormáscercano.Carácter:BuscarPrimerHijo("ParteRaízHumanoide")

                            o closerPlayer.Character:FindFirstChild("UpperTorso")

                            o closerPlayer.Character:FindFirstChild("Torso")

                        Si targetTorso entonces

                            HRP.CFrame = targetTorso.CFrame * CFrame.new(0, 0, -5)

                        fin

                    fin

                fin)

            fin

        fin

    fin

})

-- ===============================

-- 🟦 PESTAÑA DE ESCONDIDAS: ESP EXITDOOR

-- ===============================

función local createHighlight(puerta)

    si ActiveHighlights[puerta] entonces devuelve fin

    resaltado local = Instancia.new("Resaltar")

    resaltar.Adornee = puerta

    resaltar.FillColor = Color3.fromRGB(255, 255, 0)

    resaltar.OutlineColor = Color3.fromRGB(255, 255, 0)

    resaltar.FillTransparency = 0.3

    resaltar.Padre = puerta

    ActiveHighlights[puerta] = resaltar

fin

función local enableESP()

    Mapa local = Espacio de trabajo:FindFirstChild("HideAndSeekMap")

    si no es Mapa, regrese warn("⚠️ HideAndSeekMap não encontrado!") end

    CarpetaPuertaslocal = Mapa:BuscarPrimerHijo("NUEVASPUERTASFIJAS")

    si no es DoorsFolder, devuelve warn("⚠️ NEWFIXEDDOORS não encontrado!") fin

    para _, piso en ipairs(DoorsFolder:GetChildren()) hacer

        puertas de salida locales = piso:BuscarPrimerHijo("PUERTAS DE SALIDA")

        Si hay puertas de salida entonces

            para _, puerta en ipairs(exitDoors:GetChildren()) hacer

                si puerta:IsA("Modelo") y puerta:GetAttribute("ActuallyWorks") entonces

                    createHighlight(puerta)

                fin

            fin

        fin

    fin

fin

función local deshabilitarESP()

    Para la puerta, resaltar en pares (ActiveHighlights)

        Si resalta y resalta.Padre entonces

            resaltar:Destruir()

        fin

        ActiveHighlights[puerta] = nulo

    fin

fin

GroupBoxes["Esconderse y buscar"]:AddToggle("ESPExitDoor", {

    Texto = "ESP SALIDA",

    Predeterminado = falso,

    Devolución de llamada = función(Valor)

        Si Valor entonces

            habilitarESP()

        demás

            deshabilitarESP()

        fin

    fin

})

-- Script de interfaz de usuario de OBSIDIAN

-- Grupo de cuadros de puente de vidrio

GroupBoxes["Esconder y buscar"]:AddToggle("TECLA TP", {

    Texto = "TECLA TP",

    Devolución de llamada = función(Valor)

        Jugadores locales = juego:GetService("Jugadores")

        Espacio de trabajo local = juego:GetService("Espacio de trabajo")

        local LocalPlayer = Jugadores.LocalPlayer

        Efectos locales = Espacio de trabajo:WaitForChild("Efectos")

        Teletransportación local = Valor

        función local getModelCFrame(modelo)

            si modelo.PrimaryPart entonces

                devolver modelo.PrimaryPart.CFrame

            fin

            para _, parte en ipairs(modelo:GetDescendants()) hacer

                si parte:IsA("BasePart") entonces

                    devolver parte.CFrame

                fin

            fin

            devolver cero

        fin

        función local teleportKeys()

            mientras te teletransportas

                tarea.esperar(0.5)

                char local = LocalPlayer.Character

                si no es char o no es char:FindFirstChild("HumanoidRootPart") entonces continúa fin

                hrp local = char.HumanoidRootPart

                CFrame original local = hrp.CFrame

                para _, obj en ipairs(Efectos:GetChildren()) hacer

                    si obj:IsA("Modelo") y (obj.Nombre == "DroppedKeyCircle" o obj.Nombre == "DroppedKeySquare" o obj.Nombre == "DroppedKeyTriangle") entonces

                        keyCFrame local = obtenerModelCFrame(obj)

                        Si keyCFrame entonces

                            hrp.CFrame = keyCFrame + Vector3.new(0,3,0)

                            tarea.esperar(0.25)

                            hrp.CFrame = CFrame original

                            tarea.esperar(0.15)

                        fin

                    fin

                fin

            fin

        fin

        Si se teletransporta entonces

            tarea.spawn(llavesdeteletransporte)

        fin

    fin

})

-- Cuadro de grupo de luz roja

GroupBoxes["Funciones aleatorias"]:AddToggle("AutoDodge", {

    Texto = "AUTO DODGE",

    Devolución de llamada = función(Valor)

        Jugadores locales = juego:GetService("Jugadores")

        local LocalPlayer = Jugadores.LocalPlayer

        Espacio de trabajo local = juego:GetService("Espacio de trabajo")

        AutoDodge local = Valor

        Parte raíz humanoide local

        humanoide local

        DODGE_RANGE local = 4

        ALTURA DE TELEPORTE local = 75

        AMENAZAS locales = { "BOTELLA", "CUCHILLO", "TENEDOR" }

        función local hasDodgeItem()

            mochila local = LocalPlayer:FindFirstChild("Mochila")

            si mochila y mochila:FindFirstChild("¡ESQUIVA!") entonces

                devolver mochila:FindFirstChild("¡ESQUIVA!")

            fin

            personaje local = LocalPlayer.Character

            si carácter y carácter:FindFirstChild("¡ESQUIVA!") entonces

                carácter de retorno:FindFirstChild("¡ESQUIVA!")

            fin

            devolver cero

        fin

        función local useDodgeItem()

            Herramienta de esquivar local = hasDodgeItem()

            si dodgeTool y dodgeTool:FindFirstChild("RemoteEvent") entonces

                pcall(función()

                    dodgeTool.RemoteEvent:FireServer()

                fin)

                devuelve verdadero

            fin

            devolver falso

        fin

        función local teleportUp()

            Si humanoidRootPart entonces

                ParteRaízhumanoide.CFrame = ParteRaízhumanoide.CFrame + Vector3.new(0, ALTURA_TELEPORTE, 0)

            fin

        fin

        función local detectThreats()

            para _, jugador en ipairs(Players:GetPlayers()) hacer

                si jugador ~= LocalPlayer y jugador.Character entonces

                    char local = jugador.Personaje

                    hrp local = char:FindFirstChild("ParteRaízHumanoid")

                    si hrp y (hrp.Position - humanoidRootPart.Position).Magnitude <= DODGE_RANGE entonces

                        para _, herramienta en ipairs(char:GetChildren()) hacer

                            si herramienta:IsA("Herramienta") y tabla.find(AMENAZAS, herramienta.Nombre:upper()) entonces

                                devuelve verdadero

                            fin

                        fin

                    fin

                fin

            fin

            devolver falso

        fin

        función local startAutoDodge()

            tarea.spawn(función()

                mientras que AutoDodge lo hace

                    tarea.esperar(0.15)

                    char local = LocalPlayer.Character

                    HumanoidRootPart = char y char:FindFirstChild("HumanoidRootPart")

                    humanoide = char y char:FindFirstChildOfClass("Humanoide")

                    si no es humanoidRootPart o no es humanoid o humanoid.Health <= 0 entonces continúa fin

                    si detectaAmenazas() entonces

                        Si no se usaDodgeItem() entonces

                            teletransportarse()

                        fin

                    fin

                fin

            fin)

        fin

        Si AutoDodge entonces

            iniciarAutoDodge()

        fin

    fin

})



-- Grupo de luz roja: Teletransporte final

GroupBoxes["Luz roja, luz verde"]:AddButton({

    Texto = "TP FIN",

    Func = función()

        Jugadores locales = juego:GetService("Jugadores")

        local LocalPlayer = Jugadores.LocalPlayer

        Personaje local = LocalPlayer.Character

        si Personaje y Personaje:FindFirstChild("HumanoidRootPart") entonces

            objetivo localCFrame = CFrame.new(-41.7126923, 1021.32306, 134.34935, 0.811150551, 0.237830803, 0.534295142, -8.95559788e-06, 0.913583994, -0.406650066, -0.584837377, 0.32984966, 0.741056323) + Vector3.new(0, 10, 0)

            Personaje.HumanoidRootPart.CFrame = targetCFrame

        fin

    fin

})

-- Grupo de escondite: ESP EXITDOOR

GroupBoxes["Esconderse y buscar"]:AddToggle("ESPExitDoor", {

    Texto = "ESP SALIDA",

    Devolución de llamada = función(Valor)

        Espacio de trabajo local = juego:GetService("Espacio de trabajo")

        Luces activas locales = {}

        función local createHighlight(puerta)

            si ActiveHighlights[puerta] entonces devuelve fin

            resaltado local = Instancia.new("Resaltar")

            resaltar.Adornee = puerta

            resaltar.FillColor = Color3.fromRGB(255,255,0)

            resaltar.OutlineColor = Color3.fromRGB(255,255,0)

            resaltar.FillTransparency = 0.3

            resaltar.Padre = puerta

            ActiveHighlights[puerta] = resaltar

        fin

        función local enableESP()

            Mapa local = Espacio de trabajo:FindFirstChild("HideAndSeekMap")

            si no es Mapa, regrese warn("⚠️ HideAndSeekMap não encontrado!") end

            CarpetaPuertaslocal = Mapa:BuscarPrimerHijo("NUEVASPUERTASFIJAS")

            si no es DoorsFolder, devuelve warn("⚠️ NEWFIXEDDOORS não encontrado!") fin

            para _, piso en ipairs(DoorsFolder:GetChildren()) hacer

                puertas de salida locales = piso:BuscarPrimerHijo("PUERTAS DE SALIDA")

                Si hay puertas de salida entonces

                    para _, puerta en ipairs(exitDoors:GetChildren()) hacer

                        si puerta:IsA("Modelo") y puerta:GetAttribute("ActuallyWorks") entonces

                            createHighlight(puerta)

                        fin

                    fin

                fin

            fin

        fin

        función local deshabilitarESP()

            Para la puerta, resaltar en pares (ActiveHighlights)

                si resalta y resalta.Padre entonces resalta:Destruir() fin

                ActiveHighlights[puerta] = nulo

            fin

        fin

        Si Valor entonces

            habilitarESP()

        demás

            deshabilitarESP()

        fin

    fin

})

--========================

-- UI DE OBSIDIANA - VERSIÓN GROUPBOX

--========================

-- CARACTERÍSTICAS ALEATORIAS

GroupBoxes["Funciones aleatorias"]:AddToggle("InfJump", {

    Texto = "Inf Jump",

    Devolución de llamada = función(estado)

        ServicioDeEntradaDeUsuario local = juego:ObtenerServicio("ServicioDeEntradaDeUsuario")

        jugador local = juego.Jugadores.JugadorLocal

        InfiniteJumpEnabled local = estado

        UserInputService.JumpRequest:Conectar(función()

            Si InfiniteJumpEnabled entonces

                humanoide local = jugador.Personaje y jugador.Personaje:FindFirstChildOfClass("Humanoide")

                Si humanoide y humanoide.Padre entonces

                    humanoide:ChangeState(Enum.HumanoidStateType.Jumping)

                fin

            fin

        fin)

    fin

})

GroupBoxes["Funciones aleatorias"]:AddToggle("InstaInteract", {

    Texto = "Interacción instantánea",

    Devolución de llamada = función(estado)

        local InstaInteractEnabled = estado

        Jugadores locales = juego:GetService("Jugadores")

        local LocalPlayer = Jugadores.LocalPlayer

        Personaje local = LocalPlayer.Character o LocalPlayer.CharacterAdded:Wait()

        ParteRaízHumanoide local = Personaje:EsperarNiño("ParteRaízHumanoide")

        LocalPlayer.CharacterAdded:Connect(función(carácter)

            Carácter = char

            PiezaRaízHumanoide = char:WaitForChild("PiezaRaízHumanoide")

        fin)

        función local tornarPromptInstantaneo(prompt)

            si prompt:IsA("ProximityPrompt") entonces

                mensaje: GetPropertyChangedSignal("HoldDuration"):Connect(función()

                    Si InstaInteractEnabled entonces

                        prompt.HoldDuration = 0

                    fin

                fin)

                Si InstaInteractEnabled entonces

                    prompt.HoldDuration = 0

                fin

            fin

        fin

        para _, obj en pares(workspace:GetDescendants()) hacer

            si obj:IsA("ProximityPrompt") entonces

                tornarPromptInstantáneo(obj)

            fin

        fin

        espacio de trabajo.DescendantAdded:Connect(función(obj)

            si obj:IsA("ProximityPrompt") entonces

                tornarPromptInstantáneo(obj)

            fin

        fin)

        tarea.spawn(función()

            mientras tarea.wait(0.1) hacer

                Si InstaInteractEnabled entonces

                    para _, solicitar en pares(workspace:GetDescendants()) hacer

                        si prompt:IsA("ProximityPrompt") y prompt.HoldDuration ~= 0 entonces

                            prompt.HoldDuration = 0

                        fin

                    fin

                fin

            fin

        fin)

    fin

})

GroupBoxes["Funciones aleatorias"]:AddToggle("Noclip", {

    Texto = "Sin clip",

    Devolución de llamada = función(estado)

        Jugadores locales = juego:GetService("Jugadores")

        RunService local = juego:GetService("RunService")

        local LocalPlayer = Jugadores.LocalPlayer

        -- Desconecta caso já exista

        si getgenv().NoclipConnection entonces

            getgenv().NoclipConnection:Desconectar()

            getgenv().NoclipConnection = nulo

            getgenv().NoclipEnabled = falso

        fin

        Si el estado entonces

            getgenv().NoclipEnabled = verdadero

            getgenv().NoclipConnection = RunService.Heartbeat:Connect(función()

                si LocalPlayer.Character y LocalPlayer.Character:FindFirstChild("HumanoidRootPart") entonces

                    hrp local = JugadorLocal.Personaje.ParteRaízHumanoid

                    para _, parte en pares(LocalPlayer.Character:GetDescendants()) hacer

                        si parte:IsA("BasePart") entonces

                            -- Calcula la distancia entre cada parte de HumanoidRootPart

                            distancia local = (parte.Posición - hrp.Posición).Magnitud

                            si la distancia <= 100 entonces

                                parte.CanCollide = falso

                            demás

                                parte.CanCollide = verdadero

                            fin

                        fin

                    fin

                fin

            fin)

            -- Actualiza a cada 2 segundos

            spawn(función()

                mientras getgenv().NoclipEnabled hacer

                    esperar(2)

                    si LocalPlayer.Character y LocalPlayer.Character:FindFirstChild("HumanoidRootPart") entonces

                        hrp local = JugadorLocal.Personaje.ParteRaízHumanoid

                        para _, parte en pares(LocalPlayer.Character:GetDescendants()) hacer

                            si parte:IsA("BasePart") entonces

                                distancia local = (parte.Posición - hrp.Posición).Magnitud

                                si la distancia <= 100 entonces

                                    parte.CanCollide = falso

                                demás

                                    parte.CanCollide = verdadero

                                fin

                            fin

                        fin

                    fin

                fin

            fin)

        fin

    fin

})

GroupBoxes["Juego del Calamar Celestial"]:AddToggle("Plataforma Segura", {

    Texto = "Plataforma segura",

    Devolución de llamada = función(estado)

        local LocalPlayer = juego:GetService("Jugadores").LocalPlayer

        Si el estado entonces

            si no es espacio de trabajo:FindFirstChild("SafePlatform") entonces

                Personaje local = LocalPlayer.Character o LocalPlayer.CharacterAdded:Wait()

                HRP local = Personaje:WaitForChild("HumanoidRootPart")

                Plataforma segura local = Instancia.new("Parte")

                SafePlatform.Name = "SafePlatform"

                SafePlatform.Size = Vector3.new(1000, 1, 1000)

                SafePlatform.Anchored = verdadero

                SafePlatform.CanCollide = verdadero

                SafePlatform.Transparencia = 0.5

                SafePlatform.Material = Enumeración.Material.Neon

                SafePlatform.Color = Color3.fromRGB(0, 255, 0)

                SafePlatform.Position = HRP.Position - Vector3.new(0, 6, 0)

                SafePlatform.Parent = espacio de trabajo

            fin

        demás

            local existente = espacio de trabajo:FindFirstChild("SafePlatform")

            Si existe entonces

                existente:Destruir()

            fin

        fin

    fin

})

GroupBoxes["Escondite"]:AddToggle("Asesinato de Spike", {

    Texto = "Spike Kill",

    Devolución de llamada = función(estado)

        _G.AutoKnifeTeleport = estado

        tarea.spawn(función()

            mientras _G.AutoKnifeTeleport y task.wait(0.1) hacen

                Personaje local = juego.Jugadores.JugadorLocal.Personaje

                Si no es Personaje entonces continua final

                Humanoide local = Personaje:FindFirstChild("Humanoide")

                raíz local = Personaje:BuscarPrimerHijo("ParteRaízHumanoid")

                Si no es humanoide o no es root, entonces continúa y finaliza.

                para _, pista en ipairs(Humanoid:GetPlayingAnimationTracks()) hacer

                    si pista.Name == "KnifeSwingBackStabChar" entonces

                        CFrame original local = raíz.CFrame

                        raíz.CFrame = CFrame.new(101.50161, 972.146851, -6.17441177)

                        tarea.esperar(2)

                        si no es _G.AutoKnifeTeleport entonces rompe el final

                        raíz.CFrame = originalCFrame

                    fin

                fin

            fin

        fin)

    fin

})

--========================

-- CARACTERÍSTICAS DE LA CUERDA PARA SALTAR (VERSIÓN EN INGLÉS)

--========================

-- [1] QUITAR CUERDA - botón simple

GroupBoxes["JumpRope"]:AddButton("QuitarRope", {

    Texto = "QUITAR CUERDA",

    Información sobre herramientas = "Elimina la cuerda del espacio de trabajo (solo local)."

    func = función()

        cuerda local = espacio de trabajo:FindFirstChild("Efectos") y espacio de trabajo.Efectos:FindFirstChild("cuerda")

        Si cuerda entonces

            cuerda:Destruir()

            print("[OBSIDIAN UI] Cuerda retirada exitosamente (local).")

        demás

            print("[OBSIDIAN UI] Cuerda no encontrada.")

        fin

    fin

})

-- [2] CUERDA CONGELADA - alternar

GroupBoxes["Saltar la cuerda"]:AddToggle("Cuerda congelada", {

    Texto = "CUERDA CONGELADA",

    Información sobre herramientas = "Congela o descongela la cuerda físicamente."

    Devolución de llamada = función(estado)

        cuerda local = espacio de trabajo:FindFirstChild("Efectos") y espacio de trabajo.Efectos:FindFirstChild("cuerda")

        Si no es cuerda entonces

            print("[OBSIDIAN UI] Cuerda no encontrada.")

            devolver

        fin

        Si el estado entonces

            -- Congelar completamente la cuerda

            para _, v en ipairs(rope:GetDescendants()) hacer

                si v:IsA("BasePart") entonces

                    v.Anclado = verdadero

                    v.Velocidad = Vector3.cero

                    v.RotVelocity = Vector3.cero

                de lo contrario, si v:IsA("Restricción") o v:IsA("Restricción de cuerda") o v:IsA("Motor6D") entonces

                    v.Habilitado = falso

                fin

            fin

            print("[OBSIDIAN UI] Cuerda completamente congelada.")

        demás

            -- Descongelar cuerda

            para _, v en ipairs(rope:GetDescendants()) hacer

                si v:IsA("BasePart") entonces

                    v.Anclado = falso

                de lo contrario, si v:IsA("Restricción") o v:IsA("Restricción de cuerda") o v:IsA("Motor6D") entonces

                    v.Habilitado = verdadero

                fin

            fin

            print("[OBSIDIAN UI] Cuerda descongelada.")

        fin

    fin

})

-- [3] MINIJUEGO SIN EQUILIBRIO - botón simple

GroupBoxes["Saltar la cuerda"]:AddButton("NoBalanceMiniGame", {

    Texto = "MINIJUEGO SIN EQUILIBRIO",

    Información sobre herramientas = "Elimina el atributo de equilibrio para omitir el minijuego."

    func = función()

        jugador local = juego:GetService("Jugadores").LocalPlayer

        si jugador:BuscarPrimerHijo("JugandoASaltarLaCuerda") entonces

            jugador.JugandoASaltarLaComba:Destruir()

            print("[OBSIDIAN UI] Se eliminó 'PlayingJumpRope' del reproductor.")

        demás

            print("[OBSIDIAN UI] No se encontró el atributo 'PlayingJumpRope'.")

        fin

    fin

})

-- [4] SALTO AUTOMÁTICO CERCA DE LA CUERDA - alternar

Cuadros de grupo["Saltar la cuerda"]:AddToggle("AutoSaltar la cuerda", {

    Texto = "SALTO AUTOMÁTICO",

    Tooltip = "Salta automáticamente cada segundo cuando está cerca de la cuerda."

    Devolución de llamada = función(estado)

        Si no se indica, entonces devuelve el final

        playerService local = juego:FindService("Jugadores") o juego:GetService("Jugadores")

        jugador local = playerService.LocalPlayer o playerService.PlayerAdded:Wait()

        función local getHumanoid()

            char local = jugador.Carácter o jugador.CarácterAñadido:Espera()

            devolver char:WaitForChild("Humanoide")

        fin

        tarea.spawn(función()

            mientras el estado lo hace

                cuerda local = espacio de trabajo:FindFirstChild("Efectos") y espacio de trabajo.Efectos:FindFirstChild("cuerda")

                si cuerda y jugador.Carácter y jugador.Carácter:BuscarPrimerHijo("HumanoidRootPart") entonces

                    HRP local = jugador.Personaje.ParteRaízHumanoid

                    distancia local = (HRP.Posición - cuerda.Posición).Magnitud

                    si la distancia <= 15 entonces

                        humanoide local = getHumanoid()

                        Si humanoide y humanoide.Salud > 0 entonces

                            humanoide:ChangeState(Enum.HumanoidStateType.Jumping)

                        fin

                    fin

                fin

                tarea.esperar(1)

            fin

        fin)

    fin

})

-- [6] PLATAFORMA SEGURA - alternar

GroupBoxes["JumpRope"]:AddToggle("JumpRopeSafePlatform", {

    Texto = "PLATAFORMA SEGURA",

    Información sobre herramientas = "Crea una plataforma estática segura debajo del jugador."

    Devolución de llamada = función(estado)

        Jugadores locales = juego:GetService("Jugadores")

        local LocalPlayer = Jugadores.LocalPlayer

        Si el estado entonces

            Personaje local = LocalPlayer.Character o LocalPlayer.CharacterAdded:Wait()

            HRP local = Personaje:WaitForChild("HumanoidRootPart")

            plataforma local = Instancia.new("Parte")

            plataforma.Nombre = "JumpRopePlatform"

            plataforma.Tamaño = Vector3.nuevo(500, 1, 500)

            plataforma.Anclado = verdadero

            plataforma.CanCollide = verdadero

            plataforma.Transparencia = 0.6

            plataforma.Material = Enum.Material.Neon

            plataforma.Color = Color3.fromRGB(0, 255, 0)

            plataforma.Posición = HRP.Posición - Vector3.new(0, 3, 0)

            plataforma.Padre = espacio de trabajo

            print("[OBSIDIAN UI] Plataforma segura creada (local).")

        demás

            local existente = espacio de trabajo:FindFirstChild("JumpRopePlatform")

            Si existe entonces

                existente:Destruir()

                print("[OBSIDIAN UI] Plataforma segura eliminada.")

            fin

        fin

    fin

})

GroupBoxes["Dalgona"]:AddButton("ENCENDEDOR GRATIS", {

	Texto = "ENCENDEDOR GRATIS",

  

    Tooltip = "Te da un encendedor de forma permanente",

	Func = función()

		Jugadores locales = juego:GetService("Jugadores")

		local LocalPlayer = Jugadores.LocalPlayer

		función local setAttributeSafe(instancia, nombre, valor)

			si instancia:GetAttribute(nombre) == nil entonces

				instancia:SetAttribute(nombre, valor)

			demás

				instancia:SetAttribute(nombre, valor)

			fin

		fin

		setAttributeSafe(LocalPlayer, "Tiene más ligero", verdadero)

	fin

})

GroupBoxes["CARACTERÍSTICAS F2P"]:AddButton("FREEVIP", {

	Texto = "DESBLOQUEA FUNCIONES VIP", Información sobre herramientas = "Te ofrece todos los atributos VIP gratis",

	Func = función()

		Jugadores locales = juego:GetService("Jugadores")

		local LocalPlayer = Jugadores.LocalPlayer

		función local setAttributeSafe(instancia, nombre, valor)

			si instancia:GetAttribute(nombre) == nil entonces

				instancia:SetAttribute(nombre, valor)

			demás

				instancia:SetAttribute(nombre, valor)

			fin

		fin

		-- Atributos VIP

		setAttributeSafe(JugadorLocal, "__PropiedadDePasesDeJuegoVIPG", verdadero)

		setAttributeSafe(LocalPlayer, "Etiqueta VIPChat", verdadero)

		setAttributeSafe(LocalPlayer, "VIPJoinAlert", verdadero)

		setAttributeSafe(JugadorLocal, "VIPHideWins", falso)

		vipSettingData local = '{"Ocultar victorias":false,"Selector de color de ropa personalizada":"Ninguno","Color de ropa personalizada":true}'

		setAttributeSafe(LocalPlayer, "_VIPSettingData", vipSettingData)

		setAttributeSafe(ReproductorLocal, "Color Flotante", Color3.fromRGB(255, 255, 255))

	fin

})

autoTeleportBelow local = falso

GroupBoxes["JumpRope"]:AddToggle("AutoTeleportBelow", {

	Texto = "ANTI CAÍDA", Información sobre herramientas = "Teletransporta al jugador a una posición inferior a una fija si se cae."

	Devolución de llamada = función(estado)

		autoTeleportBelow = estado --atualiza bandera

		Jugadores locales = juego:GetService("Jugadores")

		local LocalPlayer = Jugadores.LocalPlayer

		teletransporte localPos = Vector3.new(615.284424, 192.274277, 920.952515)

		-- Apenas cria o loop se activa

		Si el estado entonces

			tarea.spawn(función()

				mientras que autoTeleportDebajo de hacer - usa una bandera atual

					tarea.esperar(0.2)

					si LocalPlayer.Character y LocalPlayer.Character:FindFirstChild("HumanoidRootPart") entonces

						HRP local = JugadorLocal.Personaje.ParteRaízHumanoid

						si HRP.Position.Y <= (teleportPos.Y - 3) entonces

							HRP.CFrame = CFrame.new(teletransportePos)

						fin

					fin

				fin

			fin)

		fin

	fin

})

-- Servicios

Jugadores locales = juego:GetService("Jugadores")

local LocalPlayer = Jugadores.LocalPlayer

-- Variáveis ​​de controle

autoModeEnabled local = falso

local currentMode = "Modo Guardar" -- Padrão

-- Posiciones

marco seguro local = CFrame.new(-41.7126923, 1021.32306, 134.34935, 0.811150551, 0.237830803, 0.534295142, -8.95559788e-06, 0.913583994, -0.406650066, -0.584837377, 0.32984966, 0.741056323) + Vector3.new(0, 10, 0)

troll localCFrame = CFrame.new(-49.8884354, 1020.104, -512.157776, 1, 0, 0, 0, 1, 0, 0, 0, 1)

-- Funções auxiliares

función local getNearestValidPlayer()

    Jugador local más cercano, distancia más corta = nula, matemática.enorme

    para _, jugador en ipairs(Players:GetPlayers()) hacer

        si jugador ~= LocalPlayer y jugador.Character y jugador.Character:FindFirstChild("HumanoidRootPart") entonces

            si no es jugador.Carácter:BuscarPrimerHijo("LuzRojaSeguraLuzVerde") entonces

                aviso local = jugador.Personaje:BuscarPrimerHijo("AvisoDeTransmisión", verdadero)

                Si se le solicita, entonces

                    distancia local = (LocalPlayer.Character.HumanoidRootPart.Position - jugador.Character.HumanoidRootPart.Position).Magnitud

                    si distancia < distanciamáscorta entonces

                        distanciamáscorta = distancia

                        jugadormás cercano = jugador

                    fin

                fin

            fin

        fin

    fin

    devolver el jugador más cercano

fin

función local saveRandomPlayer()

    objetivo local = obtenerJugadorValidoMásNearest()

    si no es objetivo o no es objetivo.Carácter o no es objetivo.Carácter:FindFirstChild("HumanoidRootPart") entonces devuelve fin

    mensaje local = objetivo.Carácter:FindFirstChild("CarryPrompt", verdadero)

    Si se le solicita, entonces

        HRP local = LocalPlayer.Character:FindFirstChild("ParteRaízHumanoid")

        Si HRP entonces

            HRP.CFrame = objetivo.Personaje.ParteRaízHumanoid.CFrame + Vector3.new(0,3,0)

            tarea.esperar(0.15)

            aviso de proximidad al fuego (aviso)

            tarea.esperar(0.25)

            HRP.CFrame = safeCFrame

        fin

    fin

fin

función local trollRandomPlayer()

    objetivo local = obtenerJugadorValidoMásNearest()

    si no es objetivo o no es objetivo.Carácter o no es objetivo.Carácter:FindFirstChild("HumanoidRootPart") entonces devuelve fin

    mensaje local = objetivo.Carácter:FindFirstChild("CarryPrompt", verdadero)

    Si se le solicita, entonces

        HRP local = LocalPlayer.Character:FindFirstChild("ParteRaízHumanoid")

        Si HRP entonces

            HRP.CFrame = objetivo.Personaje.ParteRaízHumanoid.CFrame + Vector3.new(0,3,0)

            tarea.esperar(0.15)

            aviso de proximidad al fuego (aviso)

            tarea.esperar(0.25)

            HRP.CFrame = trollCFrame

        fin

    fin

fin

-- Bucle automático

función local autoModeLoop()

    mientras que autoModeEnabled lo hace

        si currentMode == "Modo Guardar" entonces

            guardarRandomPlayer()

        de lo contrario, si currentMode == "Modo Troll" entonces

            trollJugadorAleatorio()

        fin

        tarea.esperar(0.5)

    fin

fin

-- ================================

-- IU: PESTAÑA LUZ ROJA, LUZ VERDE

-- ================================

-- Alternar

GroupBoxes["Luz roja, luz verde"]:AddToggle("Modo automático", {

	Texto = "MODO AUTOMÁTICO", Información sobre herramientas = "Realiza automáticamente el modo seleccionado",

	Predeterminado = falso,

	Devolución de llamada = función(Valor)

		autoModeEnabled = Valor

		Si autoModeEnabled entonces

			tarea.spawn(autoModeLoop)

		fin

	fin

})

-- Menú desplegable

GroupBoxes["Luz roja, luz verde"]:AddDropdown("ModeDropdown", {

	Texto = "MODO : ",

	Información sobre herramientas = "Seleccione el modo a ejecutar",

	Valor = "Modo Guardar", -- valor inicial

	Valores = {"Modo Guardar", "Modo Troll"}, -- lista de opciones

	Devolución de llamada = función(Opción)

		currentMode = Opción

	fin

})

-- Haga clic en el botón

GroupBoxes["Luz roja, luz verde"]:AddButton({

	Texto = "MODO JUGADOR ALEATORIO",

	Tooltip = "Realiza el modo seleccionado una vez",

	Func = función()

		si currentMode == "Modo Guardar" entonces

			guardarRandomPlayer()

		de lo contrario, si currentMode == "Modo Troll" entonces

			trollJugadorAleatorio()

		fin

	fin

})

-- =========================================

-- PESTAÑA LUZ ROJA, LUZ VERDE

-- =========================================

-- DESTRUYE HERIDOS + ATURDIDO

GroupBoxes["Luz roja, luz verde"]:AddButton("DestroyInjuredStun", {

	Texto = "QUITAR OBJETOS HERIDOS/ATURDIDOS", Descripción emergente = "Destruye todos los objetos heridos, caminantes y aturdidos",

	Func = función()

		recuento local = 0

		para _, obj en ipairs(workspace:GetDescendants()) hacer

			nombre localLower = obj.Nombre:lower()

			si nombreInferior == "caminandoherido" o nombreInferior == "aturdido" entonces

				obj:Destruir()

				contar += 1

			fin

		fin

		print("[DESTRUIR] Destruidos", count, "Objetos heridos que caminan/aturden")

	fin

})

-- =========================================

-- PESTAÑA DE ESCONDER Y BUSCAR

-- =========================================

-- QUITAR LAS PINCHAS

GroupBoxes["Esconder y buscar"]:AddButton("Eliminar picos", {

	Texto = "QUITAR PUNTA",

	Tooltip = "Destruye todas las KillingParts en HideAndSeekMap",

	Func = función()

		recuento local = 0

		para _, obj en ipairs(workspace:GetDescendants()) hacer

			si obj.Name:lower() == "killingparts" entonces

				obj:Destruir()

				contar += 1

			fin

		fin

		si el conteo > 0 entonces

			warn("[ÉXITO] Eliminado", count, "KillingParts")

		demás

			warn("[INFO] No se encontraron KillingParts")

		fin

	fin

})

-- =========================================

-- PESTAÑA DALGONA

-- =========================================

-- ELIMINAR LA PARED DE FOTOS

GroupBoxes["Dalgona"]:AddButton("Eliminar PhotoWall", {

	Texto = "QUITAR PARED DE FOTOS",

	Tooltip = "Destruye el objeto de pared de fotos en StairWalkWay",

	Func = función()

		escalera local = espacio de trabajo:FindFirstChild("StairWalkWay")

		si no es escalera entonces devuelve warn("[ERROR] StairWalkWay no encontrado") fin

		costumbre local = escalera:FindFirstChild("Personalizado")

		Si no es personalizado, devuelve warn("[ERROR] Carpeta personalizada no encontrada") fin

		recuento local = 0

		para _, obj en ipairs(custom:GetDescendants()) hacer

			si obj.Name:lower() == "startingcrossedovercollision" entonces

				obj:Destruir()

				contar += 1

			fin

		fin

		si el conteo > 0 entonces

			warn("[ÉXITO] Eliminado", count, "startingcrossedoverCOLLISION")

		demás

			warn("[INFO] StartingcrossedoverCOLLISION no encontrado")

		fin

	fin

})
