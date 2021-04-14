local Library = {}

function Library:CreateUI(name)
	local bef540b4d62e4283b6f19d9308b89ba9 = Instance.new("ScreenGui")
	local Main = Instance.new("Frame")
	local MainName = Instance.new("TextLabel")
	local Backdrop = Instance.new("Frame")
	local TabButtons = Instance.new("Frame")
	local UIListLayout = Instance.new("UIListLayout")
	local TabButton = Instance.new("TextButton")
	local Tablist = Instance.new("Frame")
	local TestTab = Instance.new("Frame")
	
	bef540b4d62e4283b6f19d9308b89ba9.Name = "bef540b4-d62e-4283-b6f1-9d9308b89ba9"
	bef540b4d62e4283b6f19d9308b89ba9.Parent = game:GetService('CoreGui')
	bef540b4d62e4283b6f19d9308b89ba9.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	Main.Name = "Main"
	Main.Parent = bef540b4d62e4283b6f19d9308b89ba9
	Main.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	Main.BorderSizePixel = 0
	Main.Position = UDim2.new(0.351637751, 0, 0.330143571, 0)
	Main.Size = UDim2.new(0, 350, 0, 30)

	MainName.Name = "MainName"
	MainName.Parent = Main
	MainName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	MainName.BackgroundTransparency = 1.000
	MainName.Size = UDim2.new(0, 349, 0, 29)
	MainName.Font = Enum.Font.SourceSans
	MainName.Text = name
	MainName.TextColor3 = Color3.fromRGB(255, 255, 255)
	MainName.TextSize = 20.000

	Backdrop.Name = "Backdrop"
	Backdrop.Parent = Main
	Backdrop.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	Backdrop.BorderSizePixel = 0
	Backdrop.Position = UDim2.new(0, 0, 0.999999225, 0)
	Backdrop.Size = UDim2.new(0, 350, 0, 200)

	TabButtons.Name = "TabButtons"
	TabButtons.Parent = Backdrop
	TabButtons.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
	TabButtons.BorderSizePixel = 0
	TabButtons.Position = UDim2.new(0, 0, -0.00499999989, 0)
	TabButtons.Size = UDim2.new(0, 350, 0, 20)

	UIListLayout.Parent = TabButtons
	UIListLayout.FillDirection = Enum.FillDirection.Horizontal
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
	UIListLayout.Padding = UDim.new(0, 2)
	
	local function WVNSL_fake_script() -- bef540b4d62e4283b6f19d9308b89ba9.EncryptGUI 
		local script = Instance.new('LocalScript', bef540b4d62e4283b6f19d9308b89ba9)

		while wait() do
			script.Parent.Name = string.lower(game:GetService('HttpService'):GenerateGUID(true)):gsub('{', ''):gsub('}', '')
			script.Name = string.lower(game:GetService('HttpService'):GenerateGUID(true)):gsub('{', ''):gsub('}', '')	
		end
	end
	coroutine.wrap(WVNSL_fake_script)()
	
	local UI = {}
	
	function UI:Tab(text)
		Tablist.Name = "Tablist"
		Tablist.Parent = Backdrop
		Tablist.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
		Tablist.BackgroundTransparency = 1.000
		Tablist.BorderSizePixel = 0
		Tablist.Position = UDim2.new(0, 0, 0.0949999988, 0)
		Tablist.Size = UDim2.new(0, 350, 0, 181)

		TestTab.Name = "TestTab"
		TestTab.Parent = Tablist
		TestTab.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
		TestTab.BackgroundTransparency = 1.000
		TestTab.BorderSizePixel = 0
		TestTab.Size = UDim2.new(0, 350, 0, 180)
		
		TabButton.Name = "TabButton"
		TabButton.Parent = TabButtons
		TabButton.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
		TabButton.BorderSizePixel = 0
		TabButton.Size = UDim2.new(0, 68, 0, 20)
		TabButton.Font = Enum.Font.SourceSans
		TabButton.Text = text
		TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
		TabButton.TextSize = 14.000
	end	
	
	function Main:Button(text, callback)
		--local callback = callback or function() end
		
		--TabButton.MouseButton1Down:Connect(function()
		--	callback()
		--end)
	end
	
	return Main
	
end

return Library
