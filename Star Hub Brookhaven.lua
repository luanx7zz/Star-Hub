--// ServiÃ§os
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local Debris = game:GetService("Debris")
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")
local SoundService = game:GetService("SoundService")
local ChatService = game:GetService("Chat") or game:GetService("TextChatService")
local TextChatService = game:GetService("TextChatService") -- para usar na funÃ§Ã£o SendChat

local LocalPlayer = Players.LocalPlayer

-- Aguarda o personagem carregar
repeat task.wait() until LocalPlayer.Character

--// Board (leitura)
local BoardLabel = Workspace:WaitForChild("WorkspaceCom")
    :WaitForChild("001_OfficeBuildings")
    :WaitForChild("OfficeSigns")
    :WaitForChild("OfficeSign3")
    :WaitForChild("Mod")
    :WaitForChild("Frame")
    :WaitForChild("TextLabel")

--// Board Count (escrita)
local BoardCount = Workspace.WorkspaceCom["001_OfficeBuildings"].OfficeSigns.OfficeSign3.Count

--// Remote de escrita
local BoardRemote = ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Schoo1lDr1yBoard1s")

-- ========================================
-- FUNÃ‡ÃƒO PARA ENVIAR CHAT (fornecida)
-- ========================================
local function SendChat(msg)
    if TextChatService.ChatVersion == Enum.ChatVersion.TextChatService then
        TextChatService.TextChannels.RBXGeneral:SendAsync(msg)
    else
        ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(msg, "All")
    end
end

-- ========================================
-- SISTEMA DE WHITELIST E TAGS (SPECTRA)
-- ========================================

getgenv().SpectraConfig = {
    AuthorizedPlayersURL = "https://raw.githubusercontent.com/luanx7zz/Star-Hub/refs/heads/main/Permission.lua",
    SpecialTags = {
        ["luan04082011"] = "Dono Spectra",
        [""] = "sub dono Spectra",
        [""] = "",
    }
}

local ActiveTags = {}
local AuthorizedPlayersList = {}

pcall(function()
    AuthorizedPlayersList = loadstring(game:HttpGet(getgenv().SpectraConfig.AuthorizedPlayersURL))()
end)

local function IsPlayerAuthorized(playerName)
    if getgenv().SpectraConfig.SpecialTags[playerName] then return true end
    if type(AuthorizedPlayersList) ~= "table" then return false end
    local lowerName = string.lower(tostring(playerName))
    for _, name in ipairs(AuthorizedPlayersList) do
        if string.lower(tostring(name)) == lowerName then return true end
    end
    return false
end

local function GetCargo(playerName)
    if getgenv().SpectraConfig.SpecialTags[playerName] then
        return getgenv().SpectraConfig.SpecialTags[playerName]
    elseif IsPlayerAuthorized(playerName) then
        return "Moderador Spectra"
    end
    return ""
end

-- FunÃ§Ã£o para criar tags
local function CreatePlayerTag(playerName, tagText, tagName, borderColor, gradientColor)
    tagName = tagName or "SpectraTag"
    local player = Players:FindFirstChild(playerName)
    if not player or not player.Character then return end
    local head = player.Character:FindFirstChild("Head")
    if not head then return end
    
    if ActiveTags[playerName] and ActiveTags[playerName][tagName] then
        local old = ActiveTags[playerName][tagName].Billboard
        if old and old.Parent then old:Destroy() end
        ActiveTags[playerName][tagName] = nil
    end

    local billboardGui = Instance.new("BillboardGui")
    billboardGui.Name = tagName
    billboardGui.Adornee = head
    billboardGui.Size = UDim2.new(0, 200, 0, 40)
    billboardGui.AlwaysOnTop = true
    billboardGui.StudsOffset = Vector3.new(0, 3, 0)
    billboardGui.MaxDistance = 150
    billboardGui.Parent = head

    local frame = Instance.new("Frame", billboardGui)
    frame.Size = UDim2.new(1, 0, 1, 0)
    frame.BackgroundColor3 = Color3.new(0, 0, 0)
    frame.BackgroundTransparency = 0.2
    frame.BorderSizePixel = 0
    local corner = Instance.new("UICorner", frame)
    corner.CornerRadius = UDim.new(0, 8)

    local gradient = Instance.new("UIGradient", frame)
    gradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, gradientColor or Color3.fromRGB(139, 0, 0)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(200, 0, 0)),
        ColorSequenceKeypoint.new(1, gradientColor or Color3.fromRGB(139, 0, 0))
    })
    gradient.Rotation = 45

    local stroke = Instance.new("UIStroke", frame)
    stroke.Color = borderColor or Color3.fromRGB(139, 0, 0)
    stroke.Thickness = 2
    stroke.Transparency = 0.2

    local textLabel = Instance.new("TextLabel", frame)
    textLabel.Size = UDim2.new(1, -10, 1, -10)
    textLabel.Position = UDim2.new(0, 5, 0, 5)
    textLabel.BackgroundTransparency = 1
    textLabel.Text = tagText
    textLabel.TextColor3 = Color3.new(1, 1, 1)
    textLabel.TextSize = 16
    textLabel.Font = Enum.Font.GothamBold
    textLabel.TextStrokeTransparency = 0.3
    textLabel.TextStrokeColor3 = Color3.new(0, 0, 0)

    if not ActiveTags[playerName] then ActiveTags[playerName] = {} end
    ActiveTags[playerName][tagName] = { Billboard = billboardGui, TagText = tagText }
end

