local Players = game:GetService("Players")
local plr = Players.LocalPlayer

-- GUI作成
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MashimeroHub"
ScreenGui.Parent = game.CoreGui

-- メインフレーム
local Main = Instance.new("Frame")
Main.Parent = ScreenGui
Main.Size = UDim2.new(0,320,0,380)
Main.Position = UDim2.new(0.05,0,0.3,0)
Main.BackgroundColor3 = Color3.fromRGB(10,10,10)
Main.Active = true
Main.Draggable = true

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0,20)
MainCorner.Parent = Main

-- タイトル
local Title = Instance.new("TextLabel")
Title.Parent = Main
Title.Size = UDim2.new(1,0,0,40)
Title.BackgroundTransparency = 1
Title.Text = "MASHIMERO HUB"
Title.TextColor3 = Color3.fromRGB(255,255,255)
Title.Font = Enum.Font.GothamBold
Title.TextScaled = true
local SpeedButton = Instance.new("TextButton")
SpeedButton.Parent = Main
SpeedButton.Size = UDim2.new(0,120,0,45)
SpeedButton.Position = UDim2.new(0.1,0,0.35,0)
SpeedButton.BackgroundColor3 = Color3.fromRGB(20,20,20)

local SpeedCorner = Instance.new("UICorner")
SpeedCorner.CornerRadius = UDim.new(0,999)
SpeedCorner.Parent = SpeedButton

SpeedButton.Text = "Speed OFF"
SpeedButton.TextColor3 = Color3.new(1,1,1)
SpeedButton.Font = Enum.Font.GothamBold
SpeedButton.TextScaled = true

local SpeedEnabled = false

SpeedButton.MouseButton1Click:Connect(function()

    SpeedEnabled = not SpeedEnabled

    local char = plr.Character
    if char and char:FindFirstChild("Humanoid") then

        if SpeedEnabled then
            char.Humanoid.WalkSpeed = 32
            SpeedButton.Text = "Speed ON"
            SpeedButton.BackgroundColor3 = Color3.fromRGB(120,0,0)

        else
            char.Humanoid.WalkSpeed = 16
            SpeedButton.Text = "Speed OFF"
            SpeedButton.BackgroundColor3 = Color3.fromRGB(20,20,20)
        end
    end
end)
local TPButton = Instance.new("TextButton")
TPButton.Parent = Main
TPButton.Size = UDim2.new(0,120,0,45)
TPButton.Position = UDim2.new(0.55,0,0.35,0)
TPButton.BackgroundColor3 = Color3.fromRGB(20,20,20)

local TPCorner = Instance.new("UICorner")
TPCorner.CornerRadius = UDim.new(1,0)
TPCorner.Parent = TPButton

TPButton.Text = "TP DOWN OFF"
TPButton.TextColor3 = Color3.new(1,1,1)
TPButton.Font = Enum.Font.GothamBold
TPButton.TextScaled = true

local TPEnabled = false

TPButton.MouseButton1Click:Connect(function()

    TPEnabled = not TPEnabled

    if TPEnabled then
        TPButton.Text = "TP DOWN ON"
        TPButton.BackgroundColor3 = Color3.fromRGB(120,0,0)

    else
        TPButton.Text = "TP DOWN OFF"
        TPButton.BackgroundColor3 = Color3.fromRGB(20,20,20)
    end
end)

task.spawn(function()

    while true do
        task.wait(0.08)

        if TPEnabled then

            local char = plr.Character

            if char and char:FindFirstChild("HumanoidRootPart") then

                char.HumanoidRootPart.CFrame =
                    char.HumanoidRootPart.CFrame * CFrame.new(0,-2,0)

            end
        end
    end
end)
local AutoButton = Instance.new("TextButton")
AutoButton.Parent = Main
AutoButton.Size = UDim2.new(0,250,0,45)
AutoButton.Position = UDim2.new(0.1,0,0.65,0)
AutoButton.BackgroundColor3 = Color3.fromRGB(20,20,20)

local AutoCorner = Instance.new("UICorner")
AutoCorner.CornerRadius = UDim.new(1,0)
AutoCorner.Parent = AutoButton

AutoButton.Text = "AUTO PLAY OFF"
AutoButton.TextColor3 = Color3.new(1,1,1)
AutoButton.Font = Enum.Font.GothamBold
AutoButton.TextScaled = true

local AutoEnabled = false
local MoveDirection = "RIGHT"

