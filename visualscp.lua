for _,v in ipairs(game:GetService("Workspace").SCP:GetChildren()) do
		local isHighlighted = v:FindFirstChildOfClass("Highlight")

		if Value then
			if not isHighlighted then
				local highlight = Instance.new("Highlight", v)
		 			  highlight.OutlineTransparency = 1
				end
			else
				if isHighlighted then
					isHighlighted:Destroy()
			end
		end
	end
