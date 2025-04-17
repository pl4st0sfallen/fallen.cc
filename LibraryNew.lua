local UILibrary = {}
UILibrary.__index = UILibrary

-- Initialize library
function UILibrary.new(title)
    local library = {}
    setmetatable(library, UILibrary)
    
    -- Main GUI elements
    library.ScreenGui = Instance.new("ScreenGui")
    library.Main = Instance.new("Frame")
    library.Main2 = Instance.new("Frame")
    library.Main3 = Instance.new("Frame")
    library.TabsContainer = Instance.new("Frame")
    library.MainTabs = Instance.new("Frame")
    library.TabsContent = Instance.new("Frame")
    
    -- Store tabs and their content
    library.tabs = {}
    library.currentTabContent = nil
    library.tabButtons = {}
    
    -- Setup GUI
    library:SetupGui(title)
    
    return library
end

-- Setup the main GUI elements
function UILibrary:SetupGui(title)
    -- ScreenGui
    self.ScreenGui.Name = "UILibrary"
    self.ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    self.ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    
    -- Main background
    self.Main.Name = "Main"
    self.Main.ZIndex = -1
    self.Main.Size = UDim2.new(1, 0, 1, 0)
    self.Main.BorderSizePixel = 0
    self.Main.BackgroundTransparency = 0.2
    self.Main.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    self.Main.Parent = self.ScreenGui
    
    -- Main2 container
    self.Main2.Name = "Main2"
    self.Main2.Size = UDim2.new(0, 955, 0, 573)
    self.Main2.BorderSizePixel = 0
    self.Main2.Position = UDim2.new(0.5, -477, 0.5, -286)
    self.Main2.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    self.Main2.Parent = self.Main
    
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 10)
    UICorner.Parent = self.Main2
    
    -- Main3 inner container
    self.Main3.Name = "Main3"
    self.Main3.Size = UDim2.new(0, 945, 0, 561)
    self.Main3.BorderSizePixel = 0
    self.Main3.Position = UDim2.new(0.004, 0, 0.012, 0)
    self.Main3.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    self.Main3.Parent = self.Main2
    
    local UICorner2 = Instance.new("UICorner")
    UICorner2.Parent = self.Main3
    
    local UIStroke = Instance.new("UIStroke")
    UIStroke.Color = Color3.fromRGB(0, 0, 0)
    UIStroke.Parent = self.Main3
    
    -- Tabs container
    self.TabsContainer.Name = "TabsContainer"
    self.TabsContainer.Size = UDim2.new(0, 93, 0, 547)
    self.TabsContainer.BorderSizePixel = 0
    self.TabsContainer.Position = UDim2.new(0.009, 0, 0.014, 0)
    self.TabsContainer.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    self.TabsContainer.Parent = self.Main3
    
    local UICorner3 = Instance.new("UICorner")
    UICorner3.Parent = self.TabsContainer
    
    local UIStroke2 = Instance.new("UIStroke")
    UIStroke2.Color = Color3.fromRGB(0, 0, 0)
    UIStroke2.Parent = self.TabsContainer
    
    local UIListLayout = Instance.new("UIListLayout")
    UIListLayout.Padding = UDim.new(0, 8)
    UIListLayout.Parent = self.TabsContainer
    
    local UIPadding = Instance.new("UIPadding")
    UIPadding.PaddingTop = UDim.new(0, 5)
    UIPadding.PaddingLeft = UDim.new(0, 5)
    UIPadding.Parent = self.TabsContainer
    
    -- Main tabs content area
    self.MainTabs.Name = "MainTabs"
    self.MainTabs.Size = UDim2.new(1, 0, 1, 0)
    self.MainTabs.BorderSizePixel = 0
    self.MainTabs.BackgroundTransparency = 1
    self.MainTabs.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    self.MainTabs.Parent = self.Main3
    
    self.TabsContent.Name = "TabsContent"
    self.TabsContent.Size = UDim2.new(0, 825, 0, 542)
    self.TabsContent.BorderSizePixel = 0
    self.TabsContent.BackgroundTransparency = 1
    self.TabsContent.Position = UDim2.new(0.116, 0, 0.014, 0)
    self.TabsContent.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    self.TabsContent.Parent = self.MainTabs
end

