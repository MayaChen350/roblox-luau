(local UFO script.Parent)

(var goLeft? true)

(fn damage [otherPart]
  (print "it works")
  (let [partParentChild (partial otherPart.Parent:FindFirstChild)
        humanoid (partParentChild "Humanoid")
        ;; sword (partParentChild "ClassicSword") ;; this isn't even used smh
        swordPhysical (partParentChild "Handle")]

    (if humanoid ;; if not null
        (set humanoid.Health (- humanoid.Health 25))
        ;; elseif that next thing is null
        swordPhysical
        (print "that's indeed a sword (well the handle but whatever)"))
    nil))

(fn warp []
  (let [posX UFO.Position.X] 
    (if (<= 9 posX) (set goLeft? false)
        (>= 38 posX) (set goLeft? true)))

  (let [newPosX (+ UFO.Position.X (if goLeft? -1 1))]
    (set UFO.Position (Vector3.new newPosX (+ UFO.Position.Y 2) UFO.Position.Z))
    (task.wait 0.5)
    (set UFO.Position (Vector.new newPosX (- UFO.Position.Y 2) UFO.Position.Z))
    (task.wait 0.5)
    nil))

(UFO.Touched:Connect damage)
(while true (warp))
