local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()


local Window = WindUI:CreateWindow({

    Title = "XRNL HUB | INK GAME",

    Icon = "cat",

    Author = "https://www.instagram.com/roseb_astian/",

    Folder = "RONALDO",

})


Window:EditOpenButton({

    Title = "Open XRNL-HUB",

    Icon = "cat",

    CornerRadius = UDim.new(0,20),

    StrokeThickness = 2,

    Color = ColorSequence.new( -- gradient

        Color3.fromHex("FF0F7B"), 

        Color3.fromHex("F89B29")

    ),

    OnlyMobile = false,

    Enabled = true,

    Draggable = true,

})


Window:Tag({

    Title = "v2.8.6",

    Color = Color3.fromHex("#30ff6a")

})


local PlayerTab = Window:Tab({

    Title = "Tab Player",

    Icon = "person-standing",

    Locked = false,

})



local RandomTab = Window:Tab({

    Title = "Random Features",

    Icon = "dices",

    Locked = false,

})


local RedTab = Window:Tab({

    Title = "Red Light, Green light",

    Icon = "lightbulb",

    Locked = false,

})


local DalgonaTab = Window:Tab({

    Title = "Dalgona",

    Icon = "cookie",

    Locked = false,

})
local LightsTab = Window:Tab({

    Title = "Lights Out / Special Game",

    Icon = "lightbulb-off",

    Locked = false,

})


local HideSeekTab = Window:Tab({

    Title = "Hide 'N' Seek",

    Icon = "swords",

    Locked = false,

})


local TugTab = Window:Tab({

    Title = "Tug Of War",

    Icon = "sword",

    Locked = false,

})



local JumpTab = Window:Tab({

    Title = "Jump Rope",

    Icon = "shell",

    Locked = false,

})


local GlassTab = Window:Tab({

    Title = "Glass bridge",

    Icon = "grid-2x2",

    Locked = false,

})


local MingleTab = Window:Tab({

    Title = "Mingle",

    Icon = "door-closed",

    Locked = false,

})


local SkyTab = Window:Tab({

    Title = "Sky Squid Game",

    Icon = "building-2",

    Locked = false,

})


local DinnerTab = Window:Tab({

    Title = "Final Dinner",

    Icon = "utensils-crossed",

    Locked = false,

})


local SquidTab = Window:Tab({

    Title = "Squid Game",

    Icon = "slice",

    Locked = false,

})

local Players = game:GetService("Players")

local LocalPlayer = Players.LocalPlayer

local Workspace = game:GetService("Workspace")

-- Função segura de teleporte

local function teleportToCFrame(cframe)

    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then

        LocalPlayer.Character.HumanoidRootPart.CFrame = cframe

    end

end

-- Botão 1: Teleport to End

JumpTab:Button({

    Title = "TP End",

    Desc = "Quickly teleport to the end location.", -- descrição em inglês

    Callback = function()

        teleportToCFrame(CFrame.new(

            737.156372, 193.805084, 920.952515,

            -1.1920929e-07, 0, -1.00000012,

            0, 1, 0,

            1.00000012, 0, -1.1920929e-07

        ))

    end

})

-- Botão 2: Teleport to Start

JumpTab:Button({

    Title = "TP Start",

    Desc = "Instantly teleport back to the start point.", -- descrição em inglês

    Callback = function()

        teleportToCFrame(CFrame.new(

            615.284424, 192.274277, 920.952515,

            -1.1920929e-07, 0, 1.00000012,

            0, 1, 0,

            -1.00000012, 0, -1.1920929e-07

        ))

    end

})

GlassTab:Button({

    Title = "TP END",

    Desc = "Teleport instantly to the END location.",

    Callback = function()

        teleportToCFrame(CFrame.new(

            -211.855881, 517.039062, -1534.7373,

            -1.1920929e-07, 0, 1.00000012,

            0, 1, 0,

            -1.00000012, 0, -1.1920929e-07

        ))

    end

})

--// Serviços

local Workspace = game:GetService("Workspace")

--// Variáveis

local AllMingleDoorsFolder = Workspace:FindFirstChild("AllMingleDoors")

local OriginalCanCollide = {} -- tabela para armazenar os valores originais

--// Cria o Toggle no WindUI

local NoclipToggle = MingleTab:Toggle({

    Title = "NOCLIP MINGLE DOORS",

    Desc = "Toggle collision of all objects in AllMingleDoors folder.",

    Default = false,

    Callback = function(Value)

        if AllMingleDoorsFolder then

            for _, obj in ipairs(AllMingleDoorsFolder:GetDescendants()) do

                if obj:IsA("BasePart") then

                    if Value then

                        -- Salva o valor original antes de tirar colisão

                        OriginalCanCollide[obj] = obj.CanCollide

                        obj.CanCollide = false

                    else

                        -- Restaura o valor original

                        if OriginalCanCollide[obj] ~= nil then

                            obj.CanCollide = OriginalCanCollide[obj]

                        else

                            obj.CanCollide = true

                        end

                    end

                end

            end

        end

    end

})

local Section = HideSeekTab:Section({ 

    Title = "Seeker Features",

    TextXAlignment = "Left",

    TextSize = 17, -- Default Size

})

local Players = game:GetService("Players")

local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer

local HRP = nil

local AutoKillEnabled = false

local AutoKillAllEnabled = false

local FollowConnection

local FollowAllConnection

--// AUTO KILL HIDE (BlueVest)

local AutoKillToggle = HideSeekTab:Toggle({

    Title = "AUTO KILL HIDE",

    Desc = "Automatically stays 5 studs in front of the BlueVest player.",

    Default = false,

    Callback = function(Value)

        AutoKillEnabled = Value

        if FollowConnection then

            FollowConnection:Disconnect()

            FollowConnection = nil

        end

        if AutoKillEnabled then

            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then

                HRP = LocalPlayer.Character.HumanoidRootPart

                -- Procura jogador com BlueVest

                local targetPlayer = nil

                for _, player in ipairs(Players:GetPlayers()) do

                    if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("BlueVest") then

                        targetPlayer = player

                        break

                    end

                end

                if targetPlayer and targetPlayer.Character then

                    local targetTorso = targetPlayer.Character:FindFirstChild("HumanoidRootPart")

                        or targetPlayer.Character:FindFirstChild("UpperTorso")

                        or targetPlayer.Character:FindFirstChild("8Torso")

                    if targetTorso then

                        FollowConnection = RunService.RenderStepped:Connect(function()

                            if AutoKillEnabled and targetPlayer.Character and targetTorso and HRP and HRP.Parent then

                                -- Posição 5 studs NA FRENTE do player alvo

                                local frontPos = targetTorso.CFrame * CFrame.new(0, 0, -5)

                                -- Faz o HRP ficar suavemente na frente do jogador

                                HRP.CFrame = frontPos

                            end

                        end)

                    end

                end

            end

        end

    end

})

