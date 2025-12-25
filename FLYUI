-- GitHub 檔案: NekoUI.lua
local NekoLib = {}

function NekoLib.Init()
    local main = Instance.new("ScreenGui")
    main.Name = "NekoFlyUI_Remote"
    main.ResetOnSpawn = false
    
    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(0, 210, 0, 130)
    Frame.Position = UDim2.new(0.5, -105, 0.4, 0)
    Frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    Frame.BackgroundTransparency = 0.25
    Frame.BorderSizePixel = 0
    Frame.Active = true
    Frame.Draggable = true
    Frame.Parent = main
    
    Instance.new("UICorner", Frame).CornerRadius = UDim.new(0, 20)
    local UIStroke = Instance.new("UIStroke", Frame)
    UIStroke.Thickness = 3
    UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

    -- 頂部圖示 (🐱 標題 🐾)
    local MiniBtn = Instance.new("TextButton", Frame)
    MiniBtn.Size = UDim2.new(0, 30, 0, 30)
    MiniBtn.Position = UDim2.new(0, 8, 0, 8)
    MiniBtn.BackgroundTransparency = 1
    MiniBtn.Text = "🐱"
    MiniBtn.TextSize = 22

    local CloseBtn = Instance.new("TextButton", Frame)
    CloseBtn.Size = UDim2.new(0, 30, 0, 30)
    CloseBtn.Position = UDim2.new(1, -38, 0, 8)
    CloseBtn.BackgroundTransparency = 1
    CloseBtn.Text = "🐾"
    CloseBtn.TextSize = 20

    local speedDisp = Instance.new("TextLabel", Frame)
    speedDisp.Size = UDim2.new(0, 110, 0, 35)
    speedDisp.Position = UDim2.new(0.5, -55, 0, 45)
    speedDisp.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    speedDisp.BackgroundTransparency = 0.5
    speedDisp.Text = "MEOW: 1"
    speedDisp.Font = Enum.Font.GothamBold
    speedDisp.TextColor3 = Color3.new(1,1,1)
    Instance.new("UICorner", speedDisp).CornerRadius = UDim.new(0, 12)

    local onof = Instance.new("TextButton", Frame)
    onof.Text = "(=^ω^=)"
    onof.Size = UDim2.new(0, 70, 0, 40)
    onof.Position = UDim2.new(0.5, -35, 0, 85)
    onof.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    onof.BackgroundTransparency = 0.2
    onof.TextColor3 = Color3.new(1,1,1)
    Instance.new("UICorner", onof).CornerRadius = UDim.new(0, 12)

    -- RGB 循環 (內部自動運行)
    task.spawn(function()
        while main.Parent do
            local hue = tick() % 5 / 5
            local rgb = Color3.fromHSV(hue, 0.7, 1)
            UIStroke.Color = rgb
            speedDisp.TextColor3 = rgb
            onof.TextColor3 = rgb
            MiniBtn.TextColor3 = rgb
            CloseBtn.TextColor3 = rgb
            task.wait()
        end
    end)

    -- 回傳組件供外部邏輯綁定
    return {
        Gui = main,
        Plus = nil, -- 你可以在這裡繼續添加其他按鈕引用
        Minus = nil,
        Toggle = onof,
        Display = speedDisp,
        Close = CloseBtn
    }
end

return NekoLib
