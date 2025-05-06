-- Script is Op and made by the poster

local OrionLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/jensonhirst/Orion/main/source'))()

local Window = OrionLib:MakeWindow({
	Name = "Vermillion Hub | Version 1.04",
	HidePremium = false,
	SaveConfig = true,
	ConfigFolder = "VermillionHub"
})

-- // MAIN TAB
local MainTab = Window:MakeTab({
	Name = "Main",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

MainTab:AddTextbox({
	Name = "Fake Money (Input the number)",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
		local amount = tonumber(Value)
		if amount then
			game:GetService("Players").LocalPlayer.leaderstats.Cash.Value = amount
		end
	end
})

MainTab:AddTextbox({
	Name = "Fake Wins (Input the number)",
	Default = "",
	TextDisappear = true,
	Callback = function(Value)
		local amount = tonumber(Value)
		if amount then
			game:GetService("Players").LocalPlayer.leaderstats.Wins.Value = amount
		end
	end
})


MainTab:AddSection({ Name = "Main Features" })

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local winsStat = player:WaitForChild("leaderstats"):WaitForChild("Wins")

local savedWins = winsStat.Value

MainTab:AddToggle({
    Name = "Unlock all worlds",
    Default = false,
    Callback = function(enabled)
        if enabled then
            savedWins = winsStat.Value
            winsStat.Value = 10000000
        else
            winsStat.Value = savedWins
        end
    end
})

-- Dupe money
local autoCashEnabled = false
local Threads = 2 -- How many times to dupe in parallel

MainTab:AddToggle({
	Name = "Normal Dupe Money (Hold Drill)",
	Default = false,
	Callback = function(Value)
		autoCashEnabled = Value
		if autoCashEnabled then
			for i = 1, Threads do
				task.spawn(function()
					while autoCashEnabled do
						local player = game:GetService("Players").LocalPlayer
						local tool = player.Character and player.Character:FindFirstChildWhichIsA("Tool")
						local giveCash = game:GetService("ReplicatedStorage"):FindFirstChild("GiveCash")

						if tool and giveCash then
							giveCash:FireServer(tool)
						end

						task.wait(0)
					end
				end)
			end
		end
	end
})

-- Dupe money
local autoCashEnabled = false
local Threads = 20 -- How many times to dupe in parallel

MainTab:AddToggle({
	Name = "Fast Dupe Money (Hold Drill)",
	Default = false,
	Callback = function(Value)
		autoCashEnabled = Value
		if autoCashEnabled then
			for i = 1, Threads do
				task.spawn(function()
					while autoCashEnabled do
						local player = game:GetService("Players").LocalPlayer
						local tool = player.Character and player.Character:FindFirstChildWhichIsA("Tool")
						local giveCash = game:GetService("ReplicatedStorage"):FindFirstChild("GiveCash")

						if tool and giveCash then
							giveCash:FireServer(tool)
						end

						task.wait(0)
					end
				end)
			end
		end
	end
})

-- Dupe Easter Tokens
local autoEasterEnabled = false
local Threads = 100 -- How many times to dupe in parallel

MainTab:AddToggle({
	Name = "Super fast Dupe Easter Tokens (Hold Drill)",
	Default = false,
	Callback = function(Value)
		autoEasterEnabled = Value
		if autoEasterEnabled then
			for i = 1, Threads do
				task.spawn(function()
					while autoEasterEnabled do
						local player = game:GetService("Players").LocalPlayer
						local tool = player.Character and player.Character:FindFirstChildWhichIsA("Tool")
						local giveCash = game:GetService("ReplicatedStorage"):FindFirstChild("GiveCash")

						if tool and giveCash then
							giveCash:FireServer(tool)
						end

						task.wait(0)
					end
				end)
			end
		end
	end
})

local VirtualInputManager = game:GetService("VirtualInputManager")
local RunService = game:GetService("RunService")

local isAutoDrilling = false
local connection

MainTab:AddToggle({
    Name = "Auto drill",
    Default = false,
    Callback = function(state)
        isAutoDrilling = state

        if isAutoDrilling then
            connection = RunService.RenderStepped:Connect(function()
                VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 0) -- Press & hold
            end)
        else
            if connection then connection:Disconnect() end
            VirtualInputManager:SendMouseButtonEvent(0, 0, 0, false, game, 0) -- Release
        end
    end
})	
				
MainTab:AddButton({
	Name = "Go to Surface",
	Callback = function()
		local stopAutoFarm = game:GetService("ReplicatedStorage"):FindFirstChild("AFKFarming")
		if stopAutoFarm and stopAutoFarm:FindFirstChild("StopAutoFarm") then
			stopAutoFarm.StopAutoFarm:FireServer()
		end
	end
})

MainTab:AddButton({
	Name = "Farm All win Locations",
	Callback = function()
		local player = game.Players.LocalPlayer
		local char = player.Character or player.CharacterAdded:Wait()
		local hrp = char:WaitForChild("HumanoidRootPart")

		local locations = {
			CFrame.new(9153.89258, 6911.06445, 123.499321, 0.472652435, -2.42196663e-08, -0.881248951, 2.72271228e-09, 1, -2.60230308e-08, 0.881248951, 9.90046178e-09, 0.472652435), -- Location 1
			CFrame.new(14070.4639, 6911.06445, 123.685318, 0.0992648602, 6.90488307e-08, -0.99506104, 1.3604613e-09, 1, 6.95272675e-08, 0.99506104, -8.2553564e-09, 0.0992648602), -- Location 2
			CFrame.new(19305.2598, 6911.06445, 123.029884, 0.952872574, -1.53685242e-09, -0.303370863, -2.45552023e-09, 1, -1.27785844e-08, 0.303370863, 1.2921296e-08, 0.952872574), -- Location 3
			CFrame.new(4373.42578, 6911.06445, 123.408325, -0.866798937, -4.78178031e-08, -0.498657793, -4.11568113e-09, 1, -8.87388794e-08, 0.498657793, -7.48664561e-08, -0.866798937), -- Location 4
			CFrame.new(-5020.96729, 6910.06445, -147.2789, -0.955857337, -5.65169078e-10, -0.29383117, -1.88307536e-10, 1, -1.31086819e-09, 0.29383117, -1.19767241e-09, -0.955857337), -- Location 5
			CFrame.new(-69.7102432, 6911.06445, 0.36041218, 0.999012947, -1.08228448e-08, 0.0444196761, 6.24521235e-09, 1, 1.03192932e-07, -0.0444196761, -1.02813665e-07, 0.999012947), -- Location 6
		}

		for _, cf in ipairs(locations) do
			hrp.CFrame = cf
			task.wait(1) -- Adjust delay between teleports as needed
		end
	end    
})
			
MainTab:AddToggle({
	Name = "Advanced Autofarm Wins (New)",
	Default = false,
	Callback = function(Value)
		getgenv().AutoFarmWins = Value
		while getgenv().AutoFarmWins do
			local player = game.Players.LocalPlayer
			local char = player.Character or player.CharacterAdded:Wait()
			local hrp = char:WaitForChild("HumanoidRootPart")

			local locations = {
				CFrame.new(9153.89258, 6911.06445, 123.499321, 0.472652435, -2.42196663e-08, -0.881248951, 2.72271228e-09, 1, -2.60230308e-08, 0.881248951, 9.90046178e-09, 0.472652435),
				CFrame.new(14070.4639, 6911.06445, 123.685318, 0.0992648602, 6.90488307e-08, -0.99506104, 1.3604613e-09, 1, 6.95272675e-08, 0.99506104, -8.2553564e-09, 0.0992648602),
				CFrame.new(19305.2598, 6911.06445, 123.029884, 0.952872574, -1.53685242e-09, -0.303370863, -2.45552023e-09, 1, -1.27785844e-08, 0.303370863, 1.2921296e-08, 0.952872574),
				CFrame.new(4373.42578, 6911.06445, 123.408325, -0.866798937, -4.78178031e-08, -0.498657793, -4.11568113e-09, 1, -8.87388794e-08, 0.498657793, -7.48664561e-08, -0.866798937),
				CFrame.new(-5020.96729, 6910.06445, -147.2789, -0.955857337, -5.65169078e-10, -0.29383117, -1.88307536e-10, 1, -1.31086819e-09, 0.29383117, -1.19767241e-09, -0.955857337),
				CFrame.new(-69.7102432, 6911.06445, 0.36041218, 0.999012947, -1.08228448e-08, 0.0444196761, 6.24521235e-09, 1, 1.03192932e-07, -0.0444196761, -1.02813665e-07, 0.999012947),
			}

			for _, cf in ipairs(locations) do
				if not getgenv().AutoFarmWins then break end
				hrp.CFrame = cf
				task.wait(1) -- Delay between teleports
			end
		end
	end    
})

-- // TELEPORT TAB
local TeleportTab = Window:MakeTab({
	Name = "Teleports",
	Icon = "rbxassetid://7733992424",
	PremiumOnly = false
})

TeleportTab:AddSection({ Name = "Teleport Locations" })

local teleportLocations = {
	["Main"] = CFrame.new(-103.572998, 9557.18945, -100.167),
	["Dinosaur"] = CFrame.new(-5056.70801, 9557.28809, -272.729736),
	["Frozen"] = CFrame.new(4339.82715, 9557.18652, 23.2329998),
	["Jungle"] = CFrame.new(9119.14844, 9557.21582, 30.2921391),
	["Magic"] = CFrame.new(14034.4795, 9557.21484, 28.9664612),
	["Ancient Greek"] = CFrame.new(19269.2305, 9557.21582, 29.3682556),
	["Crystal"] = CFrame.new(-691.727539, 9560.97754, -2547.19214)
}

local locationNames = {}
for name, _ in pairs(teleportLocations) do
	table.insert(locationNames, name)
end

TeleportTab:AddDropdown({
	Name = "Select Teleport Location",
	Default = "Select",
	Options = locationNames,
	Callback = function(selected)
		local cf = teleportLocations[selected]
		if cf then
			local char = game.Players.LocalPlayer.Character
			if char and char:FindFirstChild("HumanoidRootPart") then
				char.HumanoidRootPart.CFrame = cf
			end
		end
	end
})

local TeleportWorlds = {
    "Ancient Greek",
    "Magic",
    "Dinosaur",
    "Main",
    "Crystal",
	    "Jungle",
	    "Frozen"
    -- Add more world names if needed
}

TeleportTab:AddDropdown({
    Name = "Select World (change world)",
    Default = "Select",
    Options = TeleportWorlds,
    Callback = function(selectedWorld)
        game:GetService("ReplicatedStorage").ChangeWorld:InvokeServer(selectedWorld)
    end
})	
		
	TeleportTab:AddSection({ Name = "Player Teleports" })
	
	local Players = game:GetService("Players")

-- Table to hold player names
local playerNames = {}
local selectedPlayer = nil

-- Update function
local function updatePlayerList()
	playerNames = {}
	for _, plr in ipairs(Players:GetPlayers()) do
		if plr ~= Players.LocalPlayer then
			table.insert(playerNames, plr.Name)
		end
	end
end

updatePlayerList()

-- Dropdown in TeleportsTab
TeleportTab:AddDropdown({
	Name = "Teleport to Player",
	Default = nil,
	Options = playerNames,
	Callback = function(selectedName)
		local target = Players:FindFirstChild(selectedName)
		if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
			local localHRP = Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
			if localHRP then
				localHRP.CFrame = target.Character.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0)
			end
		end
	end
})

