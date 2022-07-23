local lp = game.Players.LocalPlayer

local repFirst = game.GetService(game, 'ReplicatedFirst');
local itemSpawn = repFirst.ItemSpawn;

local vector3Metatable = getrawmetatable(Vector3.new());
local oldIndex = rawget(vector3Metatable, '__index');

setreadonly(vector3Metatable, false); do
    vector3Metatable.__index = newcclosure(function(self, idx)
        if(string.lower(idx) == 'magnitude' and getcallingscript() == itemSpawn) then
            return 0;
        end;
        return oldIndex(self, idx);
    end);
end; setreadonly(vector3Metatable, true);

local TPBypass
TPBypass = hookmetamethod(game,"__namecall", newcclosure(function(self, ...)
  local args = {...}
  if tostring(self) == "Returner" and args[1] == "idklolbrah2de"  then
          return "  ___XP DE KEY"
      end
  return TPBypass(self, ...)
end))

local Settings = {
  ItemFarm = false
}


local Flux = loadstring(game:HttpGet"https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/fluxlib.txt")()
local win = Flux:Window("Сбор пасты", "ауе баля пон", Color3.fromRGB(255,218,185), Enum.KeyCode.RightControl)
local tab = win:Tab("Main", "http://www.roblox.com/asset/?id=6023426915")
local ItemTab = win:Tab("Farm","http://www.roblox.com/asset/?id=6023426915")
tab:Line()
tab:Label("Misc")
tab:Line()
tab:Toggle("Godmode", "Poison godmode any stand", false, function(t) -- t can be anything, choose false or true for what is the value in default
game:GetService("ReplicatedStorage").Sounds.Poisoned.Volume = 0
    local Func = game.Players.LocalPlayer.Character.RemoteFunction

getgenv().toggle = t

while getgenv().toggle do wait()
Func:InvokeServer("Poison", {
            Duration = 1, 
            TotalDamage = -99999999
        });
end
end)  
tab:Toggle("Anti-TS","No TS more.",false,function(v) end)
_G.AntiTs = t -- change to true to enable
game:GetService("RunService").RenderStepped:Connect(function()
    pcall(function()
        if _G.AntiTs == false then return end
if game:GetService("Players").LocalPlayer.Character:FindFirstChild("InTimeStop") then
game:GetService("Players").LocalPlayer.Character:FindFirstChild("InTimeStop"):Destroy()
end
end )
end )
tab:Textbox("Aerosmith kill player", "Use Sharpeness and hamon for more profit", true, function(t)
getgenv().KillPerson = true

getgenv().TargetName = t --Short names supported

while getgenv().KillPerson do wait()
pcall( function()
for i,v in pairs(game.Players:GetChildren()) do
if v:IsA("Player") and string.find(v.Name, TargetName) then
local Target = v
firetouchinterest(Target.Character.HumanoidRootPart, game:GetService("Players").LocalPlayer.Character.StandMorph.Propellers.TouchInterest.Parent, 0)
wait()
firetouchinterest(Target.Character.HumanoidRootPart, game:GetService("Players").LocalPlayer.Character.StandMorph.Propellers.TouchInterest.Parent, 1)
end
end
end)
end
end)
tab:Button("InfPilot Range", "", function() -- Description is the text you'll see when you click on the arrow at the right of the button
while wait(1) do pcall(function()
    game:GetService("Workspace").Living.LocalPlayer.Character.StandMorph.IsPiloting.Value = 999999
end)
end
end)
tab:Line()
tab:Label("SBR")
tab:Line()
tab:Slider("WalkSpeed", "Makes your faster.", 0, 500,16,function(s)
getgenv().WalkSpeedValue = s; 
local Player = game:service'Players'.LocalPlayer;
Player.Character.Humanoid:GetPropertyChangedSignal'WalkSpeed':Connect(function()
Player.Character.Humanoid.WalkSpeed = getgenv().WalkSpeedValue;
end)
Player.Character.Humanoid.WalkSpeed = getgenv().WalkSpeedValue;
end)
tab:Slider("JumpPower", "Makes your jump highter.", 0, 500,16,function(s)
getgenv().JumpPowerValue = s; 
local Player = game:service'Players'.LocalPlayer;
Player.Character.Humanoid:GetPropertyChangedSignal'JumpPower':Connect(function()
Player.Character.Humanoid.JumpPower = getgenv().JumpPowerValue;
end)
Player.Character.Humanoid.JumpPower = getgenv().JumpPowerValue;
end)