-- Create a new tab
function UILibrary:CreateTab(name, iconId)
    -- Tab button in sidebar
    local tab = Instance.new("Frame")
    local textLabel = Instance.new("TextLabel")
    local imageLabel = Instance.new("ImageLabel")
    local UICorner = Instance.new("UICorner")
    local interactButton = Instance.new("TextButton")
    
    tab.Name = "tab_" .. name
    tab.Size = UDim2.new(0, 83, 0, 68)
    tab.BorderSizePixel = 0
    tab.BackgroundTransparency = 1
    tab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    tab.Parent = self.TabsContainer
    
    textLabel.Size = UDim2.new(0, 64, 0, 17)
    textLabel.BorderSizePixel = 0
    textLabel.BackgroundTransparency = 1
    textLabel.Position = UDim2.new(0.103, 0, 0.754, 0)
    textLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    textLabel.Text = string.upper(name)
    textLabel.FontFace = Font.new("rbxassetid://11702779409", Enum.FontWeight.Bold)
    textLabel.TextWrapped = true
    textLabel.TextScaled = true
    textLabel.Parent = tab
    
    imageLabel.Size = UDim2.new(0, 35, 0, 35)
    imageLabel.BorderSizePixel = 0
    imageLabel.BackgroundTransparency = 1
    imageLabel.Position = UDim2.new(0.289, 0, 0.096, 0)
    imageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    imageLabel.Image = iconId or "rbxassetid://9794889523" -- Default icon if none provided
    imageLabel.Parent = tab
    
    UICorner.CornerRadius = UDim.new(0, 7)
    UICorner.Parent = tab
    
    interactButton.Name = "Interact"
    interactButton.AutoButtonColor = true
    interactButton.Size = UDim2.new(1, 0, 1, 0)
    interactButton.BorderSizePixel = 0
    interactButton.BackgroundTransparency = 1
    interactButton.Text = ""
    interactButton.Parent = tab
    
    -- Tab content container
    local tabContent = Instance.new("Frame")
    local UICorner2 = Instance.new("UICorner")
    local UIStroke = Instance.new("UIStroke")
    local UIPadding = Instance.new("UIPadding")
    local scrollingFrame = Instance.new("ScrollingFrame")
    local UIListLayout = Instance.new("UIListLayout")
    
    tabContent.Name = "TabContent_" .. name
    tabContent.Size = UDim2.new(0, 269, 0, 547)
    tabContent.BorderSizePixel = 0
    tabContent.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    tabContent.Visible = false
    tabContent.Parent = self.TabsContent
    
    UICorner2.Parent = tabContent
    
    UIStroke.Color = Color3.fromRGB(0, 0, 0)
    UIStroke.Parent = tabContent
    
    UIPadding.PaddingTop = UDim.new(0, 2)
    UIPadding.PaddingLeft = UDim.new(0, 4)
    UIPadding.Parent = tabContent
    
    scrollingFrame.Active = true
    scrollingFrame.Size = UDim2.new(0, 245, 0, 520)
    scrollingFrame.BorderSizePixel = 0
    scrollingFrame.BackgroundTransparency = 1
    scrollingFrame.Position = UDim2.new(0.034, 0, 0.013, 0)
    scrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    scrollingFrame.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
    scrollingFrame.ScrollBarImageTransparency = 0.33
    scrollingFrame.ElasticBehavior = Enum.ElasticBehavior.Never
    scrollingFrame.ScrollBarThickness = 5
    scrollingFrame.Parent = tabContent
    
    UIListLayout.Padding = UDim.new(0, 2)
    UIListLayout.Parent = scrollingFrame
    
    -- Auto-size scrolling frame content
    UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y)
    end)
    
    -- Store tab info
    local tabInfo = {
        button = tab,
        content = tabContent,
        scrollingFrame = scrollingFrame
    }
    
    self.tabs[name] = tabInfo
    table.insert(self.tabButtons, tab)
    
    -- Tab button functionality
    interactButton.MouseButton1Click:Connect(function()
        self:SelectTab(name)
    end)
    
    -- Select this tab if it's the first one
    if #self.tabButtons == 1 then
        self:SelectTab(name)
    end
    
    return {
        CreateSection = function(sectionName)
            return self:CreateSection(name, sectionName)
        end
    }
end

-- Select and show a tab
function UILibrary:SelectTab(tabName)
    -- Hide all tab content
    for _, tabData in pairs(self.tabs) do
        tabData.content.Visible = false
        tabData.button.BackgroundTransparency = 1
    end
    
    -- Show selected tab content
    local selectedTab = self.tabs[tabName]
    if selectedTab then
        selectedTab.content.Visible = true
        selectedTab.button.BackgroundTransparency = 0.8
    end
    
    self.currentTabContent = selectedTab