local Section = HideSeekTab:Section({ 

    Title = "Hider Features",

    TextXAlignment = "Left",

    TextSize = 17, -- Default Size

})

HideSeekTab:Button({

    Title = "TP EXIT DOOR",

    Desc = "",

    Callback = function()

        local player = game.Players.LocalPlayer

        if not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then return end

        local hrp = player.Character.HumanoidRootPart

        -- Procura todos os EXITDOORs com atributo ActuallyWorks

        local map = game.Workspace:WaitForChild("HideAndSeekMap")

        local newDoors = map:WaitForChild("NEWFIXEDDOORS")

        local closestDoor = nil

        local shortestDistance = math.huge

        -- Percorre todos os pisos e EXITDOORS

        for _, floor in ipairs(newDoors:GetChildren()) do

            local exitFolder = floor:FindFirstChild("EXITDOORS")

            if exitFolder then

                for _, door in ipairs(exitFolder:GetChildren()) do

                    if door:GetAttribute("ActuallyWorks") then

                        local primary = door.PrimaryPart or door:FindFirstChild("DoorRoot")

                        if primary then

                            local distance = (hrp.Position - primary.Position).Magnitude

                            if distance < shortestDistance then

                                shortestDistance = distance

                                closestDoor = primary

                            end

                        end

                    end

                end

            end

        end

        -- Teleporta para a frente da porta

        if closestDoor then

            -- Posiciona 3 studs na frente da porta (frente = lookVector da porta)

            local targetCFrame = closestDoor.CFrame + closestDoor.CFrame.LookVector * 3

            hrp.CFrame = CFrame.new(targetCFrame.Position, closestDoor.Position)

        else

            warn("Nenhuma porta funcional encontrada!")

        end

    end

})

-- Serviços necessários

local Players = game:GetService("Players")

local LocalPlayer = Players.LocalPlayer

local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

-- Função para teleporte

local function teleportTo(cframe)

    if not cframe then return end

    local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

    local hrp = char:WaitForChild("HumanoidRootPart")

    hrp.CFrame = cframe

end

-- Função para pegar o CFrame do modelo no workspace

local function getPositionFromWorkspace(objectName)

    local obj = workspace:FindFirstChild(objectName)

    if obj then

        if obj:IsA("Model") and obj.PrimaryPart then

            return obj.PrimaryPart.CFrame

        elseif obj:IsA("BasePart") then

            return obj.CFrame

        end

    end

    return nil

end

-- Tabela que relaciona o nome do Dropdown com o nome real no Workspace

local Positions = {

    ["none"] = nil,

    ["PERBET 1"] = "FREEPEABERT1",

    ["PERBET 2"] = "FREEPEABERT2",

    ["PERBET 3"] = "FREEPEABERT3",

    ["PERBET 4"] = "FREEPEABERT4",

    ["PERBET 5"] = "FREEPEABERT5",

    ["PERBET 6"] = "FREEPEABERT6",

}

-- Criação do Dropdown

local Dropdown = RandomTab:Dropdown({

    Title = "Teleporte PERBET",

    Values = { "none", "PERBET 1", "PERBET 2", "PERBET 3", "PERBET 4", "PERBET 5", "PERBET 6" },

    Value = "none",

    Callback = function(option)

        local targetName = Positions[option]

        if targetName then

            local targetCFrame = getPositionFromWorkspace(targetName)

            if targetCFrame then

                teleportTo(targetCFrame)

                print("Teleported to: " .. option)

            else

                warn("❌ Não encontrei o objeto no workspace: " .. targetName)

            end

        else

            print("Nenhuma posição selecionada.")

        end

    end

})

local Players = game:GetService("Players")

local LocalPlayer = Players.LocalPlayer

-- DESTROY INJURED + STUN

local DestroyInjuredButton = RedTab:Button({

    Title = "Destroy Injured/Stun",

    Desc = "Removes all InjuredWalking & Stun parts from the game.",

    Callback = function()

        local count = 0

        for _, obj in ipairs(workspace:GetDescendants()) do

            if obj.Name == "InjuredWalking" or obj.Name:lower() == "stun" then

                obj:Destroy()

                count += 1

            end

        end

        print("Destroyed:", count, "InjuredWalking/Stun objects.")

    end

})

-- REMOVE SPIKES

local RemoveSpikesButton = HideSeekTab:Button({

    Title = "Remove Spikes",

    Desc = "Deletes KillingParts from HideAndSeekMap.",

    Callback = function()

        local map = workspace:FindFirstChild("HideAndSeekMap")

        if map and map:FindFirstChild("KillingParts") then

            map.KillingParts:Destroy()

            warn("Removed all KillingParts successfully!")

        else

            warn("No KillingParts found in HideAndSeekMap.")

        end

    end

})

local RemovePhotoWallButton = DalgonaTab:Button({

    Title = "Remove Photo Wall",

    Desc = "Deletes startingcrossedoverCOLLISION inside StairWalkWay.Custom.",

    Callback = function()

        -- Caminho exato para o objeto

        local stair = workspace:FindFirstChild("StairWalkWay")

        if not stair then

            warn("[ERROR] StairWalkWay not found in workspace.")

            return

        end

        local custom = stair:FindFirstChild("Custom")

        if not custom then

            warn("[ERROR] 'Custom' folder not found inside StairWalkWay.")

            return

        end

        local wall = custom:FindFirstChild("startingcrossedoverCOLLISION")

        if wall then

            wall:Destroy()

            warn("[SUCCESS] startingcrossedoverCOLLISION removed successfully!")

        else

            warn("[INFO] startingcrossedoverCOLLISION was not found inside StairWalkWay.Custom.")

        end

    end

})

local Players = game:GetService("Players")

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local autoSkipEnabled = false

local toggleButton = RandomTab:Toggle({

    Title = "AUTO SKIP",

    Desc = "Automatically skips dialogues",

    Callback = function(state)

        autoSkipEnabled = state

        if state then

            spawn(function()

                while autoSkipEnabled do

                    local args = {"Skipped"}

                    local success, err = pcall(function()

                        ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("DialogueRemote"):FireServer(unpack(args))

                    end)

                    if not success then

                        warn("Error firing DialogueRemote:", err)

                    end

                    wait(0.5) -- intervalo entre os disparos (ajuste conforme necessário)

                end

            end)

        end

    end

})

-- Variável do toggle

local AutoPullEnabled = false

