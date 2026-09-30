# afk
--[[
    Anti-AFK V1 + AFK Mode
    Original by batus / forked by Evxn
    Modified: added AFK mode toggle
]]

repeat wait() until game:IsLoaded() and game.Players and game.Players.LocalPlayer and game.Players.LocalPlayer.Character

if getgenv().AntiAfkExecuted and game.CoreGui:FindFirstChild("thisoneissocoldww") then
    getgenv().AntiAfkExecuted = false
    getgenv().zamanbaslaticisi = false
    getgenv().AfkMode = false
    game.CoreGui.thisoneissocoldww:Destroy()
end

getgenv().AntiAfkExecuted = true
getgenv().zamanbaslaticisi = true
getgenv().AfkMode = false

local thisoneissocoldww = Instance.new("ScreenGui")
local madebybloodofbatus = Instance.new("Frame")
local UICornerw = Instance.new("UICorner")
local DestroyButton = Instance.new("TextButton")
local uselesslabelone = Instance.new("TextLabel")
local timerlabel = Instance.new("TextLabel")
local uselesslabeltwo = Instance.new("TextLabel")
local fpslabel = Instance.new("TextLabel")
local uselesslabelthree = Instance.new("TextLabel")
local pinglabel = Instance.new("TextLabel")
local uselessframeone = Instance.new("Frame")
local UICornerww = Instance.new("UICorner")
local uselesslabelfour = Instance.new("TextLabel")

-- КНОПКА AFK (новая)
local AfkButton = Instance.new("TextButton")
local UICornerAfk = Instance.new("UICorner")

-- Properties:

thisoneissocoldww.Name = "thisoneissocoldww"
thisoneissocoldww.Parent = game.CoreGui
thisoneissocoldww.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

madebybloodofbatus.Name = "madebybloodofbatus"
madebybloodofbatus.Parent = thisoneissocoldww
madebybloodofbatus.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
madebybloodofbatus.Position = UDim2.new(0.0854133144, 0, 0.13128835, 0)
madebybloodofbatus.Size = UDim2.new(0, 225, 0, 130)

UICornerw.Name = "UICornerw"
UICornerw.Parent = madebybloodofbatus

DestroyButton.Name = "DestroyButton"
DestroyButton.Parent = madebybloodofbatus
DestroyButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
DestroyButton.BackgroundTransparency = 1.000
DestroyButton.Position = UDim2.new(0.871702373, 0, 0.0245379955, 0)
DestroyButton.Size = UDim2.new(0, 27, 0, 15)
DestroyButton.Font = Enum.Font.SourceSans
DestroyButton.Text = "X"
DestroyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
DestroyButton.TextSize = 14.000

DestroyButton.MouseButton1Click:connect(function()
    getgenv().AntiAfkExecuted = false
    getgenv().zamanbaslaticisi = false
    getgenv().AfkMode = false
    wait(0.1)
    thisoneissocoldww:Destroy()
end)

uselesslabelone.Name = "uselesslabelone"
uselesslabelone.Parent = madebybloodofbatus
uselesslabelone.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
uselesslabelone.BackgroundTransparency = 1.000
uselesslabelone.Position = UDim2.new(0.302473009, 0, 0, 0)
uselesslabelone.Size = UDim2.new(0, 110, 0, 24)
uselesslabelone.Font = Enum.Font.SourceSans
uselesslabelone.Text = "Anti Afk V1 By Evxn#6765"
uselesslabelone.TextColor3 = Color3.fromRGB(255, 255, 255)
uselesslabelone.TextSize = 13.000

timerlabel.Name = "timerlabel"
timerlabel.Parent = madebybloodofbatus
timerlabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
timerlabel.BackgroundTransparency = 1.000
timerlabel.Position = UDim2.new(0.65344125, 0, 0.68194294, 0)
timerlabel.Size = UDim2.new(0, 60, 0, 24)
timerlabel.Font = Enum.Font.SourceSans
timerlabel.Text = "0:0:0"
timerlabel.TextColor3 = Color3.fromRGB(255, 255, 255)
timerlabel.TextSize = 14.000

uselesslabeltwo.Name = "uselesslabeltwo"
uselesslabeltwo.Parent = madebybloodofbatus
uselesslabeltwo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
uselesslabeltwo.BackgroundTransparency = 1.000
uselesslabeltwo.Position = UDim2.new(0.038864471, 0, 0.273806685, 0)
uselesslabeltwo.Size = UDim2.new(0, 29, 0, 24)
uselesslabeltwo.Font = Enum.Font.SourceSans
uselesslabeltwo.Text = "Ping: "
uselesslabeltwo.TextColor3 = Color3.fromRGB(255, 255, 255)
uselesslabeltwo.TextSize = 14.000

fpslabel.Name = "fpslabel"
fpslabel.Parent = madebybloodofbatus
fpslabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
fpslabel.BackgroundTransparency = 1.000
fpslabel.Position = UDim2.new(0.724226236, 0, 0.258796299, 0)
fpslabel.Size = UDim2.new(0, 55, 0, 24)
fpslabel.Font = Enum.Font.SourceSans
fpslabel.Text = "0"
fpslabel.TextColor3 = Color3.fromRGB(255, 255, 255)
fpslabel.TextSize = 14.000

uselesslabelthree.Name = "uselesslabelthree"
uselesslabelthree.Parent = madebybloodofbatus
uselesslabelthree.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
uselesslabelthree.BackgroundTransparency = 1.000
uselesslabelthree.Position = UDim2.new(0.506917477, 0, 0.252585167, 0)
uselesslabelthree.Size = UDim2.new(0, 26, 0, 24)
uselesslabelthree.Font = Enum.Font.SourceSans
uselesslabelthree.Text = "Fps: "
uselesslabelthree.TextColor3 = Color3.fromRGB(255, 255, 255)
uselesslabelthree.TextSize = 14.000