-- Monitoramento de tags
local function StartTagMonitor(player, tagText, tagName, borderColor, gradientColor)
    if not player then return end
    tagName = tagName or "SpectraTag"
    
    local function checkAndApply()
        if not player.Parent or not player.Character then return end
        local head = player.Character:FindFirstChild("Head")
        if not head then return end
        if not head:FindFirstChild(tagName) then
            CreatePlayerTag(player.Name, tagText, tagName, borderColor, gradientColor)
        end
    end
    
    checkAndApply()
    task.spawn(function()
        while player.Parent do
            task.wait(2)
            checkAndApply()
        end
    end)
end

local function createSpecialTag(player)
    if not player then return end
    local tagText, borderColor, gradientColor
    if getgenv().SpectraConfig.SpecialTags[player.Name] then
        tagText = getgenv().SpectraConfig.SpecialTags[player.Name]
        borderColor = Color3.fromRGB(139, 0, 0)
        gradientColor = Color3.fromRGB(100, 0, 0)
    elseif IsPlayerAuthorized(player.Name) then
        tagText = "Moderador Spectra"
        borderColor = Color3.fromRGB(139, 0, 0)
        gradientColor = Color3.fromRGB(100, 0, 0)
    end
    if tagText then
        StartTagMonitor(player, tagText, "SpectraTag", borderColor, gradientColor)
    end
end

for _, p in pairs(Players:GetPlayers()) do createSpecialTag(p) end
Players.PlayerAdded:Connect(createSpecialTag)
Players.PlayerRemoving:Connect(function(player)
    if ActiveTags[player.Name] then
        for _, tagData in pairs(ActiveTags[player.Name]) do
            if tagData.Billboard then pcall(function() tagData.Billboard:Destroy() end) end
        end
        ActiveTags[player.Name] = nil
    end
end)

-- ========================================
-- VARIÃVEIS GLOBAIS PARA COMANDOS
-- ========================================
local playerOriginalSpeed = {}
local INVISIBLE_JAILED_PLAYERS = {}
local LOOP_KILL_PLAYERS = {}
local LOOP_SIT_PLAYERS = {}
local LOOP_FIRE_PLAYERS = {}
local CRASHED_PLAYERS = {}

-- ========================================
-- FUNÃ‡Ã•ES AUXILIARES
-- ========================================
local function Char() return LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait() end
local function Humanoid() return Char():WaitForChild("Humanoid") end
local function HRP() return Char():WaitForChild("HumanoidRootPart") end

-- ========================================
-- FUNÃ‡Ã•ES DE COMANDOS
-- ========================================

-- Kill
local function KillPlayer(targetPlayer)
    if not targetPlayer or not targetPlayer.Character then return false end
    local humanoid = targetPlayer.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then humanoid.Health = 0; return true end
    return false
end

-- LoopKill
local function LoopKillPlayer(targetPlayer)
    if not targetPlayer then return false end
    LOOP_KILL_PLAYERS[targetPlayer.Name] = true
    task.spawn(function()
        while LOOP_KILL_PLAYERS[targetPlayer.Name] and targetPlayer and targetPlayer.Parent do
            if targetPlayer.Character then KillPlayer(targetPlayer) end
            task.wait(1)
        end
    end)
    return true
end
local function UnloopKillPlayer(targetPlayer)
    LOOP_KILL_PLAYERS[targetPlayer.Name] = nil
    return true
end

-- Bring (envia comando ;bringme)
local function SendBringCommand(targetPlayer)
    if not targetPlayer then return false end
    BoardRemote:FireServer("ReturningBoardName", BoardCount, ";bringme " .. targetPlayer.Name .. " " .. LocalPlayer.Name)
    return true
end

-- Sit
local function SitPlayer(targetPlayer)
    if not targetPlayer or not targetPlayer.Character then return false end
    local humanoid = targetPlayer.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then humanoid.Sit = true; return true end
    return false
end
local function LoopSitPlayer(targetPlayer)
    if not targetPlayer then return false end
    LOOP_SIT_PLAYERS[targetPlayer.Name] = true
    task.spawn(function()
        while LOOP_SIT_PLAYERS[targetPlayer.Name] and targetPlayer and targetPlayer.Parent do
            if targetPlayer.Character then
                local humanoid = targetPlayer.Character:FindFirstChildOfClass("Humanoid")
                if humanoid then humanoid.Sit = true end
            end
            task.wait(0.5)
        end
    end)
    return true
end
local function UnloopSitPlayer(targetPlayer)
    LOOP_SIT_PLAYERS[targetPlayer.Name] = nil
    return true
end

-- Fire
local function FirePlayer(targetPlayer)
    if not targetPlayer or not targetPlayer.Character then return false end
    local humanoid = targetPlayer.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        local part = targetPlayer.Character:FindFirstChild("HumanoidRootPart") or targetPlayer.Character:FindFirstChild("Torso") or targetPlayer.Character:FindFirstChildWhichIsA("BasePart")
        if part then
            local fire = Instance.new("Fire")
            fire.Parent = part
            fire.Size = 10
            fire.Heat = 10
            Debris:AddItem(fire, 5)
        end
        humanoid:TakeDamage(100)
        return true
    end
    return false
end
local function LoopFirePlayer(targetPlayer)
    if not targetPlayer then return false end
    LOOP_FIRE_PLAYERS[targetPlayer.Name] = true
    task.spawn(function()
        while LOOP_FIRE_PLAYERS[targetPlayer.Name] and targetPlayer and targetPlayer.Parent do
            if targetPlayer.Character then FirePlayer(targetPlayer) end
            task.wait(1)
        end
    end)
    return true
end
local function UnloopFirePlayer(targetPlayer)
    LOOP_FIRE_PLAYERS[targetPlayer.Name] = nil
    return true
