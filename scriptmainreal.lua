local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

local Window = Fluent:CreateWindow({
    Title = "OblivionHub",
    SubTitle = "Multi Script Loader",
    TabWidth = 160,
    Size = UDim2.fromOffset(500, 350),
    Theme = "Dark",
    Acrylic = false,
    MinimizeKey = Enum.KeyCode.LeftControl
})

local ScriptsTab = Window:AddTab({ Title = "Scripts" })

ScriptsTab:AddLabel({ Title = "Script No Key", Description = "" })

ScriptsTab:AddButton({
    Title = "Teddy Hub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Teddyseetink/Haidepzai/refs/heads/main/TeddyHub.lua"))()
    end
})

ScriptsTab:AddButton({
    Title = "Min Gaming Hub Eng",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LuaCrack/Min/refs/heads/main/MinUp27Eng"))()
    end
})

ScriptsTab:AddButton({
    Title = "W-Azure",
    Callback = function()
        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/85e904ae1ff30824c1aa007fc7324f8f.lua"))()
    end
})

ScriptsTab:AddButton({
    Title = "Astral Hub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Overgustx2/Main/refs/heads/main/BloxFruits_25.html"))()
    end
})

ScriptsTab:AddButton({
    Title = "Xeter Hub V3",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LuaCrack/Loader/refs/heads/main/XeterV3"))()
    end
})

ScriptsTab:AddLabel({ Title = "Script Get Key", Description = "" })

ScriptsTab:AddButton({
    Title = "HoHo Hub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/acsu123/HOHO_H/main/Loading_UI"))()
    end
})

ScriptsTab:AddButton({
    Title = "Example Get Key 2",
    Callback = function()
        loadstring(game:HttpGet("https://example.com/getkey2.lua"))()
    end
})

local InfoTab = Window:AddTab({ Title = "About" })
InfoTab:AddParagraph({
    Title = "OblivionHub",
    Content = "PC: LeftCtrl | Mobile: Logo"
})

local PlayerGui = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "OblivionHub_Toggle"
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true
ScreenGui.Parent = PlayerGui

local Toggle = Instance.new("ImageButton")
Toggle.Name = "OblivionLogo"
Toggle.Parent = ScreenGui
Toggle.Size = UDim2.new(0, 56, 0, 56)
Toggle.Position = UDim2.new(0, 12, 0, 180)
Toggle.BackgroundTransparency = 1
Toggle.Image = "rbxassetid://123613480810490"
Toggle.ZIndex = 50

local UIC = Instance.new("UICorner", Toggle)
UIC.CornerRadius = UDim.new(1, 0)

local BG = Instance.new("Frame")
BG.Name = "LogoBG"
BG.Parent = ScreenGui
BG.Size = UDim2.new(0, 70, 0, 70)
BG.Position = Toggle.Position - UDim2.new(0, 7, 0, -7)
BG.BackgroundColor3 = Color3.fromRGB(0,0,0)
BG.BackgroundTransparency = 0.6
BG.ZIndex = 49
local BGCorner = Instance.new("UICorner", BG)
BGCorner.CornerRadius = UDim.new(1, 0)

local function syncBG()
    BG.Position = Toggle.Position - UDim2.new(0, 7, 0, -7)
end

local isHidden = false
Toggle.MouseButton1Click:Connect(function()
    isHidden = not isHidden
    pcall(function() Window:Minimize(not isHidden) end)
end)

local UserInputService = game:GetService("UserInputService")
local dragging, dragStart, startPos

Toggle.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = Toggle.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseMovement) then
        local delta = input.Position - dragStart
        Toggle.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
        syncBG()
    end
end)

game:GetService("Players").LocalPlayer.CharacterAdded:Connect(function()
    Toggle.Position = UDim2.new(0, 12, 0, 180)
    syncBG()
end)
