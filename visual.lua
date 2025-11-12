local localPlayer = game:GetService("Players").LocalPlayer

local function createHighlight(plr)
	if plr == nil then
		return
	end
	if plr == localPlayer then
		return;
	end
	local highlight = Instance.new("Highlight");
	highlight.FillColor = plr.TeamColor.Color;
	highlight.Parent = plr.Character;
   highlight.OutlineTransparency = 1
	if plr:IsInGroup(35650370) then
		local BillboardGui = Instance.new("BillboardGui")
		local ImageLabel = Instance.new("ImageLabel")

		BillboardGui.Parent = plr.Character.HumanoidRootPart
		BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		BillboardGui.Active = true
		BillboardGui.AlwaysOnTop = true
		BillboardGui.LightInfluence = 1.000
		BillboardGui.Size = UDim2.new(2.5, 0, 2.5, 0)

		ImageLabel.Parent = BillboardGui
		ImageLabel.BackgroundColor3 = plr.TeamColor.Color
		ImageLabel.BackgroundTransparency = 1.000
		ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
		ImageLabel.BorderSizePixel = 1
		ImageLabel.Size = UDim2.new(1, 0, 1, 0)
		ImageLabel.Image = "http://www.roblox.com/asset/?id=6035078889"
	end
end

local function resetHighlights()
	for _, plr in game:GetService("Players"):GetPlayers() do
		if plr:IsA("Player") then
			if plr.Character then
				if plr.Character:FindFirstChildOfClass("Highlight") then
					plr.Character:FindFirstChildOfClass("Highlight"):Destroy();
				end
			end
		end
      task.wait()
	end
end

resetHighlights();

for _,v in game:GetService("Players"):GetPlayers() do
	if v ~= localPlayer then
        createHighlight(v);
		v.CharacterAdded:Connect(function()
			createHighlight(v);
		end)
	end
   task.wait()
end

Players.ChildAdded:Connect(function(plr)
	if plr:IsA("Player") then
		plr.CharacterAdded:Wait()
			createHighlight(plr);
	end
end)