local Player = game.Players.LocalPlayer
local Mouse = Player:GetMouse()
local UserInputService = game:GetService('UserInputService')
 
local HoldingControl = false
 
Mouse.Button1Down:connect(function()
if HoldingControl then
Player.Character:MoveTo(Mouse.Hit.p)
end
end)
 tab:Button("Click TP tool", "Telepots you at coursor.", function()
mouse = game.Players.LocalPlayer:GetMouse()
tool = Instance.new("Tool")
tool.RequiresHandle = false
tool.Name = "click to TP"
tool.Activated:connect(function()
local pos = mouse.Hit+Vector3.new(0,2.5,0)
pos = CFrame.new(pos.X,pos.Y,pos.Z)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
end)
tool.Parent = game.Players.LocalPlayer.Backpack
end)
 tab:Button("COMPETITIVE SBR", "Show serverlist.", function()
game.Players.LocalPlayer.Character.RemoteEvent:FireServer("EndDialogue", {
	["NPC"] = "[COMPETITIVE] Metal Ball Run", 
	["Option"] = "Option1", 
	["Dialogue"] = "Dialogue2"
})
end)
 tab:Button("CASUAL SBR", "Show serverlist.", function()
    game.Players.LocalPlayer.Character.RemoteEvent:FireServer("EndDialogue", {
	["NPC"] = "Metal Ball Run", 
	["Option"] = "Option1", 
	["Dialogue"] = "Dialogue2"
})
 end)
local tab = win:Tab("Arcade/Sell Functions", "http://www.roblox.com/asset/?id=6023426915")
tab:Line()
tab:Button("Arcade roll", "Using arcade.", function()
    game.Players.LocalPlayer.Character.RemoteEvent:FireServer("EndDialogue", {
	["NPC"] = "Item Machine", 
	["Option"] = "Option1", 
	["Dialogue"] = "Dialogue1"
})
end) 
tab:Button("Sell one handle item", "Sells equiped item.", function()
   game.Players.LocalPlayer.Character.RemoteEvent:FireServer("EndDialogue", {
	["NPC"] = "Merchant", 
	["Option"] = "Option1", 
	["Dialogue"] = "Dialogue5"
})
end)
tab:Button("Sell all handle item", "Sells equiped item.", function()
   game.Players.LocalPlayer.Character.RemoteEvent:FireServer("EndDialogue", {
	["NPC"] = "Merchant", 
	["Option"] = "Option2", 
	["Dialogue"] = "Dialogue5"
})
end)
local tab = win:Tab("Item using", "http://www.roblox.com/asset/?id=6023426915")

 tab:Button("Use Rokakaka", "Using Roka", function ()
 game.Players.LocalPlayer.Character.RemoteEvent:FireServer("EndDialogue", {
	["NPC"] = "Rokakaka", 
	["Option"] = "Option1", 
	["Dialogue"] = "Dialogue2"
})
end)
tab:Button("Use Arrow", "Using Arrow", function ()
game.Players.LocalPlayer.Character.RemoteFunction:InvokeServer("LearnSkill", {
	["Skill"] = "Vitality I", 
	["SkillTreeType"] = "Character"
})

game.Players.LocalPlayer.Character.RemoteFunction:InvokeServer("LearnSkill", {
	["Skill"] = "Vitality II", 
	["SkillTreeType"] = "Character"
})

game.Players.LocalPlayer.Character.RemoteFunction:InvokeServer("LearnSkill", {
	["Skill"] = "Vitality III", 
	["SkillTreeType"] = "Character"
})

game.Players.LocalPlayer.Character.RemoteFunction:InvokeServer("LearnSkill", {
	["Skill"] = "Worthiness I", 
	["SkillTreeType"] = "Character"
})

game.Players.LocalPlayer.Character.RemoteFunction:InvokeServer("LearnSkill", {
	["Skill"] = "Worthiness II", 
	["SkillTreeType"] = "Character"
})

game.Players.LocalPlayer.Character.RemoteEvent:FireServer("EndDialogue", {
	["NPC"] = "Mysterious Arrow", 
	["Option"] = "Option1", 
	["Dialogue"] = "Dialogue2"
})
end)
 tab:Button("Requiem Arrow", "", function()
     game.Players.LocalPlayer.Character.RemoteFunction:InvokeServer("LearnSkill", {
	["Skill"] = "Vitality I", 
	["SkillTreeType"] = "Character"
})
game.Players.LocalPlayer.Character.RemoteFunction:InvokeServer("LearnSkill", {
	["Skill"] = "Vitality II", 
	["SkillTreeType"] = "Character"
})
game.Players.LocalPlayer.Character.RemoteFunction:InvokeServer("LearnSkill", {
	["Skill"] = "Vitality III", 
	["SkillTreeType"] = "Character"
})
game.Players.LocalPlayer.Character.RemoteFunction:InvokeServer("LearnSkill", {
	["Skill"] = "Worthiness I", 
	["SkillTreeType"] = "Character"
})
game.Players.LocalPlayer.Character.RemoteFunction:InvokeServer("LearnSkill", {
	["Skill"] = "Worthiness II", 
	["SkillTreeType"] = "Character"
})
game.Players.LocalPlayer.Character.RemoteFunction:InvokeServer("LearnSkill", {
	["Skill"] = "Worthiness III", 
	["SkillTreeType"] = "Character"
})
game.Players.LocalPlayer.Character.RemoteFunction:InvokeServer("LearnSkill", {
	["Skill"] = "Worthiness IV", 
	["SkillTreeType"] = "Character"
})
game.Players.LocalPlayer.Character.RemoteFunction:InvokeServer("LearnSkill", {
	["Skill"] = "Worthiness V", 
	["SkillTreeType"] = "Character"
})
game.Players.LocalPlayer.Character.RemoteEvent:FireServer("EndDialogue",  
{
	["NPC"] = "Requiem Arrow", 
	["Option"] = "Option1", 
	["Dialogue"] = "Dialogue2"
})


 end)
 tab:Button("Buy requiem arrow", "", function ()
game.Players.LocalPlayer.Character.RemoteEvent:FireServer("EndDialogue", {
	["NPC"] = "Isabelle the Arrowsmith", 
	["Option"] = "Option1", 
	["Dialogue"] = "Dialogue4"
})
end)
local tab = win:Tab("Telepots", "http://www.roblox.com/asset/?id=6023426915")
tab:Textbox("Tp to player(Full name)", "Description", true, function(t) -- true or false to toggle if the text disappears after typing in
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Living[t].HumanoidRootPart.CFrame
    end)
