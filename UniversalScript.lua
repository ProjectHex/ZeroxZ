_G.CustomTheme = {
	Tab_Color = Color3.fromRGB(44, 44, 44),
    Tab_Text_Color = Color3.fromRGB(255, 255, 255),
    Description_Color = Color3.fromRGB(44, 44, 44),
    Description_Text_Color = Color3.fromRGB(255, 255, 255),
    Container_Color = Color3.fromRGB(44, 44, 44),
    Container_Text_Color = Color3.fromRGB(255, 255, 255),
    Button_Text_Color = Color3.fromRGB(255, 255, 255),
    Toggle_Box_Color = Color3.fromRGB(59, 59, 59),
    Toggle_Inner_Color = Color3.fromRGB(94, 255, 180),
    Toggle_Text_Color = Color3.fromRGB(255, 255, 255),
    Toggle_Border_Color = Color3.fromRGB(44, 44, 44),
    Slider_Bar_Color = Color3.fromRGB(59, 59, 59),
    Slider_Inner_Color = Color3.fromRGB(94, 255, 180),
    Slider_Text_Color = Color3.fromRGB(255, 255, 255),
	Slider_Border_Color = Color3.fromRGB(44, 44, 44),
    Dropdown_Text_Color = Color3.fromRGB(255, 255, 255),
    Dropdown_Option_BorderSize = 1,
    Dropdown_Option_BorderColor = Color3.fromRGB(44, 44, 44),
    Dropdown_Option_Color = Color3.fromRGB(59, 59, 59),
    Dropdown_Option_Text_Color = Color3.fromRGB(255, 255, 255)
}
repeat wait() 
	until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:findFirstChild("Head") and game.Players.LocalPlayer.Character:findFirstChild("Humanoid") 
local mouse = game.Players.LocalPlayer:GetMouse() 
repeat wait() until mouse
local plr = game.Players.LocalPlayer 
local torso = plr.Character.Head 
local flying = false
local deb = true 
local ctrl = {f = 0, b = 0, l = 0, r = 0} 
local lastctrl = {f = 0, b = 0, l = 0, r = 0} 
local maxspeed = 50 
local speed = 0 
flying = false



function Fly() 
local bg = Instance.new("BodyGyro", torso) 
bg.P = 9e4 
bg.maxTorque = Vector3.new(9e9, 9e9, 9e9) 
bg.cframe = torso.CFrame 
local bv = Instance.new("BodyVelocity", torso) 
bv.velocity = Vector3.new(0,0.1,0) 
bv.maxForce = Vector3.new(9e9, 9e9, 9e9) 
repeat wait() 
plr.Character.Humanoid.PlatformStand = true 
if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then 
speed = speed+.5+(speed/maxspeed) 
if speed > maxspeed then 
speed = maxspeed 
end 
elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then 
speed = speed-1 
if speed < 0 then 
speed = 0 
end 
end 
if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then 
bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed 
lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r} 
elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then 
bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed 
else 
bv.velocity = Vector3.new(0,0.1,0) 
end 
bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0) 
until not flying 
ctrl = {f = 0, b = 0, l = 0, r = 0} 
lastctrl = {f = 0, b = 0, l = 0, r = 0} 
speed = 0 
bg:Destroy() 
bv:Destroy() 
plr.Character.Humanoid.PlatformStand = false 
end 
mouse.KeyDown:connect(function(key) 
if key:lower() == "w" then 
ctrl.f = 1 
elseif key:lower() == "s" then 
ctrl.b = -1 
elseif key:lower() == "a" then 
ctrl.l = -1 
elseif key:lower() == "d" then 
ctrl.r = 1 
end 
end) 
mouse.KeyUp:connect(function(key) 
if key:lower() == "w" then 
ctrl.f = 0 
elseif key:lower() == "s" then 
ctrl.b = 0 
elseif key:lower() == "a" then 
ctrl.l = 0 
elseif key:lower() == "d" then 
ctrl.r = 0 
end 
end)





function CreateESPPart(BodyPart,color)
local ESPPartparent = BodyPart
local Box = Instance.new("BoxHandleAdornment")
Box.Size = BodyPart.Size + Vector3.new(0.1, 0.1, 0.1)
Box.Name = "ESPPart"
Box.Adornee = ESPPartparent
Box.Color3 = color
Box.AlwaysOnTop = true
Box.ZIndex = 5
Box.Transparency = 0.8
Box.Parent = BodyPart
end

local zombs = workspace.Baddies:getChildren()
for i=1,#zombs do
local bodypart = zombs[i]:getChildren()
for i=1,#bodypart do
if bodypart[i].ClassName == "Part" then
CreateESPPart(bodypart[i], Color3.fromRGB(0,255,0))
end
end
end



