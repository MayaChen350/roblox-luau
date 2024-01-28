local Players = game:GetService("Players")
local playerList = Players.GetPlayers()

local spawnPosition = Vector3.new(0, 0, 0) -- Spawn position --
local gamePosition = Vector3.new(0, 0, 0) -- In game position --

function startGame()
    for player in playerList do
        player.Character.position = gamePosition
    end
end

function endGame()
    for player in playerList do
        player.position = spawnPosition
    end
end

while true do
    startGame()
    task.wait(45)

    endGame()
    task.wait(45)
end
