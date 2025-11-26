if currentYaw > baseYaw + maxTurn then
    currentYaw = baseYaw + maxTurn
end

if currentYaw < baseYaw then currentYaw = baseYaw end