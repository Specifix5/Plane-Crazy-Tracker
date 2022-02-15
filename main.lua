-- Made by Specifix5

local Update = "Added Better lighting, added 'Remove Fog' option, added Outlines (Toggleable) for buildmode only. And most importantly, this gui! Have a great day. :3"

local camLock = false

local gui = nil
local targetGui = nil

local textbox = nil
local shfBtn = nil

local con = nil
local tbCon = nil
local sbCon = nil

local shiftLock = false
local outline = false

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
	
	if sbCon then
		sbCon:Disconnect()
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
	
	local frame1 = Instance.new("Frame", gui)
	frame1.Position = UDim2.new(0.37, 0, 0, 0)
	frame1.Size = UDim2.new(0.213, 0, 0.056, 0)
	frame1.BackgroundColor3 = Color3.fromRGB(0,0,0)
	frame1.BorderSizePixel = 3
	frame1.ZIndex = -1
	
	local frame2 = Instance.new("Frame", gui)
	frame2.Position = UDim2.new(0.919, 0, 0.411, 0)
	frame2.Size = UDim2.new(0.81, 0, 0.144, 0)
	frame2.BackgroundColor3 = Color3.fromRGB(0,0,0)
	frame2.BorderSizePixel = 3
	frame2.ZIndex = -1
	
	local sb = Instance.new("TextButton", gui)
	sb.Position = UDim2.new(0.376, 0, 0.011, 0)
	sb.Size = UDim2.new(0.042, 0, 0.035, 0)
	sb.BackgroundColor3 = Color3.fromRGB(255, 255, 0)
	sb.TextColor3 = Color3.fromRGB(0,0,0)
	sb.Text = "Remove Fog"
	sb.TextWrapped = true
	sb.BorderSizePixel = 0
	
	local sba = Instance.new("TextButton", gui)
	sba.Position = UDim2.new(0.93, 0, 0.491, 0)
	sba.Size = UDim2.new(0.061, 0, 0.046, 0)
	sba.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
	sba.TextColor3 = Color3.fromRGB(0,0,0)
	sba.Text = "Toggle Outline (Build Mode)"
	sba.TextWrapped = true
	sba.BorderSizePixel = 0
	
	local sbe = Instance.new("TextButton", gui)
	sbe.Position = UDim2.new(0.93, 0, 0.427, 0)
	sbe.Size = UDim2.new(0.061, 0, 0.046, 0)
	sbe.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
	sbe.TextColor3 = Color3.fromRGB(0,0,0)
	sbe.Text = "Better Lighting"
	sbe.TextWrapped = true
	sbe.BorderSizePixel = 0
	sbe.TextScaled = true
	
	sbe.MouseButton1Down:Connect(function()
		game.Lighting.EnvironmentDiffuseScale = 1
		game.Lighting.EnvironmentSpecularScale = 1
		game.Lighting.Brightness = 1.2

		if game.Lighting:FindFirstChildOfClass("ColorCorrectionEffect") then
			game.Lighting:FindFirstChildOfClass("ColorCorrectionEffect"):Destroy()
		end

		if game.Lighting:FindFirstChildOfClass("Sky") then
			game.Lighting:FindFirstChildOfClass("Sky"):Destroy()
		end
		wait()
		
		if game.Lighting:FindFirstChildOfClass("SunRaysEffect") then
			game.Lighting:FindFirstChildOfClass("SunRaysEffect"):Destroy()
		end
		
		local sunRays = Instance.new("SunRaysEffect", game.Lighting)
		sunRays.Intensity = 0.1
		sunRays.Spread = 0.8

		game.Lighting.ClockTime = 14

		local colorCr = Instance.new("ColorCorrectionEffect", game.Lighting)
		colorCr.Brightness = 0.01
		colorCr.Contrast = 0.15
		colorCr.Saturation = 0.05
		colorCr.Enabled = true

		local sky = Instance.new("Sky", game.Lighting)
		sky.MoonTextureId = "rbxasset://sky/moon.jpg"
		sky.SkyboxBk = "http://www.roblox.com/asset/?id=91458024"
		sky.SkyboxDn = "http://www.roblox.com/asset/?id=91457980"
		sky.SkyboxFt = "http://www.roblox.com/asset/?id=91458024"
		sky.SkyboxLf = "http://www.roblox.com/asset/?id=91458024"
		sky.SkyboxRt = "http://www.roblox.com/asset/?id=91458024"
		sky.SkyboxUp = "http://www.roblox.com/asset/?id=91458002"
		sky.StarCount = 1336
		sky.SunAngularSize = 6
		sky.MoonAngularSize = 4
		sky.SunTextureId = "rbxasset://sky/sun.jpg"

		if game.Lighting:FindFirstChildOfClass("Atmosphere") then
			game.Lighting:FindFirstChildOfClass("Atmosphere"):Destroy()
		end

		local as = Instance.new("Atmosphere", game.Lighting)
		as.Color = Color3.fromRGB(199, 199, 199)
		as.Decay = Color3.fromRGB(106, 112, 125)
		as.Glare = 0.4
		as.Haze = 0
		as.Density = 0.2
		as.Offset= 0.25
	end)

	if textbox then
		textbox:Destroy()
	end
	
	if shfBtn then
		shfBtn:Destroy()
	end

	textbox = tb
	shfBtn = sb

	tbCon = tb:GetPropertyChangedSignal("Text"):Connect(function()
		if game.Players:FindFirstChild(tb.Text) then
			local plr = game.Players:GetPlayerFromCharacter(workspace[tb.Text])
			print(plr)

			if plr and plr.Character then
				makeTargetGui(plr.Character)
			end
		end
	end)
	
	sbCon = sb.MouseButton1Click:Connect(function()
		if game.Lighting:FindFirstChildOfClass("Atmosphere") then
			game.Lighting:FindFirstChildOfClass("Atmosphere"):Destroy()
		end
		
		if game.Lighting:FindFirstChildOfClass("ColorCorrectionEffect") then
			game.Lighting:FindFirstChildOfClass("ColorCorrectionEffect"):Destroy()
		end
		
		local colorCr = Instance.new("ColorCorrectionEffect", game.Lighting)
		colorCr.Brightness = 0.01
		colorCr.Contrast = 0.15
		colorCr.Saturation = 0.05
		
		game.Lighting.FogEnd = math.huge
		game.Lighting.FogStart = math.huge
	end)
	
	sba.MouseButton1Click:Connect(function()
		if outline == false then
			outline = true
			sba.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
			for i, v in pairs(workspace.PlayerAircraft[game.Players.LocalPlayer.Name]:GetDescendants()) do
				if v:IsA("BasePart") and (not v:FindFirstChild("Outline")) then
					local outline = Instance.new("SelectionBox", v)
					outline.Adornee = v
					outline.Color3 = Color3.fromRGB(0,0,0)
					outline.SurfaceColor3 = Color3.fromRGB(0,0,0)
					outline.LineThickness = 0.001
					outline.Transparency = 0.8
					outline.Name = "Outline"
				end
			end
		else
			outline = false
			sba.BackgroundColor3 = Color3.fromRGB(170, 0, 0)
			for i, v in pairs(workspace.PlayerAircraft[game.Players.LocalPlayer.Name]:GetDescendants()) do
				if v:IsA("BasePart") and (v:FindFirstChild("Outline")) then
					v:FindFirstChild("Outline"):Destroy()
				end
			end
		end
	end)
	
	for i, v in pairs(gui:GetDescendants()) do
		if v:IsA("TextLabel") or v:IsA("TextButton") or v:IsA("TextBox") then
			v.Font = Enum.Font.SourceSans
			v.TextScaled = true
			v.TextWrapped = true
			
			if v:IsA("TextButton") then
				v.MouseEnter:Connect(function()
					local sound = Instance.new("Sound", v)
					sound.SoundId = "rbxassetid://6042053626"
					sound:Play()

					sound.Ended:Wait()
					wait(.2)
					sound:Destroy()
				end)

				v.MouseButton1Down:Connect(function()
					local sound = Instance.new("Sound", v)
					sound.SoundId = "rbxassetid://3868133279"
					sound:Play()


					sound.Ended:Wait()
					wait(.2)
					sound:Destroy()
				end)
			end
		end
		
	end
