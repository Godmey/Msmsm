local Take1 = workspace:WaitForChild("\224\184\154\224\185\137\224\184\178\224\184\153\224\185\128\224\184\161\224\184\183\224\184\173\224\184\135"):WaitForChild("\224\184\170\224\185\136\224\184\135")
local Take2 = workspace:WaitForChild("\224\184\154\224\185\137\224\184\178\224\184\153\224\185\128\224\184\161\224\184\183\224\184\173\224\184\135"):WaitForChild("\224\184\163\224\184\177\224\184\154")
local ply = game.Players.LocalPlayer.Character.HumanoidRootPart
local humanoid = game.Players.LocalPlayer.Character:WaitForChild("Humanoid")
local Nameee = loadstring("game:HttpGet(https://raw.githubusercontent.com/Godmey/Ues-4king/refs/heads/main/Hee.lua"))()

local player = game.Players.LocalPlayer
local LP = player.Character.Humanoid.Name

local found = false
for _, allowedName in ipairs(Nameee) do
    if LP == allowedName then
        found = true
        break
    end
end

if not found then
    player:Kick("คุณไม่ใช่คนที่ฉันอนุญาติให้ใช้สคริป")
end
_G.Farm = true

spawn(function()
    while _G.Farm do
        wait()
        pcall(function()
            local tool = game.Players.LocalPlayer.Character:FindFirstChild("Box") or game.Players.LocalPlayer.Backpack:FindFirstChild("Box")
            if tool and tool:IsA("Tool") then
                humanoid:EquipTool(tool)
                ply.CFrame = Take2.ToolTaker.CFrame * CFrame.new(0, 0, -5)
                fireproximityprompt(Take2.ToolTaker.ProximityPrompt)
            else
                ply.CFrame = Take1.ToolGiver.CFrame * CFrame.new(0, 0, 5)
                fireproximityprompt(Take1.ToolGiver.ProximityPrompt)
            end
        end)
    end
end)

spawn(function()
    game:GetService("RunService").Stepped:Connect(function()
        local character = game.Players.LocalPlayer.Character
        if character then
            for _, v in ipairs(character:GetDescendants()) do
                if v:IsA("BasePart") and v.CanCollide then
                    v.CanCollide = false
                end
            end

            local hrp = character:FindFirstChild("HumanoidRootPart")
            if hrp then
                local bodyClip = hrp:FindFirstChild("BodyClip")
                if _G.Farm then
                    if not bodyClip then
                        local noclip = Instance.new("BodyVelocity")
                        noclip.Name = "BodyClip"
                        noclip.Parent = hrp
                        noclip.MaxForce = Vector3.new(100000, 100000, 100000)
                        noclip.Velocity = Vector3.new(0, 0, 0)
                    end
                elseif bodyClip then
                    bodyClip:Destroy()
                end
            end
        end
    end)
end)
