local Players = game:GetService("Players")
local player = Players.LocalPlayer.Character

local spawnPosition = Vector3.new(0, 0, 0) -- Spawn position --
local gamePosition = Vector3.new(0, 0, 0) -- In game position --

function startGame()
    player.position = gamePosition
end

function endGame()
    player.position = spawnPosition
end