end

-- Create a section in a tab
function UILibrary:CreateSection(tabName, sectionName)
    local tab = self.tabs[tabName]
    if not tab then return nil end
    
    local separator = Instance.new("TextLabel")
    separator.Name = "Separator_" .. sectionName
    separator.Size = UDim2.new(0, 245, 0, 22)
    separator.BorderSizePixel = 0
    separator.BackgroundTransparency = 1
    separator.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    separator.TextColor3 = Color3.fromRGB(0, 0, 0)
    separator.Text = string.upper(sectionName)
    separator.FontFace = Font.new("rbxassetid://11702779409", Enum.FontWeight.Bold)
    separator.TextWrapped = true
    separator.TextTransparency = 0.81
    separator.TextXAlignment = Enum.TextXAlignment.Left
    separator.TextScaled = true
    separator.Parent = tab.scrollingFrame
    
    return {
        CreateToggle = function(name, description, callback)
            return self:CreateToggle(tabName, name, description, callback)
        end,
        CreateSlider = function(name, min, max, default, callback)
            return self:CreateSlider(tabName, name, min, max, default, callback)
        end,
        CreateButton = function(name, description, callback)
            return self:CreateButton(tabName, name, description, callback)
        end,
        CreateKeybind = function(name, description, default, callback)
            return self:CreateKeybind(tabName, name, description, default, callback)
        end,
        CreateColorPicker = function(name, description, default, callback)
            return self:CreateColorPicker(tabName, name, description, default, callback)
        end,
        CreateDropdown = function(name, description, options, callback)
            return self:CreateDropdown(tabName, name, description, options, callback)
        end
    }
end

-- Create toggle element
function UILibrary:CreateToggle(tabName, name, description, callback)
    local tab = self.tabs[tabName]
    if not tab then return nil end
    
    local toggle = Instance.new("Frame")
    local titleLabel = Instance.new("TextLabel")
    local descriptionLabel = Instance.new("TextLabel")
    local interactButton = Instance.new("TextButton")
    local toggleFrame = Instance.new("Frame")
    local toggleUICorner = Instance.new("UICorner")
    local toggleIndicator = Instance.new("Frame")
    local toggleIndicatorUICorner = Instance.new("UICorner")
    
    toggle.Name = "toggle_" .. name
    toggle.Size = UDim2.new(0, 236, 0, 48)
    toggle.BorderSizePixel = 0
    toggle.BackgroundTransparency = 1
    toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    toggle.Parent = tab.scrollingFrame
    
    titleLabel.Size = UDim2.new(0, 176, 0, 19)
    titleLabel.BorderSizePixel = 0
    titleLabel.BackgroundTransparency = 1
    titleLabel.Position = UDim2.new(0, 0, 0.129, 0)
    titleLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.Text = name
    titleLabel.FontFace = Font.new("rbxassetid://11702779409", Enum.FontWeight.Bold)
    titleLabel.TextWrapped = true
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.TextScaled = true
    titleLabel.Parent = toggle
    
    descriptionLabel.Size = UDim2.new(0, 176, 0, 19)
    descriptionLabel.BorderSizePixel = 0
    descriptionLabel.BackgroundTransparency = 1
    descriptionLabel.Position = UDim2.new(0, 0, 0.53, 0)
    descriptionLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    descriptionLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
    descriptionLabel.Text = description
    descriptionLabel.FontFace = Font.new("rbxassetid://11702779409", Enum.FontWeight.Regular)
    descriptionLabel.TextWrapped = true
    descriptionLabel.TextXAlignment = Enum.TextXAlignment.Left
    descriptionLabel.TextScaled = true
    descriptionLabel.Parent = toggle
    
    interactButton.Name = "Interact"
    interactButton.AutoButtonColor = true
    interactButton.Size = UDim2.new(1, 0, 1, 0)
    interactButton.BorderSizePixel = 0
    interactButton.BackgroundTransparency = 1
    interactButton.Text = ""
    interactButton.Parent = toggle
    
    toggleFrame.Size = UDim2.new(0, 50, 0, 23)
    toggleFrame.BorderSizePixel = 0
    toggleFrame.Position = UDim2.new(0.771, 0, 0.292, 0)
    toggleFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    toggleFrame.Parent = toggle
    
    toggleUICorner.CornerRadius = UDim.new(1, 8)
    toggleUICorner.Parent = toggleFrame
    
    toggleIndicator.Size = UDim2.new(0, 15, 0, 15)
    toggleIndicator.BorderSizePixel = 0
    toggleIndicator.Position = UDim2.new(0.1, 0, 0.157, 0)
    toggleIndicator.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    toggleIndicator.Parent = toggleFrame
    
    toggleIndicatorUICorner.CornerRadius = UDim.new(1, 8)
    toggleIndicatorUICorner.Parent = toggleIndicator
    
    -- Toggle state and functionality
    local enabled = false
    
    local function updateToggle()
        if enabled then
            toggleIndicator:TweenPosition(
                UDim2.new(0.7, 0, 0.157, 0),
                Enum.EasingDirection.InOut,
                Enum.EasingStyle.Quad,
                0.15
            )
            toggleIndicator.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        else
            toggleIndicator:TweenPosition(
                UDim2.new(0.1, 0, 0.157, 0),
                Enum.EasingDirection.InOut,
                Enum.EasingStyle.Quad,
                0.15
            )
            toggleIndicator.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        end
        
        if callback then
            callback(enabled)
        end
    end
    
    interactButton.MouseButton1Click:Connect(function()
        enabled = not enabled
        updateToggle()
    end)
    
    return {
        Set = function(value)
            enabled = value
            updateToggle()
        end,
        Get = function()
            return enabled
        end
    }
