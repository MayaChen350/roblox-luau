local UFO = script.Parent
local goLeft_3f = true
local function damage(otherPart)
  print("it works")
  local partParentChild
  local function _1_(...)
    return otherPart.Parent:FindFirstChild(...)
  end
  partParentChild = _1_
  local humanoid = partParentChild("Humanoid")
  local swordPhysical = partParentChild("Handle")
  if humanoid then
    humanoid.Health = (humanoid.Health - 25)
  elseif swordPhysical then
    print("that's indeed a sword (well the handle but whatever)")
  else
  end
  return nil
end
local function warp()
  do
    local posX = UFO.Position.X
    if (9 <= posX) then
      goLeft_3f = false
    elseif (38 >= posX) then
      goLeft_3f = true
    else
    end
  end
  local newPosX
  local _4_
  if goLeft_3f then
    _4_ = -1
  else
    _4_ = 1
  end
  newPosX = (UFO.Position.X + _4_)
  UFO.Position = Vector3.new(newPosX, (UFO.Position.Y + 2), UFO.Position.Z)
  task.wait(0.5)
  UFO.Position = Vector.new(newPosX, (UFO.Position.Y - 2), UFO.Position.Z)
  task.wait(0.5)
  return nil
end
UFO.Touched:Connect(damage)
while true do
  warp()
end
return nil
