local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")

local plr = Players.LocalPlayer

local gui = Instance.new("ScreenGui")
gui.Parent = game.CoreGui

local Main = Instance.new("Frame")
Main.Parent = gui
Main.Size = UDim2.new(0,450,0,350)
Main.Position = UDim2.new(0.5,-225,0.5,-175)
Main.BackgroundTransparency = 1

local dragging = false
local dragInput
local dragStart
local startPos

Main.InputBegan:Connect(function(input)

	if input.UserInputType == Enum.UserInputType.Touch
	or input.UserInputType == Enum.UserInputType.MouseButton1 then

		dragging = true
		dragStart = input.Position
		startPos = Main.Position

		input.Changed:Connect(function()

			if input.UserInputState ==
			Enum.UserInputState.End then

				dragging = false

			end
		end)
	end
end)

Main.InputChanged:Connect(function(input)

	if input.UserInputType ==
	Enum.UserInputType.Touch
	or input.UserInputType ==
	Enum.UserInputType.MouseMovement then

		dragInput = input

	end
end)

UIS.InputChanged:Connect(function(input)

	if input == dragInput and dragging then

		local delta =
		input.Position - dragStart

		Main.Position = UDim2.new(
			startPos.X.Scale,
			startPos.X.Offset + delta.X,
			startPos.Y.Scale,
			startPos.Y.Offset + delta.Y
		)
	end
end)

local function CircleButton(
	text,
	x,
	y,
	color
)

	local b = Instance.new("TextButton")

	b.Parent = Main
b.Size = UDim2.new(0,70,0,70)
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

local Title = Instance.new("TextLabel")
Title.Parent = Main
Title.Size = UDim2.new(0,250,0,50)
Title.Position = UDim2.new(0,100,0,-10)

Title.BackgroundColor3 =
Color3.fromRGB(0,0,0)

Title.Text = "MASHIMERO HUB"
Title.TextColor3 = Color3.new(1,1,1)
Title.TextScaled = true
Title.Font = Enum.Font.GothamBold

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0,20)
TitleCorner.Parent = Title
local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0,20)
TitleCorner.Parent = Title
