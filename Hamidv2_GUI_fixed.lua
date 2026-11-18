--[[
	WARNING: Heads up! This script has not been verified by ScriptBlox. Use at your own risk!
]]
-- Services
local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterGui = game:GetService("StarterGui")

-- Cleanup old GUI if exists
if CoreGui:FindFirstChild("ToxicChocoSpammer") then
    CoreGui.ToxicChocoSpammer:Destroy()
end
if CoreGui:FindFirstChild("HAMIDDaddySpammer") then
    CoreGui.HAMIDDaddySpammer:Destroy()
end

-- ScreenGui Setup
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ToxicChocoSpammer"
ScreenGui.Parent = CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

----------------------------------------------------------------
----------------------------------------------------------------
-- Startup chat message removed: this version does not send chat messages.

----------------------------------------------------------------
-- 1. INTRO SCREEN (WITH NEW MESSAGE ✨)
----------------------------------------------------------------
local IntroFrame = Instance.new("Frame")
IntroFrame.Size = UDim2.new(1, 0, 1, 0)
IntroFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
IntroFrame.BorderSizePixel = 0
IntroFrame.ZIndex = 10
IntroFrame.Parent = ScreenGui

local RedGradient = Instance.new("UIGradient")
RedGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(50, 0, 0)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(150, 0, 20)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(30, 0, 0))
})
RedGradient.Rotation = 45
RedGradient.Parent = IntroFrame

local IntroText = Instance.new("TextLabel")
IntroText.Size = UDim2.new(1, 0, 1, 0)
IntroText.BackgroundTransparency = 1
IntroText.Font = Enum.Font.GothamBold
IntroText.Text = "🔥HAMID SPAMMER 😝\n( MADE BY HAMID 😉)\n\n🥶HAMID PAPA IS HERE SAB LEAVE KRO😝BHAAGO😎\n(☠️ AB KOI BACH NI SAKTA) ✨"
IntroText.TextColor3 = Color3.fromRGB(255, 255, 255)
IntroText.TextSize = 28
IntroText.ZIndex = 11
IntroText.Parent = IntroFrame

-- Pop-up Roblox Notification
task.spawn(function()
    StarterGui:SetCore("SendNotification", {
        Title = "HAMID😉SPAM",
        Text = "🥶 hamid v2 executed SABKO PELDO ✨",
        Duration = 5
    })
end)

----------------------------------------------------------------
-- 2. FLOATING BUTTON (☠️) - DRAGGABLE
----------------------------------------------------------------
local FlowerBtn = Instance.new("TextButton")
FlowerBtn.Size = UDim2.new(0, 60, 0, 60)
FlowerBtn.Position = UDim2.new(0, 20, 0.5, -30)
FlowerBtn.BackgroundColor3 = Color3.fromRGB(25, 10, 15)
FlowerBtn.BorderColor3 = Color3.fromRGB(220, 20, 60)
FlowerBtn.BorderSizePixel = 2
FlowerBtn.Text = "☠️"
FlowerBtn.TextSize = 28
FlowerBtn.Visible = false
FlowerBtn.ZIndex = 5
FlowerBtn.Active = true     
FlowerBtn.Draggable = true  
FlowerBtn.Parent = ScreenGui

local FlowerCorner = Instance.new("UICorner")
FlowerCorner.CornerRadius = UDim.new(1, 0)
FlowerCorner.Parent = FlowerBtn

----------------------------------------------------------------
-- 3. MAIN UI WINDOW (Animated & Crimson Theme)
----------------------------------------------------------------
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 0, 0, 0) 
MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 10, 12) 
MainFrame.BorderSizePixel = 0
MainFrame.Visible = false
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.ClipsDescendants = true 
MainFrame.ZIndex = 2
MainFrame.Parent = ScreenGui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.Parent = MainFrame

local MainStroke = Instance.new("UIStroke")
MainStroke.Color = Color3.fromRGB(220, 20, 60) 
MainStroke.Thickness = 2
MainStroke.Parent = MainFrame

