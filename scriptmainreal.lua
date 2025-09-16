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

local NoKeyTab = Window:AddTab({ Title = "Script No Key" })

NoKeyTab:AddButton({
    Title = "Teddy Hub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Teddyseetink/Haidepzai/refs/heads/main/TeddyHub.lua"))()
    end
})

NoKeyTab:AddButton({
    Title = "Min Gaming Hub Eng",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LuaCrack/Min/refs/heads/main/MinUp27Eng"))()
    end
})

NoKeyTab:AddButton({
    Title = "W-Azure",
    Callback = function()
        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/85e904ae1ff30824c1aa007fc7324f8f.lua"))()
    end
})

NoKeyTab:AddButton({
    Title = "Astral Hub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Overgustx2/Main/refs/heads/main/BloxFruits_25.html"))()
    end
})

NoKeyTab:AddButton({
    Title = "Banana Fake",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/trongnguyenhubbloxfruit/TrongNguyenHub_Banana/refs/heads/main/BananaHubFreeBF.lua"))()
    end
})


local KeyTab = Window:AddTab({ Title = "Script Get Key" })

KeyTab:AddButton({
    Title = "HoHo Hub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/acsu123/HOHO_H/main/Loading_UI"))()
    end
})

KeyTab:AddButton({
    Title = "OMG Hub",
    Callback = function()
        loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/80a557829defe42d381746809857e884.lua"))()
    end
})

local InfoTab = Window:AddTab({ Title = "About" })
InfoTab:AddParagraph({
    Title = "OblivionHub",
    Content = "PC: LeftCtrl | Mobile: Open UI"
})

local PlayerGui = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "OblivionHub_Toggle"
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true
ScreenGui.Parent = PlayerGui


local Toggle = Instance.new("ImageButton")
Toggle.Name = "LogoButton"
Toggle.Parent = ScreenGui
Toggle.Size = UDim2.new(0, 50, 0, 50) 
Toggle.Position = UDim2.new(0, 20, 0, 200) 
Toggle.BackgroundTransparency = 1 
Toggle.Image = "rbxassetid://123613480810490" 

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(1, 0)
UICorner.Parent = Toggle

local isHidden = false
Toggle.MouseButton1Click:Connect(function()
    Window:Minimize(not isHidden)
    isHidden = not isHidden
end)

local UserInputService = game:GetService("UserInputService")
local dragging, dragStart, startPos

Toggle.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch then
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
    if dragging and input.UserInputType == Enum.UserInputType.Touch then
        local delta = input.Position - dragStart
        Toggle.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end
end)
