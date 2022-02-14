-- Made by Specifix5

local camLock = false

local gui = nil
local targetGui = nil

local textbox = nil

local con = nil
local tbCon = nil

local astGuis = {}

local function round(n)
	return math.floor(n + 0.5)
end


local function makeTargetGui(target)
	if targetGui then
		targetGui:Destroy()
	end

	if con then
		con:Disconnect()
	end

	targetGui = Instance.new("BillboardGui", target.HumanoidRootPart)
	targetGui.AlwaysOnTop = true
	targetGui.Adornee = target.HumanoidRootPart
	targetGui.LightInfluence = 0
	targetGui.MaxDistance = math.huge
	targetGui.Size = UDim2.new(0,300,0,78)

	local img = Instance.new("ImageLabel", targetGui)
	img.BackgroundTransparency = 1
	img.Size = UDim2.new(0.26, 0, 1, 0)
	img.Position = UDim2.new(0, 110, 0, 0)
	img.Image = "rbxassetid://659155421"
	img.ImageColor3 = Color3.fromRGB(0, 255, 0)
	img.Name = "CrosshairOutline"

	local ch = Instance.new("TextLabel", targetGui)
	ch.BackgroundTransparency = 1
	ch.Position = UDim2.new(0, 110, 0, 0)
	ch.Size = UDim2.new(0.26, 0, 1, 0)
	ch.Font = Enum.Font.SourceSans
	ch.Text = "=+="
	ch.TextColor3 = Color3.fromRGB(255, 0, 0)
	ch.TextScaled = true
	ch.TextStrokeTransparency = 0.8

	local tName = Instance.new("TextLabel", targetGui)
	tName.BackgroundTransparency = 1
	tName.Position = UDim2.new(0.65, 0, 0 ,0)
	tName.Size = UDim2.new(1,0,1,0)
	tName.Font = Enum.Font.RobotoMono
	tName.Text = target.Name
	tName.TextColor3 = Color3.fromRGB(0, 255, 0)
	tName.TextSize = 20
	tName.TextXAlignment = Enum.TextXAlignment.Left
	tName.TextYAlignment = Enum.TextYAlignment.Top
	tName.TextStrokeTransparency = 0.8

	local tDist = Instance.new("TextLabel", targetGui)
	tDist.BackgroundTransparency = 1
	tDist.Position = UDim2.new(0.65, 0, 0 ,0)
	tDist.Size = UDim2.new(1,0,1,0)
	tDist.Font = Enum.Font.RobotoMono
	tDist.Text = "... studs"
	tDist.TextColor3 = Color3.fromRGB(0, 255, 0)
	tDist.TextSize = 20
	tDist.TextXAlignment = Enum.TextXAlignment.Left
	tDist.TextYAlignment = Enum.TextYAlignment.Center
	tDist.TextStrokeTransparency = 0.8

	local tSpeed = Instance.new("TextLabel", targetGui)
	tSpeed.BackgroundTransparency = 1
	tSpeed.Position = UDim2.new(0.65, 0, 0 ,0)
	tSpeed.Size = UDim2.new(1,0,1,0)
	tSpeed.Font = Enum.Font.RobotoMono
	tSpeed.Text = "... sps"
	tSpeed.TextColor3 = Color3.fromRGB(0, 255, 0)
	tSpeed.TextSize = 20
	tSpeed.TextXAlignment = Enum.TextXAlignment.Left
	tSpeed.TextYAlignment = Enum.TextYAlignment.Bottom
	tSpeed.TextStrokeTransparency = 0.8

	con = game:GetService("RunService").Heartbeat:Connect(function()
		tDist.Text = round((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - target.HumanoidRootPart.Position).magnitude).." studs"
		tSpeed.Text = round((target.HumanoidRootPart.Velocity).magnitude).." sps"
	end)
end

