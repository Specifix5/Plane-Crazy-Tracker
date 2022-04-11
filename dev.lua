local user = "bhbydii1uhdbudqwdd"
local plr = game.Players.LocalPlayer

local can = true

function getDestination()
    -- Up to you to determine where this thing is going!
    return workspace[user.."Aircraft"].PilotSeat.Seat.Position
end

workspace[plr].Humanoid.Died:Connect(function()
	can = false
end)

while wait(.1) do
	if can == true then
		if workspace[plr.."Aircraft"].PilotSeat.Seat == nil then
			workspace.Gravity = 196
		else
			workspace.Gravity = 0
			local offset = getDestination() - workspace[plr.."Aircraft"].PilotSeat.Seat.Position
			--workspace.Filename_03Aircraft.PilotSeat.Seat.CFrame = workspace[user.."Aircraft"].PilotSeat.Seat.CFrame * CFrame.new(0, 0, 80)
			workspace[plr.."Aircraft"].PilotSeat.Seat.Velocity = offset.Unit * 450--((workspace[user.."Aircraft"].PilotSeat.Seat.Velocity).magnitude * 1.25)
		end
	end
end
--loadstring(game:GetObjects("rbxassetid://418957341")[1].Source)()