-- Função que dispara o QTE

local function AutoPull()

    local ReplicatedStorage = game:GetService("ReplicatedStorage")

    local Remote = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("TemporaryReachedBindable")

    local args = {

        { IHateYou = true }

    }

    Remote:FireServer(unpack(args))

end

-- Loop automático do AutoPull

local RunService = game:GetService("RunService")

local AutoPullConnection

AutoPullConnection = RunService.Heartbeat:Connect(function()

    if AutoPullEnabled then

        AutoPull()

        task.wait(0.25) -- loop de 0.25 segundos

    end

end)

TugTab:Toggle({

    Title= "AUTO PULL",

    Desc = "Automatically pull in Tug-of-War mini-game",

    CheckBox = false,

    Icon = nil,

    Callback = function(value)

        AutoPullEnabled = value

    end

})

local Players = game:GetService("Players")

local LocalPlayer = Players.LocalPlayer

local originalPower = LocalPlayer:GetAttribute("_EquippedPower")

local Toggle = RandomTab:Toggle({

    Title = "Phantom Step",

    Desc = "You gain the Phantom Step dash ability",

    Default = false,

    Callback = function(state) 

        if state then

            -- Ativar Phantom Step

            LocalPlayer:SetAttribute("_EquippedPower", "PHANTOM STEP")

            print("Phantom Step On")

        else

            LocalPlayer:SetAttribute("_EquippedPower", originalPower)

            print("Phantom Step off")

        end

    end

})

local Players = game:GetService("Players")

local LocalPlayer = Players.LocalPlayer

local function toggleFasterSprint(state)

    local boostsFolder = LocalPlayer:FindFirstChild("Boosts")

    if not boostsFolder then

        warn("Boosts not found")

        return

    end

    local sprintBoost = boostsFolder:FindFirstChild("Faster Sprint")

    if not sprintBoost or not sprintBoost:IsA("NumberValue") then

        warn("Faster Sprint not found")

        return

    end

    if state then

        sprintBoost.Value = 5  -- ativa

        print("Faster Sprint on: 5")

    else

        sprintBoost.Value = 0  -- desativa

        print("Faster Sprint off: 0")

    end

end

local Toggle = RandomTab:Toggle({

    Title = "Dash",

    Desc = "You gain the ability to dash",

    Default = false,

    Callback = function(state)

        toggleFasterSprint(state)

    end

})

local Players = game:GetService("Players")

local LocalPlayer = Players.LocalPlayer

local originalPower = LocalPlayer:GetAttribute("_EquippedPower")

local Toggle = RandomTab:Toggle({

    Title = "Parkour Artist",

    Desc = "You gain the Parkour Artist dash ability",

    Default = false,

    Callback = function(state) 

        if state then

            -- Ativar Parkour Artist

            LocalPlayer:SetAttribute("_EquippedPower", "PARKOUR ARTIST")

            print("Parkour Artist On")

        else

            LocalPlayer:SetAttribute("_EquippedPower", originalPower)

            print("Parkour Artist Off")

        end

    end

})

local Players = game:GetService("Players")

local LocalPlayer = Players.LocalPlayer

local RunService = game:GetService("RunService")

-- Variável de controle

local showGlassPlatforms = false

local glassPlatforms = {} -- Armazena as plataformas criadas

-- Função para verificar vidro real ou falso

local function isFakeGlass(part)

    if part:GetAttribute("GlassPart") then

        if part:GetAttribute("ActuallyKilling") ~= nil then

            return true -- falso

        end

    end

    return false

end

-- Função para criar plataformas em cima dos vidros falsos

local function createPlatforms()

    -- Remove plataformas antigas antes de criar novas

    for _, platform in ipairs(glassPlatforms) do

        if platform and platform.Parent then

            platform:Destroy()

        end

    end

    glassPlatforms = {}

    -- Procura por todos os vidros falsos

    for _, part in ipairs(workspace:GetDescendants()) do

        if part:IsA("BasePart") and isFakeGlass(part) then

            -- Cria uma plataforma acima do vidro falso

            local platform = Instance.new("Part")

            platform.Size = Vector3.new(10, 0.5, 10) -- 7 studs de comprimento e largura

            platform.CFrame = part.CFrame * CFrame.new(0, 2, 0) -- Fica 3 studs acima do vidro

            platform.Anchored = true

            platform.CanCollide = true

            platform.Transparency = 0.3

            platform.Material = Enum.Material.Neon

            platform.Color = Color3.fromRGB(255, 0, 0) -- Vermelho = vidro falso

            platform.Parent = workspace

            -- Armazena a plataforma para remover depois

            table.insert(glassPlatforms, platform)

        end

    end

end

-- Função para remover todas as plataformas

local function removePlatforms()

    for _, platform in ipairs(glassPlatforms) do

        if platform and platform.Parent then

            platform:Destroy()

        end

    end

    glassPlatforms = {}

end

-- Toggle WindUI

local Toggle = GlassTab:Toggle({

    Title = "Glass Platforms",

    Desc = "Creates platforms above fake glasses.",

    Default = false,

    Callback = function(state)

        showGlassPlatforms = state

        if showGlassPlatforms then

            task.spawn(function()

                while showGlassPlatforms do

                    createPlatforms()

                    task.wait(1) -- Atualiza as plataformas a cada 1 segundo

                end

            end)

        else

            removePlatforms()

        end

    end

})

local Players = game:GetService("Players")

local LocalPlayer = Players.LocalPlayer

local RunService = game:GetService("RunService")

-- Variável de controle

local showGlassESP = false

-- Função para verificar vidro real ou falso

local function isRealGlass(part)

    if part:GetAttribute("GlassPart") then

        if part:GetAttribute("ActuallyKilling") ~= nil then

            return false -- falso

        end

        return true -- real

    end

    return false

end

-- Função para aplicar cor nos vidros

local function updateGlassColors()

    for _, part in ipairs(workspace:GetDescendants()) do

        if part:IsA("BasePart") and part:GetAttribute("GlassPart") then

            if showGlassESP then

                -- Glass correto/errado

                if isRealGlass(part) then

                    part.Color = Color3.fromRGB(0, 255, 0) -- verde real

                else

                    part.Color = Color3.fromRGB(255, 0, 0) -- vermelho falso

                end

                part.Material = Enum.Material.Neon

                -- Adiciona atributo ExploitingIsEvil

                part:SetAttribute("ExploitingIsEvil", true)

            else

                -- Resetar para cor original (opcional)

                part.Color = Color3.fromRGB(163, 162, 165)

                part.Material = Enum.Material.Glass

                -- Remove atributo

                part:SetAttribute("ExploitingIsEvil", nil)

            end

        end

    end

