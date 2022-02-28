local Players = game:GetService("Players")
repeat task.wait() until game:IsLoaded()
shared.Executed = false
shared.assetsversion = game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/assetsversion.dat")
shared.assets = game:HttpGet("")
shared.whitelisted = {
    1494659690
}

local function getURL(URL)
    if table.find(shared.whitelisted, game.Players.LocalPlayer.UserId) then
        return loadstring(readfile("Water/"..URL), true)
    end
end


local getasset = getsynasset or getcustomasset
if getasset == nil and getgenv().getcustomasset == nil then
	getgenv().getcustomasset = function(location) return "rbxasset://"..location end
	getasset = getgenv().getcustomasset
end
local queueteleport = syn and syn.queue_on_teleport or queue_on_teleport or fluxus and fluxus.queue_on_teleport
local requestfunc = syn and syn.request or http and http.request or http_request or fluxus and fluxus.request or getgenv().request or request

local checkIfCompatibleWithExecutor = function()
    if (getasset and requestfunc and queueteleport) then
        return true
    else
        return false
    end
end

local isCompatbile = checkIfCompatibleWithExecutor()

if not isCompatbile then
    return game.Players.LocalPlayer:Kick("Your executor isn't supported! We're working on expanding our executors that're whitelisted as of now.")
end

if not shared.Executed or shared.Executed == false then
    shared.Executed = true
elseif shared.Executed == true then
    error("Vape already injected!")
    return
end