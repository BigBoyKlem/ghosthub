local Library = {}

function Library:CreateWindow()
	local bef540b4d62e4283b6f19d9308b89ba9 = Instance.new("ScreenGui")
	local Mother = Instance.new("Frame")
	local Frame = Instance.new("Frame")
	local TextButton = Instance.new("TextButton")
	local UIListLayout = Instance.new("UIListLayout")
	local Frame_2 = Instance.new("Frame")
	
	bef540b4d62e4283b6f19d9308b89ba9.Name = "bef540b4-d62e-4283-b6f1-9d9308b89ba9"
	bef540b4d62e4283b6f19d9308b89ba9.Parent = game:GetService("CoreGui")
	bef540b4d62e4283b6f19d9308b89ba9.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	Mother.Name = "Mother"
	Mother.Parent = bef540b4d62e4283b6f19d9308b89ba9
	Mother.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	Mother.Position = UDim2.new(0.366398573, 0, 0.339712918, 0)
	Mother.Size = UDim2.new(0, 299, 0, 200)

	Frame.Parent = Mother
	Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	Frame.BorderSizePixel = 0
	Frame.Position = UDim2.new(0.0334448144, 0, 0.180000007, 0)
	Frame.Size = UDim2.new(0, 100, 0, 150)
	
	UIListLayout.Parent = Frame
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

	Frame_2.Parent = Mother
	Frame_2.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	Frame_2.BorderSizePixel = 0
	Frame_2.Size = UDim2.new(0, 299, 0, 20)

	local function ALDP_fake_script() -- bef540b4d62e4283b6f19d9308b89ba9.EncryptGUI 
		local script = Instance.new('LocalScript', bef540b4d62e4283b6f19d9308b89ba9)

		while wait() do
			script.Parent.Name = string.lower(game:GetService('HttpService'):GenerateGUID(true)):gsub('{', ''):gsub('}', '')
			script.Name = string.lower(game:GetService('HttpService'):GenerateGUID(true)):gsub('{', ''):gsub('}', '')	
		end
	end
	coroutine.wrap(ALDP_fake_script)()
	
	local Window = {}
	
	function Window:CreateButton(name)
		TextButton.Parent = Frame
		TextButton.BackgroundColor3 = Color3.fromRGB(54, 54, 54)
		TextButton.BorderSizePixel = 0
		TextButton.Size = UDim2.new(0, 100, 0, 25)
		TextButton.Font = Enum.Font.SourceSans
		TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
		TextButton.TextSize = 14.000
		TextButton.Text = name
	end
	
	return Window
end

return Library