end

local Toggle = GlassTab:Toggle({

    Title = "Glass Vision",

    Desc = "Op Glass vision.",

    Icon = "bird",

    Default = false,

    Callback = function(state)

        showGlassESP = state

        if showGlassESP then

            task.spawn(function()

                while showGlassESP do

                    updateGlassColors()

                    task.wait(0.5)

                end

            end)

        else

            updateGlassColors()

        end

    end

})

-- Serviços  

local Players = game:GetService("Players")  

local LocalPlayer = Players.LocalPlayer  

local Workspace = game:GetService("Workspace")  

-- Função para encontrar o DroppedBandage mais próximo  

local function getClosestBandage()  

    local character = LocalPlayer.Character  

    if not character or not character:FindFirstChild("HumanoidRootPart") then return nil end  

    local hrp = character.HumanoidRootPart  

    local closest = nil  

    local minDistance = math.huge  

    for _, bandage in ipairs(Workspace.Effects:GetChildren()) do  

        if bandage.Name == "DroppedBandage" and bandage:IsA("Model") then  

            local primary = bandage.PrimaryPart or bandage:FindFirstChildWhichIsA("BasePart")

            if primary then

                local distance = (hrp.Position - primary.Position).Magnitude

                if distance < minDistance then

                    minDistance = distance

                    closest = bandage

                end

            end

        end  

    end  

    return closest  

end  

-- Botão na aba Random  

RandomTab:Button({  

    Title = "TP Bandage",  

    Desc = "Teleports to the closest DroppedBandage and returns",  

    Callback = function()  

        local character = LocalPlayer.Character  

        if not character or not character:FindFirstChild("HumanoidRootPart") then return end  

        local hrp = character.HumanoidRootPart  

        local originalPosition = hrp.CFrame  

        local bandage = getClosestBandage()  

        if bandage then  

            local primary = bandage.PrimaryPart or bandage:FindFirstChildWhichIsA("BasePart")

            if primary then

                -- Teleporta para o bandage

                hrp.CFrame = primary.CFrame + Vector3.new(0, 3, 0)

                wait(0.5) -- espera meio segundo no bandage

                -- Volta para posição original

                hrp.CFrame = originalPosition

            end

        else  

            warn("No DroppedBandage found!")  

        end  

    end  

})

local Players = game:GetService("Players")

local LocalPlayer = Players.LocalPlayer

-- Aguarda até o Character estar carregado

local function getSwingSpeed()

    local liveFolder = workspace:WaitForChild("Live")

    local playerModel = liveFolder:WaitForChild(LocalPlayer.Name) -- Pega o modelo do jogador atual

    local swingSpeed = playerModel:WaitForChild("SwingSpeed")

    return swingSpeed

end

-- Criação do Input

local Input = RandomTab:Input({

    Title = "Swing Speed (BETA)",

    Desc = "Set a custom swing speed between 0 and 50",

    Value = tostring(getSwingSpeed().Value), -- valor inicial do jogador atual

    InputIcon = "zap",

    Type = "Input",

    Placeholder = "Enter speed (0-50)...",

    Callback = function(input)

        -- Converte o valor digitado para número

        local value = tonumber(input)

        -- Validação do número

        if not value then

            warn("Invalid input, enter a number!")

            return

        end

        -- Limitar entre 0 e 50

        if value < 0 then

            value = 0

        elseif value > 50 then

            value = 50

        end

        -- Atualiza o SwingSpeed do jogador atual

        local swingSpeed = getSwingSpeed()

        if swingSpeed and swingSpeed:IsA("NumberValue") then

            swingSpeed.Value = value

            print("Swing Speed set to:", value)

        else

            warn("SwingSpeed not found or invalid for this player!")

        end

    end

})

-- Serviços

local Players = game:GetService("Players")

local LocalPlayer = Players.LocalPlayer

local RunService = game:GetService("RunService")

local Workspace = game:GetService("Workspace")

-- Função para teleporte com +10 studs

local function teleportTo(cframe)

    local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

    local hrp = character:WaitForChild("HumanoidRootPart")

    hrp.CFrame = cframe + Vector3.new(0, 10, 0)

end

-- [1] Botão TP START

local TPStart = RedTab:Button({

    Title = "TP START",

    Desc = "Teleports you to the starting point.",

    Callback = function()

        teleportTo(CFrame.new(-49.8884354, 1020.104, -512.157776, 1, 0, 0, 0, 1, 0, 0, 0, 1))

    end

})

-- [2] Botão TP SAFE PLACE (LightsTab)

local TPSafeLights = LightTab:Button({

    Title = "TP SAFE PLACE",

    Desc = "Teleports to a hidden safe place.",

    Callback = function()

        teleportTo(CFrame.new(195.255814, 112.202904, -85.3726807, -1, 0, 0, 0, 1, 0, 0, 0, -1))

    end

})

-- [3] Botão TP SAFE PLACE (RedTab)

local TPSafeRed = RedTab:Button({

    Title = "TP SAFE PLACE",

    Desc = "Teleports to a secondary safe place.",

    Callback = function()

        teleportTo(CFrame.new(197.452408, 51.3870239, -95.6055298, 0, 1, 0, -1, 0, 0, 0, 0, 1))

    end

})

-- [4] Botão BRIG OUT

local BrigOut = MingleTab:Button({

    Title = "Bring person out",

    Desc = "It works like this: You use Power hold / player 120 / Hercules, you use the skill on a player and press Bring out then you will return to the place you were (YOU WILL STAY AT LEAST 10 SECONDS OUTSIDE )",

    Callback = function()

        teleportTo(CFrame.new(1210.03967, 414.071106, -574.103088, 0, 0.747953832, -0.663750827, 1, 0, 0, 0, -0.663750827, -0.747953892))

    end

})

-- [5] Toggle DONT EXIT OF SQUID (Cria caixa oca 50x50x50 ao redor do jogador)

local BoxParts = {}

local BoxEnabled = false