-- Refresh button in TeleportsTab
TeleportTab:AddButton({
	Name = "Refresh Player List",
	Callback = function()
		updatePlayerList()
	end
})
		
TeleportTab:AddToggle({
	Name = "Auto Refresh Player List",
	Default = false,
	Callback = function(value)
		autoRefreshEnabled = value

		if value then
			task.spawn(function()
				while autoRefreshEnabled do
					updatePlayerList()
					task.wait(5) -- refresh every 5 seconds
				end
			end)
		end
	end
})		
		
			TeleportTab:AddSection({ Name = "Other Teleports" })
		
TeleportTab:AddButton({
	Name = "Teleport To Rebirth",
	Callback = function()
		local char = game.Players.LocalPlayer.Character
		if char and char:FindFirstChild("HumanoidRootPart") then
			char.HumanoidRootPart.CFrame = CFrame.new(
				9079.74512, 9557.27637, -9.01346493,
				0.305170655, 1.74454795e-09, 0.952297688,
				5.22233679e-09, 1, -3.50547102e-09,
				-0.952297688, 6.04298611e-09, 0.305170655
			)
		end
	end
})		

-- // MISC TAB
local MiscTab = Window:MakeTab({
	Name = "Misc",
	Icon = "rbxassetid://7733701545",
	PremiumOnly = false
})