tab:Button("Arcade", "Teleport.", function()
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new (301.839508, 0.381902546, -257.743652, -0.0336270966, -1.60877462e-08, -0.999434471, 3.67901798e-08, 1, -1.73346972e-08, 0.999434471, -3.73522901e-08, -0.0336270966)  
 end)
  tab:Button("Pizzeria", "Teleport.", function()
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new (190.23381, 0.384423345, 139.752655, 0.99999851, -5.39057199e-09, 0.00171832519, 5.48264856e-09, 1, -5.35801341e-08, -0.00171832519, 5.35894742e-08, 0.99999851)
  end)
 tab:Button("Cafe", "Teleport.", function()
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new (-559.807556, -25.6434689, -173.888702, 0.270550966, -1.00642739e-08, -0.962705672, 4.28360387e-08, 1, 1.58413604e-09, 0.962705672, -4.16670858e-08, 0.270550966)
  end)
 tab:Button("Train Station", "Teleport.", function()
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new (-216.238678, 0.522331715, 10.1781473, 0.012914733, -1.00292993e-07, 0.999916613, -1.79470643e-08, 1, 1.00533164e-07, -0.999916613, -1.92439273e-08, 0.012914733)
  end)
  tab:Button("Diavollo Castle", "Teleport.", function()
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new (591.787415, 0.393531531, -107.864952, -0.784612417, -2.05337614e-09, -0.619986594, 1.33765905e-08, 1, -2.02404618e-08, 0.619986594, -2.41742235e-08, -0.784612417)
  end)
   tab:Button("Merchant Roof", "Teleport.", function()
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new (-651.922791, 16.3488083, -303.327515, 0.00914677978, 1.62050995e-08, 0.999958158, -5.07794304e-08, 1, -1.57412892e-08, -0.999958158, -5.06333215e-08, 0.00914677978)
   end)
   tab:Button("Merchant", "Teleport.", function()
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new (-622.519348, -25.6700325, -337.950684, -0.0524418429, -1.98233305e-08, 0.998623967, 4.24487556e-09, 1, 2.00735606e-08, -0.998623967, 5.29172883e-09, -0.0524418429)
  end)
  tab:Button("Quinton(box)", "Teleport.", function()
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new (286.164978, 0.361056685, 103.790054, -0.254602224, 1.8103929e-08, 0.967045844, 1.2146808e-08, 1, -1.55228665e-08, -0.967045844, 7.79436338e-09, -0.254602224)
  end)
