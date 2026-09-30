--[[
    ╔═══════════════════════════════════════════╗
    ║   ANTI-AFK V3 — Modern UI Edition         ║
    ║   Author: sdfsd2648                       ║
    ║   Original concept: batus / Evxn          ║
    ║   Features: Anti-AFK, AFK Mode, FPS,      ║
    ║   Ping, Timer, Draggable, Dark Theme      ║
    ╚═══════════════════════════════════════════╝
]]

repeat wait() until game:IsLoaded() and game.Players and game.Players.LocalPlayer and game.Players.LocalPlayer.Character

-- Защита от повторного запуска
if getgenv().AntiAfkV3Running and game.CoreGui:FindFirstChild("AntiAfkV3UI") then
    getgenv().AntiAfkV3Running = false
    getgenv().AntiAfkTimer = false
    getgenv().AfkMode = false
    game.CoreGui.AntiAfkV3UI:Destroy()
    wait(0.2)
end

getgenv().AntiAfkV3Running = true
getgenv().AntiAfkTimer = true
getgenv().AfkMode = false

-- ═══════════════ СЕРВИСЫ ═══════════════
local Players           = game:GetService("Players")
local RunService        = game:GetService("RunService")
local UserInputService  = game:GetService("UserInputService")
local TweenService      = game:GetService("TweenService")
local Stats             = game:GetService("Stats")
local VirtualUser       = game:GetService("VirtualUser")
local Lighting          = game:GetService("Lighting")

-- ═══════════════ ЦВЕТА ═══════════════
local C = {
    BG        = Color3.fromRGB(18, 18, 24),
    BG2       = Color3.fromRGB(28, 28, 38),
    Card      = Color3.fromRGB(38, 38, 50),
    Accent    = Color3.fromRGB(130, 100, 255),
    Accent2   = Color3.fromRGB(200, 100, 255),
    Text      = Color3.fromRGB(240, 240, 248),
    TextDim   = Color3.fromRGB(150, 150, 170),
    Green     = Color3.fromRGB(80, 220, 140),
    Red       = Color3.fromRGB(255, 90, 110),
    Yellow    = Color3.fromRGB(255, 200, 80),
    Cyan      = Color3.fromRGB(80, 220, 255),
}

-- ═══════════════ ГЛАВНОЕ ОКНО ═══════════════
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "AntiAfkV3UI"
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = game.CoreGui

local Main = Instance.new("Frame")
Main.Name = "Main"
Main.AnchorPoint = Vector2.new(0.5, 0.5)
Main.Position = UDim2.new(0.5, 0, 0.5, 0)
Main.Size = UDim2.new(0, 320, 0, 260)
Main.BackgroundColor3 = C.BG
Main.BorderSizePixel = 0
Main.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 16)
MainCorner.Parent = Main

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = C.Accent
MainStroke.Thickness = 1.5
MainStroke.Transparency = 0.35
MainStroke.Parent = Main

local MainGrad = Instance.new("UIGradient")
MainGrad.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, C.BG),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(30, 22, 50)),
})
MainGrad.Rotation = 130
MainGrad.Parent = Main

-- ═══════════════ ЗАГОЛОВОК ═══════════════
local Header = Instance.new("Frame")
Header.Name = "Header"
Header.Size = UDim2.new(1, 0, 0, 46)
Header.BackgroundColor3 = C.BG2
Header.BackgroundTransparency = 0.2
Header.BorderSizePixel = 0
Header.Parent = Main

local HeaderCorner = Instance.new("UICorner")
HeaderCorner.CornerRadius = UDim.new(0, 16)
HeaderCorner.Parent = Header

local HeaderFix = Instance.new("Frame")
HeaderFix.Size = UDim2.new(1, 0, 0, 16)
HeaderFix.Position = UDim2.new(0, 0, 1, -16)
HeaderFix.BackgroundColor3 = C.BG2
HeaderFix.BackgroundTransparency = 0.2
HeaderFix.BorderSizePixel = 0
HeaderFix.Parent = Header

-- Пульсирующая точка статуса
local Dot = Instance.new("Frame")
Dot.Size = UDim2.new(0, 9, 0, 9)
Dot.Position = UDim2.new(0, 18, 0.5, -4.5)
Dot.BackgroundColor3 = C.Green
Dot.BorderSizePixel = 0
Dot.Parent = Header

local DotCorner = Instance.new("UICorner")
DotCorner.CornerRadius = UDim.new(1, 0)
DotCorner.Parent = Dot

task.spawn(function()
    while Dot.Parent do
        TweenService:Create(Dot, TweenInfo.new(0.9, Enum.EasingStyle.Sine), {BackgroundTransparency = 0.6}):Play()
        wait(0.9)
        if not Dot.Parent then break end
        TweenService:Create(Dot, TweenInfo.new(0.9, Enum.EasingStyle.Sine), {BackgroundTransparency = 0}):Play()
        wait(0.9)
    end
end)