local DontExit = SquidTab:Toggle({

    Title = "DONT EXIT OF SQUID",

    Description = "It works like this: You need to use it in the middle if he tries to push you out you won't get out because of the box which is better, next time I'll add anti-exit",

    Default = false,

    NoIcon = true, -- sem ícone

    NoCheckbox = true, -- sem checkbox

    Callback = function(state)

        BoxEnabled = state

        -- Remover caixas antigas

        for _, part in ipairs(BoxParts) do

            part:Destroy()

        end

        BoxParts = {}

        if state then

            local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

            local hrp = char:WaitForChild("HumanoidRootPart")

            local size = Vector3.new(50, 50, 50)

            local thickness = 3

            -- Função auxiliar para criar paredes

            local function createWall(pos, size)

                local part = Instance.new("Part")

                part.Size = size

                part.Anchored = true

                part.CanCollide = true

                part.Transparency = 0.5

                part.Material = Enum.Material.ForceField

                part.Color = Color3.fromRGB(255, 0, 0)

                part.CFrame = hrp.CFrame:ToWorldSpace(CFrame.new(pos))

                part.Parent = Workspace

                table.insert(BoxParts, part)

            end

            -- Criar paredes da caixa

            createWall(Vector3.new(25, 0, 0), Vector3.new(thickness, size.Y, size.Z)) -- Direita

            createWall(Vector3.new(-25, 0, 0), Vector3.new(thickness, size.Y, size.Z)) -- Esquerda

            createWall(Vector3.new(0, 0, 25), Vector3.new(size.X, size.Y, thickness)) -- Frente

            createWall(Vector3.new(0, 0, -25), Vector3.new(size.X, size.Y, thickness)) -- Trás

            createWall(Vector3.new(0, 25, 0), Vector3.new(size.X, thickness, size.Z)) -- Teto

            createWall(Vector3.new(0, -25, 0), Vector3.new(size.X, thickness, size.Z)) -- Chão

        end

    end

})

--// AUTO KILL PLAYERS (Todos os players)

local AutoKillAllToggle = LightTab:Toggle({

    Title = "AUTO KILL PLAYERS",

    Desc = "Stays 5 studs in front of the nearest player automatically.",

    Default = false,

    Callback = function(Value)

        AutoKillAllEnabled = Value

        if FollowAllConnection then

            FollowAllConnection:Disconnect()

            FollowAllConnection = nil

        end

        if AutoKillAllEnabled then

            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then

                HRP = LocalPlayer.Character.HumanoidRootPart

                FollowAllConnection = RunService.RenderStepped:Connect(function()

                    if not AutoKillAllEnabled or not HRP or not HRP.Parent then return end

                    -- Procura o jogador mais próximo

                    local closestPlayer = nil

                    local shortestDistance = math.huge

                    for _, player in ipairs(Players:GetPlayers()) do

                        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health > 0 then

                            local torso = player.Character:FindFirstChild("HumanoidRootPart")

                            if torso then

                                local distance = (HRP.Position - torso.Position).Magnitude

                                if distance < shortestDistance then

                                    shortestDistance = distance

                                    closestPlayer = player

                                end

                            end

                        end

                    end

                    if closestPlayer and closestPlayer.Character then

                        local targetTorso = closestPlayer.Character:FindFirstChild("HumanoidRootPart")

                            or closestPlayer.Character:FindFirstChild("UpperTorso")

                            or closestPlayer.Character:FindFirstChild("Torso")

                        if targetTorso then

                            -- Fica 5 studs NA FRENTE do player mais próximo

                            local frontPos = targetTorso.CFrame * CFrame.new(0, 0, -5)

                            HRP.CFrame = frontPos

                        end

                    end

                end)

            end

        end

    end

})

local Players = game:GetService("Players")

local LocalPlayer = Players.LocalPlayer

local RunService = game:GetService("RunService")

-- Definindo CFrame do local seguro

local safeCFrame = CFrame.new(

    -41.7126923, 1021.32306, 134.34935,

    0.811150551, 0.237830803, 0.534295142,

    -8.95559788e-06, 0.913583994, -0.406650066,

    -0.584837377, 0.32984966, 0.741056323

) + Vector3.new(0, 10, 0)

-- Definindo CFrame do local de troll

local trollCFrame = CFrame.new(

    -49.8884354, 1020.104, -512.157776,

    1, 0, 0,

    0, 1, 0,

    0, 0, 1

)

-- Função para encontrar o jogador mais próximo com CarryPrompt e sem SafeRedLightGreenLight

local function getNearestValidPlayer()

    local closestPlayer = nil

    local shortestDistance = math.huge

    for _, player in ipairs(Players:GetPlayers()) do

        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then

            if not player.Character:FindFirstChild("SafeRedLightGreenLight") then

                local prompt = player.Character:FindFirstChild("CarryPrompt", true)

                if prompt then

                    local distance = (LocalPlayer.Character.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude

                    if distance < shortestDistance then

                        shortestDistance = distance

                        closestPlayer = player

                    end

                end

            end

        end

    end

    return closestPlayer

end

-- Função para salvar um jogador

local function saveRandomPlayer()

    local target = getNearestValidPlayer()

    if not target or not target.Character or not target.Character:FindFirstChild("HumanoidRootPart") then return end

    local prompt = target.Character:FindFirstChild("CarryPrompt", true)

    if prompt then

        local humanoidRoot = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")

        if humanoidRoot then

            humanoidRoot.CFrame = target.Character.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0)

            task.wait(0.15)

            fireproximityprompt(prompt)

            task.wait(0.25)

            humanoidRoot.CFrame = safeCFrame

        end

    end

end

-- Função para trollar um jogador

local function trollRandomPlayer()

    local target = getNearestValidPlayer()

    if not target or not target.Character or not target.Character:FindFirstChild("HumanoidRootPart") then return end

    local prompt = target.Character:FindFirstChild("CarryPrompt", true)

    if prompt then

        local humanoidRoot = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")

        if humanoidRoot then

            humanoidRoot.CFrame = target.Character.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0)

            task.wait(0.15)

            fireproximityprompt(prompt)

            task.wait(0.25)

            humanoidRoot.CFrame = trollCFrame

        end

    end

end

-- Variáveis de controle dos loops

local autoSave = false

local autoTroll = false

-- Loop do Auto Save

local function autoSaveLoop()

    while autoSave do

        saveRandomPlayer()

        task.wait(0.5)

    end

end

-- Loop do Auto Troll

local function autoTrollLoop()

    while autoTroll do

        trollRandomPlayer()

        task.wait(0.5)

    end

end

-- Botão: Save Random Player (original)

local SaveButton = RedTab:Button({

    Title = "Save Random Player",

    Desc = "Carry and save one player.",

    Callback = function()

        saveRandomPlayer()

    end

})

-- 1. Botão Troll Random Player

local TrollButton = RedTab:Button({

    Title = "Troll Random Player",

    Desc = "Carry a random player and teleport to troll location.",

    Callback = function()

        trollRandomPlayer()

    end

})

-- 2. Toggle Auto Save Players

local AutoSaveToggle = RedTab:Toggle({

    Title = "Auto Save Players",

    Desc = "Automatically saves players in a loop.",

    Default = false,

    Callback = function(Value)

        autoSave = Value

        if autoSave then

            task.spawn(autoSaveLoop)

        end

    end

})