local function makeASTGui(target)
	local itargetGui = Instance.new("BillboardGui", target.HumanoidRootPart)
	itargetGui.AlwaysOnTop = true
	itargetGui.Adornee = target.HumanoidRootPart
	itargetGui.LightInfluence = 0
	itargetGui.MaxDistance = math.huge
	itargetGui.Size = UDim2.new(0,300,0,78)
	itargetGui.ClipsDescendants = false
	
	itargetGui.Name = "AST"

	local img = Instance.new("ImageLabel", itargetGui)
	img.BackgroundTransparency = 1
	img.Size = UDim2.new(0.26, 0, 1, 0)
	img.Position = UDim2.new(0, 110, 0, 0)
	img.Image = "rbxassetid://659155421"
	img.ImageColor3 = Color3.fromRGB(255, 82, 82)
	img.Name = "CrosshairOutline"
	
	local img2 = Instance.new("ImageLabel", itargetGui)
	img2.BackgroundTransparency = 1
	img2.Size = UDim2.new(0.2,0,0.8,0)
	img2.Position = UDim2.new(0,45,0,10)
	img2.Image = "rbxassetid://8822839970"
	img2.ImageColor3 = Color3.fromRGB(255, 255, 255)
	img2.Name = "Logo"

	local ch = Instance.new("TextLabel", itargetGui)
	ch.BackgroundTransparency = 1
	ch.Position = UDim2.new(0, 110, 0, 0)
	ch.Size = UDim2.new(0.26, 0, 1, 0)
	ch.Font = Enum.Font.SourceSans
	ch.Text = "=+="
	ch.TextColor3 = Color3.fromRGB(255, 255, 0)
	ch.TextScaled = true
	ch.TextStrokeTransparency = 0.8

	local tName = Instance.new("TextLabel", itargetGui)
	tName.BackgroundTransparency = 1
	tName.Position = UDim2.new(0.65, 0, 0 ,0)
	tName.Size = UDim2.new(1,0,1,0)
	tName.Font = Enum.Font.RobotoMono
	tName.Text = target.Name
	tName.TextColor3 = Color3.fromRGB(255, 82, 82)
	tName.TextSize = 20
	tName.TextXAlignment = Enum.TextXAlignment.Left
	tName.TextYAlignment = Enum.TextYAlignment.Top
	tName.TextStrokeTransparency = 0.8
	
	tName.Name = "Name"

	local tDist = Instance.new("TextLabel", itargetGui)
	tDist.BackgroundTransparency = 1
	tDist.Position = UDim2.new(0.65, 0, 0 ,0)
	tDist.Size = UDim2.new(1,0,1,0)
	tDist.Font = Enum.Font.RobotoMono
	tDist.Text = "... studs"
	tDist.TextColor3 = Color3.fromRGB(255, 82, 82)
	tDist.TextSize = 20
	tDist.TextXAlignment = Enum.TextXAlignment.Left
	tDist.TextYAlignment = Enum.TextYAlignment.Center
	tDist.TextStrokeTransparency = 0.8
	
	tDist.Name = "Dist"

	local tSpeed = Instance.new("TextLabel", itargetGui)
	tSpeed.BackgroundTransparency = 1
	tSpeed.Position = UDim2.new(0.65, 0, 0 ,0)
	tSpeed.Size = UDim2.new(1,0,1,0)
	tSpeed.Font = Enum.Font.RobotoMono
	tSpeed.Text = "... sps"
	tSpeed.TextColor3 = Color3.fromRGB(255, 82, 82)
	tSpeed.TextSize = 20
	tSpeed.TextXAlignment = Enum.TextXAlignment.Left
	tSpeed.TextYAlignment = Enum.TextYAlignment.Bottom
	tSpeed.TextStrokeTransparency = 0.8
	
	tSpeed.Name = "Speed"
	
	table.insert(astGuis, itargetGui)

end