MiscTab:AddSection({ Name = "Misc Features" })

-- Anti-AFK
MiscTab:AddButton({
	Name = "Anti-AFK",
	Callback = function()
		local vu = game:GetService("VirtualUser")
		game:GetService("Players").LocalPlayer.Idled:Connect(function()
			vu:CaptureController()
			vu:ClickButton2(Vector2.new())
		end)
		game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "ANTI-AFK",
			Text = "Vermillion Anti-AFK injected!",
			Duration = 8
		})
	end
})

-- Infinite Yield
MiscTab:AddButton({
	Name = "Load Infinite Yield",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
	end
})

-- Noclip (PC and Mobile)
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local player = game.Players.LocalPlayer
local noclipEnabled = false
local mobileNoclipEnabled = false

UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if not gameProcessed and input.KeyCode == Enum.KeyCode.N then
		noclipEnabled = not noclipEnabled
	end
end)

RunService.Stepped:Connect(function()
	if (noclipEnabled or mobileNoclipEnabled) and player.Character then
		for _, part in pairs(player.Character:GetDescendants()) do
			if part:IsA("BasePart") then
				part.CanCollide = false
			end
		end
	end
end)

MiscTab:AddButton({
	Name = "Enable Noclip (Press N)",
	Callback = function()
		game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "Noclip Enabled",
			Text = "Press N to toggle noclip on/off.",
			Duration = 6
		})
	end
})

