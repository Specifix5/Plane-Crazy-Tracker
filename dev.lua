local user = "Rahalmulit"
local speed = 1250
local plr = game.Players.LocalPlayer.Name

function notify(title, text)
	game.StarterGui:SetCore("SendNotification", {
		Title = tostring(title); -- Required. Has to be a string!
		Text = tostring(text); -- Required. Has to be a string!
		Icon = ""; -- Optional, defaults to "" (no icon)
		Duration = 5; -- Optional, defaults to 5 seconds
	})
end

if workspace[user.."Aircraft"].PilotSeat.Seat.Position == nil then
	notify("Error", "Unable to find player vehicle")
else
	notify("Ready", "Script successfully been executed.")
end

local can = true

function getDestination()
    -- Up to you to determine where this thing is going!
    return workspace[user].HumanoidRootPart.Position--.."Aircraft"].PilotSeat.Seat.Position
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
			workspace[plr.."Aircraft"].PilotSeat.Seat.Velocity = offset.Unit * speed--((workspace[user.."Aircraft"].PilotSeat.Seat.Velocity).magnitude * 1.25)
		end
	end
end