AutoButton.MouseButton1Click:Connect(function()

    AutoEnabled = not AutoEnabled

    if AutoEnabled then
        AutoButton.Text = "AUTO PLAY ON"
        AutoButton.BackgroundColor3 = Color3.fromRGB(120,0,0)

    else
        AutoButton.Text = "AUTO PLAY OFF"
        AutoButton.BackgroundColor3 = Color3.fromRGB(20,20,20)
    end
end)

task.spawn(function()

    while true do
        task.wait(0.15)

        if AutoEnabled then

            local char = plr.Character

            if char and char:FindFirstChild("Humanoid") then

                local hum = char.Humanoid

                hum.WalkSpeed = 32
fix
if MoveDirection == "RIGHT" then


                    hum:Move(Vector3.new(1,0,0), true)
                else
                    hum:Move(Vector3.new(-1,0,0), true)
                end

                MoveRight = not MoveRight

            end
        end
    end
end)
local CurrentMode = "Normal"

local ModeLabel = Instance.new("TextLabel")
ModeLabel.Parent = Main
ModeLabel.Size = UDim2.new(0,250,0,30)
ModeLabel.Position = UDim2.new(0.1,0,0.88,0)
ModeLabel.BackgroundTransparency = 1
ModeLabel.Text = "MODE : NORMAL"
ModeLabel.TextColor3 = Color3.new(1,1,1)
ModeLabel.Font = Enum.Font.GothamBold
ModeLabel.TextScaled = true

local ModeButton = Instance.new("TextButton")
ModeButton.Parent = Main
ModeButton.Size = UDim2.new(0,250,0,35)
ModeButton.Position = UDim2.new(0.1,0,1.02,0)
ModeButton.BackgroundColor3 = Color3.fromRGB(20,20,20)

local ModeCorner = Instance.new("UICorner")
ModeCorner.CornerRadius = UDim.new(1,0)
ModeCorner.Parent = ModeButton

ModeButton.Text = "CHANGE MODE"
ModeButton.TextColor3 = Color3.new(1,1,1)
ModeButton.Font = Enum.Font.GothamBold
ModeButton.TextScaled = true

ModeButton.MouseButton1Click:Connect(function()

    if CurrentMode == "Normal" then

        CurrentMode = "Lagger"
        ModeLabel.Text = "MODE : LAGGER"

    elseif CurrentMode == "Lagger" then

        CurrentMode = "Desync"
        ModeLabel.Text = "MODE : DESYNC"

    else

        CurrentMode = "Normal"
        ModeLabel.Text = "MODE : NORMAL"

    end
end)
local DropButton = Instance.new("TextButton")
DropButton.Parent = Main
DropButton.Size = UDim2.new(0,250,0,40)
DropButton.Position = UDim2.new(0.1,0,1.22,0)
DropButton.BackgroundColor3 = Color3.fromRGB(20,20,20)

local DropCorner = Instance.new("UICorner")
DropCorner.CornerRadius = UDim.new(1,0)
DropCorner.Parent = DropButton

DropButton.Text = "DROP BRAINROT"
DropButton.TextColor3 = Color3.new(1,1,1)
DropButton.Font = Enum.Font.GothamBold
DropButton.TextScaled = true

DropButton.MouseButton1Click:Connect(function()

    local char = plr.Character

    if char then

        for i,v in pairs(char:GetChildren()) do

            if v:IsA("Tool") then

                v.Parent = workspace

            end
        end
    end
end)
local CloseButton = Instance.new("TextButton")
CloseButton.Parent = Main
CloseButton.Size = UDim2.new(0,35,0,35)
CloseButton.Position = UDim2.new(1,-40,0,5)
CloseButton.BackgroundColor3 = Color3.fromRGB(120,0,0)

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(1,0)
CloseCorner.Parent = CloseButton

CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.new(1,1,1)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.TextScaled = true

CloseButton.MouseButton1Click:Connect(function()

    ScreenGui:Destroy()

end)
local TweenService = game:GetService("TweenService")

Main.Size = UDim2.new(0,0,0,0)

TweenService:Create(
    Main,
    TweenInfo.new(
        0.4,
        Enum.EasingStyle.Back,
        Enum.EasingDirection.Out
    ),
    {
Size = UDim2.new(0,320,0,380)
    }
):Play()
local DirectionButton = Instance.new("TextButton")
DirectionButton.Parent = Main
DirectionButton.Size = UDim2.new(0,250,0,40)
DirectionButton.Position = UDim2.new(0.1,0,1.4,0)
DirectionButton.BackgroundColor3 = Color3.fromRGB(20,20,20)