MiscTab:AddToggle({
	Name = "Mobile Noclip Toggle",
	Default = false,
	Callback = function(value)
		mobileNoclipEnabled = value
	end
})
			
local EggsTab = Window:MakeTab({
    Name = "Eggs/Pets",
    Icon = "rbxassetid://8997385940",  -- best icon ever
    PremiumOnly = false
})

EggsTab:AddSection({ Name = "Eggs-" })		
			
-- Egg names list
local eggNames = {
    "Oceanic Egg", "Beach Egg", "Lava Egg", "Fossil Egg", "Jurassic Egg",
    "Glacier Egg", "Blizzard Egg", "Tropical Egg", "Jungle Egg", "Ember Egg",
    "Enigma Egg", "Pantheon Egg", "Olympian Egg", "Easter Egg"
}

local selectedEgg = "Oceanic Egg" -- Default egg
local hatchCount = 1 -- Default hatch count

-- Dropdown to select egg
EggsTab:AddDropdown({
    Name = "Select Egg",
    Default = selectedEgg,
    Options = eggNames,
    Callback = function(egg)
        selectedEgg = egg
    end
})

-- Input box for how many eggs to hatch
EggsTab:AddTextbox({
    Name = "Number of Eggs",
    Default = "1",
    TextDisappear = false,
    Callback = function(input)
        hatchCount = tonumber(input) or 1
    end
})

-- Button to fire hatch event
EggsTab:AddButton({
    Name = "Hatch Eggs",
    Callback = function()
        local args = {
            [1] = selectedEgg,
            [2] = hatchCount
        }

        game:GetService("ReplicatedStorage"):WaitForChild("KPets"):WaitForChild("Events"):WaitForChild("Hatch"):FireServer(unpack(args))
    end
})
			
			EggsTab:AddSection({ Name = "Pets-" })
			
EggsTab:AddButton({
	Name = "Equip Best Pets",
	Callback = function()
		game:GetService("ReplicatedStorage"):WaitForChild("KPets"):WaitForChild("Events"):WaitForChild("EquipBest"):FireServer()
	end
})		
			
EggsTab:AddButton({
	Name = "Unequip All Pets",
	Callback = function()
		game:GetService("ReplicatedStorage"):WaitForChild("KPets"):WaitForChild("Events"):WaitForChild("UnequipAll"):FireServer()
	end
})	
			
-- Most overpowered Section
-- // Give TAB
local GiveTab = Window:MakeTab({
	Name = "Give/Editor",
	Icon = "rbxassetid://7733946818",
	PremiumOnly = false
})
			
		GiveTab:AddSection({ Name = "Drill Editor-" })		
			
GiveTab:AddButton({
    Name = "Give Dev Drill Patched",
    Callback = function()
        game.ReplicatedStorage.ViewportDrills.DEV.Parent = game.Players.LocalPlayer.Backpack
    end
})
			