-- 3. Toggle Auto Troll Players

local AutoTrollToggle = RedTab:Toggle({

    Title = "Auto Troll Players",

    Desc = "Automatically trolls players in a loop.",

    Default = false,

    Callback = function(Value)

        autoTroll = Value

        if autoTroll then

            task.spawn(autoTrollLoop)

        end

    end

})

local Button = HideSeekTab:Button({

    Title = "TP SAFE PLACE",

    Desc = "TP Safe place",

    Locked = false,

    Callback = function()

        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then

            LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(146.46, 1055.28, 54.50)

        end

    end

})

--// Variável para armazenar highlights

local ActiveHighlights = {}

-- Função para criar highlights amarelos

local function createHighlight(door)

    if ActiveHighlights[door] then return end

    local highlight = Instance.new("Highlight")

    highlight.Adornee = door

    highlight.FillColor = Color3.fromRGB(255, 255, 0)

    highlight.OutlineColor = Color3.fromRGB(255, 255, 0)

    highlight.FillTransparency = 0.3

    highlight.Parent = door

    ActiveHighlights[door] = highlight

end

-- Função para habilitar ESP

local function enableESP()

    -- Aqui, buscamos o Workspace e a pasta SOMENTE quando o toggle é ativado

    local Workspace = game:GetService("Workspace")

    local Map = Workspace:FindFirstChild("HideAndSeekMap")

    if not Map then

        warn("⚠️ HideAndSeekMap não encontrado!")

        return

    end

    local DoorsFolder = Map:FindFirstChild("NEWFIXEDDOORS")

    if not DoorsFolder then

        warn("⚠️ NEWFIXEDDOORS não encontrado!")

        return

    end

    -- Percorre todos os andares e procura portas corretas

    for _, floor in ipairs(DoorsFolder:GetChildren()) do

        local exitDoors = floor:FindFirstChild("EXITDOORS")

        if exitDoors then

            for _, door in ipairs(exitDoors:GetChildren()) do

                if door:IsA("Model") and door:GetAttribute("ActuallyWorks") then

                    createHighlight(door)

                end

            end

        end

    end

end

-- Função para desativar ESP

local function disableESP()

    for door, highlight in pairs(ActiveHighlights) do

        if highlight and highlight.Parent then

            highlight:Destroy()

        end

        ActiveHighlights[door] = nil

    end

end

-- Criação do botão toggle na Wind UI

HideSeekTab:Toggle({

    Title = "ESP EXITDOOR",

    Desc = "",

    Default = false,

    Callback = function(state)

        if state then

            enableESP()

        else

            disableESP()

        end

    end

})

--// Serviços

local Players = game:GetService("Players")

local Workspace = game:GetService("Workspace")

local LocalPlayer = Players.LocalPlayer

local Effects = Workspace:WaitForChild("Effects")

-- Variável para controlar o loop

local Teleporting = false

-- Função para encontrar o PrimaryPart de um Model

local function getModelCFrame(model)

    if model.PrimaryPart then

        return model.PrimaryPart.CFrame

    end

    -- Se não tiver PrimaryPart definido, tenta achar uma BasePart dentro do Model

    for _, part in ipairs(model:GetDescendants()) do

        if part:IsA("BasePart") then

            return part.CFrame

        end

    end

    return nil

end

-- Função para teleportar para todas as chaves e voltar à posição original

local function teleportKeys()

    while Teleporting do

        task.wait(0.5)

        local char = LocalPlayer.Character

        if not char or not char:FindFirstChild("HumanoidRootPart") then

            continue

        end

        local hrp = char:FindFirstChild("HumanoidRootPart")

        local originalCFrame = hrp.CFrame -- salva posição atual

        -- Procura pelas chaves

        for _, obj in ipairs(Effects:GetChildren()) do

            if obj:IsA("Model") and (

                obj.Name == "DroppedKeyCircle" or

                obj.Name == "DroppedKeySquare" or

                obj.Name == "DroppedKeyTriangle"

            ) then

                -- Pega o CFrame correto da chave

                local keyCFrame = getModelCFrame(obj)

                if keyCFrame then

                    -- Teleporta para a chave

                    hrp.CFrame = keyCFrame + Vector3.new(0, 3, 0)

                    task.wait(0.25)

                    -- Volta para onde estava

                    hrp.CFrame = originalCFrame

                    task.wait(0.15)

                end

            end

        end

    end

end

-- Cria o botão toggle na Wind UI

HideSeekTab:Toggle({

    Title = "TP KEY",

    Desc = "",

    Default = false,

    Callback = function(state)

        Teleporting = state

        if state then

            teleportKeys()

        end

    end

})

local FullBrightEnabled = false

local FullBrightToggle = RandomTab:Toggle({

    Title = "Full Bright",

    Description = "Keeps the game fully bright in a loop.",

    Default = false,

    Callback = function(Value)

        FullBrightEnabled = Value

        task.spawn(function()

            local Lighting = game:GetService("Lighting")

            while FullBrightEnabled and task.wait(1) do

                Lighting.ClockTime = 14 -- Manter dia

                Lighting.Brightness = 2

                Lighting.GlobalShadows = false

            end

        end)

    end

})

--// Serviços

local Players = game:GetService("Players")

local Workspace = game:GetService("Workspace")

local LocalPlayer = Players.LocalPlayer

-- Variáveis de controle

local AutoDodge = false

local humanoidRootPart

local humanoid

-- Configurações

local DODGE_RANGE = 4 -- distância para detectar ataques

local TELEPORT_HEIGHT = 75

local THREATS = { "BOTTLE", "KNIFE", "FORK" } -- nomes das ferramentas perigosas

-- Função para verificar se o jogador tem o item "DODGE!"

local function hasDodgeItem()

    local backpack = LocalPlayer:FindFirstChild("Backpack")

    if backpack and backpack:FindFirstChild("DODGE!") then

        return backpack:FindFirstChild("DODGE!")

    end

    -- Caso esteja equipado na mão

    local character = LocalPlayer.Character

    if character and character:FindFirstChild("DODGE!") then

        return character:FindFirstChild("DODGE!")

    end

    return nil

end

-- Função para usar o item DODGE

local function useDodgeItem()

    local dodgeTool = hasDodgeItem()

    if dodgeTool and dodgeTool:FindFirstChild("RemoteEvent") then

        -- Aciona o RemoteEvent do DODGE!

        pcall(function()

            dodgeTool.RemoteEvent:FireServer()

        end)

        return true

    end

    return false

end

-- Função para teleportar para cima

