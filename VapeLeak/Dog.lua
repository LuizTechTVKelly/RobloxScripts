repeat task.wait() until game:IsLoaded()
repeat task.wait() until shared.GuiLibrary
local uis = game:GetService("UserInputService")
local GuiLibrary = shared.GuiLibrary
local ScriptSettings = {}
local UIS = game:GetService("UserInputService")
local COB = function(tab, argstable) 
	return GuiLibrary["ObjectsThatCanBeSaved"][tab.."Window"]["Api"].CreateOptionsButton(argstable)
end
function securefunc(func)
	task.spawn(function()
		spawn(function()
			pcall(function()
				loadstring(
					func()
				)()
			end)
		end)
	end)
end
function createwarning(title, content, duration)
	local frame = GuiLibrary["CreateNotification"](title or "VapeDaddy V4 Warning", content or "(No Content Given)", duration or 5, "assets/WarningNotification.png")
	frame.Frame.Frame.ImageColor3 = Color3.fromRGB(255, 64, 64)
end
function infonotify(title, content, duration)
	local frame = GuiLibrary["CreateNotification"](title or "VapeDaddy V4 Info", content or "(No Content Given)", duration or 5, "assets/InfoNotification.png")
	frame.Frame.Frame.ImageColor3 = Color3.fromRGB(255, 64, 64)
end
function getstate()
	local ClientStoreHandler = require(game.Players.LocalPlayer.PlayerScripts.TS.ui.store).ClientStore
	return ClientStoreHandler:getState().Game.matchState
end
function iscustommatch()
	local ClientStoreHandler = require(game.Players.LocalPlayer.PlayerScripts.TS.ui.store).ClientStore
	return ClientStoreHandler:getState().Game.customMatch
end
function checklagback()
	local hrp = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
	return isnetworkowner(hrp)
end

GuiLibrary["MainGui"].ScaledGui.ClickGui.Version.Text = "DOG PRIVATE | V4.0.8  "
GuiLibrary["MainGui"].ScaledGui.ClickGui.MainWindow.TextLabel.Text = "DOG PRIVATE | V4.0.8  "
GuiLibrary["MainGui"].ScaledGui.ClickGui.Version.Version.Text = "DOG PRIVATE | V4.0.8  "
GuiLibrary["MainGui"].ScaledGui.ClickGui.Version.Position = UDim2.new(1, -175 - 20, 1, -25)
infonotify("VapeDaddy", "Loaded successfully!", 5)