local DirectionCorner = Instance.new("UICorner")
DirectionCorner.CornerRadius = UDim.new(1,0)
DirectionCorner.Parent = DirectionButton

DirectionButton.Text = "RIGHT"
DirectionButton.TextColor3 = Color3.new(1,1,1)
DirectionButton.Font = Enum.Font.GothamBold
DirectionButton.TextScaled = true
DirectionButton.MouseButton1Click:Connect(function()

    if DirectionButton.Text == "RIGHT" then
        DirectionButton.Text = "LEFT"
        MoveRight = false
    else
        DirectionButton.Text = "RIGHT"
        MoveRight = true
    end

end)
DirectionButton.MouseButton1Click:Connect(function()

    if MoveDirection == "RIGHT" then

        MoveDirection = "LEFT"
        DirectionButton.Text = "LEFT"

    else

        MoveDirection = "RIGHT"
        DirectionButton.Text = "RIGHT"

    end
end)
local MinimizeButton = Instance.new("TextButton")
MinimizeButton.Parent = Main
MinimizeButton.Size = UDim2.new(0,40,0,40)
MinimizeButton.Position = UDim2.new(0.83,0,0,5)
MinimizeButton.BackgroundColor3 = Color3.fromRGB(40,40,40)

local MinimizeCorner = Instance.new("UICorner")
MinimizeCorner.CornerRadius = UDim.new(1,0)
MinimizeCorner.Parent = MinimizeButton

MinimizeButton.Text = "-"
MinimizeButton.TextColor3 = Color3.new(1,1,1)
MinimizeButton.Font = Enum.Font.GothamBold
MinimizeButton.TextScaled = true

local Minimized = false

MinimizeButton.MouseButton1Click:Connect(function()

    Minimized = not Minimized

    if Minimized then
        Main.Size = UDim2.new(0,320,0,50)
        MinimizeButton.Text = "+"
    else
Main.Size = UDim2.new(0,360,0,650)
        MinimizeButton.Text = "-"
    end

end)
local LaggerButton = Instance.new("TextButton")
LaggerButton.Parent = Main
LaggerButton.Size = UDim2.new(0,280,0,55)
LaggerButton.Position = UDim2.new(0.1,0,1.28,0)
LaggerButton.BackgroundColor3 = Color3.fromRGB(20,20,20)

local LagCorner = Instance.new("UICorner")
LagCorner.CornerRadius = UDim.new(1,0)
LagCorner.Parent = LaggerButton

LaggerButton.Text = "LAGGER OFF"
LaggerButton.TextColor3 = Color3.new(1,1,1)
LaggerButton.Font = Enum.Font.GothamBold
LaggerButton.TextScaled = true

local LagEnabled = false

LaggerButton.MouseButton1Click:Connect(function()

    LagEnabled = not LagEnabled

    if LagEnabled then
        LaggerButton.Text = "LAGGER ON"
    else
        LaggerButton.Text = "LAGGER OFF"
    end

end)

task.spawn(function()

    while true do
        task.wait()

        if LagEnabled then

            local remote = game:GetService("ReplicatedStorage"):FindFirstChildOfClass("RemoteEvent")

            if remote then
                for i = 1,10 do
                    remote:FireServer()
                end
            end

        end
    end
end)
local DesyncButton = Instance.new("TextButton")
DesyncButton.Parent = Main
DesyncButton.Size = UDim2.new(0,250,0,45)
DesyncButton.Position = UDim2.new(0.1,0,1.32,0)
DesyncButton.BackgroundColor3 = Color3.fromRGB(20,20,20)

local DesyncCorner = Instance.new("UICorner")
DesyncCorner.CornerRadius = UDim.new(1,0)
DesyncCorner.Parent = DesyncButton

DesyncButton.Text = "DESYNC OFF"
DesyncButton.TextColor3 = Color3.new(1,1,1)
DesyncButton.Font = Enum.Font.GothamBold
DesyncButton.TextScaled = true

local DesyncEnabled = false

DesyncButton.MouseButton1Click:Connect(function()

    DesyncEnabled = not DesyncEnabled

    if DesyncEnabled then
        DesyncButton.Text = "DESYNC ON"
    else
        DesyncButton.Text = "DESYNC OFF"
    end

end)

