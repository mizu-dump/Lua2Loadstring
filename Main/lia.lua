get genv().farm = true
while genv().farm do
task.wait()
game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("ClaimReward"):FireServer()
end