local plr = game.Players.LocalPlayer
local UIS = game:GetService("UserInputService")

local gui = Instance.new("ScreenGui")
gui.Parent = game.CoreGui

local main = Instance.new("Frame")
main.Parent = gui
main.Size = UDim2.new(0,450,0,350)
main.Position = UDim2.new(0.5,-225,0.5,-175)
main.BackgroundTransparency = 1

local function CircleButton(text,x,y,color)

    local b = Instance.new("TextButton")
    b.Parent = main
    b.Size = UDim2.new(0,95,0,95)
    b.Position = UDim2.new(0,x,0,y)
    b.BackgroundColor3 = color
    b.Text = text
    b.TextColor3 = Color3.new(1,1,1)
    b.TextScaled = true
    b.Font = Enum.Font.GothamBold

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(1,0)
    corner.Parent = b

    return b
end

local title = Instance.new("TextLabel")
title.Parent = main
title.Size = UDim2.new(0,250,0,50)
title.Position = UDim2.new(0,110,0,-10)
title.BackgroundColor3 = Color3.fromRGB(0,0,0)
title.Text = "TRUBL HUB USER"
title.TextColor3 = Color3.new(1,1,1)
title.TextScaled = true
title.Font = Enum.Font.GothamBold

local titlecorner = Instance.new("UICorner")
titlecorner.CornerRadius = UDim.new(0,20)
titlecorner.Parent = title

local DesyncButton =
CircleButton(
    "Desync",
    120,
    20,
    Color3.fromRGB(120,0,0)
)

local AutoTPButton =
CircleButton(
    "Auto TP",
    230,
    20,
    Color3.fromRGB(0,0,0)
)

local AimbotButton =
CircleButton(
    "Aimbot",
    175,
    125,
    Color3.fromRGB(0,0,0)
)

local TPDownButton =
CircleButton(
    "TP Down",
    230,
    220,
    Color3.fromRGB(0,0,0)
)

local AutoPlayButton =
CircleButton(
    "Auto Play",
    340,
    125,
    Color3.fromRGB(0,0,0)
)

local DirectionButton =
CircleButton(
    "RIGHT",
    340,
    20,
    Color3.fromRGB(0,50,150)
)

local LaggerButton =
CircleButton(
    "Lagger",
    10,
    20,
    Color3.fromRGB(80,0,120)
)

local MoveDirection = "RIGHT"

DirectionButton.MouseButton1Click:Connect(function()

    if MoveDirection == "RIGHT" then

        MoveDirection = "LEFT"
        DirectionButton.Text = "LEFT"

    else

        MoveDirection = "RIGHT"
        DirectionButton.Text = "RIGHT"

    end
end)

local TPEnabled = false

TPDownButton.MouseButton1Click:Connect(function()

    TPEnabled = not TPEnabled

    if TPEnabled then
        TPDownButton.Text = "TP ON"
        TPDownButton.BackgroundColor3 = Color3.fromRGB(120,0,0)
    else
        TPDownButton.Text = "TP OFF"
        TPDownButton.BackgroundColor3 = Color3.fromRGB(0,0,0)
    end
end)

task.spawn(function()

    while true do
        task.wait(0.15)

        if TPEnabled then

            local char = plr.Character

            if char and char:FindFirstChild("HumanoidRootPart") then

                local hrp = char.HumanoidRootPart

                if MoveDirection == "RIGHT" then
                    hrp.CFrame =
                    hrp.CFrame + Vector3.new(6,0,0)
                else
                    hrp.CFrame =
                    hrp.CFrame + Vector3.new(-6,0,0)
                end
            end
        end
    end
end)

local AutoEnabled = false

AutoPlayButton.MouseButton1Click:Connect(function()

    AutoEnabled = not AutoEnabled

    if AutoEnabled then
        AutoPlayButton.Text = "AUTO ON"
        AutoPlayButton.BackgroundColor3 = Color3.fromRGB(120,0,0)
    else
        AutoPlayButton.Text = "AUTO OFF"
        AutoPlayButton.BackgroundColor3 = Color3.fromRGB(0,0,0)
    end
end)

task.spawn(function()

    while true do
        task.wait(0.1)

        if AutoEnabled then

            local char = plr.Character

            if char and char:FindFirstChild("Humanoid") then

                local hum = char.Humanoid
                hum:Move(Vector3.new(1,0,0),true)

            end
        end
    end
end)

local DesyncEnabled = false

DesyncButton.MouseButton1Click:Connect(function()

    DesyncEnabled = not DesyncEnabled

    if DesyncEnabled then
        DesyncButton.BackgroundColor3 =
        Color3.fromRGB(120,0,0)
    else
        DesyncButton.BackgroundColor3 =
        Color3.fromRGB(0,0,0)
    end
end)

task.spawn(function()

    while true do
        task.wait()

        if DesyncEnabled then

            local char = plr.Character

            if char and char:FindFirstChild("HumanoidRootPart") then

                char.HumanoidRootPart.CFrame =
                char.HumanoidRootPart.CFrame *
                CFrame.Angles(
                    math.rad(math.random(-25,25)),
                    math.rad(math.random(-25,25)),
                    0
                )
            end
        end
    end
end)

local InfJump = false

LaggerButton.MouseButton1Click:Connect(function()

    InfJump = not InfJump

    if InfJump then
        LaggerButton.Text = "INF JUMP"
        LaggerButton.BackgroundColor3 =
        Color3.fromRGB(120,0,120)
    else
        LaggerButton.Text = "Lagger"
        LaggerButton.BackgroundColor3 =
        Color3.fromRGB(80,0,120)
    end
end)

UIS.JumpRequest:Connect(function()

    if InfJump then

        local char = plr.Character

        if char and char:FindFirstChild("Humanoid") then

            char.Humanoid:ChangeState(
                Enum.HumanoidStateType.Jumping
            )
        end
    end
end)