----------------------------------------------------------------
-- 3.1 TOP BAR & OWNER BRANDING (TOP SHIFTED)
----------------------------------------------------------------
local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size = UDim2.new(1, 0, 0, 35)
TitleLabel.BackgroundColor3 = Color3.fromRGB(25, 10, 15)
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.Text = " 🔥 HAMID MESSAGE TESTER V2 "
TitleLabel.TextColor3 = Color3.fromRGB(255, 150, 150)
TitleLabel.TextSize = 14
TitleLabel.TextXAlignment = Enum.TextXAlignment.Center
TitleLabel.ZIndex = 3
TitleLabel.Parent = MainFrame

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 12)
TitleCorner.Parent = TitleLabel

local MinimizeBtn = Instance.new("TextButton")
MinimizeBtn.Size = UDim2.new(0, 35, 0, 35)
MinimizeBtn.Position = UDim2.new(1, -40, 0, 0)
MinimizeBtn.BackgroundColor3 = Color3.fromRGB(40, 15, 20)
MinimizeBtn.Font = Enum.Font.GothamBold
MinimizeBtn.Text = "—"
MinimizeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeBtn.TextSize = 16
MinimizeBtn.ZIndex = 4
MinimizeBtn.Parent = MainFrame

local MinimizeCorner = Instance.new("UICorner")
MinimizeCorner.CornerRadius = UDim.new(0, 6)
MinimizeCorner.Parent = MinimizeBtn

local OwnerPanel = Instance.new("Frame")
OwnerPanel.Size = UDim2.new(1, 0, 0, 25)
OwnerPanel.Position = UDim2.new(0, 0, 0, 35) 
OwnerPanel.BackgroundColor3 = Color3.fromRGB(40, 10, 20)
OwnerPanel.BorderSizePixel = 0
OwnerPanel.ZIndex = 3
OwnerPanel.Parent = MainFrame

local OwnerText = Instance.new("TextLabel")
OwnerText.Size = UDim2.new(1, 0, 1, 0)
OwnerText.BackgroundTransparency = 1
OwnerText.Font = Enum.Font.GothamBold
OwnerText.Text = "👑 OWNER : HAMIDHERE🖤 | REMEMBER HAMID PAPA NEVEL LOSE😝"
OwnerText.TextColor3 = Color3.fromRGB(255, 100, 100)
OwnerText.TextSize = 12
OwnerText.TextXAlignment = Enum.TextXAlignment.Center
OwnerText.Parent = OwnerPanel

----------------------------------------------------------------
-- UI ANIMATION FUNCTIONS 
----------------------------------------------------------------
local function animateUIOpen()
    MainFrame.Visible = true
    MainFrame.Size = UDim2.new(0, 0, 0, 0)
    TweenService:Create(MainFrame, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = UDim2.new(0, 480, 0, 490)}):Play()
end

local function animateUIClose()
    local hideTween = TweenService:Create(MainFrame, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.In), {Size = UDim2.new(0, 0, 0, 0)})
    hideTween:Play()
    hideTween.Completed:Wait()
    MainFrame.Visible = false
    FlowerBtn.Visible = true
end

local function addPopAnimation(btn)
    local scale = Instance.new("UIScale")
    scale.Parent = btn
    
    btn.MouseEnter:Connect(function()
        TweenService:Create(scale, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Scale = 1.05}):Play()
    end)
    btn.MouseLeave:Connect(function()
        TweenService:Create(scale, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Scale = 1.0}):Play()
    end)
    btn.MouseButton1Down:Connect(function()
        TweenService:Create(scale, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Scale = 0.95}):Play()
    end)
    btn.MouseButton1Up:Connect(function()
        TweenService:Create(scale, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Scale = 1.05}):Play()
    end)
end

addPopAnimation(MinimizeBtn)

MinimizeBtn.MouseButton1Click:Connect(function()
    animateUIClose()
end)

