local BadgeService = game:GetService("BadgeService")

local BADGE_ID = 123456789 -- 🔴 Remplace par l'ID du badge

game.Players.PlayerAdded:Connect(function(player)
    local success, hasBadge = pcall(function()
        return BadgeService:UserHasBadgeAsync(player.UserId, BADGE_ID)
    end)

    if success and not hasBadge then
        pcall(function()
            BadgeService:AwardBadge(player.UserId, BADGE_ID)
        end)
    end
end)