local CustomFly = COB("Blatant", {
	["Name"] = "CustomFly",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.CustomFly = true
				while task.wait() do
					if not ScriptSettings.CustomFly == true then return end
					game:GetService("Workspace").Gravity = 0
					game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
					task.wait(0.04)
					game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Climbing)
					task.wait(0.01)
					game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Landed)
				end
			end)
		else
			pcall(function()
				ScriptSettings.CustomFly = false
				game:GetService("Workspace").Gravity = 196.2
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "Uses bypasses to fly"
})
local AnticheatDisabler = COB("Utility", {
	["Name"] = "AnticheatDisabler",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.AnticheatDisabler = true
                                        local function disablerFunction()
	     local lplr = game.Players.LocalPlayer
        lplr.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead, true)
        lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Dead)
        repeat task.wait() until lplr.Character.Humanoid.MoveDirection ~= Vector3.zero
        task.wait(0.2)
        lplr.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
        lplr.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Running)
        workspace.Gravity = 192.6    
    end
             disablerFunction()
			end)
		else
			pcall(function()
				ScriptSettings.AnticheatDisabler = false
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "yes its real stfu"
})
AnticheatDisabler.CreateSlider({
    ["Name"] = "Delay",
	["Double"] = 100,
    ["Min"] = 0,
    ["Max"] = 100,
    ["Function"] = function(val)
        ScriptSettings.AnticheatDisabler_Delay = val
    end,
    ["HoverText"] = "Delay",
    ["Default"] = 0.05
})
local KitExploit = COB("Utility", {
	["Name"] = "KitExploit",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.KitExploit = true
				local kits = {
					["Axolotl"] = require(game:GetService("ReplicatedStorage").TS.games.bedwars.kit.kits.axolotl["axolotl-kit"]).AxolotlKit,
					["Beast"] = require(game:GetService("ReplicatedStorage").TS.games.bedwars.kit.kits["beast"]["beast-util"]).BeastKit,
					["Dasher"] = require(game:GetService("ReplicatedStorage").TS.games.bedwars.kit.kits.dasher["dasher-kit"]).DasherKit,
					["Fisherman"] = require(game:GetService("ReplicatedStorage").TS.games.bedwars.kit.kits["fisherman"]["fisherman-util"]).FishermanUtil,
					["IceQueen"] = require(game:GetService("ReplicatedStorage").TS.games.bedwars.kit.kits["ice-queen"]["ice-queen-kit"]).IceQueenKit,
					["Santa"] = require(game:GetService("ReplicatedStorage").TS.games.bedwars.kit.kits.santa["santa-util"]).SantaUtil,
				}
				kits["Axolotl"]["SWIM_TO_CHARACTER_TIME"] = 0.0000000000001
				kits["Axolotl"]["ACTIVE_COOLDOWN"] = 0.0000000000001
				kits["Beast"]["WALK_SPEED_MULTIPLIER"] = 5
				kits["Beast"]["KNOCKBACK_MULTIPLIER"] = 5
				kits["Dasher"]["DASH_COOLDOWN"] = 0.0000000000001
				kits["Dasher"]["CHARGE_TIME"] = 0.0000000000001
				kits["Dasher"]["CHARGE_TIME_BEFORE_CHARGING_STATE"] = 0.0000000000001
				kits["Dasher"]["TOTAL_CHARGE_TIME"] = 0.0000000000001
				kits["Fisherman"]["minigameDuration"] = 60
				kits["Fisherman"]["markerSize"] = UDim2.fromScale(0.05, 1)
				kits["Fisherman"]["totalDecaySpeedSec"] = 2
				kits["Fisherman"]["startingMarkerIncrementSpeed"] = 0.2
				kits["Fisherman"]["holdMinimumMarkerIncrementSpeed"] = 0.1
				kits["Fisherman"]["markerIncrementAmount"] = 0.025
				kits["Fisherman"]["fishZoneSize"] = UDim2.fromScale(0,5, 1)
				kits["Fisherman"]["fishZoneSpeedMultiplier"] = 5
				kits["Fisherman"]["fishZoneMoveCooldown"] = 10
				kits["Fisherman"]["fillAmount"] = 0.1
				kits["Fisherman"]["drainAmount"] = 0.0001
				kits["IceQueen"]["DAMAGE_REQUIREMENT"] = 0.0000000000001
				kits["IceQueen"]["PASSIVE_STACK_COOLDOWN"] = 0.0000000000001
				kits["IceQueen"]["PROC_COOLDOWN"] = 0.0000000000001
				kits["IceQueen"]["BAR_COUNT"] = 4
				kits["IceQueen"]["BASE_PASSIVE_DAMAGE"] = 0.1
				kits["IceQueen"]["BASE_SPEED_MULTIPLIER"] = 99
				kits["IceQueen"]["BASE_SLOW_LENGHT"] = 0.0000000000001
				kits["IceQueen"]["ICE_SWORD_PASSIVE_DAMAGE"] = 0.1
				kits["IceQueen"]["ICE_SWORD_SLOW_LENGTH"] = 0.0000000000001
				kits["IceQueen"]["ICE_SWORD_STUN_DURATION"] = 99
				kits["IceQueen"]["PASSIVE_EXPIRATION_TIME"] = 99
				kits["Santa"]["BOMB_DROP_DELAY"] = 0.0000000000001
				kits["Santa"]["TOTAL_BOMBS"] = 99
				kits["Santa"]["DROP_HEIGHT"] = 150
				kits["Santa"]["DROP_DELAY"] = 0.0000000000001
			end)
		else
			pcall(function()
				ScriptSettings.KitExploit = false
				infonotify("ItemExploit", "Unable to revert changes", "5")
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "Exploits Axolotl, Beast, Dasher, Fisherman, IceQueen and Santa kit settings"
})
local ItemExploit = COB("Utility", {
	["Name"] = "ItemExploit",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.ItemExploit = true
				local SW = require(game:GetService("ReplicatedStorage").TS.games.bedwars.items.stopwatch["stopwatch-constants"]).StopwatchConstants
				local TB = require(game:GetService("ReplicatedStorage").TS.games.bedwars.items.twirlblade["twirlblade-util"]).TwirlbladeUtil
				local CS = require(game:GetService("ReplicatedStorage").TS.games.bedwars["charge-shield"]["charge-shield-util"]).ChargeShieldUtil
				local GH = require(game:GetService("ReplicatedStorage").TS["grappling-hook"]["grappling-hook-util"])
				local HM = require(game:GetService("ReplicatedStorage").TS.vehicle.helicopter["helicopter-missile"])
				SW["DURATION"] = 60
				SW["EFFECT_DURATION"] = 60
				TB["SPIN_DAMAGE"] = 100
				CS["CHARGE_SHIELD_COOLDOWN_SEC"] = 0.0000000000001
				CS["CHARGE_DURATION"] = 10
				CS["CHARGE_SPEED_MULTIPLIER"] = 5
				CS["MAX_HIT_DISTANCE"] = 50
				CS["MAX_HIT_ANGLE"] = 360
				CS["MAX_HIT_HEIGHT"] = 100
				CS["HIT_DAMAGE"] = 100
				CS["VERTICAL_KNOCKBACK"] = 5
				CS["HORIZONTAL_KNOCKBACK"] = 5
				GH["SPEED"] = 5000
				GH["FIRE_COOLDOWN"] = 0.0000000000001
				GH["HIT_PLAYER_COOLDOWN"] = 0.0000000000001
				GH["HIT_BLOCK_COOLDOWN"] = 0.0000000000001
				HM["MISSLE_FIRE_RATE"] = 0.0000000000001
			end)
		else
			pcall(function()
				ScriptSettings.ItemExploit = false
				infonotify("ItemExploit", "Unable to revert changes", "5")
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "Exploits like 5 item settings settings"
})
local InfJump = COB("Utility", {
	["Name"] = "InfJump",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.InfJump = true
				game:GetService("UserInputService").JumpRequest:connect(function()
					if not ScriptSettings.InfJump == true then return end
					if not ScriptSettings.InfJump_Alr then
					    game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
					    ScriptSettings.InfJump_Alr = true
					    task.wait(0.125)
					    ScriptSettings.InfJump_Alr = false
					else
					    task.wait()
					end
				end)
			end)
		else
			pcall(function()
				ScriptSettings.InfJump = false
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "Makes you can jump infinetly"
})
runcode(function()
	local SizeChanger = {["Enabled"] = false}
    SizeChanger = GuiLibrary["ObjectsThatCanBeSaved"]["RenderWindow"]["Api"].CreateOptionsButton({
        ["Name"] = "SizeChanger",
		["HoverText"] = "Changes The Size Of a Item",
        ["Function"] = function(callback)
            if callback then
				RunLoops:BindToHeartbeat("SizeThing", 1, function()
					for i, v in pairs(game:GetService("Workspace").Camera.Viewmodel:GetChildren()) do
						if (v:IsA("Accessory")) then
							if v:FindFirstChild("Handle").Anchored == true then
								break
							else
								if v:FindFirstChild("Handle") then
									v.Handle.Size =  v.Handle.Size / 3
									v:FindFirstChild("Handle").Anchored = true
								end
								if v:FindFirstChild("Handle"):FindFirstChild("Neon") then
									v:FindFirstChild("Handle"):FindFirstChild("Neon"):Destroy()
								end
								if v:FindFirstChild("Handle"):FindFirstChild("gem") then
									v:FindFirstChild("Handle"):FindFirstChild("gem"):Destroy()
								end
							end
						end
					end
				end)
			else
				RunLoops:UnbindFromHeartbeat("SizeThing")
				createwarning("VapeDaddy", "Disabled Next Time You Die", 3)
			end
		end
	})
end)
runcode(function()
	local SunSetSky = {["Enabled"] = false}
    SunSetSky = GuiLibrary["ObjectsThatCanBeSaved"]["RenderWindow"]["Api"].CreateOptionsButton({
        ["Name"] = "SunsetSkyBox",
		["HoverText"] = "Changes The SkyBox",
        ["Function"] = function(callback)
            if callback then
				repeat task.wait() until game:GetService("Lighting").Sky
				game:GetService("Lighting").Sky.SkyboxBk = ("rbxassetid://151165214")
				game:GetService("Lighting").Sky.SkyboxDn = ("rbxassetid://151165197")
				game:GetService("Lighting").Sky.SkyboxFt = ("rbxassetid://151165224")
				game:GetService("Lighting").Sky.SkyboxLf = ("rbxassetid://151165191")
				game:GetService("Lighting").Sky.SkyboxRt = ("rbxassetid://151165206")
				game:GetService("Lighting").Sky.SkyboxUp = ("rbxassetid://151165227")
				game:GetService("Lighting").Sky.StarCount = "1333"
				local Bloom1 = Instance.new("BloomEffect", game:GetService("Lighting"))
				Bloom1.Intensity = 1
				Bloom1.Threshold = 2
				Bloom1.Name = "SkyBloom"
			else
				game:GetService("Lighting").Sky.StarCount = "0"
				game:GetService("Lighting").Sky.SkyboxBk = ("rbxassetid://7018684000")
				game:GetService("Lighting").Sky.SkyboxDn = ("rbxassetid://6334928194")
				game:GetService("Lighting").Sky.SkyboxFt = ("rbxassetid://7018684000")
				game:GetService("Lighting").Sky.SkyboxLf = ("rbxassetid://7018684000")
				game:GetService("Lighting").Sky.SkyboxRt = ("rbxassetid://7018684000")
				game:GetService("Lighting").Sky.SkyboxUp = ("rbxassetid://7018689553")
				game:GetService("Lighting"):FindFirstChild("SkyBloom"):Destroy()
			end
		end
	})
end)


