local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()


local Window = WindUI:CreateWindow({

    Title = "MEOWL HUB | INK GAME",

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


-- ========================

-- INF JUMP TOGGLE

-- ========================

local InfiniteJumpEnabled = false

local UserInputService = game:GetService("UserInputService")

local player = game.Players.LocalPlayer


local Toggle = PlayerTab:Toggle({

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

local Button = PlayerTab:Toggle({

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


local Toggle = PlayerTab:Toggle({

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






local Players = game:GetService("Players")

local LocalPlayer = Players.LocalPlayer


local originalPower = LocalPlayer:GetAttribute("_EquippedPower")


local Toggle = RandomTab:Toggle({

    Title = "Phantom Step",

    Desc = "Give u Phantom Step",

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

    Desc = "Dash click lol",

    Default = false,

    Callback = function(state)

        toggleFasterSprint(state)

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


--// Serviços

local Players = game:GetService("Players")

local LocalPlayer = Players.LocalPlayer


-- Função para destruir os folders, caso existam no seu personagem

local function destroyFolders()

    local char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()


    -- Verifica e destrói o folder "Stun"

    local stun = char:FindFirstChild("Stun")

    if stun then

        stun:Destroy()

    end


    -- Verifica e destrói o folder "InjuredWalking"

    local injured = char:FindFirstChild("InjuredWalking")

    if injured then

        injured:Destroy()

    end

end


-- Botão de clique único na Wind UI

RedTab:Button({

    Title = "REMOVER STUN & INJURED",

    Desc = "Op",

    Callback = function()

        destroyFolders()

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


local Players = game:GetService("Players")

local LocalPlayer = Players.LocalPlayer

local HRP = nil

local AntiFallEnabled = false

local LastPosition = nil


local AntiFallToggle = SkyTab:Toggle({

    Title = "Anti Fall",

    Description = "Prevents you from falling more than 5 studs by teleporting to the last safe position.",

    Default = false,

    Callback = function(Value)

        AntiFallEnabled = Value


        if AntiFallEnabled then  

            -- Salva a posição exata ao ativar

            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then

                HRP = LocalPlayer.Character.HumanoidRootPart

                LastPosition = HRP.Position -- posição exata onde ativou

            end


            -- Inicia loop

            task.spawn(function()  

                while AntiFallEnabled and task.wait(0.1) do  

                    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then  

                        HRP = LocalPlayer.Character.HumanoidRootPart  


                        -- Verifica se caiu 5 studs ou mais

                        local YDiff = LastPosition.Y - HRP.Position.Y  

                        if YDiff >= 5 then  

                            -- Teleporta de volta para a posição exata onde ativou

                            HRP.CFrame = CFrame.new(LastPosition)  

                        end

                    end  

                end  

            end)  

        else  

            -- Reset quando desligado

            LastPosition = nil  

        end  

    end

})


local Players = game:GetService("Players")

local ESPSeekEnabled = false

local ESPSeekHighlights = {}


local ESPSeekToggle = HideSeekTab:Toggle({

    Title = "ESP Seek",

    Description = "Highlights players wearing RedVest in red.",

    Default = false,

    Callback = function(Value)

        ESPSeekEnabled = Value


        task.spawn(function()

            while ESPSeekEnabled and task.wait(0.5) do

                for _, player in pairs(Players:GetPlayers()) do

                    if player.Character and player.Character:FindFirstChild("RedVest") then

                        if not ESPSeekHighlights[player] then

                            local highlight = Instance.new("Highlight")

                            highlight.FillColor = Color3.fromRGB(255, 0, 0)

                            highlight.OutlineColor = Color3.fromRGB(255, 0, 0)

                            highlight.Adornee = player.Character

                            highlight.Parent = game:GetService("CoreGui")

                            ESPSeekHighlights[player] = highlight

                        end

                    else

                        if ESPSeekHighlights[player] then

                            ESPSeekHighlights[player]:Destroy()

                            ESPSeekHighlights[player] = nil

                        end

                    end

                end

            end


            -- Cleanup highlights ao desativar

            if not ESPSeekEnabled then

                for _, hl in pairs(ESPSeekHighlights) do

                    hl:Destroy()

                end

                ESPSeekHighlights = {}

            end

        end)

    end

})


local ESPHideEnabled = false

local ESPHideHighlights = {}


local ESPHideToggle = HideSeekTab:Toggle({

    Title = "ESP Hide",

    Description = "Highlights players wearing BlueVest in blue.",

    Default = false,

    Callback = function(Value)

        ESPHideEnabled = Value


        task.spawn(function()

            while ESPHideEnabled and task.wait(0.5) do

                for _, player in pairs(Players:GetPlayers()) do

                    if player.Character and player.Character:FindFirstChild("BlueVest") then

                        if not ESPHideHighlights[player] then

                            local highlight = Instance.new("Highlight")

                            highlight.FillColor = Color3.fromRGB(0, 0, 255)

                            highlight.OutlineColor = Color3.fromRGB(0, 0, 255)

                            highlight.Adornee = player.Character

                            highlight.Parent = game:GetService("CoreGui")

                            ESPHideHighlights[player] = highlight

                        end

                    else

                        if ESPHideHighlights[player] then

                            ESPHideHighlights[player]:Destroy()

                            ESPHideHighlights[player] = nil

                        end

                    end

                end

            end


            -- Cleanup highlights ao desativar

            if not ESPHideEnabled then

                for _, hl in pairs(ESPHideHighlights) do

                    hl:Destroy()

                end

                ESPHideHighlights = {}

            end

        end)

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


-- Serviços

local Players = game:GetService("Players")

local LocalPlayer = Players.LocalPlayer


-- Variável da plataforma

local SafePlatform = nil


-- Toggle Wind UI

local SafePlatformToggle = JumpTab:Toggle({

    Title = "Safe Platform",

    Desc = "Op for many games.",

    Icon = "building-2",

    Default = false,

    Callback = function(state)

        if state then

            -- Cria a plataforma se não existir

            if not SafePlatform then

                local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

                local HRP = Character:WaitForChild("HumanoidRootPart")


                SafePlatform = Instance.new("Part")

                SafePlatform.Name = "SafePlatform"

                SafePlatform.Size = Vector3.new(1000, 1, 1000)

                SafePlatform.Anchored = true

                SafePlatform.CanCollide = true

                SafePlatform.Transparency = 0.5

                SafePlatform.Material = Enum.Material.Neon

                SafePlatform.Color = Color3.fromRGB(0, 255, 0)


                -- Posiciona 6 studs abaixo do player e fica parada

                SafePlatform.Position = HRP.Position - Vector3.new(0, 6, 0)

                SafePlatform.Parent = workspace

            end

        else

            -- Remove a plataforma ao desativar

            if SafePlatform then

                SafePlatform:Destroy()

                SafePlatform = nil

            end

        end

    end

})


-- Serviços

local Players = game:GetService("Players")

local LocalPlayer = Players.LocalPlayer


-- Variável da plataforma

local SafePlatform = nil


-- Toggle Wind UI

local SafePlatformToggle = SkyTab:Toggle({

    Title = "Safe Platform",

    Desc = "Op for many games.",

    Icon = "building-2",

    Default = false,

    Callback = function(state)

        if state then

            -- Cria a plataforma se não existir

            if not SafePlatform then

                local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

                local HRP = Character:WaitForChild("HumanoidRootPart")


                SafePlatform = Instance.new("Part")

                SafePlatform.Name = "SafePlatform"

                SafePlatform.Size = Vector3.new(1000, 1, 1000)

                SafePlatform.Anchored = true

                SafePlatform.CanCollide = true

                SafePlatform.Transparency = 0.5

                SafePlatform.Material = Enum.Material.Neon

                SafePlatform.Color = Color3.fromRGB(0, 255, 0)


                -- Posiciona 6 studs abaixo do player e fica parada

                SafePlatform.Position = HRP.Position - Vector3.new(0, 6, 0)

                SafePlatform.Parent = workspace

            end

        else

            -- Remove a plataforma ao desativar

            if SafePlatform then

                SafePlatform:Destroy()

                SafePlatform = nil

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


-- Parte para onde vamos teleportar no TP Starting

local startingPart = workspace:FindFirstChild("startingcrossedover")


-- Função para encontrar o jogador mais próximo com CarryPrompt e sem SafeRedLightGreenLight

local function getNearestValidPlayer()

    local closestPlayer = nil

    local shortestDistance = math.huge


    for _, player in ipairs(Players:GetPlayers()) do

        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then

            -- Ignora jogadores com SafeRedLightGreenLight

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


-- Função para salvar 1 jogador e teleportar para o safeCFrame

local function saveRandomPlayer()

    local target = getNearestValidPlayer()

    if not target or not target.Character or not target.Character:FindFirstChild("HumanoidRootPart") then

        warn("Nenhum jogador próximo com CarryPrompt válido encontrado!")

        return

    end


    local prompt = target.Character:FindFirstChild("CarryPrompt", true)

    if prompt then

        local humanoidRoot = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")

        if humanoidRoot then

            -- Teleporta para perto do jogador

            humanoidRoot.CFrame = target.Character.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0)


            -- Interage com o CarryPrompt

            task.wait(0.15)

            fireproximityprompt(prompt)


            -- Teleporta para o safeCFrame

            task.wait(0.25)

            humanoidRoot.CFrame = safeCFrame

        end

    end

end


-- Função para salvar 1 jogador e teleportar para startingcrossedover

local function tpToStarting()

    local target = getNearestValidPlayer()

    if not startingPart then

        warn("A part 'startingcrossedover' não foi encontrada!")

        return

    end


    if not target or not target.Character or not target.Character:FindFirstChild("HumanoidRootPart") then

        warn("Nenhum jogador válido para CarryPrompt encontrado!")

        return

    end


    local prompt = target.Character:FindFirstChild("CarryPrompt", true)

    if prompt then

        local humanoidRoot = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")

        if humanoidRoot then

            -- Teleporta para perto do jogador

            humanoidRoot.CFrame = target.Character.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0)


            -- Usa o CarryPrompt

            task.wait(0.15)

            fireproximityprompt(prompt)


            -- Teleporta para o ponto inicial

            task.wait(0.25)

            humanoidRoot.CFrame = startingPart.CFrame + Vector3.new(0, 5, 0)

        end

    end

end


-- Variável para controle do AUTO SAVE

local autoSave = false

local autoSaveConnection


-- Botão CLICK → Salvar 1 jogador

local SaveButton = RedTab:Button({

    Title = "Save Random Player",

    Desc = "Carry and save one player.",

    Callback = function()

        saveRandomPlayer()

    end

})


-- Botão TOGGLE → Salvar jogadores infinitamente

local SaveToggle = RedTab:Toggle({

    Title = "AUTO Save",

    Desc = "Carry and save all players randomtime.",

    Icon = "user-check",

    Default = false,

    Callback = function(state)

        autoSave = state

        if autoSave then

            autoSaveConnection = RunService.Heartbeat:Connect(function()

                saveRandomPlayer()

                task.wait(0.5)

            end)

        else

            if autoSaveConnection then

                autoSaveConnection:Disconnect()

                autoSaveConnection = nil

            end

        end

    end

})



local Players = game:GetService("Players")

local TweenService = game:GetService("TweenService")

local LocalPlayer = Players.LocalPlayer

local HRP = nil


local AutoKillEnabled = false


local AutoKillToggle = HideSeekTab:Toggle({

    Title = "AUTO KILL HIDE",

    Desc = "Automatically teleports to the player wearing BlueVest and follows them.",

    Default = false,

    Callback = function(Value)

        AutoKillEnabled = Value


        if AutoKillEnabled then

            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then

                HRP = LocalPlayer.Character.HumanoidRootPart


                -- Procura o jogador com BlueVest

                local targetPlayer = nil

                for _, player in ipairs(Players:GetPlayers()) do

                    if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Humanoid") then

                        local vest = player.Character:FindFirstChild("BlueVest")

                        if vest then

                            targetPlayer = player

                            break

                        end

                    end

                end


                if targetPlayer and targetPlayer.Character then

                    -- Prioriza Torso no R6, senão usa UpperTorso no R15, e fallback pro HRP

                    local targetTorso = targetPlayer.Character:FindFirstChild("Torso") or 

                                        targetPlayer.Character:FindFirstChild("UpperTorso") or 

                                        targetPlayer.Character:FindFirstChild("HumanoidRootPart")


                    if targetTorso then

                        -- Teleporta uma vez para o alvo

                        HRP.CFrame = targetTorso.CFrame + Vector3.new(0, 3, 0)


                        -- Loop para seguir com Tween

                        task.spawn(function()

                            while AutoKillEnabled and targetPlayer.Character and targetTorso and targetTorso.Parent do

                                local goal = {CFrame = targetTorso.CFrame + Vector3.new(0, 3, 0)}

                                local tween = TweenService:Create(

                                    HRP,

                                    TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), -- Mais rápido

                                    goal

                                )

                                tween:Play()

                                tween.Completed:Wait()

                                task.wait(0.05) -- Pequeno delay para suavizar

                            end

                        end)

                    end

                end

            end

        end

    end

})



local Players = game:GetService("Players")

local LocalPlayer = Players.LocalPlayer

local HRP = nil


local AutoKillAllEnabled = false


local AutoKillAllToggle = LightsTab:Toggle({

    Title = "AUTO KILL PLAYERS",

    Desc = "Instantly teleports inside any player's torso and sticks to them.",

    Default = false,

    Callback = function(Value)

        AutoKillAllEnabled = Value


        if AutoKillAllEnabled then

            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then

                HRP = LocalPlayer.Character.HumanoidRootPart


                task.spawn(function()

                    while AutoKillAllEnabled do

                        local targetPlayer = nil


                        -- Procura qualquer player válido, exceto você

                        for _, player in ipairs(Players:GetPlayers()) do

                            if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health > 0 then

                                targetPlayer = player

                                break

                            end

                        end


                        if targetPlayer and targetPlayer.Character then

                            -- Prioriza torso (R6), depois UpperTorso (R15), depois HRP

                            local targetTorso = targetPlayer.Character:FindFirstChild("Torso") or

                                                targetPlayer.Character:FindFirstChild("UpperTorso") or

                                                targetPlayer.Character:FindFirstChild("HumanoidRootPart")


                            if targetTorso then

                                -- Colar dentro do torso do jogador

                                HRP.CFrame = targetTorso.CFrame

                            end

                        end


                        task.wait() -- Atualiza a cada frame

                    end

                end)

            end

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

    Name = "AUTO PULL",

    Desc = "Automatically pull in Tug-of-War mini-game",

    CheckBox = false,

    Icon = nil,

    Callback = function(value)

        AutoPullEnabled = value

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
