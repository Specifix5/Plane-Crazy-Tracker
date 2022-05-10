--[[ 
	Hello there, whoever is using my script. Is it me Specifix a.k.a your local Filename_03, here's some 
	basic introduction to using the script.

	<!> PLEASE NOTE THAT DO NOT ADD ANY PHYSICS OBJECT INTO YOUR VEHICLE <!>
	(e.g: Motors, Parachutes, Ropes, and many other!) Plane crazy's physics handler
	will override the script's physics alternation ability (to move and do stuff)

	The max speed for cutters to actully work and break blocks is around ~1250, so please remember that!
	the faster you go, the more useless it gets.

	If you are a toxic exploiter, you can enable "useAnnoyingChatMessages" for you to say stuff when
	target dies, script executes (e.g: "LOL! You're being targetted.")

	NOTE: There's this stupid ass bug where your ping sometimes commit unexist when you go too fast.


	TODO:
	- Add an exploiter detector, potentially detects an exploiter and marks them as suspicious.
	This helps you to know that there's a physics altering exploiter such as vfly (vehicle fly)
	user and stuff. Might wanna go for that hacker vs hacker 1v1 moment

	- Priority List, A blacklist sort of thing to make you target the blacklisted user available in blacklist.txt
--]]

local user = "TARGET NAME" -- Target User here
local speed = 2250 -- Specified Speed the vehicle will move at (It is recommended to not go above 1250)
local plr = game.Players.LocalPlayer.Name

-- Settings
local useAnnoyingChatMessages = false -- Enable Chat messages (e.g: "LOL! You're being targetted.")

local targetDiedEvent

-- IGNORE THIS -- Wether the script continue to execute and update velocity!
local can = true

function notify(title, text)
	game.StarterGui:SetCore("SendNotification", {
		Title = tostring(title); -- Required. Has to be a string!
		Text = tostring(text); -- Required. Has to be a string!
		Icon = ""; -- Optional, defaults to "" (no icon)
		Duration = 5; -- Optional, defaults to 5 seconds
	})
end

function playAudio(audioId)
	local s = Instance.new("Sound", workspace)
	s.SoundId = "rbxassetid://"..audioId
	s.Volume = 1.25
	s.PlayOnRemove = true

	wait()

	s:Destroy()
	print("Successfully played audio:"..audioId)
end

if workspace:FindFirstChild(user.."Aircraft") == nil then
	playAudio(9576185430)
	notify("Error", "Unable to find player vehicle")
	return
else
	notify("Ready", "Script successfully been executed.")
	playAudio(9576178484)
	if useAnnoyingChatMessages then
		game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("LOL! You're being targetted, "..user, "All")
	end

	targetDiedEvent = workspace[user].Humanoid.Died:Connect(function ()
		playAudio(9576182449)
		if useAnnoyingChatMessages then
			game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer("L You died, imagine! "..user, "All")
		end

		can = false
		local offset = getDestination() - workspace[plr.."Aircraft"].PilotSeat.Seat.Position
		workspace[plr.."Aircraft"].PilotSeat.Seat.Velocity = offset.Unit * 0

		wait(game.Players.RespawnTime + 3.5)

		repeat wait() until (workspace:FindFirstChild(user.."Aircraft") and workspace:FindFirstChild(plr.."Aircraft")) == true

		wait(10)
		
		playAudio(9576428703)
		notify("Target Respawned", "Maintaining Velocity to target's position")
		
		can = true
	end)
end

can = true

function getDestination()
    -- Up to you to determine where this thing is going!
    return workspace[user].HumanoidRootPart.Position--.."Aircraft"].PilotSeat.Seat.Position
end


workspace[plr].Humanoid.Died:Connect(function()
	playAudio(9576183844)
	can = false
	wait(.1)
	targetDiedEvent:Disconnect()
	targetDiedEvent = nil
end)

for i, v in pairs(workspace.BuildingZones:GetDescendants()) do
	if v.Name == "BlackListPart" then
		v:Destroy()
	end
end

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