runcode(function()
	local PlayerAnoyer = {["Enabled"] = false}
	PlayerAnoyer = GuiLibrary["ObjectsThatCanBeSaved"]["UtilityWindow"]["Api"].CreateOptionsButton({
		["Name"] = "PlayerAnnoyer",
		["HoverText"] = "Annoyes The Player With A Stupid Sound",
		["Function"] = function(callback)
			if callback then
				RunLoops:BindToHeartbeat("PlayerAnoyer", 1, function()
					game:GetService("ReplicatedStorage")["events-@easy-games/game-core:shared/game-core-networking@getEvents.Events"].useAbility:FireServer("PARTY_POPPER")
				end)
			else
				RunLoops:UnbindFromHeartbeat("PlayerAnoyer")
			end
		end
	})
end)


runcode(function()
	local OldLeaderBoard = {["Enabled"] = false}
	OldLeaderBoard = GuiLibrary["ObjectsThatCanBeSaved"]["RenderWindow"]["Api"].CreateOptionsButton({
		["Name"] = "LeaderBoard",
		["HoverText"] = "The LeaderBoard Becomes The Old One",
		["Function"] = function(callback)
			if callback then
				RunLoops:BindToHeartbeat("OldLeader", 1, function()
					game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, true)
				end)
			else
				RunLoops:UnbindFromHeartbeat("OldLeader")
				game:GetService("StarterGui"):SetCoreGuiEnabled(Enum.CoreGuiType.PlayerList, false)
			end
		end
	})
end)
runcode(function()
	function GotoAllBeds(GotoAllBedsDEL, TPUPBED)
		for i, v in pairs(game:GetService("Workspace"):GetChildren()) do
			if v.Name == "bed" then
				if v.Covers.BrickColor ~= game.Players.LocalPlayer.Team.TeamColor then
					game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health = 0
					Player.CharacterAdded:Wait()
					if TPUPBED ~= nil then
						game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = v.CFrame + Vector3.new(0,10,0)
					else
						game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = v.CFrame + Vector3.new(0,2,0)
					end
					if GotoAllBedsDEL ~= nil then
						task.wait(GotoAllBedsDEL)
					else
						task.wait(3.5)
					end
				end
			end
		end
	end

	function GotoPlayers()
		for i, v in pairs(game:GetService("Players"):GetPlayers()) do
			if v ~= Player and v.TeamColor.Name ~= Player.TeamColor.Name then
				if v.Character then
					Player.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Dead)
					Player.CharacterAdded:Wait()
					while v.Character:FindFirstChild("Humanoid").Health > 0 and v.Character:FindFirstChild("HumanoidRootPart") do
						game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = v.Character:FindFirstChild("HumanoidRootPart").CFrame
						task.wait(0.1)
					end
				end
			end
		end
	end
	local DeathAutowinCheck = 0
	local DeathAutowin = {["Enabled"] = false}
	DeathAutowin = GuiLibrary["ObjectsThatCanBeSaved"]["UtilityWindow"]["Api"].CreateOptionsButton({
		["Name"] = "DeathWin",
		["HoverText"] = "An Autowin but Uses Death tp (Make Sure KillAura and Nuker is on ! )",
		["Function"] = function(callback)
			if callback then
				createwarning("VapeDaddy", "Please Wait", 3)
				repeat task.wait() until game:GetService("ReplicatedStorage"):WaitForChild("Inventories"):WaitForChild(game.Players.LocalPlayer.Name):WaitForChild("wood_pickaxe")
				if game:GetService("ReplicatedStorage"):WaitForChild("Inventories"):WaitForChild(game.Players.LocalPlayer.Name):WaitForChild("wood_pickaxe") then
					if DeathAutowin["Enabled"] then
						DeathAutowin["ToggleButton"](false)
					end
					if Player.Character.Humanoid.Health <= 0 then
						createwarning("VapeDaddy", "You Cannot Enable This While Your Dead !", 5)
						if DeathAutowin["Enabled"] then
							DeathAutowin["ToggleButton"](false)
						end
					end
					DeathAutowinCheck = DeathAutowinCheck + 1
					if DeathAutowinCheck ~= 1 then
						createwarning("VapeDaddy", "Please Do Not Enable This Over One Time", 5)
						if DeathAutowin["Enabled"] then
							DeathAutowin["ToggleButton"](false)
						end
					end
					if DeathAutowinCheck == 1 then
						createwarning("VapeDaddy", "Destroying Beds", 5)
						GotoAllBeds(4.5)
						createwarning("VapeDaddy", "Killing Players", 5)
						GotoPlayers()
						createwarning("VapeDaddy", "You Won !", 3)
					end
					if DeathAutowin["Enabled"] then
						DeathAutowin["ToggleButton"](false)
					end
				else
					createwarning("VapeDaddy", "Failed To Find Inventory", 3)
					if DeathAutowin["Enabled"] then
						DeathAutowin["ToggleButton"](false)
					end
				end
			end
		end
	})
end)
runcode(function()
	local MassNuker = {["Enabled"] = false}
    MassNuker = GuiLibrary["ObjectsThatCanBeSaved"]["WorldWindow"]["Api"].CreateOptionsButton({
        ["Name"] = "MassNuker",
		["HoverText"] = "TelePorts To a bed",
        ["Function"] = function(callback)
            if callback then
				if game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart") or game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
					local Player = game.Players.LocalPlayer
					for i, v in pairs(game:GetService("Workspace"):GetChildren()) do
						if v.Name == "bed" then
							if v.Covers.BrickColor ~= game.Players.LocalPlayer.Team.TeamColor then
								game.Players.LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Dead)
								Player.CharacterAdded:Wait()
								game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = v.CFrame + Vector3.new(0,2,0)
								task.wait(4.5)
							end
						end
					end
					MassNuker["ToggleButton"](false)
				else
					createwarning("VapeDaddy", "Failed To Find Character", 3)
					MassNuker["ToggleButton"](false)
				end
			end
		end
	})