-- Заголовок
local Title = Instance.new("TextLabel")
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0, 36, 0, 0)
Title.Size = UDim2.new(1, -140, 1, 0)
Title.Font = Enum.Font.GothamBold
Title.Text = "⚡ Anti-AFK V3"
Title.TextColor3 = C.Text
Title.TextSize = 15
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = Header

-- Имя автора
local Author = Instance.new("TextLabel")
Author.BackgroundTransparency = 1
Author.AnchorPoint = Vector2.new(1, 0.5)
Author.Position = UDim2.new(1, -46, 0.5, 0)
Author.Size = UDim2.new(0, 90, 0, 20)
Author.Font = Enum.Font.GothamMedium
Author.Text = "by sdfsd2648"
Author.TextColor3 = C.Accent2
Author.TextSize = 11
Author.TextXAlignment = Enum.TextXAlignment.Right
Author.Parent = Header

-- Кнопка закрытия
local CloseBtn = Instance.new("TextButton")
CloseBtn.AnchorPoint = Vector2.new(1, 0.5)
CloseBtn.Position = UDim2.new(1, -12, 0.5, 0)
CloseBtn.Size = UDim2.new(0, 24, 0, 24)
CloseBtn.BackgroundColor3 = C.Red
CloseBtn.BackgroundTransparency = 0.82
CloseBtn.BorderSizePixel = 0
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = C.Text
CloseBtn.TextSize = 12
CloseBtn.AutoButtonColor = false
CloseBtn.Parent = Header

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(1, 0)
CloseCorner.Parent = CloseBtn

CloseBtn.MouseEnter:Connect(function()
    TweenService:Create(CloseBtn, TweenInfo.new(0.15), {BackgroundTransparency = 0.4}):Play()
end)
CloseBtn.MouseLeave:Connect(function()
    TweenService:Create(CloseBtn, TweenInfo.new(0.15), {BackgroundTransparency = 0.82}):Play()
end)
CloseBtn.MouseButton1Click:Connect(function()
    getgenv().AntiAfkV3Running = false
    getgenv().AntiAfkTimer = false
    getgenv().AfkMode = false
    ScreenGui:Destroy()
end)

-- ═══════════════ КАРТОЧКИ СТАТИСТИКИ ═══════════════
local function makeCard(name, labelText, iconText, xPos, accentColor)
    local Card = Instance.new("Frame")
    Card.Name = name
    Card.Position = UDim2.new(0, xPos, 0, 60)
    Card.Size = UDim2.new(0, 90, 0, 66)
    Card.BackgroundColor3 = C.Card
    Card.BackgroundTransparency = 0.25
    Card.BorderSizePixel = 0
    Card.Parent = Main

    local Corner = Instance.new("UICorner")
    Corner.CornerRadius = UDim.new(0, 12)
    Corner.Parent = Card

    local Stroke = Instance.new("UIStroke")
    Stroke.Color = accentColor
    Stroke.Thickness = 1
    Stroke.Transparency = 0.6
    Stroke.Parent = Card

    local Icon = Instance.new("TextLabel")
    Icon.BackgroundTransparency = 1
    Icon.Size = UDim2.new(1, 0, 0, 18)
    Icon.Position = UDim2.new(0, 0, 0, 8)
    Icon.Font = Enum.Font.GothamMedium
    Icon.Text = iconText .. " " .. labelText
    Icon.TextColor3 = C.TextDim
    Icon.TextSize = 10
    Icon.Parent = Card

    local Value = Instance.new("TextLabel")
    Value.Name = "Value"
    Value.BackgroundTransparency = 1
    Value.Size = UDim2.new(1, 0, 0, 24)
    Value.Position = UDim2.new(0, 0, 0, 30)
    Value.Font = Enum.Font.GothamBold
    Value.Text = "0"
    Value.TextColor3 = accentColor
    Value.TextSize = 17
    Value.Parent = Card

    return Value
end

local FpsValue  = makeCard("FpsCard",  "FPS",  "⚡", 16,  C.Yellow)
local PingValue = makeCard("PingCard", "PING", "📶", 115, C.Cyan)
local TimeValue = makeCard("TimeCard", "TIME", "⏱", 214, C.Green)

