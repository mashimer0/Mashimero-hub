local Players = game:GetService("Players")
local plr = Players.LocalPlayer

-- GUI作成
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MashimeroHub"
ScreenGui.Parent = game.CoreGui

-- メインフレーム
local Main = Instance.new("Frame")
Main.Parent = ScreenGui
Main.Size = UDim2.new(0,300,0,220)
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