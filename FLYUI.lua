local NekoLib = {}

function NekoLib.Init()
    local main = Instance.new("ScreenGui")
    main.Name = "NekoFlyUI_V12"
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
    
    local MainCorner = Instance.new("UICorner", Frame)
    MainCorner.CornerRadius = UDim.new(0, 20)

    local UIStroke = Instance.new("UIStroke", Frame)
    UIStroke.Thickness = 3
    UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

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

    local Title = Instance.new("TextLabel", Frame)
    Title.Size = UDim2.new(1, 0, 0, 35)
    Title.BackgroundTransparency = 1
    Title.Text = "NYAN PROTOCOL"
    Title.Font = Enum.Font.GothamBold
    Title.TextSize = 11
    Title.TextColor3 = Color3.new(1, 1, 1)

    local function applyStyle(btn)
        Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 12)
        local s = Instance.new("UIStroke", btn)
        s.Thickness = 1.2
        s.Color = Color3.new(1, 1, 1)
        s.Transparency = 0.8
        btn.MouseEnter:Connect(function() btn.BackgroundTransparency = 0.1 end)
        btn.MouseLeave:Connect(function() btn.BackgroundTransparency = 0.3 end)
    end

    local mine = Instance.new("TextButton", Frame)
    mine.Text = "−"
    mine.Size = UDim2.new(0, 35, 0, 35)
    mine.Position = UDim2.new(0.5, -95, 0, 45)
    mine.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    mine.BackgroundTransparency = 0.3
    applyStyle(mine)

    local plus = Instance.new("TextButton", Frame)
    plus.Text = "+"
    plus.Size = UDim2.new(0, 35, 0, 35)
    plus.Position = UDim2.new(0.5, 60, 0, 45)
    plus.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    plus.BackgroundTransparency = 0.3
    applyStyle(plus)

    local speedDisp = Instance.new("TextLabel", Frame)
    speedDisp.Size = UDim2.new(0, 110, 0, 35)
    speedDisp.Position = UDim2.new(0.5, -55, 0, 45)
    speedDisp.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    speedDisp.BackgroundTransparency = 0.5
    speedDisp.Text = "MEOW: 1"
    speedDisp.Font = Enum.Font.GothamBold
    speedDisp.TextSize = 14
    Instance.new("UICorner", speedDisp).CornerRadius = UDim.new(0, 12)

    local up = Instance.new("TextButton", Frame)
    up.Text = "UP"
    up.Size = UDim2.new(0, 55, 0, 40)
    up.Position = UDim2.new(0.5, -95, 0, 85)
    up.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    up.BackgroundTransparency = 0.3
    up.Font = Enum.Font.GothamBold
    up.TextSize = 14
    applyStyle(up)

    local down = Instance.new("TextButton", Frame)
    down.Text = "DOWN"
    down.Size = UDim2.new(0, 55, 0, 40)
    down.Position = UDim2.new(0.5, 40, 0, 85)
    down.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    down.BackgroundTransparency = 0.3
    down.Font = Enum.Font.GothamBold
    down.TextSize = 12
    applyStyle(down)

    local onof = Instance.new("TextButton", Frame)
    onof.Text = "(=^ω^=)"
    onof.Size = UDim2.new(0, 70, 0, 40)
    onof.Position = UDim2.new(0.5, -35, 0, 85)
    onof.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    onof.BackgroundTransparency = 0.2
    onof.TextSize = 14
    applyStyle(onof)

    local ExpandBtn = Instance.new("TextButton", main)
    ExpandBtn.Size = UDim2.new(0, 50, 0, 50)
    ExpandBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    ExpandBtn.Text = "🐱"
    ExpandBtn.TextSize = 24
    ExpandBtn.Visible = false
    Instance.new("UICorner", ExpandBtn).CornerRadius = UDim.new(1, 0)
    local ExpandStroke = Instance.new("UIStroke", ExpandBtn)
    ExpandStroke.Thickness = 3

    task.spawn(function()
        while main.Parent do
            local rgb = Color3.fromHSV(tick() % 5 / 5, 0.7, 1)
            UIStroke.Color = rgb
            ExpandStroke.Color = rgb
            speedDisp.TextColor3 = rgb
            onof.TextColor3 = rgb
            Title.TextColor3 = rgb
            MiniBtn.TextColor3 = rgb
            CloseBtn.TextColor3 = rgb
            task.wait()
        end
    end)

    MiniBtn.MouseButton1Click:Connect(function()
        Frame.Visible = false
        ExpandBtn.Visible = true
        ExpandBtn.Position = Frame.Position
    end)

    ExpandBtn.MouseButton1Click:Connect(function()
        Frame.Visible = true
        ExpandBtn.Visible = false
    end)

    CloseBtn.MouseButton1Click:Connect(function()
        main:Destroy()
    end)

    return {
        Gui = main,
        Plus = plus,
        Minus = mine,
        Up = up,
        Down = down,
        Toggle = onof,
        Display = speedDisp
    }
end

return NekoLib
