local user = "Willing19"
local plr = game.Players.LocalPlayer.Name

function notify(title, text)
	game.StarterGui:SetCore("SendNotification", {
		Title = title; -- Required. Has to be a string!
		Text = text; -- Required. Has to be a string!
		Icon = ""; -- Optional, defaults to "" (no icon)
		Duration = 5; -- Optional, defaults to 5 seconds
	})
end

local gui = Instance.new("ScreenGui", game.Players.LocalPlayer.PlayerGui)
gui.IgnoreGuiInset = true
gui.DisplayOrder = 69420
gui.ResetOnSpawn = false

local tb = Instance.new("TextBox", gui)
tb.Position = UDim2.new(0.424, 0, 0.012, 0)
tb.Size = UDim2.new(0.151, 0, 0.035, 0)
tb.BackgroundTransparency = 0.5
tb.BackgroundColor3 = Color3.fromRGB(0,0,0)
tb.TextColor3 = Color3.fromRGB(255,255,255)
tb.PlaceholderText = "Enter a name here.."
tb.Text = ""

tbCon = tb:GetPropertyChangedSignal("Text"):Connect(function()
	if game.Players:FindFirstChild(tb.Text) then
		local pler = game.Players:GetPlayerFromCharacter(workspace[tb.Text])
		print(pler)

		if pler and pler.Character and workspace[pler.Name.."Aircraft"].PilotSeat.Seat ~= nil then
			user = pler.Name
			notify("Success", "Changed target to: "..pler.Name)
		else
			notify("Error", "Unable to find player vehicle")
		end
	end
end)

local can = true

function getDestination()
    -- Up to you to determine where this thing is going!
    return workspace[user.."Aircraft"].PilotSeat.Seat.Position
end

workspace[plr].Humanoid.Died:Connect(function()
	can = false
	tbCon:Disconnect()
	tbCon = nil
	gui:Destroy()
	gui = nil
end)

while wait(.1) do
	if can == true then
		if workspace[plr.."Aircraft"].PilotSeat.Seat == nil then
			workspace.Gravity = 196
		else
			workspace.Gravity = 0
			local offset = getDestination() - workspace[plr.."Aircraft"].PilotSeat.Seat.Position
			--workspace.Filename_03Aircraft.PilotSeat.Seat.CFrame = workspace[user.."Aircraft"].PilotSeat.Seat.CFrame * CFrame.new(0, 0, 80)
			workspace[plr.."Aircraft"].PilotSeat.Seat.Velocity = offset.Unit * 650--((workspace[user.."Aircraft"].PilotSeat.Seat.Velocity).magnitude * 1.25)
		end
	end
end
--loadstring(game:GetObjects("rbxassetid://418957341")[1].Source)()