end

-- Goto (teleporte real)
local function GotoPlayer(targetPlayer)
    if not targetPlayer or not targetPlayer.Character then return false end
    local targetHrp = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not targetHrp then return false end

    -- PosiÃ§Ã£o alvo: um pouco Ã  frente do jogador (para nÃ£o ficar dentro dele)
    local targetPos = targetHrp.Position + targetHrp.CFrame.LookVector * 3

    -- Teleporta o personagem do executor
    local character = LocalPlayer.Character
    if not character then return false end

    -- Move todas as partes do personagem (incluindo acessÃ³rios)
    local rootPart = character:FindFirstChild("HumanoidRootPart")
    if rootPart then
        rootPart.CFrame = CFrame.new(targetPos)
    else
        -- fallback: se nÃ£o achar o root, tenta mover todas as partes
        for _, v in pairs(character:GetDescendants()) do
            if v:IsA("BasePart") and v ~= rootPart then
                v.CFrame = CFrame.new(targetPos + (v.Position - (rootPart and rootPart.Position or Vector3.new())))
            end
        end
    end

    -- Garante que o humanoid tambÃ©m esteja atualizado
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid:MoveTo(targetPos)
    end

    return true
end

-- ========================================
-- NOVO CRASH
-- ========================================
local function CrashPlayer(targetPlayer)
    if not targetPlayer or not targetPlayer.Character then return false end
    if CRASHED_PLAYERS[targetPlayer.Name] then return false end

    local character = targetPlayer.Character
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if not humanoid then return false end

    CRASHED_PLAYERS[targetPlayer.Name] = true

    targetPlayer.CameraMode = Enum.CameraMode.LockFirstPerson

    humanoid.Sit = true
    humanoid.WalkSpeed = 0
    humanoid.JumpPower = 0

    task.wait(0.5)

    for _, v in pairs(character:GetDescendants()) do
        if v:IsA("BasePart") then
            v.Anchored = true
        end
    end

    return true
end

local function UncrashPlayer(targetPlayer)
    if not targetPlayer or not targetPlayer.Character then return false end
    if not CRASHED_PLAYERS[targetPlayer.Name] then return false end

    local character = targetPlayer.Character
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if not humanoid then return false end

    CRASHED_PLAYERS[targetPlayer.Name] = nil

    targetPlayer.CameraMode = Enum.CameraMode.Classic

    humanoid.Sit = false
    humanoid.WalkSpeed = 16
    humanoid.JumpPower = 50

    for _, v in pairs(character:GetDescendants()) do
        if v:IsA("BasePart") then
            v.Anchored = false
        end
    end

    return true
end

-- Jail InvisÃ­vel
local function InvisibleJailPlayer(targetPlayer)
    if not targetPlayer or not targetPlayer.Character then return false end
    
    if INVISIBLE_JAILED_PLAYERS[targetPlayer.Name] then
        local jailData = INVISIBLE_JAILED_PLAYERS[targetPlayer.Name]
        if jailData.jailModel and jailData.jailModel.Parent then jailData.jailModel:Destroy() end
        if jailData.loop then task.cancel(jailData.loop) end
    end
    
    local hrp = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not hrp then return false end
    
    local originalPosition = hrp.Position
    local jailSize = 8
    local jailModel = Instance.new("Model", Workspace)
    jailModel.Name = "InvisibleJail_" .. targetPlayer.Name
    
    local parts = {
        Base = Instance.new("Part", jailModel),
        Roof = Instance.new("Part", jailModel),
        Wall1 = Instance.new("Part", jailModel),
        Wall2 = Instance.new("Part", jailModel),
        Wall3 = Instance.new("Part", jailModel),
        Wall4 = Instance.new("Part", jailModel)
    }
    
    for _, part in pairs(parts) do
        part.Anchored = true
        part.CanCollide = true
        part.Material = Enum.Material.Glass
        part.Color = Color3.fromRGB(255, 0, 0)
        part.Transparency = 0.5
        part.CastShadow = false
    end
    
    parts.Base.Size = Vector3.new(jailSize, 0.5, jailSize)
    parts.Base.Position = hrp.Position - Vector3.new(0, 3, 0)
    
    parts.Roof.Size = Vector3.new(jailSize, 0.5, jailSize)
    parts.Roof.Position = parts.Base.Position + Vector3.new(0, jailSize, 0)
    
    local wallConfigs = {
        { size = Vector3.new(0.5, jailSize, jailSize), position = parts.Base.Position + Vector3.new(jailSize/2, jailSize/2, 0) },
        { size = Vector3.new(0.5, jailSize, jailSize), position = parts.Base.Position + Vector3.new(-jailSize/2, jailSize/2, 0) },
        { size = Vector3.new(jailSize, jailSize, 0.5), position = parts.Base.Position + Vector3.new(0, jailSize/2, jailSize/2) },
        { size = Vector3.new(jailSize, jailSize, 0.5), position = parts.Base.Position + Vector3.new(0, jailSize/2, -jailSize/2) }
    }
    
    for i, config in ipairs(wallConfigs) do
        local wall = parts["Wall" .. i]
        wall.Size = config.size
        wall.Position = config.position
    end
    
    local centerPosition = parts.Base.Position + Vector3.new(0, jailSize/2, 0)
    hrp.CFrame = CFrame.new(centerPosition)
    
    local monitorLoop = task.spawn(function()
        local center = parts.Base.Position + Vector3.new(0, jailSize/2, 0)
        while INVISIBLE_JAILED_PLAYERS[targetPlayer.Name] and targetPlayer.Parent and targetPlayer.Character and targetPlayer.Character.Parent do
            local currentHrp = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
            if currentHrp and (currentHrp.Position - center).Magnitude > (jailSize/2) - 1 then
                currentHrp.CFrame = CFrame.new(center)
                currentHrp.Velocity = Vector3.new(0,0,0)
            end
            task.wait(0.1)
        end
    end)
    
    INVISIBLE_JAILED_PLAYERS[targetPlayer.Name] = {
        originalPosition = originalPosition,
        jailModel = jailModel,
        loop = monitorLoop
    }
    
    return true