task.spawn(function()

    while true do
        task.wait(0.03)

        if DesyncEnabled then

            local char = plr.Character

            if char and char:FindFirstChild("HumanoidRootPart") then

                local hrp = char.HumanoidRootPart

                hrp.CFrame =
                    hrp.CFrame *
                    CFrame.new(
                        math.random(-1,1),
                        0,
                        math.random(-1,1)
                    )

            end
        end
    end
end)
local GrabButton = Instance.new("TextButton")
GrabButton.Parent = Main
GrabButton.Size = UDim2.new(0,250,0,45)
GrabButton.Position = UDim2.new(0.1,0,1.49,0)
GrabButton.BackgroundColor3 = Color3.fromRGB(20,20,20)

local GrabCorner = Instance.new("UICorner")
GrabCorner.CornerRadius = UDim.new(1,0)
GrabCorner.Parent = GrabButton

GrabButton.Text = "AUTO GRAB OFF"
GrabButton.TextColor3 = Color3.new(1,1,1)
GrabButton.Font = Enum.Font.GothamBold
GrabButton.TextScaled = true

local GrabEnabled = false
local Grabbed = {}

GrabButton.MouseButton1Click:Connect(function()

    GrabEnabled = not GrabEnabled

    if GrabEnabled then
        GrabButton.Text = "AUTO GRAB ON"
    else
        GrabButton.Text = "AUTO GRAB OFF"
    end

end)

task.spawn(function()

    while true do
        task.wait(2)

        if GrabEnabled then

            local char = plr.Character

            if char and char:FindFirstChild("HumanoidRootPart") then

                local hrp = char.HumanoidRootPart

                for _,v in pairs(workspace:GetDescendants()) do

                    if v:IsA("Tool")
                    and v:FindFirstChild("Handle")
                    and not Grabbed[v] then

                        firetouchinterest(hrp,v.Handle,0)
                        firetouchinterest(hrp,v.Handle,1)

                        Grabbed[v] = true

                    end
                end
            end
        end
    end
end)
local SmartTPButton = Instance.new("TextButton")
SmartTPButton.Parent = Main
SmartTPButton.Size = UDim2.new(0,250,0,45)
SmartTPButton.Position = UDim2.new(0.1,0,1.66,0)
SmartTPButton.BackgroundColor3 = Color3.fromRGB(20,20,20)

local SmartTPCorner = Instance.new("UICorner")
SmartTPCorner.CornerRadius = UDim.new(1,0)
SmartTPCorner.Parent = SmartTPButton

SmartTPButton.Text = "SMART TP DOWN OFF"
SmartTPButton.TextColor3 = Color3.new(1,1,1)
SmartTPButton.Font = Enum.Font.GothamBold
SmartTPButton.TextScaled = true

local SmartTPEnabled = false

SmartTPButton.MouseButton1Click:Connect(function()

    SmartTPEnabled = not SmartTPEnabled

    if SmartTPEnabled then
        SmartTPButton.Text = "SMART TP DOWN ON"
    else
        SmartTPButton.Text = "SMART TP DOWN OFF"
    end

end)

task.spawn(function()

    while true do
        task.wait(0.2)

        if SmartTPEnabled then

            local char = plr.Character

            if char and char:FindFirstChild("HumanoidRootPart") then

                local hrp = char.HumanoidRootPart


　　　　　　　　　　　　if hrp.Position.Y >= 35 then

                    local ray = Ray.new(
                        hrp.Position,
                        Vector3.new(0,-1000,0)
                    )

                    local part,pos = workspace:FindPartOnRay(ray,char)

                    if pos then

                        hrp.CFrame = CFrame.new(
                            pos.X,
                            pos.Y + 5,
                            pos.Z
                        )

                    end
                end
            end
        end
    end
end)
local InfiniteJumpEnabled = true

game:GetService("UserInputService").JumpRequest:Connect(function()
    if InfiniteJumpEnabled then
        local char = plr.Character
        if char and char:FindFirstChildOfClass("Humanoid") then
            char:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
end)
local CircleButton = Instance.new("TextButton")
CircleButton.Parent = ScreenGui

CircleButton.Size = UDim2.new(0,90,0,90)
CircleButton.Position = UDim2.new(0.72,0,0.1,0)

CircleButton.BackgroundColor3 = Color3.fromRGB(170,0,0)
CircleButton.Text = "Desync"

CircleButton.TextColor3 = Color3.new(1,1,1)
CircleButton.Font = Enum.Font.GothamBold
CircleButton.TextSize = 18

local CircleCorner = Instance.new("UICorner")
CircleCorner.CornerRadius = UDim.new(1,0)
CircleCorner.Parent = CircleButton