end

local function makeUpdateGui()
	local upd = Instance.new("ScreenGui", game.Players.LocalPlayer.PlayerGui)
	
	local frame = Instance.new("Frame", upd)
	frame.Position = UDim2.new(0.262, 0,0.292, 0)
	frame.Size = UDim2.new(0.474, 0, 0.415, 0)
	frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
	frame.BorderColor3 = Color3.fromRGB(40, 40, 40)
	frame.BorderSizePixel = 4
	
	local clsBtn = Instance.new("TextButton", frame)
	clsBtn.Position = UDim2.new(0.807, 0, 0, 0)
	clsBtn.Size = UDim2.new(0.193, 0, 0.146, 0)
	clsBtn.Text = "Close"
	clsBtn.TextScaled = true
	clsBtn.BackgroundColor3 = Color3.fromRGB(170,0,0)
	clsBtn.BorderSizePixel = 1
	clsBtn.Font = Enum.Font.SourceSans
	clsBtn.TextColor3 = Color3.fromRGB(0,0,0)
	
	local HeaderText = Instance.new("TextLabel", frame)
	HeaderText.Position = UDim2.new(0,0,0,0)
	HeaderText.Size = UDim2.new(0.807,0,0.146,0)
	HeaderText.Text = "Welcome, "..game.Players.LocalPlayer.Name.."!"
	HeaderText.TextSize = 30
	HeaderText.Font = Enum.Font.RobotoMono
	HeaderText.BorderSizePixel = 0
	HeaderText.BackgroundColor3 = Color3.fromRGB(25,25,25)
	HeaderText.TextColor3 = Color3.fromRGB(255,255,255)
	
	local Upd = Instance.new("TextLabel", frame)
	Upd.Position = UDim2.new(0,0,0.146,0)
	Upd.Size = UDim2.new(1,0,0.854,0)
	Upd.Text = "Loading updates.."
	Upd.TextSize = 25
	Upd.Font = Enum.Font.SourceSansLight
	Upd.BorderSizePixel = 0
	Upd.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
	Upd.TextColor3 = Color3.fromRGB(255,255,255)
	Upd.TextXAlignment = Enum.TextXAlignment.Left
	Upd.TextYAlignment = Enum.TextYAlignment.Top
	Upd.TextWrapped = true
	
	wait(0.5)
	Upd.Text = Update
	
	clsBtn.MouseEnter:Connect(function()
		local sound = Instance.new("Sound", clsBtn)
		sound.SoundId = "rbxassetid://6042053626"
		sound:Play()
		
		sound.Ended:Wait()
		wait(.2)
		sound:Destroy()
	end)
	
	clsBtn.MouseButton1Down:Connect(function()
		local sound = Instance.new("Sound", clsBtn)
		sound.SoundId = "rbxassetid://3868133279"
		sound:Play()
		

		sound.Ended:Wait()
		upd:Destroy()
	end)
