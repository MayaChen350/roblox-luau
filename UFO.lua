-- Get the parent of the script
local UFO = script.Parent

-- Manages the damages from or to the UFO
local function damage(otherPart)
	print("it works")
	local partParent = otherPart.Parent
	local humanoid = partParent:FindFirstChild("Humanoid")
	local sword = partParent:FindFirstChild("ClassicSword")
	local swordPhysical = partParent:FindFirstChild("Handle")
	if humanoid then
		humanoid.Health = humanoid.Health - 25
	elseif swordPhysical then
		print("that's indeed a sword")
	end
end

-- Connect the ’Touched’ event of the UFO to the ’damage’ function
UFO.Touched:Connect(damage)

-- The direction of the UFO
local goLeft = true

-- Makes the UFO teleport to move forward and backward
local function Warp()
	if UFO.Position.X <= 9 then
		goLeft = false
	-- After reaching a certain point it goes back
	elseif UFO.Position.X >= 38 then
		goLeft = true
	end

	-- Determine the new position based on where it's supposed to go
	local newPositionX = goLeft and UFO.Position.X - 1 or UFO.Position.X + 1

	-- It goes up and down
	local position = Vector3.new(newPositionX, UFO.Position.Y + 2, UFO.Position.Z)
	UFO.Position = position
	task.wait(0.5)
	position = Vector3.new(newPositionX, UFO.Position.Y -2 , UFO.Position.Z)
	UFO.Position = position
	task.wait(0.5)
end

-- Eternal loop
while true do
	Warp()
end
