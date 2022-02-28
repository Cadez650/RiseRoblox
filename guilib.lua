local module = {}

if shared.Executed then
    print("Executed!")
    local getasset = getsynasset or getcustomasset
	local requestfunc = syn and syn.request or http and http.request or http_request or fluxus and fluxus.request or getgenv().request or request
    function shared.getassetfunc(path)
        if not isfile("Water/"..path) then
            spawn(function()
                local textLabel = Instance.new("TextLabel")
                textLabel.Size = UDim2.new(1, 0, 0, 36)
                textLabel.Text = "Downloading "..path
				textLabel.BackgroundTransparency = 1
				textLabel.TextStrokeTransparency = 0
				textLabel.TextSize = 30
				textLabel.Font = Enum.Font.SourceSans
				textLabel.TextColor3 = Color3.new(1, 1, 1)
				textLabel.Position = UDim2.new(0, 0, 0, -36)
				textLabel.Parent = game.Players.LocalPlayer.PlayerGui
                repeat wait() until isfile(path)
				textLabel:Remove()
            end)
            local req = requestfunc({
				Url = "https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/"..path:gsub("Water/assets", "assets"),
				Method = "GET"
			})
			writefile(path, req.Body)
        end
    end
end

local function isaFile(fileName)
    if isfile("Water/assets/"..fileName) then
        return true
    else
        return false
    end
end

function module.print(string)
    print(string)
end

return module