end

-- Create slider element
function UILibrary:CreateSlider(tabName, name, min, max, default, callback)
    local tab = self.tabs[tabName]
    if not tab then return nil end
    
    -- Validate inputs
    min = min or 0
    max = max or 100
    default = default or min
    default = math.clamp(default, min, max)
    
    local slider = Instance.new("Frame")
    local titleLabel = Instance.new("TextLabel")
    local valueLabel = Instance.new("TextLabel")
    local sliderFrame = Instance.new("Frame")
    local sliderUICorner = Instance.new("UICorner")
    local sliderFill = Instance.new("Frame")
    local sliderFillUICorner = Instance.new("UICorner")
    local sliderKnob = Instance.new("Frame")
    local sliderKnobUICorner = Instance.new("UICorner")
    
    slider.Name = "slider_" .. name
    slider.Size = UDim2.new(0, 236, 0, 63)
    slider.BorderSizePixel = 0
    slider.BackgroundTransparency = 1
    slider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    slider.Parent = tab.scrollingFrame
    
    titleLabel.Size = UDim2.new(0, 143, 0, 19)
    titleLabel.BorderSizePixel = 0
    titleLabel.BackgroundTransparency = 1
    titleLabel.Position = UDim2.new(0, 0, 0.065, 0)
    titleLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.Text = name
    titleLabel.FontFace = Font.new("rbxassetid://11702779409", Enum.FontWeight.Bold)
    titleLabel.TextWrapped = true
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.TextScaled = true
    titleLabel.Parent = slider
    
    valueLabel.Size = UDim2.new(0, 64, 0, 19)
    valueLabel.BorderSizePixel = 0
    valueLabel.BackgroundTransparency = 1
    valueLabel.Position = UDim2.new(0.712, 0, 0.065, 0)
    valueLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    valueLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    valueLabel.Text = tostring(default)
    valueLabel.FontFace = Font.new("rbxassetid://11702779409", Enum.FontWeight.Bold)
    valueLabel.TextWrapped = true
    valueLabel.TextXAlignment = Enum.TextXAlignment.Right
    valueLabel.TextScaled = true
    valueLabel.Parent = slider
    
    sliderFrame.Size = UDim2.new(0, 232, 0, 7)
    sliderFrame.BorderSizePixel = 0
    sliderFrame.Position = UDim2.new(0, 0, 0.54, 0)
    sliderFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    sliderFrame.Parent = slider
    
    sliderUICorner.Parent = sliderFrame
    
    sliderFill.Size = UDim2.new(0, 0, 1, 0)
    sliderFill.BorderSizePixel = 0
    sliderFill.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    sliderFill.Parent = sliderFrame
    
    sliderFillUICorner.Parent = sliderFill
    
    sliderKnob.Size = UDim2.new(0, 19, 0, 19)
    sliderKnob.BorderSizePixel = 0
    sliderKnob.Position = UDim2.new(0, -9.5, 0.5, -9.5)
    sliderKnob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    sliderKnob.Parent = sliderFill
    
    sliderKnobUICorner.CornerRadius = UDim.new(1, 8)
    sliderKnobUICorner.Parent = sliderKnob
    
    -- Slider functionality
    local currentValue = default
    
    local function updateSlider(value)
        -- Clamp value to min/max range
        value = math.clamp(value, min, max)
        currentValue = value
        
        -- Calculate percentage and update visualization
        local percent = (value - min) / (max - min)
        sliderFill.Size = UDim2.new(percent, 0, 1, 0)
        
        -- Update value text
        valueLabel.Text = tostring(math.floor(value))
        
        -- Call callback with new value
        if callback then
            callback(value)
        end
    end
    
    -- Initialize slider position
    updateSlider(default)
    
    -- Handle slider interaction
    local dragging = false
    
    sliderFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            local inputPosition = input.Position.X
            local sliderPosition = sliderFrame.AbsolutePosition.X
            local sliderWidth = sliderFrame.AbsoluteSize.X
            local relativePosition = (inputPosition - sliderPosition) / sliderWidth
            local value = min + (max - min) * relativePosition
            updateSlider(value)
        end
    end)
    
    sliderKnob.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
        end
    end)
    
    game:GetService("UserInputService").InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
    
    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local mousePosition = input.Position.X
            local sliderPosition = sliderFrame.AbsolutePosition.X
            local sliderWidth = sliderFrame.AbsoluteSize.X
            local relativePosition = (mousePosition - sliderPosition) / sliderWidth
            local value = min + (max - min) * relativePosition
            updateSlider(value)
        end
    end)
    
    return {
        Set = function(value)
            updateSlider(value)
        end,
        Get = function()
            return currentValue
        end
    }