local function teleportUp()

    if humanoidRootPart then

        humanoidRootPart.CFrame = humanoidRootPart.CFrame + Vector3.new(0, TELEPORT_HEIGHT, 0)

    end

end

-- Função para detectar ameaças próximas

local function detectThreats()

    for _, player in ipairs(Players:GetPlayers()) do

        if player ~= LocalPlayer and player.Character then

            local char = player.Character

            local hrp = char:FindFirstChild("HumanoidRootPart")

            if hrp and (hrp.Position - humanoidRootPart.Position).Magnitude <= DODGE_RANGE then

                -- Verifica ferramentas perigosas no personagem

                for _, tool in ipairs(char:GetChildren()) do

                    if tool:IsA("Tool") and table.find(THREATS, tool.Name:upper()) then

                        return true

                    end

                end

            end

        end

    end

    return false

end

-- Loop principal do Auto Dodge

local function startAutoDodge()

    task.spawn(function()

        while AutoDodge do

            task.wait(0.15)

            local char = LocalPlayer.Character

            humanoidRootPart = char and char:FindFirstChild("HumanoidRootPart")

            humanoid = char and char:FindFirstChildOfClass("Humanoid")

            if not humanoidRootPart or not humanoid or humanoid.Health <= 0 then

                continue

            end

            -- Se houver ameaça próxima

            if detectThreats() then

                if not useDodgeItem() then

                    teleportUp()

                end

            end

        end

    end)

end

-- Botão toggle na aba Random

RandomTab:Toggle({

    Title = "AUTO DODGE",

    Desc = "aop",

    Default = false,

    Callback = function(state)

        AutoDodge = state

        if state then

            startAutoDodge()

        end

    end

})

local Button = RedTab:Button({

    Title = "Teleport Final",

    Desc = "001 ?",

    Icon = "bird",

    Callback = function()

        local Players = game:GetService("Players")

        local LocalPlayer = Players.LocalPlayer

        local Character = LocalPlayer.Character

        if Character and Character:FindFirstChild("HumanoidRootPart") then

            -- CFrame que você passou

            local targetCFrame = CFrame.new(

                -41.7126923, 1021.32306, 134.34935,

                0.811150551, 0.237830803, 0.534295142,

                -8.95559788e-06, 0.913583994, -0.406650066,

                -0.584837377, 0.32984966, 0.741056323

            )

            -- Adiciona 10 studs para cima

            targetCFrame = targetCFrame + Vector3.new(0, 10, 0)

            -- Teleporta o HumanoidRootPart

            Character.HumanoidRootPart.CFrame = targetCFrame

        end

    end

})

-- ========================

-- INF JUMP TOGGLE

-- ========================

local InfiniteJumpEnabled = false

local UserInputService = game:GetService("UserInputService")

local player = game.Players.LocalPlayer

local Toggle = RandomTab:Toggle({

    Title = "Inf Jump",

    Desc = "Infinite Jump i think.",

    Locked = false,

    Callback = function(state)

        InfiniteJumpEnabled = state -- Ativa/Desativa o toggle

    end

})

-- Evento para permitir/desativar o Infinite Jump

UserInputService.JumpRequest:Connect(function()

    if InfiniteJumpEnabled then

        local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")

        if humanoid and humanoid.Parent then

            humanoid:ChangeState(Enum.HumanoidStateType.Jumping)

        end

    end

end)

-- ========================

-- INSTA INTERACT TOGGLE

-- ========================

local InstaInteractEnabled = false

local Players = game:GetService("Players")

local LocalPlayer = Players.LocalPlayer

local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")

local DISTANCIA_MAX = 999999999

-- Toggle na Wind UI

local Button = RandomTab:Toggle({

    Title = "Insta Interact",

    Desc = "Makes all ProximityPrompts instant.",

    Locked = false,

    Callback = function(state)

        InstaInteractEnabled = state

    end

})

-- Atualiza o HumanoidRootPart quando o player renascer

LocalPlayer.CharacterAdded:Connect(function(char)

    Character = char

    HumanoidRootPart = char:WaitForChild("HumanoidRootPart")

end)

-- Função para forçar HoldDuration = 0

local function tornarPromptInstantaneo(prompt)

    if prompt:IsA("ProximityPrompt") then

        -- Sempre que o HoldDuration mudar, forçamos para 0 se o toggle estiver ativo

        prompt:GetPropertyChangedSignal("HoldDuration"):Connect(function()

            if InstaInteractEnabled then

                prompt.HoldDuration = 0

            end

        end)

        -- Define inicialmente

        if InstaInteractEnabled then

            prompt.HoldDuration = 0

        end

    end

end

-- Aplica aos prompts já existentes

for _, obj in pairs(workspace:GetDescendants()) do

    if obj:IsA("ProximityPrompt") then

        tornarPromptInstantaneo(obj)

    end

end

-- Aplica aos prompts adicionados futuramente

workspace.DescendantAdded:Connect(function(obj)

    if obj:IsA("ProximityPrompt") then

        tornarPromptInstantaneo(obj)

    end

end)

-- Loop extra de segurança: força constantemente o HoldDuration = 0

task.spawn(function()

    while task.wait(0.1) do

        if InstaInteractEnabled then

            for _, prompt in pairs(workspace:GetDescendants()) do

                if prompt:IsA("ProximityPrompt") and prompt.HoldDuration ~= 0 then

                    prompt.HoldDuration = 0

                end

            end

        end

    end

end)

local Toggle = RandomTab:Toggle({

    Title = "Noclip",

    Desc = "Auto-Explained",

    Default = false,

    Callback = function(state) 

        print("Toggle Activated: " .. tostring(state))

        -- Serviços

        local Players = game:GetService("Players")

        local RunService = game:GetService("RunService")

        local LocalPlayer = Players.LocalPlayer

        

        if getgenv().NoclipConnection then

            getgenv().NoclipConnection:Disconnect()

            getgenv().NoclipConnection = nil

            getgenv().NoclipEnabled = false

            print("Noclip Off")

        end

        if state then

            getgenv().NoclipEnabled = true

            getgenv().NoclipConnection = RunService.Stepped:Connect(function()

                if LocalPlayer.Character then

                    for _, part in pairs(LocalPlayer.Character:GetDescendants()) do

                        if part:IsA("BasePart") then

                            part.CanCollide = false

                        end

                    end

                end

            end)

            print("Noclip On")

        end

    end

})

--// Serviços

local Workspace = game:GetService("Workspace")

--// Botão para remover o Rope

