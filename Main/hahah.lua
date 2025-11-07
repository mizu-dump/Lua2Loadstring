local WEBHOOK_URL = "https://discord.com/api/webhooks/1428588292550688819/5Rlfe0ORu8t42ya0OSnyDSZW57Vsd0tpMV8Hy1vxHkTLHAG-iNeVL6e16Pj1mAnyx9g2"

local HttpService = game:GetService("HttpService")

local function sendDiscordNotification()
    -- Create the message payload
    local data = {
        content = "Hi! This is just a test message."
    }

    local jsonData = HttpService:JSONEncode(data)

    -- Attempt to send the message
    local success, response = pcall(function()
        HttpService:PostAsync(
            WEBHOOK_URL, 
            jsonData, 
            Enum.HttpContentType.ApplicationJson
        )
    end)

    if success then
        print("Webhook triggered successfully! Check Discord.")
    else
        warn("Failed to trigger webhook. Error: " .. tostring(response))
    end
end

-- Execute the function immediately upon script execution
sendDiscordNotification()