----------------------------------------------------------------
-- 4. CONTROLS & 10 TARGET FIELDS (Full Width)
----------------------------------------------------------------
local TargetLabel = Instance.new("TextLabel")
TargetLabel.Size = UDim2.new(0, 440, 0, 20)
TargetLabel.Position = UDim2.new(0, 20, 0, 70)
TargetLabel.BackgroundTransparency = 1
TargetLabel.Font = Enum.Font.GothamSemibold
TargetLabel.Text = "Target notes (preview only):"
TargetLabel.TextColor3 = Color3.fromRGB(255, 150, 150)
TargetLabel.TextSize = 13
TargetLabel.TextXAlignment = Enum.TextXAlignment.Left
TargetLabel.Parent = MainFrame

local TargetScroll = Instance.new("ScrollingFrame")
TargetScroll.Size = UDim2.new(0, 440, 0, 120)
TargetScroll.Position = UDim2.new(0, 20, 0, 95)
TargetScroll.BackgroundColor3 = Color3.fromRGB(20, 10, 15)
TargetScroll.BorderSizePixel = 0
TargetScroll.CanvasSize = UDim2.new(0, 0, 0, 180) 
TargetScroll.ScrollBarThickness = 5
TargetScroll.ScrollBarImageColor3 = Color3.fromRGB(220, 20, 60)
TargetScroll.Parent = MainFrame

local ScrollCorner = Instance.new("UICorner")
ScrollCorner.CornerRadius = UDim.new(0, 6)
ScrollCorner.Parent = TargetScroll

local UIGrid = Instance.new("UIGridLayout")
UIGrid.SortOrder = Enum.SortOrder.LayoutOrder
UIGrid.CellPadding = UDim2.new(0, 5, 0, 5)
UIGrid.CellSize = UDim2.new(0, 210, 0, 30) 
UIGrid.FillDirectionMaxCells = 2 
UIGrid.Parent = TargetScroll

local UIPadding = Instance.new("UIPadding")
UIPadding.PaddingTop = UDim.new(0, 5)
UIPadding.PaddingLeft = UDim.new(0, 5)
UIPadding.PaddingRight = UDim.new(0, 5)
UIPadding.Parent = TargetScroll

local TargetBoxes = {}

for i = 1, 10 do
    local tBox = Instance.new("TextBox")
    tBox.Name = "TargetBox_" .. i
    tBox.BackgroundColor3 = Color3.fromRGB(35, 15, 20)
    tBox.BorderSizePixel = 0
    tBox.Font = Enum.Font.Gotham
    tBox.PlaceholderText = "Target " .. i .. "..."
    tBox.Text = ""
    tBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    tBox.TextSize = 12
    tBox.LayoutOrder = i
    tBox.Parent = TargetScroll
    
    local bCorner = Instance.new("UICorner")
    bCorner.CornerRadius = UDim.new(0, 5)
    bCorner.Parent = tBox
    
    table.insert(TargetBoxes, tBox)
end

-- Custom Message Input Box
local CustomMsgBox = Instance.new("TextBox")
local CustomMsgLabel = Instance.new("TextLabel")
CustomMsgLabel.Size = UDim2.new(0, 440, 0, 20)
CustomMsgLabel.Position = UDim2.new(0, 20, 0, 225)
CustomMsgLabel.BackgroundTransparency = 1
CustomMsgLabel.Font = Enum.Font.GothamSemibold
CustomMsgLabel.Text = "Custom Message:"
CustomMsgLabel.TextColor3 = Color3.fromRGB(255, 150, 150)
CustomMsgLabel.TextSize = 13
CustomMsgLabel.TextXAlignment = Enum.TextXAlignment.Left
CustomMsgLabel.Parent = MainFrame

