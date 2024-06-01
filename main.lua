local ReplicatedStorage = game:GetService("ReplicatedStorage")

local function waitForChild(parent, childName, timeout)
    local startTime = os.time()
    while os.time() - startTime < timeout do
        local child = parent:FindFirstChild(childName)
        if child then
            return child
        end
        wait(0.1)  -- Aguarda um pequeno intervalo antes de verificar novamente
    end
    error("Timeout esperando por " .. childName)
end

local eventsShared = waitForChild(ReplicatedStorage, "events-shared", 10)  -- Timeout de 10 segundos

local GlobalEvents = waitForChild(eventsShared, "network@GlobalEvents", 10)  -- Timeout de 10 segundos

local Window = Rayfield:CreateWindow({
   Name = "1 SEC HUB",
   LoadingTitle = "Rayfield Interface Suite",
   LoadingSubtitle = "by Sirius",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "1 SEC HUB"
   },
   Discord = {
      Enabled = false,
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },
   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided",
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local Button = Window:CreateButton({
   Name = "Button Example",
   Callback = function()
       -- O que acontecerá quando o botão for pressionado
       while true do
           GlobalEvents:WaitForChild("placeBlock"):FireServer()
           wait() -- Aguarda um curto intervalo antes de continuar
       end
   end,
})