local RemoveRopeButton = JumpTab:Button({

    Title = "Remove Rope",

    Desc = "Removes the rope effect from the game.",

    Callback = function()

        local rope = Workspace:FindFirstChild("Effects") and Workspace.Effects:FindFirstChild("rope")

        if rope then

            rope:Destroy()

            print("[WindUI] Rope removed successfully!")

        else

            warn("[WindUI] Rope not found.")

        end

    end

})
-- ------------------------------------------------------------------
-- TELEPORT (Dropdown + Refresh + Teleport) (usa RandomTab del hub)
-- ------------------------------------------------------------------
-- Asegúrate de tener RandomTab definido en tu script principal antes de cargar este archivo.

if not RandomTab then
    warn("RandomTab no existe. Crea la pestaña RandomTab en tu hub antes de usar este script.")
else
    local SelectedPlayer = nil

    local function GetPlayerList()
        local names = {}
        for _, plr in ipairs(Players:GetPlayers()) do
            if plr ~= LocalPlayer then
                table.insert(names, plr.Name)
            end
        end
        return names
    end

    local PlayerDropdown = RandomTab:Dropdown({
        Title = "Seleccionar Jugador",
        Values = GetPlayerList(),
        Multi = false,
        Callback = function(selected)
            SelectedPlayer = selected
            print("Jugador seleccionado: " .. tostring(SelectedPlayer))
        end
    })

    RandomTab:Button({
        Title = "🔄 Refresh Lista",
        Desc = "Actualiza la lista de jugadores",
        Callback = function()
            PlayerDropdown:SetValues(GetPlayerList())
            print("✅ Lista de jugadores actualizada.")
        end
    })

    RandomTab:Button({
        Title = "⚡ Teleportar al Jugador",
        Desc = "Te teletransporta al jugador seleccionado",
        Callback = function()
            if SelectedPlayer then
                local target = Players:FindFirstChild(SelectedPlayer)
                if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
                    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        LocalPlayer.Character:PivotTo(target.Character.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0))
                        print("✅ Teletransportado a " .. SelectedPlayer)
                    else
                        warn("Tu personaje no está listo.")
                    end
                else
                    warn("No se pudo encontrar al jugador o su personaje.")
                end
            else
                warn("No has seleccionado ningún jugador.")
            end
        end
    })
end

-- ------------------------------------------------------------------
----------------------------------------------------------
-- AUTO DALGONA (Más robusto que solo firesignal)
-- ------------------------------------------------------------------
do
    local function findDalgonaUI()
        for _, gui in pairs(LocalPlayer.PlayerGui:GetChildren()) do
            if gui:IsA("ScreenGui") and gui:FindFirstChild("Dalgona") then
                return gui.Dalgona
            end
            -- Algunos juegos usan nombres diferentes
            if gui:IsA("ScreenGui") and gui:FindFirstChild("Sugar") then
                return gui.Sugar
            end
        end
        return nil
    end

    local function autoDalgonaOnce()
        local dal = findDalgonaUI()
        if not dal then return false end
        -- Buscar partes clicables dentro de la UI (botones o ImageButtons)
        for _, v in pairs(dal:GetDescendants()) do
            if v:IsA("ImageButton") or v:IsA("TextButton") then
                pcall(function()
                    -- Intentar diferentes formas de activar (firesignal o firetouchinterest)
                    if v.MouseButton1Click then
                        firesignal(v.MouseButton1Click)
                    else
                        v:Activate()
                    end
                end)
            end
        end
        return true
    end

    local autoEnabled = false
    if DalgonaTab then
        DalgonaTab:Toggle({
            Title = "Auto Dalgona",
            Desc = "Intenta completar la Dalgona automáticamente",
            Default = false,
            Callback = function(state)
                autoEnabled = state
                print("AutoDalgona:", state)
            end
        })
    else
        warn("DalgonaTab no existe. Skipping Auto Dalgona toggle.")
    end

    -- Loop de chequeo
    spawn(function()
        while true do
            task.wait(0.6)
            if autoEnabled then
                local ok = autoDalgonaOnce()
                if ok then
                    -- si completó, esperar un poco para evitar spam
                    task.wait(1.5)
                end
            else
                task.wait(1)
            end
        end
    end)
end

-- ------------------------------------------------------------------
-- SIMPLE ESP / GLASS VISION (Outline highlight + optional ESP)
-- ------------------------------------------------------------------
do
    local espEnabled = false
    local highlights = {}

    local function addHighlight(character)
        if not character or not character:IsA("Model") then return end
        if highlights[character] then return end
        local hrp = character:FindFirstChild("HumanoidRootPart") or character:FindFirstChildWhichIsA("BasePart")
        if not hrp then return end
        local hl = Instance.new("Highlight")
        hl.Name = "XRNL_Highlight"
        hl.Adornee = character
        hl.Parent = character
        highlights[character] = hl
    end

    local function removeHighlight(character)
        if not character then return end
        local hl = highlights[character]
        if hl and hl.Parent then hl:Destroy() end
        highlights[character] = nil
    end

    local function refreshHighlights()
        for k, v in pairs(highlights) do
            if not k.Parent then
                removeHighlight(k)
            end
        end
    end

    if RandomTab then
        RandomTab:Toggle({
            Title = "ESP Players",
            Desc = "Resalta a los jugadores con Highlight",
            Default = false,
            Callback = function(state)
                espEnabled = state
                if not state then
                    for k,_ in pairs(highlights) do
                        removeHighlight(k)
                    end
                end
            end
        })
    end

    Players.PlayerAdded:Connect(function(plr)
        plr.CharacterAdded:Connect(function(char)
            task.wait(0.5)
            if espEnabled then addHighlight(char) end
        end)
    end)

    Players.PlayerRemoving:Connect(function(plr)
        if plr.Character then removeHighlight(plr.Character) end
    end)

    -- Toggle existing characters
    RunService.Heartbeat:Connect(function()
        if espEnabled then
            for _, plr in ipairs(Players:GetPlayers()) do
                if plr ~= LocalPlayer and plr.Character then
                    addHighlight(plr.Character)
                end
            end
        else
            refreshHighlights()
        end
    end)
end

-- ------------------------------------------------------------------
-- EXTRA: Teleport to spawn / to mouse / noclip quick buttons (optional)
-- ------------------------------------------------------------------
do
    if RandomTab then
        RandomTab:Button({
            Title = "Teleport to Spawn",
            Desc = "Ir al spawn del juego",
            Callback = function()
                local spawn = Workspace:FindFirstChild("SpawnLocation") or Workspace:FindFirstChild("Spawn")
                if spawn and spawn:IsA("BasePart") and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    LocalPlayer.Character:PivotTo(spawn.CFrame + Vector3.new(0,3,0))
                    print("Teleported to spawn.")
                else
                    warn("No se encontró spawn o tu personaje no está listo.")
                end
            end
        })
    
