        print 'your textbox has been clear'
end)

end)

button7.Name = "button7"
button7.Parent = frame
button7.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
button7.BorderColor3 = Color3.fromRGB(255, 0, 0)
button7.BorderSizePixel = 3
button7.Position = UDim2.new(-0.00333331339, 0, 0.175000012, 0)
button7.Size = UDim2.new(0, 75, 0, 30)
button7.Font = Enum.Font.SourceSans
button7.Text = "[FE] Energize GUI"
button7.TextColor3 = Color3.fromRGB(255, 255, 255)
button7.TextSize = 14.000
button7.TextWrapped = true
button7.MouseButton1Down:connect(function()
        loadstring(game:HttpGet("https://[Log in to view URL]",true))()        
end)

        
        







close.Name = "close"
close.Name = main
close.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
close.BorderColor3 = Color3.fromRGB(255, 0, 0)
close.BorderSizePixel = 3
close.Position = UDim2.new(0,3,0.3,380)
close.Size = UDim2.new(0, 300, 0, 20)
close.Font = Enum.Font.SourceSans
close.Text = "Close"
close.TextColor3 = Color3.fromRGB(255, 255, 255)
close.TextSize = 18.000
close.MouseButton1Down:connect(function()
        if close.Text == "Close" then
            frame.Visible = false
            close.Text = "Open" else
            frame.Visible = true
            close.Text = "Close"
        end
end)
            
            