end

-- Create button element
function UILibrary:CreateButton(tabName, name, description, callback)
    local tab = self.tabs[tabName]
    if not tab then return nil end
    
    local button = Instance.new("Frame")
    local titleLabel = Instance.new("TextLabel")
    local descriptionLabel = Instance.new("TextLabel")
    local buttonElement = Instance.new("TextButton")
    local UIStroke = Instance.new("UIStroke")
    local UICorner = Instance.new("UICorner")
    
    button.Name = "button_" .. name
    button.Size = UDim2.new(0, 236, 0, 48)
    button.BorderSizePixel = 0
    button.BackgroundTransparency = 1
    button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    button.Parent = tab.scrollingFrame
    
    titleLabel.Size = UDim2.new(0, 157, 0, 19)
    titleLabel.BorderSizePixel = 0
    titleLabel.BackgroundTransparency = 1
    titleLabel.Position = UDim2.new(0, 0, 0.129, 0)
    titleLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.Text = name
    titleLabel.FontFace = Font.new("rbxassetid://11702779409", Enum.FontWeight.Bold)
    titleLabel.TextWrapped = true
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.TextScaled = true
    titleLabel.Parent = button
    
    descriptionLabel.Size = UDim2.new(0, 157, 0, 19)
    descriptionLabel.BorderSizePixel = 0
    descriptionLabel.BackgroundTransparency = 1
    descriptionLabel.Position = UDim2.new(0, 0, 0.53, 0)
    descriptionLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    descriptionLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
    descriptionLabel.Text = description
    descriptionLabel.FontFace = Font.new("rbxassetid://11702779409", Enum.FontWeight.Regular)
    descriptionLabel.TextWrapped = true
    descriptionLabel.TextXAlignment = Enum.TextXAlignment.Left
    descriptionLabel.TextScaled = true
    descriptionLabel.Parent = button
    
    buttonElement.AutoButtonColor = true
    buttonElement.Size = UDim2.new(0, 65, 0, 19)
    buttonElement.BorderSizePixel = 0
    buttonElement.Position = UDim2.new(0.712, 0, 0.292, 0)
    buttonElement.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    buttonElement.TextColor3 = Color3.fromRGB(255, 255, 255)
    buttonElement.Text = "Run"
    buttonElement.FontFace = Font.new("rbxassetid://11702779409", Enum.FontWeight.Bold)
    buttonElement.Parent = button
    
    UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    UIStroke.Color = Color3.fromRGB(0, 0, 0)
    UIStroke.Parent = buttonElement
    
    UICorner.CornerRadius = UDim.new(0, 4)
    UICorner.Parent = buttonElement
    
    -- Button functionality
    buttonElement.MouseButton1Click:Connect(function()
        if callback then
            callback()
        end
    end)
    
    return button
end