CustomMsgBox.Size = UDim2.new(0, 440, 0, 35)
CustomMsgBox.Position = UDim2.new(0, 20, 0, 245)
CustomMsgBox.BackgroundColor3 = Color3.fromRGB(35, 15, 20)
CustomMsgBox.BorderSizePixel = 0
CustomMsgBox.Font = Enum.Font.Gotham
CustomMsgBox.PlaceholderText = "Type a message to preview..."
CustomMsgBox.Text = ""
CustomMsgBox.TextColor3 = Color3.fromRGB(255, 255, 255)
CustomMsgBox.TextSize = 13
CustomMsgBox.Parent = MainFrame

local CustomMsgCorner = Instance.new("UICorner")
CustomMsgCorner.CornerRadius = UDim.new(0, 6)
CustomMsgCorner.Parent = CustomMsgBox

-- Delay Time Input Box
local DelayBox = Instance.new("TextBox")
local DelayLabel = Instance.new("TextLabel")
DelayLabel.Size = UDim2.new(0, 440, 0, 20)
DelayLabel.Position = UDim2.new(0, 20, 0, 290)
DelayLabel.BackgroundTransparency = 1
DelayLabel.Font = Enum.Font.GothamSemibold
DelayLabel.Text = "Delay (Seconds):"
DelayLabel.TextColor3 = Color3.fromRGB(255, 150, 150)
DelayLabel.TextSize = 13
DelayLabel.TextXAlignment = Enum.TextXAlignment.Left
DelayLabel.Parent = MainFrame

DelayBox.Size = UDim2.new(0, 440, 0, 35)
DelayBox.Position = UDim2.new(0, 20, 0, 310)
DelayBox.BackgroundColor3 = Color3.fromRGB(35, 15, 20)
DelayBox.BorderSizePixel = 0
DelayBox.Font = Enum.Font.Gotham
DelayBox.Text = "2.4" 
DelayBox.TextColor3 = Color3.fromRGB(255, 255, 255)
DelayBox.TextSize = 13
DelayBox.Parent = MainFrame

local DelayCorner = Instance.new("UICorner")
DelayCorner.CornerRadius = UDim.new(0, 6)
DelayCorner.Parent = DelayBox

----------------------------------------------------------------
-- 4.5 TWO SIDE-BY-SIDE BUTTONS (START & MODE)
----------------------------------------------------------------
local ToggleBtn = Instance.new("TextButton")
ToggleBtn.Size = UDim2.new(0, 215, 0, 45)
ToggleBtn.Position = UDim2.new(0, 20, 0, 360)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(220, 20, 60)
ToggleBtn.Font = Enum.Font.GothamBold
ToggleBtn.Text = "START"
ToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleBtn.TextSize = 15
ToggleBtn.Parent = MainFrame

local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(0, 8)
ToggleCorner.Parent = ToggleBtn
addPopAnimation(ToggleBtn)

local isBurstMode = false 
local ModeBtn = Instance.new("TextButton")
ModeBtn.Size = UDim2.new(0, 215, 0, 45)
ModeBtn.Position = UDim2.new(0, 245, 0, 360)
ModeBtn.BackgroundColor3 = Color3.fromRGB(59, 130, 246) 
ModeBtn.Font = Enum.Font.GothamBold
ModeBtn.Text = "MODE: NORMAL 🐢"
ModeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ModeBtn.TextSize = 14
ModeBtn.Parent = MainFrame

local ModeCorner = Instance.new("UICorner")
ModeCorner.CornerRadius = UDim.new(0, 8)
ModeCorner.Parent = ModeBtn
addPopAnimation(ModeBtn)

ModeBtn.MouseButton1Click:Connect(function()
    isBurstMode = not isBurstMode
    if isBurstMode then
        ModeBtn.Text = "MODE: FAST PREVIEW ⚡"
        ModeBtn.BackgroundColor3 = Color3.fromRGB(150, 20, 180) 
        DelayBox.Text = "0.5" 
    else
        ModeBtn.Text = "MODE: NORMAL 🐢"
        ModeBtn.BackgroundColor3 = Color3.fromRGB(59, 130, 246)
        DelayBox.Text = "2.4" 
    end
end)