local function makeGui()
	if gui then
		gui:Destroy()
	end

	if tbCon then
		tbCon:Disconnect()
	end

	gui = Instance.new("ScreenGui", game.Players.LocalPlayer.PlayerGui)
	gui.IgnoreGuiInset = true
	gui.DisplayOrder = 69420

	local tb = Instance.new("TextBox", gui)
	tb.Position = UDim2.new(0.424, 0, 0.012, 0)
	tb.Size = UDim2.new(0.151, 0, 0.035, 0)
	tb.BackgroundTransparency = 0.5
	tb.BackgroundColor3 = Color3.fromRGB(0,0,0)
	tb.TextColor3 = Color3.fromRGB(255,255,255)
	tb.PlaceholderText = "Enter a name here.."
	tb.Text = ""

	if textbox then
		textbox:Destroy()
	end

	textbox = tb

	tbCon = tb:GetPropertyChangedSignal("Text"):Connect(function()
		if game.Players:FindFirstChild(tb.Text) then
			local plr = game.Players:GetPlayerFromCharacter(workspace[tb.Text])
			print(plr)

			if plr and plr.Character then
				makeTargetGui(plr.Character)
			end
		end
	end)
end

wait(1)

makeGui()

for i, v in pairs(game.Players:GetPlayers()) do
	if v ~= game.Players.LocalPlayer then
		if v:IsInGroup(10299170) then
			if v.Character then
				if v.Character.HumanoidRootPart:FindFirstChild("AST") then
					if table.find(astGuis, v.Character.HumanoidRootPart:FindFirstChild("AST")) then
						table.remove(astGuis, v.Character.HumanoidRootPart:FindFirstChild("AST"))
					end
					v.Character.HumanoidRootPart:FindFirstChild("AST"):Destroy()
					wait()
					makeASTGui(v.Character)
				else
					makeASTGui(v.Character)
				end
			end
		end
	end
end

game.Players.ChildAdded:Connect(function(v)
	if game.Players:GetPlayerFromCharacter(workspace[v.Name]) then
		local plr = game.Players:GetPlayerFromCharacter(workspace[v.Name])
		repeat wait() until plr.Character
		
		if plr and plr.Character then
			makeASTGui(plr.Character)
		end
	end
end)

local hbcon = game:GetService("RunService").RenderStepped:Connect(function()
	for i, v in pairs(astGuis) do
		v:FindFirstChild("Dist").Text = round((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Parent.Position).magnitude).." studs"
		v:FindFirstChild("Speed").Text = round((v.Parent.Velocity).magnitude).." sps"
	end
	
	if camLock == true and targetGui ~= nil then
		workspace.CurrentCamera.CFrame = CFrame.lookAt(workspace.CurrentCamera.CFrame.p, targetGui.Parent.Position)
	end
end)

game.Players.LocalPlayer.Character.Humanoid.Died:Connect(function()
	if targetGui then
		targetGui:Destroy()
		wait()
		targetGui = nil
	end

	for i, v in pairs(astGuis) do
		if v then
			v:Destroy()
		end
	end
	
	if hbcon then
		hbcon:Disconnect()
	end
end)

wait(.5)

local FOV = workspace.CurrentCamera.FieldOfView


game:GetService("UserInputService").InputBegan:Connect(function(input)
	local inputType = input.UserInputType
	if inputType == Enum.UserInputType.MouseButton2 then
		--game:GetService("TweenService"):Create(workspace.CurrentCamera, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {FieldOfView = 25}):Play()
	elseif inputType == Enum.UserInputType.MouseButton3 then
		if camLock == false then
			camLock = true
		elseif camLock == true then
			camLock = false
		end
	end
end)    

game:GetService("UserInputService").InputEnded:Connect(function(input)
	local inputType = input.UserInputType
	if inputType == Enum.UserInputType.MouseButton2 then
		--game:GetService("TweenService"):Create(workspace.CurrentCamera, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {FieldOfView = FOV}):Play()
	end
end)    