tab:Button("Uzurashi(pluck)", "Teleport.", function()
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new (120.1819, -25.5129528, 426.077271, 0.0209821798, 2.65913727e-08, -0.99977982, -1.18167129e-08, 1, 2.63492339e-08, 0.99977982, 1.1261247e-08, 0.0209821798)
   end)
  tab:Button("Jonathan(hamon)", "Teleport.", function()
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new (418.543976, 8.08255386, -283.584595, -0.0293733757, -3.81279577e-08, -0.999568522, -8.21773085e-08, 1, -3.57295491e-08, 0.999568522, 8.10923524e-08, -0.0293733757)
   end)
tab:Button("Gyro(spin", "Teleport.", function()
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new (119.391617, 6.15012789, 102.830894, -0.999956906, 7.71162902e-08, 0.00928331912, 7.69728601e-08, 1, -1.58077178e-08, -0.00928331912, -1.5092473e-08, -0.999956906)
  end)
tab:Button("The tallest peak", "Teleport.", function()
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new (-233.276703, 284.348206, 355.227814, 0.999945164, 1.62608913e-08, -0.0104705701, -1.60326188e-08, 1, 2.18851941e-08, 0.0104705701, -2.1716124e-08, 0.999945164)
   end)
   tab:Button("Doppio's Parking", "Teleport.", function()
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new (-34.4739685, 0.156817824, -974.340881, 0.942215264, -2.06628012e-08, 0.335007995, 2.06744022e-09, 1, 5.5863822e-08, -0.335007995, -5.19431396e-08, 0.942215264)
   end)
     tab:Button("Dio's Quest", "Teleport.", function()
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new (176.573303, -25.8557491, 577.437073, -0.883502483, 3.13720996e-08, -0.468426436, -5.28524158e-09, 1, 7.69419017e-08, 0.468426436, 7.04541137e-08, -0.883502483)
   end)
        tab:Button("Vamp lair", "Teleport.", function()
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new (387.469635, -30.0487938, -180.662933, 0.854845941, -3.49447866e-08, -0.518881857, 2.27958346e-08, 1, -2.97907121e-08, 0.518881857, 1.36381253e-08, 0.854845941)
      end)
        tab:Button("Heaven Dio", "Teleport.", function()
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new (8501.62891, -478.979828, 8160.81836, 0.699075043, -7.18590387e-09, 0.715048313, -2.72525491e-09, 1, 1.27139117e-08, -0.715048313, -1.08366676e-08, 0.699075043)
        end)
        ItemTab:Toggle(
          "item farm",
          "",
          false,
          function(v)
              Settings.ItemFarm = v
              while Settings.ItemFarm and task.wait() do
                  pcall(
                      function()
                          for i, v in pairs(game:GetService("Workspace")["Item_Spawns"].Items:GetChildren()) do
                              if v:FindFirstChildOfClass("MeshPart") then
                                  getgenv().Item = "MeshPart"
                              elseif v:FindFirstChildOfClass("Part") then
                                  getgenv().Item = "Part"
                              end
                              if v:IsA("Model") and v:FindFirstChildOfClass("ClickDetector") ~= 0 then
                                  repeat
                                      task.wait(.3)
                                      game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
                                          v:FindFirstChildOfClass(getgenv().Item).CFrame * CFrame.new(0, 5, 0)
                                          task.wait(.3)
                                          fireclickdetector(v:FindFirstChildOfClass("ClickDetector"))
                                          wait(0.5)
                                          v:Destroy()
                                          if string.match(lp.PlayerGui.Message.TextLabel.Text, "You can't have more than") then
                                    v:Destroy();
                                end
                                  until Settings.ItemFarm == false or game.Players.LocalPlayer.Character == nil or v == nil
                                  if not Settings.ItemFarm then break end
                              end
                          end
                      end
                  )
              end
          end
      )
     local tab = win:Tab("UI Settings", "http://www.roblox.com/asset/?id=6023426915") -- Logo is the link
tab:Button("Destroy GUI", "", function() -- Description is the text you'll see when you click on the arrow at the right of the button
game:GetService("CoreGui").FluxLib:Destroy()
end)