-- Status Display Label (Centered)
local StatusLabel = Instance.new("TextLabel")
StatusLabel.Size = UDim2.new(0, 440, 0, 30)
StatusLabel.Position = UDim2.new(0, 20, 0, 415)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Font = Enum.Font.GothamSemibold
StatusLabel.Text = "Status: Stopped 🔴"
StatusLabel.TextColor3 = Color3.fromRGB(239, 68, 68)
StatusLabel.TextSize = 14
StatusLabel.TextXAlignment = Enum.TextXAlignment.Center
StatusLabel.Parent = MainFrame

----------------------------------------------------------------
-- 5. INTRO ANIMATION & FLOW
----------------------------------------------------------------
task.spawn(function()
    task.wait(3.0) 
    local tweenInfo = TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local fadeTween = TweenService:Create(IntroFrame, tweenInfo, {BackgroundTransparency = 1})
    local textFade = TweenService:Create(IntroText, tweenInfo, {TextTransparency = 1})
    fadeTween:Play()
    textFade:Play()
    task.wait(0.8)
    IntroFrame:Destroy()
    
    FlowerBtn.Visible = true
    addPopAnimation(FlowerBtn)
end)

FlowerBtn.MouseButton1Click:Connect(function()
    FlowerBtn.Visible = false
    animateUIOpen() 
end)

----------------------------------------------------------------
-- 6. LOCAL PREVIEW CONTROLS (NO CHAT MESSAGES ARE SENT)
----------------------------------------------------------------
local isPreviewRunning = false
local previewCount = 0
local previewMessages = {
    "Preview is running locally",
    "Press STOP to pause the preview"
}

local PreviewLabel = Instance.new("TextLabel")
PreviewLabel.Size = UDim2.new(0, 440, 0, 36)
PreviewLabel.Position = UDim2.new(0, 20, 0, 450)
PreviewLabel.BackgroundColor3 = Color3.fromRGB(35, 15, 20)
PreviewLabel.BorderSizePixel = 0
PreviewLabel.Font = Enum.Font.Gotham
PreviewLabel.Text = "Preview only — no chat messages are sent"
PreviewLabel.TextColor3 = Color3.fromRGB(255, 210, 210)
PreviewLabel.TextSize = 12
PreviewLabel.TextWrapped = true
PreviewLabel.Parent = MainFrame

local PreviewCorner = Instance.new("UICorner")
PreviewCorner.CornerRadius = UDim.new(0, 6)
PreviewCorner.Parent = PreviewLabel

ToggleBtn.MouseButton1Click:Connect(function()
    isPreviewRunning = not isPreviewRunning

    if isPreviewRunning then
        ToggleBtn.Text = "STOP"
        ToggleBtn.BackgroundColor3 = Color3.fromRGB(100, 15, 25)
        StatusLabel.Text = "Status: Preview running 🟢"
        StatusLabel.TextColor3 = Color3.fromRGB(74, 222, 128)

        task.spawn(function()
            while isPreviewRunning do
                previewCount += 1
                local customText = string.match(CustomMsgBox.Text, "^%s*(.-)%s*$")
                if customText and customText ~= "" then
                    PreviewLabel.Text = "Preview " .. previewCount .. ": " .. customText
                else
                    local statusText = previewMessages[((previewCount - 1) % #previewMessages) + 1]
                    PreviewLabel.Text = "Preview " .. previewCount .. ": " .. statusText
                end

                local delaySeconds = tonumber(DelayBox.Text)
                if not delaySeconds then
                    delaySeconds = 2.4
                    DelayBox.Text = "2.4"
                end
                delaySeconds = math.clamp(delaySeconds, 0.5, 30)
                task.wait(delaySeconds)
            end
        end)
    else
        ToggleBtn.Text = "START"
        ToggleBtn.BackgroundColor3 = Color3.fromRGB(220, 20, 60)
        StatusLabel.Text = "Status: Stopped 🔴"
        StatusLabel.TextColor3 = Color3.fromRGB(239, 68, 68)
        PreviewLabel.Text = "Preview stopped — nothing was sent"
    end
end)