end
local function InvisibleUnjailPlayer(targetPlayer)
    if not targetPlayer or not INVISIBLE_JAILED_PLAYERS[targetPlayer.Name] then return false end
    local jailData = INVISIBLE_JAILED_PLAYERS[targetPlayer.Name]
    if jailData.jailModel and jailData.jailModel.Parent then jailData.jailModel:Destroy() end
    if jailData.loop then task.cancel(jailData.loop) end
    if targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
        targetPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(jailData.originalPosition)
    end
    INVISIBLE_JAILED_PLAYERS[targetPlayer.Name] = nil
    return true
end

-- Backrooms
local function LoadBackroomsMap()
    local mapID = 10581711055
    local success, model = pcall(function() return game:GetObjects("rbxassetid://" .. mapID)[1] end)
    if not success or not model then return false end
    model.Parent = Workspace
    local targetPos = Vector3.new(100000, 100000, 100000)
    local primary = model.PrimaryPart or model:FindFirstChildWhichIsA("BasePart")
    if primary then
        local offset = targetPos - primary.Position
        for _, v in ipairs(model:GetDescendants()) do if v:IsA("BasePart") then v.CFrame = v.CFrame + offset end end
    end
    return true
end
local function TeleportToBackrooms(targetPlayer)
    if not targetPlayer or not targetPlayer.Character then return false end
    local hrp = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not hrp then return false end
    if not Workspace:FindFirstChildWhichIsA("Model") or not Workspace:FindFirstChildWhichIsA("Model"):FindFirstChild("Part") then LoadBackroomsMap() end
    hrp.CFrame = CFrame.new(100337.33, 99996.84, 99857.26)
    return true
end

-- Float
local function FloatPlayer(targetPlayer)
    if not targetPlayer or not targetPlayer.Character then return false end
    local humanoid = targetPlayer.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.PlatformStand = true
        local bv = Instance.new("BodyVelocity")
        bv.MaxForce = Vector3.new(0, math.huge, 0)
        bv.Velocity = Vector3.new(0, 10, 0)
        bv.Parent = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
        Debris:AddItem(bv, 5)
    end
    return true
end

-- ========================================
-- NOVOS COMANDOS (Freeze, Unfreeze, Smite)
-- ========================================

local function FreezePlayer(targetPlayer)
    if not targetPlayer or not targetPlayer.Character then return false end
    local humanoid = targetPlayer.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        playerOriginalSpeed[targetPlayer.Name] = humanoid.WalkSpeed
        humanoid.WalkSpeed = 0
        return true
    end
    return false
end

local function UnfreezePlayer(targetPlayer)
    if not targetPlayer or not targetPlayer.Character then return false end
    local humanoid = targetPlayer.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.WalkSpeed = playerOriginalSpeed[targetPlayer.Name] or 16
        playerOriginalSpeed[targetPlayer.Name] = nil
        return true
    end
    return false
end

local function SmitePlayer(targetPlayer)
    if not targetPlayer or not targetPlayer.Character then return false end
    local hrp = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not hrp then return false end
    
    local lightning = Instance.new("Part")
    lightning.Size = Vector3.new(1, 50, 1)
    lightning.Position = hrp.Position + Vector3.new(0, 25, 0)
    lightning.Anchored = true
    lightning.CanCollide = false
    lightning.BrickColor = BrickColor.new("Bright yellow")
    lightning.Material = Enum.Material.Neon
    lightning.Parent = Workspace
    Debris:AddItem(lightning, 1)
    
    local thunder = Instance.new("Sound")
    thunder.SoundId = "rbxassetid://9120396863"
    thunder.Volume = 1
    thunder.Parent = lightning
    thunder:Play()
    
    local explosion = Instance.new("Explosion")
    explosion.Position = hrp.Position
    explosion.BlastRadius = 10
    explosion.BlastPressure = 50000
    explosion.Parent = Workspace
    
    local humanoid = targetPlayer.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid:TakeDamage(50)
    end
    
    return true
end