-- ═══════════════ КНОПКА AFK ═══════════════
local AfkBtn = Instance.new("TextButton")
AfkBtn.Name = "AfkBtn"
AfkBtn.Position = UDim2.new(0, 16, 0, 140)
AfkBtn.Size = UDim2.new(0.5, -22, 0, 40)
AfkBtn.BackgroundColor3 = C.Card
AfkBtn.BackgroundTransparency = 0.15
AfkBtn.BorderSizePixel = 0
AfkBtn.Font = Enum.Font.GothamBold
AfkBtn.Text = "😴 AFK MODE: OFF"
AfkBtn.TextColor3 = C.Text
AfkBtn.TextSize = 13
AfkBtn.AutoButtonColor = false
AfkBtn.Parent = Main

local AfkCorner = Instance.new("UICorner")
AfkCorner.CornerRadius = UDim.new(0, 10)
AfkCorner.Parent = AfkBtn

local AfkStroke = Instance.new("UIStroke")
AfkStroke.Color = C.TextDim
AfkStroke.Thickness = 1
AfkStroke.Transparency = 0.6
AfkStroke.Parent = AfkBtn

-- ═══════════════ КНОПКА "КРУТИТЬСЯ" (фишка) ═══════════════
local SpinBtn = Instance.new("TextButton")
SpinBtn.Name = "SpinBtn"
SpinBtn.Position = UDim2.new(0.5, 6, 0, 140)
SpinBtn.Size = UDim2.new(0.5, -22, 0, 40)
SpinBtn.BackgroundColor3 = C.Card
SpinBtn.BackgroundTransparency = 0.15
SpinBtn.BorderSizePixel = 0
SpinBtn.Font = Enum.Font.GothamBold
SpinBtn.Text = "🌀 SPIN: OFF"
SpinBtn.TextColor3 = C.Text
SpinBtn.TextSize = 13
SpinBtn.AutoButtonColor = false
SpinBtn.Parent = Main

local SpinCorner = Instance.new("UICorner")
SpinCorner.CornerRadius = UDim.new(0, 10)
SpinCorner.Parent = SpinBtn

local SpinStroke = Instance.new("UIStroke")
SpinStroke.Color = C.TextDim
SpinStroke.Thickness = 1
SpinStroke.Transparency = 0.6
SpinStroke.Parent = SpinBtn

-- ═══════════════ СТАТУС-БАР ═══════════════
local StatusBar = Instance.new("Frame")
StatusBar.Name = "StatusBar"
StatusBar.Position = UDim2.new(0, 16, 0, 192)
StatusBar.Size = UDim2.new(1, -32, 0, 32)
StatusBar.BackgroundColor3 = C.Card
StatusBar.BackgroundTransparency = 0.35
StatusBar.BorderSizePixel = 0
StatusBar.Parent = Main

local StatusCorner = Instance.new("UICorner")
StatusCorner.CornerRadius = UDim.new(0, 10)
StatusCorner.Parent = StatusBar

local StatusStroke = Instance.new("UIStroke")
StatusStroke.Color = C.Green
StatusStroke.Thickness = 1
StatusStroke.Transparency = 0.65
StatusStroke.Parent = StatusBar

local StatusText = Instance.new("TextLabel")
StatusText.Name = "StatusText"
StatusText.BackgroundTransparency = 1
StatusText.Size = UDim2.new(1, -16, 1, 0)
StatusText.Position = UDim2.new(0, 14, 0, 0)
StatusText.Font = Enum.Font.GothamMedium
StatusText.Text = "● Anti-AFK активен"
StatusText.TextColor3 = C.Green
StatusText.TextSize = 12
StatusText.TextXAlignment = Enum.TextXAlignment.Left
StatusText.Parent = StatusBar

-- ═══════════════ ПОДПИСЬ ВНИЗУ ═══════════════
local Footer = Instance.new("TextLabel")
Footer.BackgroundTransparency = 1
Footer.Position = UDim2.new(0, 0, 1, -22)
Footer.Size = UDim2.new(1, 0, 0, 16)
Footer.Font = Enum.Font.Gotham
Footer.Text = "sdfsd2648 © 2025 · Anti-AFK V3"
Footer.TextColor3 = C.TextDim
Footer.TextSize = 10
Footer.Parent = Main

-- ═══════════════ ПЕРЕТАСКИВАНИЕ ═══════════════
local dragging, dragInput, dragStart, startPos

local function updateDrag(input)
    local delta = input.Position - dragStart
    Main.Position = UDim2.new(
        startPos.X.Scale, startPos.X.Offset + delta.X,
        startPos.Y.Scale, startPos.Y.Offset + delta.Y
    )
end

Header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
    or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = Main.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

Header.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement
    or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        updateDrag(input)
    end
end)