pinglabel.Name = "pinglabel"
pinglabel.Parent = madebybloodofbatus
pinglabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
pinglabel.BackgroundTransparency = 1.000
pinglabel.Position = UDim2.new(0.20330891, 0, 0.271578127, 0)
pinglabel.Size = UDim2.new(0, 55, 0, 24)
pinglabel.Font = Enum.Font.SourceSans
pinglabel.Text = "0"
pinglabel.TextColor3 = Color3.fromRGB(255, 255, 255)
pinglabel.TextSize = 14.000
pinglabel.TextWrapped = true

uselessframeone.Name = "uselessframeone"
uselessframeone.Parent = madebybloodofbatus
uselessframeone.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
uselessframeone.Position = UDim2.new(0.00444444455, 0, 0.213312627, 0)
uselessframeone.Size = UDim2.new(0, 224, 0, 5)

UICornerww.CornerRadius = UDim.new(0, 50)
UICornerww.Name = "UICornerww"
UICornerww.Parent = uselessframeone

uselesslabelfour.Name = "uselesslabelfour"
uselesslabelfour.Parent = madebybloodofbatus
uselesslabelfour.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
uselesslabelfour.BackgroundTransparency = 1.000
uselesslabelfour.Position = UDim2.new(0.0580285639, 0, 0.65, 0)
uselesslabelfour.Size = UDim2.new(0, 120, 0, 12)
uselesslabelfour.Font = Enum.Font.SourceSans
uselesslabelfour.Text = "Anti-Afk Auto Enabled"
uselesslabelfour.TextColor3 = Color3.fromRGB(0, 255, 100)
uselesslabelfour.TextSize = 13.000
uselesslabelfour.TextXAlignment = Enum.TextXAlignment.Left

-- КНОПКА AFK
AfkButton.Name = "AfkButton"
AfkButton.Parent = madebybloodofbatus
AfkButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
AfkButton.Position = UDim2.new(0.058, 0, 0.80, 0)
AfkButton.Size = UDim2.new(0, 95, 0, 22)
AfkButton.Font = Enum.Font.SourceSansBold
AfkButton.Text = "AFK: ВЫКЛ"
AfkButton.TextColor3 = Color3.fromRGB(255, 255, 255)
AfkButton.TextSize = 13.000

UICornerAfk.CornerRadius = UDim.new(0, 6)
UICornerAfk.Parent = AfkButton

AfkButton.MouseButton1Click:Connect(function()
    getgenv().AfkMode = not getgenv().AfkMode
    if getgenv().AfkMode then
        AfkButton.Text = "AFK: ВКЛ"
        AfkButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
        uselesslabelfour.Text = "AFK Mode ON — не двигайся"
        uselesslabelfour.TextColor3 = Color3.fromRGB(255, 180, 0)
    else
        AfkButton.Text = "AFK: ВЫКЛ"
        AfkButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        uselesslabelfour.Text = "Anti-Afk Auto Enabled"
        uselesslabelfour.TextColor3 = Color3.fromRGB(0, 255, 100)
    end
end)

-- Перетаскивание
local Drag = madebybloodofbatus
gsCoreGui = game:GetService("CoreGui")
gsTween = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local dragging, dragInput, dragStart, startPos

local function update(input)
    local delta = input.Position - dragStart
    local dragTime = 0.04
    local SmoothDrag = {}
    SmoothDrag.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    local dragSmoothFunction = gsTween:Create(Drag, TweenInfo.new(dragTime, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), SmoothDrag)
    dragSmoothFunction:Play()
end

Drag.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = Drag.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

Drag.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging and Drag.Size then
        update(input)
    end
end)

-- АНТИ-AFK
local bbbatusxxxddddd = game:GetService("VirtualUser")

game:GetService("Players").LocalPlayer.Idled:connect(function()
    bbbatusxxxddddd:CaptureController()
    bbbatusxxxddddd:ClickButton2(Vector2.new())
end)

-- AFK MODE (двигает персонажа чтобы не кикнуло, если нужно)
game:GetService("RunService").Heartbeat:Connect(function()
    if getgenv().AfkMode then
        local plr = game.Players.LocalPlayer
        if plr and plr.Character and plr.Character:FindFirstChild("Humanoid") then
            plr.Character.Humanoid.Jump = true
        end
    end
end)

-- FPS
local FPSsLabel = fpslabel
local RunService = game:GetService("RunService")
local RenderStepped = RunService.RenderStepped
local sec = nil
local FPS = {}

local function fre()
    local fr = tick()
    for index = #FPS,1,-1 do
        FPS[index + 1] = (FPS[index] >= fr - 1) and FPS[index] or nil
    end
    FPS[1] = fr
    local fps = (tick() - sec >= 1 and #FPS) or (#FPS / (tick() - sec))
    fps = math.floor(fps)
    fpslabel.Text = fps
end

sec = tick()
RenderStepped:Connect(fre)

-- PING
spawn(function()
    repeat
        wait(1)
        local ping = tonumber(game:GetService("Stats"):FindFirstChild("PerformanceStats").Ping:GetValue())
        ping = math.floor(ping)
        pinglabel.Text = ping
    until pinglabel == nil
end)

-- ТАЙМЕР
local saniye = 0
local dakika = 0
local saat = 0

getgenv().zamanbaslaticisi = true

while true do
    if getgenv().zamanbaslaticisi then
        saniye = saniye + 1
        wait(1)
    end

    if saniye >= 60 then
        saniye = 0
        dakika = dakika + 1
    end

    if dakika >= 60 then
        dakika = 0
        saat = saat + 1
    end

    timerlabel.Text = saat..":"..dakika..":"..saniye
end