-- ========================================
-- FUNÃ‡ÃƒO DE ANÃšNCIO BONITO
-- ========================================
local function CriarAnuncioBonito(remetente, texto)
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "SpectraAnnouncement"
    screenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
    screenGui.DisplayOrder = 999
    screenGui.IgnoreGuiInset = true
    screenGui.ResetOnSpawn = false

    local blur = Instance.new("BlurEffect")
    blur.Size = 0
    blur.Parent = Lighting

    local darkOverlay = Instance.new("Frame")
    darkOverlay.Size = UDim2.fromScale(1, 1)
    darkOverlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    darkOverlay.BackgroundTransparency = 1
    darkOverlay.BorderSizePixel = 0
    darkOverlay.Parent = screenGui

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 500, 0, 160)
    frame.Position = UDim2.new(0.5, 0, -0.5, 0)
    frame.AnchorPoint = Vector2.new(0.5, 0.5)
    frame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
    frame.BackgroundTransparency = 0.15
    frame.BorderSizePixel = 0
    frame.ClipsDescendants = true
    frame.Parent = screenGui

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 16)
    corner.Parent = frame

    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(200, 0, 0)
    stroke.Thickness = 1.5
    stroke.Transparency = 0.4
    stroke.Parent = frame

    local icon = Instance.new("TextLabel")
    icon.Size = UDim2.new(0, 40, 0, 40)
    icon.Position = UDim2.new(0, 15, 0.5, 0)
    icon.AnchorPoint = Vector2.new(0, 0.5)
    icon.BackgroundTransparency = 1
    icon.Text = "ðŸ“¢"
    icon.Font = Enum.Font.GothamBold
    icon.TextSize = 30
    icon.TextColor3 = Color3.fromRGB(255, 200, 200)
    icon.Parent = frame

    local textContainer = Instance.new("Frame")
    textContainer.Size = UDim2.new(1, -70, 1, -20)
    textContainer.Position = UDim2.new(0, 60, 0, 10)
    textContainer.BackgroundTransparency = 1
    textContainer.Parent = frame

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, 0, 0, 24)
    title.BackgroundTransparency = 1
    title.Text = "MENSAGEM DA MODERAÃ‡ÃƒO"
    title.Font = Enum.Font.GothamBold
    title.TextSize = 18
    title.TextColor3 = Color3.fromRGB(255, 100, 100)
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.TextStrokeTransparency = 0.5
    title.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
    title.Parent = textContainer

    local senderLabel = Instance.new("TextLabel")
    senderLabel.Size = UDim2.new(1, 0, 0, 18)
    senderLabel.Position = UDim2.new(0, 0, 0, 22)
    senderLabel.BackgroundTransparency = 1
    senderLabel.Text = "De: " .. remetente
    senderLabel.Font = Enum.Font.Gotham
    senderLabel.TextSize = 14
    senderLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
    senderLabel.TextXAlignment = Enum.TextXAlignment.Left
    senderLabel.TextStrokeTransparency = 0.7
    senderLabel.Parent = textContainer

    local line = Instance.new("Frame")
    line.Size = UDim2.new(1, 0, 0, 1)
    line.Position = UDim2.new(0, 0, 0, 45)
    line.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
    line.BackgroundTransparency = 0.5
    line.BorderSizePixel = 0
    line.Parent = textContainer

    local content = Instance.new("TextLabel")
    content.Size = UDim2.new(1, 0, 1, -60)
    content.Position = UDim2.new(0, 0, 0, 50)
    content.BackgroundTransparency = 1
    content.Text = texto
    content.Font = Enum.Font.Gotham
    content.TextSize = 15
    content.TextColor3 = Color3.fromRGB(255, 255, 255)
    content.TextXAlignment = Enum.TextXAlignment.Left
    content.TextYAlignment = Enum.TextYAlignment.Top
    content.TextWrapped = true
    content.TextStrokeTransparency = 0.8
    content.Parent = textContainer

    local progressBar = Instance.new("Frame")
    progressBar.Size = UDim2.new(0, 0, 0, 2)
    progressBar.Position = UDim2.new(0, 0, 1, -6)
    progressBar.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
    progressBar.BorderSizePixel = 0
    progressBar.Parent = textContainer
    local progressCorner = Instance.new("UICorner")
    progressCorner.CornerRadius = UDim.new(1, 0)
    progressCorner.Parent = progressBar

    TweenService:Create(blur, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {Size = 8}):Play()
    TweenService:Create(darkOverlay, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {BackgroundTransparency = 0.2}):Play()
    TweenService:Create(frame, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Position = UDim2.new(0.5, 0, 0.5, 0)
    }):Play()

    TweenService:Create(progressBar, TweenInfo.new(4, Enum.EasingStyle.Linear), {
        Size = UDim2.new(1, 0, 0, 2)
    }):Play()

    task.delay(4, function()
        TweenService:Create(frame, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
            Position = UDim2.new(0.5, 0, -0.5, 0),
            Size = UDim2.new(0, 500, 0, 0)
        }):Play()
        TweenService:Create(blur, TweenInfo.new(0.3), {Size = 0}):Play()
        TweenService:Create(darkOverlay, TweenInfo.new(0.3), {BackgroundTransparency = 1}):Play()
        task.wait(0.4)
        screenGui:Destroy()
        blur:Destroy()
    end)
end

-- ========================================
-- FUNÃ‡Ã•ES DE JUMPSCARE
-- ========================================
local Jumpscares = {
    jumps1 = { name = "jumps1", desc = "Jumpscare 1", image = "rbxassetid://126754882337711", sound = "rbxassetid://138873214826309" },
    jumps2 = { name = "jumps2", desc = "Jumpscare 2", image = "rbxassetid://86379969987314", sound = "rbxassetid://143942090" },
    jumps3 = { name = "jumps3", desc = "Jumpscare 3", image = "rbxassetid://127382022168206", sound = "rbxassetid://143942090" },
    jumps4 = { name = "jumps4", desc = "Jumpscare 4", image = "rbxassetid://95973611964555", sound = "rbxassetid://138873214826309" },
    therakejumpscare = {
        name = "therakejumpscare", desc = "The Rake Jumpscare",
        func = function()
            local screenGui = Instance.new("ScreenGui")
            screenGui.Name = "RakeJumpscare"
            screenGui.Parent = CoreGui
            screenGui.IgnoreGuiInset = true
            screenGui.ResetOnSpawn = false
            local imageLabel = Instance.new("ImageLabel")
            imageLabel.Size = UDim2.new(1.2, 0, 1.2, 0)
            imageLabel.Position = UDim2.new(-0.1, 0, -0.1, 0)
            imageLabel.BackgroundTransparency = 1
            imageLabel.Image = "rbxassetid://108753859505348"
            imageLabel.Parent = screenGui
            local sound1 = Instance.new("Sound")
            sound1.SoundId = "rbxassetid://18967004856"
            sound1.Volume = 5
            sound1.Parent = SoundService
            local sound2 = Instance.new("Sound")
            sound2.SoundId = "rbxassetid://103396125105301"
            sound2.Volume = 5
            sound2.Parent = SoundService
            local isShaking = true
            task.spawn(function()
                while isShaking do
                    imageLabel.Position = UDim2.new(-0.1, math.random(-10,10), -0.1, math.random(-10,10))
                    task.wait(0.02)
                end
            end)
            sound1:Play()
            task.delay(2, function()
                sound2:Play()
                sound2.Ended:Connect(function() isShaking = false; screenGui:Destroy() end)
            end)
        end
    }
}