end

wait(1)

makeGui()
makeUpdateGui()

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

local hbcon = game:GetService("RunService").RenderStepped:Connect(function()
	for i, v in pairs(astGuis) do
		v:FindFirstChild("Dist").Text = round((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - v.Parent.Position).magnitude).." studs"
		v:FindFirstChild("Speed").Text = round((v.Parent.Velocity).magnitude).." sps"
	end
	
	if camLock == true and targetGui ~= nil then
		workspace.CurrentCamera.CFrame = CFrame.lookAt(workspace.CurrentCamera.CFrame.p, targetGui.Parent.Position)
	end
end)

local db = false

local hbcon2 = game:GetService("RunService").Heartbeat:Connect(function()
	if outline == true and db == false then
		db = true
		for i, v in pairs(game.Players:GetPlayers()) do
			if v ~= game.Players.LocalPlayer then
				if v:IsInGroup(10299170) then
					if v.Character then
						if v.Character.HumanoidRootPart:FindFirstChild("AST") then
							--do nothing
						else
							makeASTGui(v.Character)
						end
					end
				end
			end
		end
		
		for i, v in pairs(workspace.PlayerAircraft[game.Players.LocalPlayer.Name]:GetDescendants()) do
			if v:IsA("BasePart") and (not v:FindFirstChild("Outline")) then
				local outline = Instance.new("SelectionBox", v)
				outline.Adornee = v
				outline.Color3 = Color3.fromRGB(0,0,0)
				outline.SurfaceColor3 = Color3.fromRGB(0,0,0)
				outline.LineThickness = 0.001
				outline.Transparency = 0.8
				outline.Name = "Outline"
			end
		end
		wait(3)
		db = false
	end
end)
local oCon = nil

oCon = workspace:FindFirstChild("PlayerAircraft")[game.Players.LocalPlayer.Name].DescendantAdded:Connect(function(v)
	if v:IsA("BasePart") and outline == true then
		local outline = Instance.new("SelectionBox", v)
		outline.Adornee = v
		outline.Color3 = Color3.fromRGB(0,0,0)
		outline.SurfaceColor3 = Color3.fromRGB(0,0,0)
		outline.LineThickness = 0.001
		outline.Transparency = 0.8
		outline.Name = "Outline"
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
	
	if hbcon2 then
		hbcon:Disconnect()
	end
	
	if oCon then
		oCon:Disconnect()
	end
	
	for i, v in pairs(workspace.PlayerAircraft[game.Players.LocalPlayer.Name]:GetDescendants()) do
		if v:IsA("BasePart") and (v:FindFirstChild("Outline")) then
			v:FindFirstChild("Outline"):Destroy()
		end
	end
end)

wait(.5)

local FOV = workspace.CurrentCamera.FieldOfView


game:GetService("UserInputService").InputBegan:Connect(function(input)
	local inputType = input.UserInputType
	if inputType == Enum.UserInputType.MouseButton3 then
		if camLock == false then
			camLock = true
		elseif camLock == true then
			camLock = false
		end
	end
end)    