function onKeyPress(inputObject, gameProcessedEvent)
	if inputObject.KeyCode == Enum.KeyCode.O then
		local m = require(game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Weapon1"))
m.StoredAmmo = math.huge
m.MagSize = math.huge
m.Semi = false
m.Damage = {Max = 1500000, Min = 10000}
m.Spread = {Min = 0, Max = 0}
m.ViewKick = {
Pitch = {Min = 0, Max = 0},
Yaw = {Min = 0, Max = 0}
}
m.BulletPenetration = 1500
m.FireTime = 0
	end
end
 
game:GetService("UserInputService").InputBegan:connect(onKeyPress)

function onKeyPress(inputObject, gameProcessedEvent)
	if inputObject.KeyCode == Enum.KeyCode.I then
		for _,v in pairs(debug.getregistry()) do
   if typeof(v) == "table" then
       if v.Ammo then
           v.Ammo = math.huge
       end
   end
		   end

	end
end



local Library = loadstring(game:HttpGet("https://pastebin.com/raw/2xDTKdpV", true))()

local Universal = Library:CreateTab("Universal", "This is where you can modify your charater'stuffs")

Universal:CreateSlider("Speed", 0, 1000, function(arg) --the (arg) is the sliders value
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = arg
end)
Universal:CreateSlider("JumpPower", 0, 1000, function(arg) --the (arg) is the sliders value
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = arg
end)
Universal:CreateToggle("Fly", function(arg) --the (arg) is if the checkbox is toggled or not
    if arg then
    flying = true 
    Fly() 

    else
     if flying then flying = false end
    end
end)

Universal:CreateSlider("Fly Speed", 0, 500, function(arg) --the (arg) is the sliders value
    maxspeed = arg
end)
Universal:CreateButton("NoClip (E To Toggle) ", function() --you dont need "arg" for a button
    noclip = false
    game:GetService('RunService').Stepped:connect(function()
    if noclip then
    game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
    end
    end)
    plr = game.Players.LocalPlayer
    mouse = plr:GetMouse()
    mouse.KeyDown:connect(function(key)

    if key == "e" then
    noclip = not noclip
    game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
    end
    end)

end)
Universal:CreateButton("Respawn (No Spam)", function() --you dont need "arg" for a button
 
local saved = groot.Position
       
local ch = game.Players.LocalPlayer.Character
local prt=Instance.new("Model", workspace)
local z1 =  Instance.new("Part", prt)
z1.Name="Torso"
z1.CanCollide = false
z1.Anchored = true
local z2  =Instance.new("Part", prt)
z2.Name="Head"
z2.Anchored = true
z2.CanCollide = false
local z3 =Instance.new("Humanoid", prt)
z3.Name="Humanoid"
z1.Position = Vector3.new(0,9999,0)
z2.Position = Vector3.new(0,9991,0)
 game.Players.LocalPlayer.Character=prt
wait(5)
game.Players.LocalPlayer.Character=ch

end)

local Combat = Library:CreateTab("Combat", "Combat Stuffs")
Combat:CreateButton("Zombies ESP", function() --you dont need "arg" for a button
 workspace.Baddies.ChildAdded:Connect(function(zomb)
    wait(1)
    local bodypart = zomb:getChildren()
    for i=1,#bodypart do
    if bodypart[i].ClassName == "Part" then
    CreateESPPart(bodypart[i], Color3.fromRGB(94, 255, 180))
    end
    end
    end)
end)
Combat:CreateButton("TP Zombiess Head", function() --you dont need "arg" for a button
local pos = 5,0,5

local zomb = workspace.Baddies:GetChildren()
for i=1,#zomb do
    zomb[i].HeadBox.Transparency = 0
    zomb[i].HeadBox.Material = "Neon"
    zomb[i].HeadBox.CanCollide = false
    zomb[i].HeadBox.Anchored = true
    zomb[i].HeadBox.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position+Vector3.new(pos)
end
end)

local Teleports = Library:CreateTab("Teleports", "Teleports Stuffs")

Teleports:CreateButton("Barrier Back 1", function() --you dont need "arg" for a button
    game.Players.LocalPlayer.Character:MoveTo(Vector3.new(38.7996941, 20.2000065, 64.9929962))
end)
Teleports:CreateButton("Barrier Back 2", function() --you dont need "arg" for a button
    game.Players.LocalPlayer.Character:MoveTo(Vector3.new(39.9715347, 20.200016, -32.2160835))
end)
Teleports:CreateButton("Barrier Back 3", function() --you dont need "arg" for a button
    game.Players.LocalPlayer.Character:MoveTo(Vector3.new(75.7908325, 3.20002508, -29.1730213))
end)
Teleports:CreateButton("Barrier Back 4", function() --you dont need "arg" for a button
    game.Players.LocalPlayer.Character:MoveTo(Vector3.new(74.7251892, 20.9555206, 103.646507))
end)
Teleports:CreateButton("Library", function() --you dont need "arg" for a button
    game.Players.LocalPlayer.Character:MoveTo(Vector3.new(-66.9610825, 20.1990089, 2.16642976))
end)
Teleports:CreateButton("Bathroom", function() --you dont need "arg" for a button
    game.Players.LocalPlayer.Character:MoveTo(Vector3.new(63.4641228, 20.2000504, 78.6364136))
end)
Teleports:CreateButton("Lobby", function() --you dont need "arg" for a button
    game.Players.LocalPlayer.Character:MoveTo(Vector3.new(-10.6820145, -494.5, -2.53165269))
end)
Teleports:CreateButton("Backyard", function() --you dont need "arg" for a button
game.Players.LocalPlayer.Character:MoveTo(Vector3.new(8.4164629, 3.20000005, -115.536255))
end)
Teleports:CreateButton("Spawn", function() --you dont need "arg" for a button
game.Players.LocalPlayer.Character:MoveTo(Vector3.new(-16.4724731, 3.20000005, -18.6810131))
end)
Teleports:CreateButton("PowerRoom", function() --you dont need "arg" for a button
game.Players.LocalPlayer.Character:MoveTo(Vector3.new(-3.92677093, 20.1999989, 91.4792633))
end)
Teleports:CreateButton("CenterYard", function() --you dont need "arg" for a button
game.Players.LocalPlayer.Character:MoveTo(Vector3.new(-0.663911641, 3.79999971, 41.9799118))
end)
Teleports:CreateButton("BuildingTop", function() --you dont need "arg" for a button
game.Players.LocalPlayer.Character:MoveTo(Vector3.new(-3.20340729, 47.1415977, 4.63647652))
end)