-- ═══════════════ ЛОГИКА AFK MODE ═══════════════
AfkBtn.MouseButton1Click:Connect(function()
    getgenv().AfkMode = not getgenv().AfkMode
    if getgenv().AfkMode then
        AfkBtn.Text = "😴 AFK MODE: ON"
        AfkBtn.BackgroundColor3 = C.Red
        AfkStroke.Color = C.Red
        StatusText.Text = "● AFK MODE — персонаж активен"
        StatusText.TextColor3 = C.Yellow
        StatusStroke.Color = C.Yellow
    else
        AfkBtn.Text = "😴 AFK MODE: OFF"
        AfkBtn.BackgroundColor3 = C.Card
        AfkStroke.Color = C.TextDim
        StatusText.Text = "● Anti-AFK активен"
        StatusText.TextColor3 = C.Green
        StatusStroke.Color = C.Green
    end
end)

AfkBtn.MouseEnter:Connect(function()
    if not getgenv().AfkMode then
        TweenService:Create(AfkBtn, TweenInfo.new(0.15), {BackgroundTransparency = 0}):Play()
    end
end)
AfkBtn.MouseLeave:Connect(function()
    TweenService:Create(AfkBtn, TweenInfo.new(0.15), {BackgroundTransparency = 0.15}):Play()
end)

-- ═══════════════ ФИШКА: SPIN MODE ═══════════════
-- Крутит камеру вокруг персонажа — выглядит как активность
getgenv().SpinMode = false

SpinBtn.MouseButton1Click:Connect(function()
    getgenv().SpinMode = not getgenv().SpinMode
    if getgenv().SpinMode then
        SpinBtn.Text = "🌀 SPIN: ON"
        SpinBtn.BackgroundColor3 = C.Accent
        SpinStroke.Color = C.Accent2
    else
        SpinBtn.Text = "🌀 SPIN: OFF"
        SpinBtn.BackgroundColor3 = C.Card
        SpinStroke.Color = C.TextDim
    end
end)

SpinBtn.MouseEnter:Connect(function()
    if not getgenv().SpinMode then
        TweenService:Create(SpinBtn, TweenInfo.new(0.15), {BackgroundTransparency = 0}):Play()
    end
end)
SpinBtn.MouseLeave:Connect(function()
    TweenService:Create(SpinBtn, TweenInfo.new(0.15), {BackgroundTransparency = 0.15}):Play()
end)

-- Логика SPIN — медленно вращаем камеру
RunService.RenderStepped:Connect(function(dt)
    if getgenv().SpinMode then
        local cam = workspace.CurrentCamera
        if cam then
            local cf = cam.CFrame
            local rot = CFrame.Angles(0, math.rad(30) * dt, 0)
            cam.CFrame = cf * rot
        end
    end
end)

-- ═══════════════ АНТИ-AFK (основной) ═══════════════
Players.LocalPlayer.Idled:Connect(function()
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)

-- Логика AFK-режима — лёгкие прыжки
RunService.Heartbeat:Connect(function()
    if getgenv().AfkMode then
        local plr = Players.LocalPlayer
        if plr and plr.Character then
            local hum = plr.Character:FindFirstChildOfClass("Humanoid")
            if hum and hum.Health > 0 then
                hum.Jump = true
            end
        end
    end
end)

-- ═══════════════ FPS СЧЁТЧИК ═══════════════
local frames = {}
local lastSec = tick()

RunService.RenderStepped:Connect(function()
    local now = tick()
    table.insert(frames, now)
    for i = #frames, 1, -1 do
        if frames[i] < now - 1 then
            table.remove(frames, i)
        end
    end
    if now - lastSec >= 1 then
        local fps = #frames
        FpsValue.Text = tostring(fps)
        -- Меняем цвет в зависимости от FPS
        if fps >= 50 then
            FpsValue.TextColor3 = C.Green
        elseif fps >= 25 then
            FpsValue.TextColor3 = C.Yellow
        else
            FpsValue.TextColor3 = C.Red
        end
        lastSec = now
    end
end)

-- ═══════════════ PING СЧЁТЧИК ═══════════════
task.spawn(function()
    while ScreenGui.Parent do
        wait(1)
        local ok, ping = pcall(function()
            return Stats.PerformanceStats.Ping:GetValue()
        end)
        if ok and ping then
            local ms = math.floor(ping)
            PingValue.Text = tostring(ms)
            if ms < 100 then
                PingValue.TextColor3 = C.Green
            elseif ms < 250 then
                PingValue.TextColor3 = C.Yellow
            else
                PingValue.TextColor3 = C.Red
            end
        end
    end
end)

-- ═══════════════ ТАЙМЕР ═══════════════
task.spawn(function()
    local s, m, h = 0, 0, 0
    while ScreenGui.Parent do
        wait(1)
        if getgenv().AntiAfkTimer then
            s = s + 1
            if s >= 60 then s = 0; m = m + 1 end
            if m >= 60 then m = 0; h = h + 1 end
            TimeValue.Text = string.format("%d:%02d:%02d", h, m, s)
        end
    end
end)
