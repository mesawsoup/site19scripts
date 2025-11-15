 			 local Player = game.Players.LocalPlayer
			 local Character = Player.Character        
			 local PlayerGui = Player:waitForChild("PlayerGui")
			 local Backpack = Player:waitForChild("Backpack")
			 local Humanoid = Character and Character:FindFirstChildWhichIsA("Humanoid") or false
			 local RootPart = Character and Humanoid and Humanoid.RootPart or false
			 local RightArm = Character and Character:FindFirstChild("Right Arm") or Character:FindFirstChild("RightHand")
			 if not Humanoid or not RootPart or not RightArm then
				 return
			 end
			 Humanoid:UnequipTools()
			 local MainTool = Backpack:FindFirstChildWhichIsA("Tool") or false
			 if not MainTool or not MainTool:FindFirstChild("Handle") then
				 return
			 end
			 local TCharacter = workspace.Special.NPC.Chaos
			 local THumanoid = TCharacter and TCharacter:FindFirstChildWhichIsA("Humanoid") or false
			 local TRootPart = TCharacter and THumanoid and THumanoid.RootPart or false
			 if not THumanoid or not TRootPart then
				 return
			 end
			 Character.Humanoid.Name = "DAttach"
			 local l = Character["DAttach"]:Clone()
			 l.Parent = Character
			 l.Name = "Humanoid"
			 wait()
			 Character["DAttach"]:Destroy()
			 game.Workspace.CurrentCamera.CameraSubject = Character
			 Character.Animate.Disabled = true
			 wait()
			 Character.Animate.Disabled = false
			 Character.Humanoid:EquipTool(MainTool)
			 wait()
			 CF = Player.Character.PrimaryPart.CFrame
			 if firetouchinterest then
				 local flag = false
				 task.defer(function()
					 MainTool.Handle.AncestryChanged:wait()
					 flag = true
				 end)
				 repeat
					 firetouchinterest(MainTool.Handle, TRootPart, 0)
					 firetouchinterest(MainTool.Handle, TRootPart, 1)
					 wait()
					 Player.Character.HumanoidRootPart.CFrame = CF
				 until flag
			 else
				 Player.Character.HumanoidRootPart.CFrame =
				 TCharacter.HumanoidRootPart.CFrame
				 wait()
				 Player.Character.HumanoidRootPart.CFrame =
				 TCharacter.HumanoidRootPart.CFrame
				 wait()
				 Player.Character.HumanoidRootPart.CFrame = CF
				 wait()
			 end
			 wait(.3)
			 Player.Character:SetPrimaryPartCFrame(CF)
			 if Humanoid.RigType == Enum.HumanoidRigType.R6 then
				 Character["Right Arm"].RightGrip:Destroy()
			 else
				 Character["RightHand"].RightGrip:Destroy()
				 Character["RightHand"].RightGripAttachment:Destroy()
			 end
				 
			 wait(4)
			 CF = Player.Character.HumanoidRootPart.CFrame
			 player.CharacterAdded:wait(1):waitForChild("HumanoidRootPart").CFrame = CF