end)
local StateChanger = {["Enabled"] = false}
	StatChanger = GuiLibrary["ObjectsThatCanBeSaved"]["RenderWindow"]["Api"].CreateOptionsButton({
		["Name"] = "StatChanger",
		["HoverText"] = "Changes Stats",
		["Function"] = function(callback)
			if callback then
				game.Players.LocalPlayer.leaderstats.Kills.Value = Kills1
			else
				game.Players.LocalPlayer.leaderstats.Kills.Value = 0
			end
		end
	})

	Kills1 = StatChanger.CreateSlider({
		["Name"] = "kills",
		["Min"] = 0,
		["Max"] = 200,
		["HoverText"] = "Epic",
		["Function"] = function(val)
			Kills1 = val
		 end
	})

    --purple Skybox
    local skybox11 = {["Enabled"] = false}
	skybox11 = GuiLibrary["ObjectsThatCanBeSaved"]["RenderWindow"]["Api"].CreateOptionsButton({
		["Name"] = "PurpleSkybox",
		["Function"] = function(callback)
			if callback then
				local sky = Instance.new("Sky",game.Lighting)
				sky.MoonAngularSize = "0"
				sky.MoonTextureId = "rbxassetid://6444320592"
				sky.SkyboxBk = "rbxassetid://8107841671"
				sky.SkyboxDn = "rbxassetid://6444884785"
				sky.SkyboxFt = "rbxassetid://8107841671"
				sky.SkyboxLf = "rbxassetid://8107841671"
				sky.SkyboxRt = "rbxassetid://8107841671"
				sky.SkyboxUp = "rbxassetid://8107849791"
				sky.SunTextureId = "rbxassetid://6196665106"

			else
				local sky2 = Instance.new("Sky",game.Lighting)
				sky2.MoonAngularSize = "11"
				sky2.MoonTextureId = "rbxasset://sky/moon.jpg"
				sky2.SkyboxBk = "rbxassetid://7018684000"
				sky2.SkyboxDn = "rbxassetid://6334928194"
				sky2.SkyboxFt = "rbxassetid://7018684000"
				sky2.SkyboxLf = "rbxassetid://7018684000"
				sky2.SkyboxRt = "rbxassetid://7018684000"
				sky2.SkyboxUp = "rbxassetid://7018689553"
				sky2.SunTextureId = "rbxasset://sky/sun.jpg"
				sky2.SunAngularSize = "21"
			end
		end
	})

        --purple Ambience
	local Ambience1 = {["Enabled"] = false}
	Ambience1 = GuiLibrary["ObjectsThatCanBeSaved"]["RenderWindow"]["Api"].CreateOptionsButton({
		["Name"] = "PurpleAmbience",
		["Function"] = function(callback)
			if callback then
				game.Lighting.ColorCorrection.TintColor = Color3.fromRGB(170, 170, 255)
				game.Lighting.Ambient = Color3.fromRGB(170, 170, 255)
				game.Lighting.OutdoorAmbient = Color3.fromRGB(170, 170, 255)
			else
				game.Lighting.ColorCorrection.TintColor = Color3.fromRGB(255, 255, 255)
				game.Lighting.Ambient = Color3.fromRGB(255, 255, 255)
				game.Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
			end
		end
	})
    runcode(function()
	local UserInputService = game:GetService("UserInputService")
	local PlaceAnywhere = false
	local function onInputBegan(input, _gameProcessed)
		if PlaceAnywhere == true then
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				local MouseHit = game:GetService("Players").LocalPlayer:GetMouse().Hit
				local Rounds = {
					X = math.round(MouseHit.X/3),
					Y = math.round(MouseHit.Y/3),
					Z = math.round(MouseHit.Z/3)
				}
	
				for i, v in pairs(game:GetService("Players").LocalPlayer.Character:GetChildren()) do
					if (v:IsA("Accessory")) and v:FindFirstChild("Handle") and v:FindFirstChild("Handle"):FindFirstChild("Back") then
						game:GetService("ReplicatedStorage").rbxts_include.node_modules["@rbxts"].net.out._NetManaged.PlaceBlock:InvokeServer({
							["position"] = Vector3.new(Rounds.X, Rounds.Y, Rounds.Z),
							["blockType"] = v.Name,
						})
					end
				end
			end
		end
	end
	local BlockExploit = {["Enabled"] = false}
	BlockExploit = GuiLibrary["ObjectsThatCanBeSaved"]["UtilityWindow"]["Api"].CreateOptionsButton({
		["Name"] = "BlockExploit",
		["HoverText"] = "Allows You To Place Blocks Anywhere",
		["Function"] = function(callback)
			if callback then
				PlaceAnywhere = true
				UserInputService.InputBegan:Connect(onInputBegan)
				createwarning("BlockExploit", "You Can Now Place Blocks Anywhere", 2)

			else
				PlaceAnywhere = false
				UserInputService.InputBegan:Connect(onInputBegan)
			end
		end
	})
end)

        --Blue Ambience
	local Ambience12 = {["Enabled"] = false}
	Ambience12 = GuiLibrary["ObjectsThatCanBeSaved"]["RenderWindow"]["Api"].CreateOptionsButton({
		["Name"] = "BlueAmbience",
		["Function"] = function(callback)
			if callback then
				game.Lighting.ColorCorrection.TintColor = Color3.fromRGB(0, 247, 255)
				game.Lighting.Ambient = Color3.fromRGB(255, 60, 255)
				game.Lighting.OutdoorAmbient = Color3.fromRGB(255, 60, 255)
			else
				game.Lighting.ColorCorrection.TintColor = Color3.fromRGB(255, 255, 255)
				game.Lighting.Ambient = Color3.fromRGB(255, 255, 255)
				game.Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
			end
		end
	})



	


        -- Lunar Sunset
	local skybox113 = {["Enabled"] = false}
	skybox113 = GuiLibrary["ObjectsThatCanBeSaved"]["RenderWindow"]["Api"].CreateOptionsButton({
		["Name"] = "LunarSunsetSkybox",
		["Function"] = function(callback)
			if callback then
				local sky3 = Instance.new("Sky",game.Lighting)
				sky3.MoonAngularSize = "11"
				sky3.MoonTextureId = "rbxasset://sky/moon.jpg"
				sky3.SkyboxBk = "rbxassetid://187713366"
				sky3.SkyboxDn = "rbxassetid://187712428"
				sky3.SkyboxFt = "rbxassetid://187712836"
				sky3.SkyboxLf = "rbxassetid://187713755"
				sky3.SkyboxRt = "rbxassetid://187714525"
				sky3.SkyboxUp = "rbxassetid://187712111"
				sky3.SunTextureId = "rbxasset://sky/sun.jpg"
				sky3.SunAngularSize = "21"
				game.Lighting.Brightness = "0"

			else
				local sky4 = Instance.new("Sky",game.Lighting)
				sky4.MoonAngularSize = "11"
				sky4.MoonTextureId = "rbxasset://sky/moon.jpg"
				sky4.SkyboxBk = "rbxassetid://7018684000"
				sky4.SkyboxDn = "rbxassetid://6334928194"
				sky4.SkyboxFt = "rbxassetid://7018684000"
				sky4.SkyboxLf = "rbxassetid://7018684000"
				sky4.SkyboxRt = "rbxassetid://7018684000"
				sky4.SkyboxUp = "rbxassetid://7018689553"
				sky4.SunTextureId = "rbxasset://sky/sun.jpg"
				sky4.SunAngularSize = "21"
				game.Lighting.Brightness = "2"
			end
		end
	})
	

        --Night
	local Night = {["Enabled"] = false}
    Night = GuiLibrary["ObjectsThatCanBeSaved"]["RenderWindow"]["Api"].CreateOptionsButton({
        ["Name"] = "TimeChanger",
        ["Function"] = function(callback)
            if callback then
				RunLoops:BindToHeartbeat("TimeChanger", 1, function()
					game:GetService("Lighting").TimeOfDay = (TimeChangerVal..":00:00")
				end)
            else
				RunLoops:UnbindFromHeartbeat("TimeChanger")
                game:GetService("Lighting").TimeOfDay = "13:00:00"
            end
        end
    })

	TimeChangerVal = Night.CreateSlider({
		["Name"] = "Time",
		["Min"] = 1,
		["Max"] = 13,
		["Default"] = 1,
		["Function"] = function(val)
			TimeChangerVal = val
		 end
	})