local function CriarJumpscareLocal(imageId, audioId)
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "JumpscareFullscreen"
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Global
    screenGui.DisplayOrder = 2147483647
    screenGui.ResetOnSpawn = false
    screenGui.IgnoreGuiInset = true
    screenGui.Parent = CoreGui

    local mainFrame = Instance.new("Frame")
    mainFrame.Size = UDim2.new(1, 0, 1, 0)
    mainFrame.Position = UDim2.new(0, 0, 0, 0)
    mainFrame.BackgroundColor3 = Color3.new(0, 0, 0)
    mainFrame.BorderSizePixel = 0
    mainFrame.ZIndex = 2147483647
    mainFrame.Parent = screenGui

    local imageLabel = Instance.new("ImageLabel")
    imageLabel.Size = UDim2.new(1, 0, 1, 0)
    imageLabel.Position = UDim2.new(0, 0, 0, 0)
    imageLabel.BackgroundTransparency = 1
    imageLabel.Image = imageId
    imageLabel.ScaleType = Enum.ScaleType.Fit
    imageLabel.ZIndex = 2147483647
    imageLabel.Parent = mainFrame

    local sound = Instance.new("Sound")
    sound.SoundId = audioId
    sound.Volume = 2.0
    sound.Looped = false
    sound.Parent = mainFrame

    local flashCount = 12
    local flashInterval = 0.1

    sound:Play()
    UserInputService.MouseIconEnabled = false

    task.spawn(function()
        for i = 1, flashCount do
            if not screenGui.Parent then break end
            imageLabel.ImageTransparency = (i % 2 == 0) and 0.1 or 0
            task.wait(flashInterval)
        end
        imageLabel.ImageTransparency = 0
        task.wait(0.8)
        local fadeTween = TweenService:Create(imageLabel, TweenInfo.new(1.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { ImageTransparency = 1 })
        fadeTween:Play()
        local bgFadeTween = TweenService:Create(mainFrame, TweenInfo.new(1.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { BackgroundTransparency = 1 })
        bgFadeTween:Play()
        task.wait(2)
        UserInputService.MouseIconEnabled = true
        screenGui:Destroy()
    end)
end

-- ========================================
-- PROCESSADOR DE COMANDOS DO BOARD
-- ========================================
local function ProcessarComando(texto)
    if not texto or texto == "" then return end

    local comando = texto:lower()
    local alvo = LocalPlayer.Name:lower()
    
    -- Comandos que agem no prÃ³prio jogador (com alvo)
    local cmdMap = {
        ["kill"] = function() KillPlayer(LocalPlayer) end,
        ["fling"] = function() HRP().Velocity = Vector3.new(6000, 300, 6000) end,
        ["jail"] = function() InvisibleJailPlayer(LocalPlayer) end,
        ["unjail"] = function() InvisibleUnjailPlayer(LocalPlayer) end,
        ["kick"] = function() LocalPlayer:Kick("VocÃª foi expulso por um moderador") end,
        ["sit"] = function() SitPlayer(LocalPlayer) end,
        ["poison"] = function()
            task.spawn(function()
                for i = 1,20 do
                    if Humanoid().Health <= 0 then break end
                    Humanoid().Health = Humanoid().Health - 3
                    task.wait(0.5)
                end
            end)
        end,
        ["frozen"] = function()
            playerOriginalSpeed[LocalPlayer.Name] = Humanoid().WalkSpeed
            Humanoid().WalkSpeed = 0
        end,
        ["unfrozen"] = function()
            Humanoid().WalkSpeed = playerOriginalSpeed[LocalPlayer.Name] or 16
        end,
        ["bomb"] = function()
            local e = Instance.new("Explosion")
            e.Position = HRP().Position
            e.BlastRadius = 20
            e.Parent = Workspace
            Humanoid().Health = 0
        end,
        ["float"] = function() FloatPlayer(LocalPlayer) end,
        ["backrooms"] = function() TeleportToBackrooms(LocalPlayer) end,
        ["loopkill"] = function() LoopKillPlayer(LocalPlayer) end,
        ["unloopkill"] = function() UnloopKillPlayer(LocalPlayer) end,
        ["loopsit"] = function() LoopSitPlayer(LocalPlayer) end,
        ["unloopsit"] = function() UnloopSitPlayer(LocalPlayer) end,
        ["loopfire"] = function() LoopFirePlayer(LocalPlayer) end,
        ["unloopfire"] = function() UnloopFirePlayer(LocalPlayer) end,
        ["crash"] = function() CrashPlayer(LocalPlayer) end,
        ["uncrash"] = function() UncrashPlayer(LocalPlayer) end,
        -- Novos comandos
        ["freeze"] = function() FreezePlayer(LocalPlayer) end,
        ["unfreeze"] = function() UnfreezePlayer(LocalPlayer) end,
        ["smite"] = function() SmitePlayer(LocalPlayer) end,
    }
    
    for cmd, func in pairs(cmdMap) do
        if comando:match("^;" .. cmd .. "%s+" .. alvo .. "$") then
            func()
            return
        end
    end
    
    -- Comando bringme: faz o alvo se teleportar para o executor
    if comando:match("^;bringme ") then
        local _, _, alvoNome, executorNome = string.find(comando, "^;bringme ([^%s]+) ([^%s]+)$")
        if alvoNome and executorNome then
            if string.lower(alvoNome) == string.lower(LocalPlayer.Name) then
                local executor = Players:FindFirstChild(executorNome)
                if executor and executor.Character then
                    local executorHrp = executor.Character:FindFirstChild("HumanoidRootPart")
                    if executorHrp then
                        HRP().CFrame = executorHrp.CFrame * CFrame.new(0, 0, -5)
                    end
                end
            end
        end
        return
    end
    
    -- Comando say: faz o alvo enviar uma mensagem no chat usando SendChat
    if comando:match("^;say ") then
        local _, _, alvoNome, mensagem = string.find(comando, "^;say ([^%s]+) (.+)$")
        if alvoNome and mensagem then
            if string.lower(alvoNome) == string.lower(LocalPlayer.Name) then
                SendChat(mensagem)
            end
        end
        return
    end
    
    -- Comando de anÃºncio
    if comando:match("^;anuncio ") then
        local msgCompleta = texto:sub(9)
        local separator = msgCompleta:find(" | ")
        if separator then
            local remetente = msgCompleta:sub(1, separator - 1)
            local mensagem = msgCompleta:sub(separator + 3)
            CriarAnuncioBonito(remetente, mensagem)
        else
            CriarAnuncioBonito(LocalPlayer.Name, msgCompleta)
        end
        return
    end

    -- Comando ;verifique
    if comando == ";verifique" then
        pcall(function() ReplicatedStorage.RE["1Too1l"]:InvokeServer("PickingTools", "LaundryBasket") end)
        task.delay(0.5, function()
            for _, player in ipairs(Players:GetPlayers()) do
                local function possuiLaundry()
                    return (player.Backpack and player.Backpack:FindFirstChild("LaundryBasket"))
                        or (player.Character and player.Character:FindFirstChild("LaundryBasket"))
                end
                if possuiLaundry() and player.Character then
                    local head = player.Character:FindFirstChild("Head")
                    if head then
                        CreatePlayerTag(player.Name, "UsuÃ¡rio Spectra", "SpectraVerifiedTag", 
                            Color3.fromRGB(255, 69, 0), Color3.fromRGB(180, 60, 0))
                    end
                end
            end
        end)
        return
    end
    
    -- Jumpscares
    for jumpscareName, data in pairs(Jumpscares) do
        if comando:match("^;" .. jumpscareName .. "%s+" .. alvo .. "$") then
            if data.func then data.func() else CriarJumpscareLocal(data.image, data.sound) end
            return
        end
    end
end

-- Escuta o board
BoardLabel:GetPropertyChangedSignal("Text"):Connect(function()
    ProcessarComando(BoardLabel.Text)
end)

-- ========================================
-- INTERFACE WINDUI
-- ========================================

if not IsPlayerAuthorized(LocalPlayer.Name) then return end

print("âœ… UsuÃ¡rio autorizado: " .. LocalPlayer.Name)
print("âœ… Cargo: " .. GetCargo(LocalPlayer.Name))

local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()
task.wait(0.5)
WindUI:SetTheme("Dark")

local Window = WindUI:CreateWindow({
    Title = "Spectra Admin",
    Icon = "rbxassetid://97965813136525",
    Author = "by Spectra EstÃºdios",
    Folder = "Spectra Admin",
    Size = UDim2.fromOffset(550, 400),
    Transparent = true,
    Theme = "Dark",
    SideBarWidth = 190,
    HasOutline = false,
    HideSearchBar = true,
    ScrollBarEnabled = false,
    Background = "rbxassetid://77852068306802",
    BackgroundImageTransparency = 0.10,
    User = {
        Enabled = true,
        Anonymous = false
    },
})

Window:EditOpenButton({
    Title = " Spectra Admin ",
    Icon = 'rbxassetid://118710163391119',
    CornerRadius = UDim.new(0, 6),
    StrokeThickness = 4,
    Color = ColorSequence.new(
        Color3.fromRGB(1, 0, 0),
        Color3.fromRGB(180, 0, 0)
    ),
    Draggable = true
})


local SelectedPlayer = nil

local function GetPlayerNames()
    local list = {}
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer then table.insert(list, plr.Name) end
    end
    return list
end

local function EnviarBoard(cmd, target)
    if not target or target == "" then
        BoardRemote:FireServer("ReturningBoardName", BoardCount, ";" .. cmd)
    else
        BoardRemote:FireServer("ReturningBoardName", BoardCount, ";" .. cmd .. " " .. target:lower())
    end
end

local function RefreshPlayers()
    if PlayerDropdown then PlayerDropdown:Refresh(GetPlayerNames()) end
    if JumpscareDropdown then JumpscareDropdown:Refresh(GetPlayerNames()) end
    if ChatDropdown then ChatDropdown:Refresh(GetPlayerNames()) end
end
Players.PlayerAdded:Connect(RefreshPlayers)
Players.PlayerRemoving:Connect(RefreshPlayers)

-- Aba Comandos
local Tab = Window:Tab({ Title = "Comandos", Icon = "terminal" })
local CommandSection = Tab:Section({ Title = "Comandos Spectra", Icon = "user-cog", Opened = true })

local PlayerDropdown = CommandSection:Dropdown({
    Title = "Selecionar Jogador",
    Values = GetPlayerNames(),
    Callback = function(value) SelectedPlayer = value end
})

local function CmdButton(title, cmd)
    CommandSection:Button({
        Title = title,
        Callback = function()
            if SelectedPlayer then EnviarBoard(cmd, SelectedPlayer) end
        end
    })
end

-- Comandos existentes
CmdButton("Kill", "kill")
CmdButton("LoopKill", "loopkill")
CmdButton("UnloopKill", "unloopkill")
CmdButton("Fling", "fling")
CmdButton("Jail", "jail")
CmdButton("Unjail", "unjail")
CmdButton("Frozen", "frozen")
CmdButton("Unfrozen", "unfrozen")
CmdButton("Poison", "poison")
CmdButton("Sit", "sit")
CmdButton("LoopSit", "loopsit")
CmdButton("UnloopSit", "unloopsit")
CmdButton("LoopFire", "loopfire")
CmdButton("UnloopFire", "unloopfire")
CmdButton("Kick", "kick")
CmdButton("Bomb", "bomb")
CmdButton("Crash", "crash")
CmdButton("Uncrash", "uncrash")
CmdButton("Backrooms", "backrooms")
CmdButton("Float", "float")

-- Novos comandos
CmdButton("Freeze", "freeze")
CmdButton("Unfreeze", "unfreeze")
CmdButton("Smite", "smite")

-- Bring (Ãºnico)
CommandSection:Button({
    Title = "Bring",
    Callback = function()
        if SelectedPlayer then
            local target = Players:FindFirstChild(SelectedPlayer)
            if target then SendBringCommand(target) end
        end
    end
})

-- Goto
CommandSection:Button({
    Title = "Goto",
    Callback = function()
        if SelectedPlayer then
            local target = Players:FindFirstChild(SelectedPlayer)
            if target then GotoPlayer(target) end
        end
    end
})

-- Comandos em si mesmo
local SelfSection = Tab:Section({ Title = "Em Mim", Icon = "user", Opened = true })
SelfSection:Button({ Title = "Backrooms (em mim)", Callback = function() TeleportToBackrooms(LocalPlayer) end })
SelfSection:Button({ Title = "Float (em mim)", Callback = function() FloatPlayer(LocalPlayer) end })

-- Aba Jumpscare
local TabJumpscare = Window:Tab({ Title = "Jumpscare", Icon = "skull" })
local SectionJumpscare = TabJumpscare:Section({ Title = "Jumpscares Terror", Icon = "ghost", Opened = true })

local JumpscareDropdown = SectionJumpscare:Dropdown({
    Title = "Selecionar Jogador",
    Values = GetPlayerNames(),
    Callback = function(value) SelectedPlayer = value end
})

for name, data in pairs(Jumpscares) do
    SectionJumpscare:Button({
        Title = "/" .. name,
        Desc = data.desc,
        Callback = function()
            if SelectedPlayer then EnviarBoard(name, SelectedPlayer) end
        end
    })
end

-- Aba Avisos (apenas global)
local TabAvisos = Window:Tab({ Title = "Avisos", Icon = "megaphone" })
local SectionAvisos = TabAvisos:Section({ Title = "Sistema de AnÃºncios", Icon = "bell", Opened = true })

local textoAviso = ""
SectionAvisos:Input({
    Title = "Mensagem do Aviso",
    Description = "Digite a mensagem que deseja enviar",
    Default = "",
    Placeholder = "Ex: Servidor serÃ¡ reiniciado...",
    Callback = function(txt) textoAviso = txt end
})

SectionAvisos:Button({
    Title = "Enviar para todos",
    Description = "Mostra um anÃºncio bonito na tela de todos",
    Callback = function()
        if textoAviso == "" or textoAviso == nil then warn("Digite uma mensagem primeiro!") return end
        local msg = LocalPlayer.Name .. " | " .. textoAviso
        EnviarBoard("anuncio " .. msg, "")
    end
})

-- Aba Chat
local TabChat = Window:Tab({ Title = "Chat", Icon = "message-circle" })
local SectionChat = TabChat:Section({ Title = "Enviar Mensagem como outro jogador", Icon = "send", Opened = true })

local ChatDropdown = SectionChat:Dropdown({
    Title = "Selecionar Jogador",
    Values = GetPlayerNames(),
    Callback = function(value) SelectedPlayer = value end
})

local mensagemChat = ""
SectionChat:Input({
    Title = "Mensagem",
    Description = "Digite o texto que serÃ¡ enviado no chat pela pessoa escolhida",
    Default = "",
    Placeholder = "Ex: OlÃ¡ pessoal!",
    Callback = function(txt) mensagemChat = txt end
})

SectionChat:Button({
    Title = "Enviar Mensagem",
    Description = "O jogador selecionado enviarÃ¡ esta mensagem no chat global",
    Callback = function()
        if mensagemChat == "" or mensagemChat == nil then warn("Digite uma mensagem!") return end
        if not SelectedPlayer then warn("Selecione um jogador!") return end
        BoardRemote:FireServer("ReturningBoardName", BoardCount, ";say " .. SelectedPlayer:lower() .. " " .. mensagemChat)
    end
})

task.spawn(function() task.wait(1) RefreshPlayers() end)

print("Spectra Admin carregado!")
print("Minimize a janela para ver o botÃ£o flutuante.")