GiveTab:AddDropdown({
	Name = "Give Selected Drill (Some may not work)",
	Default = "Select",
	Options = {"DEV", "Herculean", "Olympian", "Aegean Tide", "Mystic Bore",
			"Arcane Auger", "Spellboun", "Thornspike", "Vinecutter", "Permafrost",
			"Icebreaker", "Glacier", "Volcano", "Amber", "Fossil"}, -- Add your drills here
	Callback = function(Value)
		local drill = game.ReplicatedStorage.ViewportDrills:FindFirstChild(Value)
		if drill then
			drill.Parent = game.Players.LocalPlayer.Backpack
		end
	end
})
			
			local Options = {
    "DEV", "Herculean", "Olympian", "Aegean Tide", "Mystic Bore",
    "Arcane Auger", "Spellboun", "Thornspike", "Vinecutter", "Permafrost",
    "Icebreaker", "Glacier", "Volcano", "Amber", "Fossil"
}

-- Function to equip all drills
local function giveAllDrills()
    for _, drillName in pairs(Options) do
        local drill = game.ReplicatedStorage.ViewportDrills:FindFirstChild(drillName)
        if drill then
            drill.Parent = game.Players.LocalPlayer.Backpack
        else
            warn("Drill not found: " .. drillName)
        end
    end
end

-- Add the button to give all drills
GiveTab:AddButton({
    Name = "Give All Drills",
    Callback = function()
        giveAllDrills()
    end    
})
    	
GiveTab:AddTextbox({
    Name = "Drill Power Multiplier (Dont Exceed 20)",
    Default = "",
    TextDisappear = false,
    Callback = function(Value)
        local num = tonumber(Value)
        if num and num > 0 and num <= 20 then
            game.Players.LocalPlayer.DrillPowerMultiplier.Value = num
        else
            warn("Invalid input. Enter a number between 1 and 20.")
        end
    end
})    	
    	
GiveTab:AddTextbox({
    Name = "Drill Speed Multiplier",  -- Name of the textbox
    Default = "",            -- Default value shown
    TextDisappear = true,              -- Makes the text disappear when losing focus
    Callback = function(Value)        -- The function to handle input
        game:GetService("Players").LocalPlayer.AmuletData.TotalDigSpeedMulti.Value = tonumber(Value)
    end
})	
    	
GiveTab:AddSection({ Name = "Gamepass Editor-" })
			
GiveTab:AddButton({
	Name = "Give x3,x8 Hatch Gamepass",
	Callback = function()
		game:GetService("Players").LocalPlayer.Data.Gamepasses.X8EggsHatch.Value = true
	end    
})    	
    	
GiveTab:AddButton({
    Name = "Give SuperLucky Gamepass",
    Callback = function()
        -- Granting the SuperLucky gamepass to the player
        game:GetService("Players").LocalPlayer.Data.Gamepasses.SuperLucky.Value = true
        print("SuperLucky gamepass granted!")
    end    
})    	
    	
-- // SAFE TAB
local SafeTab = Window:MakeTab({
	Name = "Safe",
	Icon = "rbxassetid://7734056411",
	PremiumOnly = false
})    	
    	
-- Admin User IDs
local adminUserIds = {
	7608294518,
	7480140891,
	1003344545,
	514156205,
	7390635749
}

local kickMessage = "Admin detected. You have been kicked."
local kickEnabled = false

-- TextBox (for message)
SafeTab:AddTextbox({
	Name = "Kick Message",
	Default = "",
	TextDisappear = false,
	Callback = function(text)
		if text ~= "" then
			kickMessage = text
		end
	end
})

-- Toggle (for enabling auto-kick)
SafeTab:AddToggle({
	Name = "Kick If Admin Joins",
	Default = false,
	Callback = function(Value)
		kickEnabled = Value
	end
})

-- Kick logic
game.Players.PlayerAdded:Connect(function(player)
	if not kickEnabled then return end
	if table.find(adminUserIds, player.UserId) then
		game.Players.LocalPlayer:Kick(kickMessage)
	end
end)
    	
-- // SETTINGS TAB
local SettingsTab = Window:MakeTab({
	Name = "Settings",
	Icon = "rbxassetid://7734053495",
	PremiumOnly = false
})
	
SettingsTab:AddButton({
	Name = "Unload GUI",
	Callback = function()
		OrionLib:Destroy()
	end
}) 