local MageAnimation = COB("Render", {
	["Name"] = "MageAnimation",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.MageAnimation = true
				local Animate = game:GetService("Players").LocalPlayer.Character.Animate
				Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=707742142"
				Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=707855907"
				Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=707897309"
				Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=707861613"
				Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=707853694"
				Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=707826056"
				Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=707829716"
			end)
		else
			pcall(function()
				ScriptSettings.MageAnimation = false
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "Makes you get mage animation (FE)"
})
local SpamSwordSwing = COB("Combat", {
	["Name"]  = "SpamSwordSwing",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.SpamSwordSwing = true
				while task.wait(0.01) do
					if not ScriptSettings.SpamSwordSwing == true then return end
					local sc = require(game:GetService("Players").LocalPlayer.PlayerScripts.TS.controllers.global.combat.sword["sword-controller"]).SwordController
					sc:swingSwordAtMouse()
				end
			end)
		else
			pcall(function()
				ScriptSettings.SpamSwordSwing = false
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "Spam swings your sword"
})
local NoClickDelay = COB("Combat", {
	["Name"]  = "NoClickDelay",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.NoClickDelay = true
				local SwordCont = require(game:GetService("Players").LocalPlayer.PlayerScripts.TS.controllers.global.combat.sword["sword-controller"]).SwordController
				local ItemTableFunc = require(game:GetService("ReplicatedStorage").TS.item["item-meta"]).getItemMeta
				local ItemTable = debug.getupvalue(ItemTableFunc, 1)
				for i2,v2 in pairs(ItemTable) do
					if type(v2) == "table" and rawget(v2, "sword") then
						v2.sword.attackSpeed = 0.0000000000000000000000000000000000001
					end
					SwordCont.isClickingTooFast = function() return false end
				end
			end)
		else
			pcall(function()
				ScriptSettings.NoClickDelay = false
				local SwordCont = require(game:GetService("Players").LocalPlayer.PlayerScripts.TS.controllers.global.combat.sword["sword-controller"]).SwordController
				local ItemTableFunc = require(game:GetService("ReplicatedStorage").TS.item["item-meta"]).getItemMeta
				local ItemTable = debug.getupvalue(ItemTableFunc, 1)
				for i2,v2 in pairs(ItemTable) do
					if type(v2) == "table" and rawget(v2, "sword") then
						v2.sword.attackSpeed = 0.24
					end
					SwordCont.isClickingTooFast = function() return false end
				end
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "Spam swings your sword"
})
local AnimDisabler = COB("Utility", {
	["Name"]  = "AnimDisabler",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.AnimDisabler = true
				game:GetService("Players").LocalPlayer.Character.Animate.Disabled = true
				while task.wait(1.5) do
					if not ScriptSettings.AnimDisabler == true then return end
					repeat task.wait() until game:GetService("Players").LocalPlayer.Character.Animate
					game:GetService("Players").LocalPlayer.Character.Animate.Disabled = true
				end
			end)
		else
			pcall(function()
				ScriptSettings.AnimDisabler = false
				game:GetService("Players").LocalPlayer.Character.Animate.Disabled = false
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "Disables your animation"
})
local CollectAllDrops = COB("Utility", {
	["Name"]  = "CollectAllDrops",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.CollectAllDrops = true
				while task.wait() do
					if not ScriptSettings.CollectAllDrops == true then return end
					for i,v in pairs(game:GetService("Workspace").ItemDrops:GetChildren()) do
						game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
						game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(0,2,0)
					end
				end
			end)
		else
			pcall(function()
				ScriptSettings.CollectAllDrops = false
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "Collect drops"
})
local Shaders = COB("Render", {
	["Name"] = "Shaders",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.Shaders = true
				game:GetService("Lighting"):ClearAllChildren()
				local Bloom = Instance.new("BloomEffect")
				Bloom.Intensity = 0.1
				Bloom.Threshold = 0
				Bloom.Size = 100

				local Tropic = Instance.new("Sky")
				Tropic.Name = "Tropic"
				Tropic.SkyboxUp = "http://www.roblox.com/asset/?id=169210149"
				Tropic.SkyboxLf = "http://www.roblox.com/asset/?id=169210133"
				Tropic.SkyboxBk = "http://www.roblox.com/asset/?id=169210090"
				Tropic.SkyboxFt = "http://www.roblox.com/asset/?id=169210121"
				Tropic.StarCount = 100
				Tropic.SkyboxDn = "http://www.roblox.com/asset/?id=169210108"
				Tropic.SkyboxRt = "http://www.roblox.com/asset/?id=169210143"
				Tropic.Parent = Bloom

				local Sky = Instance.new("Sky")
				Sky.SkyboxUp = "http://www.roblox.com/asset/?id=196263782"
				Sky.SkyboxLf = "http://www.roblox.com/asset/?id=196263721"
				Sky.SkyboxBk = "http://www.roblox.com/asset/?id=196263721"
				Sky.SkyboxFt = "http://www.roblox.com/asset/?id=196263721"
				Sky.CelestialBodiesShown = false
				Sky.SkyboxDn = "http://www.roblox.com/asset/?id=196263643"
				Sky.SkyboxRt = "http://www.roblox.com/asset/?id=196263721"
				Sky.Parent = Bloom

				Bloom.Parent = game:GetService("Lighting")

				local Bloom = Instance.new("BloomEffect")
				Bloom.Enabled = false
				Bloom.Intensity = 0.35
				Bloom.Threshold = 0.2
				Bloom.Size = 56

				local Tropic = Instance.new("Sky")
				Tropic.Name = "Tropic"
				Tropic.SkyboxUp = "http://www.roblox.com/asset/?id=169210149"
				Tropic.SkyboxLf = "http://www.roblox.com/asset/?id=169210133"
				Tropic.SkyboxBk = "http://www.roblox.com/asset/?id=169210090"
				Tropic.SkyboxFt = "http://www.roblox.com/asset/?id=169210121"
				Tropic.StarCount = 100
				Tropic.SkyboxDn = "http://www.roblox.com/asset/?id=169210108"
				Tropic.SkyboxRt = "http://www.roblox.com/asset/?id=169210143"
				Tropic.Parent = Bloom

				local Sky = Instance.new("Sky")
				Sky.SkyboxUp = "http://www.roblox.com/asset/?id=196263782"
				Sky.SkyboxLf = "http://www.roblox.com/asset/?id=196263721"
				Sky.SkyboxBk = "http://www.roblox.com/asset/?id=196263721"
				Sky.SkyboxFt = "http://www.roblox.com/asset/?id=196263721"
				Sky.CelestialBodiesShown = false
				Sky.SkyboxDn = "http://www.roblox.com/asset/?id=196263643"
				Sky.SkyboxRt = "http://www.roblox.com/asset/?id=196263721"
				Sky.Parent = Bloom

				Bloom.Parent = game:GetService("Lighting")
				local Blur = Instance.new("BlurEffect")
				Blur.Size = 2

				Blur.Parent = game:GetService("Lighting")
				local Efecto = Instance.new("BlurEffect")
				Efecto.Name = "Efecto"
				Efecto.Enabled = false
				Efecto.Size = 2

				Efecto.Parent = game:GetService("Lighting")
				local Inaritaisha = Instance.new("ColorCorrectionEffect")
				Inaritaisha.Name = "Inari taisha"
				Inaritaisha.Saturation = 0.05
				Inaritaisha.TintColor = Color3.fromRGB(255, 224, 219)

				Inaritaisha.Parent = game:GetService("Lighting")
				local Normal = Instance.new("ColorCorrectionEffect")
				Normal.Name = "Normal"
				Normal.Enabled = false
				Normal.Saturation = -0.2
				Normal.TintColor = Color3.fromRGB(255, 232, 215)

				Normal.Parent = game:GetService("Lighting")
				local SunRays = Instance.new("SunRaysEffect")
				SunRays.Intensity = 0.05

				SunRays.Parent = game:GetService("Lighting")
				local Sunset = Instance.new("Sky")
				Sunset.Name = "Sunset"
				Sunset.SkyboxUp = "rbxassetid://323493360"
				Sunset.SkyboxLf = "rbxassetid://323494252"
				Sunset.SkyboxBk = "rbxassetid://323494035"
				Sunset.SkyboxFt = "rbxassetid://323494130"
				Sunset.SkyboxDn = "rbxassetid://323494368"
				Sunset.SunAngularSize = 14
				Sunset.SkyboxRt = "rbxassetid://323494067"

				Sunset.Parent = game:GetService("Lighting")
				local Takayama = Instance.new("ColorCorrectionEffect")
				Takayama.Name = "Takayama"
				Takayama.Enabled = false
				Takayama.Saturation = -0.3
				Takayama.Contrast = 0.1
				Takayama.TintColor = Color3.fromRGB(235, 214, 204)

				Takayama.Parent = game:GetService("Lighting")
				local L = game:GetService("Lighting")
				L.Brightness = 2.14
				L.ColorShift_Bottom = Color3.fromRGB(11, 0, 20)
				L.ColorShift_Top = Color3.fromRGB(240, 127, 14)
				L.OutdoorAmbient = Color3.fromRGB(34, 0, 49)
				L.ClockTime = 6.7
				L.FogColor = Color3.fromRGB(94, 76, 106)
				L.FogEnd = 1000
				L.FogStart = 0
				L.ExposureCompensation = 0.24
				L.ShadowSoftness = 0
				L.Ambient = Color3.fromRGB(59, 33, 27)

				local Bloom = Instance.new("BloomEffect")
				Bloom.Intensity = 0.1
				Bloom.Threshold = 0
				Bloom.Size = 100

				local Tropic = Instance.new("Sky")
				Tropic.Name = "Tropic"
				Tropic.SkyboxUp = "http://www.roblox.com/asset/?id=169210149"
				Tropic.SkyboxLf = "http://www.roblox.com/asset/?id=169210133"
				Tropic.SkyboxBk = "http://www.roblox.com/asset/?id=169210090"
				Tropic.SkyboxFt = "http://www.roblox.com/asset/?id=169210121"
				Tropic.StarCount = 100
				Tropic.SkyboxDn = "http://www.roblox.com/asset/?id=169210108"
				Tropic.SkyboxRt = "http://www.roblox.com/asset/?id=169210143"
				Tropic.Parent = Bloom

				local Sky = Instance.new("Sky")
				Sky.SkyboxUp = "http://www.roblox.com/asset/?id=196263782"
				Sky.SkyboxLf = "http://www.roblox.com/asset/?id=196263721"
				Sky.SkyboxBk = "http://www.roblox.com/asset/?id=196263721"
				Sky.SkyboxFt = "http://www.roblox.com/asset/?id=196263721"
				Sky.CelestialBodiesShown = false
				Sky.SkyboxDn = "http://www.roblox.com/asset/?id=196263643"
				Sky.SkyboxRt = "http://www.roblox.com/asset/?id=196263721"
				Sky.Parent = Bloom

				Bloom.Parent = game:GetService("Lighting")

				local Bloom = Instance.new("BloomEffect")
				Bloom.Enabled = false
				Bloom.Intensity = 0.35
				Bloom.Threshold = 0.2
				Bloom.Size = 56

				local Tropic = Instance.new("Sky")
				Tropic.Name = "Tropic"
				Tropic.SkyboxUp = "http://www.roblox.com/asset/?id=169210149"
				Tropic.SkyboxLf = "http://www.roblox.com/asset/?id=169210133"
				Tropic.SkyboxBk = "http://www.roblox.com/asset/?id=169210090"
				Tropic.SkyboxFt = "http://www.roblox.com/asset/?id=169210121"
				Tropic.StarCount = 100
				Tropic.SkyboxDn = "http://www.roblox.com/asset/?id=169210108"
				Tropic.SkyboxRt = "http://www.roblox.com/asset/?id=169210143"
				Tropic.Parent = Bloom

				local Sky = Instance.new("Sky")
				Sky.SkyboxUp = "http://www.roblox.com/asset/?id=196263782"
				Sky.SkyboxLf = "http://www.roblox.com/asset/?id=196263721"
				Sky.SkyboxBk = "http://www.roblox.com/asset/?id=196263721"
				Sky.SkyboxFt = "http://www.roblox.com/asset/?id=196263721"
				Sky.CelestialBodiesShown = false
				Sky.SkyboxDn = "http://www.roblox.com/asset/?id=196263643"
				Sky.SkyboxRt = "http://www.roblox.com/asset/?id=196263721"
				Sky.Parent = Bloom

				Bloom.Parent = game:GetService("Lighting")
				local Blur = Instance.new("BlurEffect")
				Blur.Size = 2

				Blur.Parent = game:GetService("Lighting")
				local Efecto = Instance.new("BlurEffect")
				Efecto.Name = "Efecto"
				Efecto.Enabled = false
				Efecto.Size = 4

				Efecto.Parent = game:GetService("Lighting")
				local Inaritaisha = Instance.new("ColorCorrectionEffect")
				Inaritaisha.Name = "Inari taisha"
				Inaritaisha.Saturation = 0.05
				Inaritaisha.TintColor = Color3.fromRGB(255, 224, 219)

				Inaritaisha.Parent = game:GetService("Lighting")
				local Normal = Instance.new("ColorCorrectionEffect")
				Normal.Name = "Normal"
				Normal.Enabled = false
				Normal.Saturation = -0.2
				Normal.TintColor = Color3.fromRGB(255, 232, 215)

				Normal.Parent = game:GetService("Lighting")
				local SunRays = Instance.new("SunRaysEffect")
				SunRays.Intensity = 0.05

				SunRays.Parent = game:GetService("Lighting")
				local Sunset = Instance.new("Sky")
				Sunset.Name = "Sunset"
				Sunset.SkyboxUp = "rbxassetid://323493360"
				Sunset.SkyboxLf = "rbxassetid://323494252"
				Sunset.SkyboxBk = "rbxassetid://323494035"
				Sunset.SkyboxFt = "rbxassetid://323494130"
				Sunset.SkyboxDn = "rbxassetid://323494368"
				Sunset.SunAngularSize = 14
				Sunset.SkyboxRt = "rbxassetid://323494067"

				Sunset.Parent = game:GetService("Lighting")
				local Takayama = Instance.new("ColorCorrectionEffect")
				Takayama.Name = "Takayama"
				Takayama.Enabled = false
				Takayama.Saturation = -0.3
				Takayama.Contrast = 0.1
				Takayama.TintColor = Color3.fromRGB(235, 214, 204)

				Takayama.Parent = game:GetService("Lighting")
				local L = game:GetService("Lighting")
				L.Brightness = 2.3
				L.ColorShift_Bottom = Color3.fromRGB(11, 0, 20)
				L.ColorShift_Top = Color3.fromRGB(240, 127, 14)
				L.OutdoorAmbient = Color3.fromRGB(34, 0, 49)
				L.TimeOfDay = "07:30:00"
				L.FogColor = Color3.fromRGB(94, 76, 106)
				L.FogEnd = 300
				L.FogStart = 0
				L.ExposureCompensation = 0.24
				L.ShadowSoftness = 0
				L.Ambient = Color3.fromRGB(59, 33, 27)
			end)
		else
			pcall(function()
				ScriptSettings.Shaders = false
				infonotify("Shaders", "Unable to revert changes", 5)
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "Cool shader"
})
local HostCrasher = COB("Utility", {
	["Name"] = "HostCrasher",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.HostCrasher = true
				for i,plr in pairs(game:GetService("Players"):GetChildren()) do
                    local args = {
                        [1] = "",
                        [2] = {
                            [1] = {
                                ["userId"] = plr.UserId,
                                ["name"] = plr.Name,
                                ["displayName"] = plr.DisplayName
                            }
                        }
                    }
                    game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged:FindFirstChild("CustomMatches:CohostPlayer"):FireServer(unpack(args))
				end
				while task.wait() do
				    if not ScriptSettings.HostCrasher == true then return end
				    for i,plr in pairs(game:GetService("Players"):GetChildren()) do
                        local args = {
                            [1] = "",
                            [2] = {
                                [1] = {
                                    ["userId"] = plr.UserId,
                                    ["name"] = plr.Name,
                                    ["displayName"] = plr.DisplayName
                                },
                                [2] = math.random(1,999999999)
                            }
                        }
                        game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged:FindFirstChild("CustomMatches:SetPlayerMaxHealth"):FireServer(unpack(args))
				    end
				end
			end)
		else
			pcall(function()
				ScriptSettings.HostCrasher = false
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "Requires you to be host to let it work"
})
local Crosshair = COB("Render", {
	["Name"] = "Crosshair",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.Crosshair = true
				local mouse = game:GetService("Players").LocalPlayer:GetMouse()
				mouse.Icon = "rbxassetid://9943168532"
				mouse:GetPropertyChangedSignal("Icon"):Connect(function()
				    if not ScriptSettings.Crosshair == true then return end
				    mouse.Icon = "rbxassetid://9943168532"
				end)
			end)
		else
			pcall(function()
				ScriptSettings.Crosshair = false
				local mouse = game:GetService("Players").LocalPlayer:GetMouse()
				mouse.Icon = ""
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "Custom crosshair"
})
local Reinject = COB("Utility", {
	["Name"] = "Reinject",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.Reinject = true
				infonotify("Reinject", "Please disable reinject to use.", 5)
			end)
		else
			pcall(function()
				ScriptSettings.Reinject = false
				GuiLibrary["SelfDestruct"]()
				if shared.DogV4Private_AutoExec then shared.Restart_Vape() else infonotify("Reinject", "You do not have Dog V4 Reinject supported.", "5") end
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "Reinjects vape"
})
local Night = COB("Render", {
	["Name"] = "Night",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.Night = true
				game:GetService("Lighting").TimeOfDay = "00:00:00"
				while task.wait(5) do
					if not ScriptSettings.Night == true then return end
					game:GetService("Lighting").TimeOfDay = "00:00:00"
				end
			end)
		else
			pcall(function()
				ScriptSettings.Night = false
				game:GetService("Lighting").TimeOfDay = "13:00:00"
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "Cool night render"
})
local ChatCrasher = COB("Utility", {
	["Name"] = "ChatCrasher",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.ChatCrasher = true
				while task.wait() do
					if not ScriptSettings.ChatCrasher == true then return end
					game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼", "All")
				end
			end)
		else
			pcall(function()
				ScriptSettings.ChatCrasher = false
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "cool"
})
local AntiAFK = COB("Render", {
	["Name"] = "AntiAFK",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.AntiAFK = true
				local cons = getconnections or get_signal_cons
				if cons then
					for i,v in pairs(cons(game:GetService("Players").LocalPlayer.Idled)) do
						if ScriptSettings.AntiAFK == true then
							v:Disable()
							v:Disconnect()
						end
					end
				end
				assert(firesignal, "Asserted FireSignal")
				local uis = game:GetService("UserInputService")
				local runs = game:GetService("RUnService")
				uis.WindowFocusReleased:Connect(function()
					if ScriptSettings.AntiAFK == true then
						runs.Stepped:Wait()
						pcall(firesignal, uis.WindowFocused)
					end
				end)
			end)
		else
			pcall(function()
				ScriptSettings.AntiAFK = false
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "No more AFK kicks, wow, another untoggable module i made toggable"
})
local CustomAntivoid = COB("Utility", {
	["Name"] = "CustomAntivoid",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.CustomAntivoid = true
				--repeat task.wait(0.3) until getstate() == 1
				local part = Instance.new("Part")
				part.Name = "AVOID_PART"
				part.Anchored = true
				part.Color = Color3.fromRGB(255,65,65)
				part.Size = Vector3.new(5000,3,5000)
				part.Parent = game:GetService("Workspace")
				part.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame - Vector3.new(0,20,0)
				ScriptSettings.CustomAntivoid_Part = part
				part.Touched:Connect(function(v)
					if v.Parent:FindFirstChild("Humanoid") and v.Parent.Parent.Name == game:GetService("Players").LocalPlayer.Name and not v.Parent:FindFirstChild("Humanoid").Health == 0 then
						game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
						task.wait(0.12)
						game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
						task.wait(0.12)
						game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
						task.wait(0.12)
						game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
						--[[
							local tptimes = 0
							repeat
								task.wait()
								tptimes = tptimes + 1
								game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame / 2
							until tptimes = 10
						]]--
					end
				end)
			end)
		else
			pcall(function()
				ScriptSettings.CustomAntivoid = false
				ScriptSettings.CustomAntivoid_Part:Destroy()
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "custom anti void (broken on beach map)"
})
local RagdollDisabler = COB("Utility", {
	["Name"]  = "RagdollDisabler",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.RagdollDisabler = true
				while task.wait(0.1) do
					if not ScriptSettings.RagdollDisabler == true then return end
					game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Ragdoll)
					task.wait(0.085)
					game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Running)
				end
			end)
		else
			pcall(function()
				ScriptSettings.RagdollDisabler = false
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "Makes you ragdoll to bypass anticheat"
})
local LandmindeAura = COB("Blatant", {
	["Name"]  = "LandmindeAura",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.LandmindeAura = true
				while task.wait(0.15) do
					if not ScriptSettings.LandmindeAura == true then return end
					for i,v in pairs(game:GetService("Players"):GetChildren()) do
						if not v.Name == game:GetService("Players").LocalPlayer.Name then
							local mag = (v.Character:FindFirstChild("HumanoidRootPart").Position - game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Position).magnitude
							if mag > 11 then
								if not v.Team.BrickColor == game:GetService("Players").LocalPlayer.Team.BrickColor then
									if not v.Team.Name == game:GetService("Players").LocalPlayer.Team.Name then
										game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged["landmineremote"]:FireServer({
											["invisibleLandmine"] = v.Character:FindFirstChild("Head")
										})
									end
								end
							end
						end
					end
				end
			end)
		else
			pcall(function()
				ScriptSettings.LandmindeAura = false
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "(Actually) a dumb aura i made"
})
local BiMode_Blur 
local BiMode = COB("Render", {
	["Name"]  = "BiMode",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.BiMode = true
				game:GetService("Lighting").Ambient = Color3.fromRGB(130, 12, 110)
				game:GetService("Lighting").OutdoorAmbient = Color3.fromRGB(130, 12, 110)
				game:GetService("Lighting").ColorShift_Bottom = Color3.fromRGB(130, 12, 110)
				game:GetService("Lighting").ColorShift_Top = Color3.fromRGB(130, 12, 110)
				game:GetService("Lighting").TimeOfDay = "03:00:00"
				game:GetService("Lighting").FogColor = Color3.fromRGB(130, 12, 110)
				game:GetService("Lighting").FogStart = 500
				game:GetService("Lighting").FogEnd = 100000
				game:GetService("Lighting").ExposureCompensation = 1
				BiMode_Blur = Instance.new("Blur")
				local blurx = BiMode_Blur
				blurx.Size = 4
				blurx.Name = game:GetService("HttpService"):GenerateGUID(true)
			end)
		else
			pcall(function()
				ScriptSettings.BiMode = false
				game:GetService("Lighting").Ambient = Color3.fromRGB(165, 165, 165)
				game:GetService("Lighting").OutdoorAmbient = Color3.fromRGB(104, 104, 104)
				game:GetService("Lighting").ColorShift_Bottom = Color3.fromRGB(146, 190, 255)
				game:GetService("Lighting").ColorShift_Top = Color3.fromRGB(228, 249, 255)
				game:GetService("Lighting").TimeOfDay = "13:00:00"
				game:GetService("Lighting").FogColor = Color3.fromRGB(255, 255, 255)
				game:GetService("Lighting").FogStart = 0
				game:GetService("Lighting").FogEnd = 100000
				game:GetService("Lighting").ExposureCompensation = 0
				if BiMode_Blur then BiMode_Blur:Destroy() end
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "ok"
})
local SlowAutoWin = COB("Utility", {
	["Name"]  = "SlowAutoWin",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.SlowAutoWin = true
				local char = game:GetService("Players").LocalPlayer.Character
				char:FindFirstChild("HumanoidRootPart").CFrame = char:FindFirstChild("HumanoidRootPart").CFrame + Vector3.new(0,99,0)
				char:FindFirstChild("Head").Anchored = true
				char:FindFirstChild("UpperTorso").Anchored = true
				char:FindFirstChild("UpperTorso").Anchored = true
				char:FindFirstChild("HumanoidRootPart"):Destroy()
			end)
		else
			pcall(function()
				ScriptSettings.SlowAutoWin = false
				infonotify("SlowAutoWin", "Unable to revert changes", "5")
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "advanced hrp destroyer"
})
local InviteCrash = COB("Utility", {
	["Name"] = "InviteCrash",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.InviteCrash = true
				while task.wait() do
					if not ScriptSettings.InviteCrash == true then return end
					for i,v in pairs(game:GetService("Players"):GetChildren()) do
						if not v.Name == game:GetService("Players").LocalPlayer.Name then
							game:GetService("ReplicatedStorage")["events-@easy-games/lobby:shared/event/lobby-events@getEvents.Events"].inviteToParty:FireServer({["player"] = game:GetService("Players")[v.Name],})
						end
					end
				end
			end)
		else
			pcall(function()
				ScriptSettings.InviteCrash = false
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "Spam invites other players"
})
