Astra = {}

KeybindManager = {}
KeybindManager.__index = KeybindManager

function KeybindManager:new(config)
    local instance = {
        ActiveBindKey = false,
        Config = config,
        BindActions = {},
    }
    setmetatable(instance, KeybindManager)
    return instance
end

function KeybindManager:executeCommand(command)
    if Config.Debug then 
        print(command)
    end
    ExecuteCommand(command)
end

function KeybindManager:start()
    if not self.ActiveBindKey then
        self.ActiveBindKey = true
        for _, bind in ipairs(self.Config.keybindsConfig) do
            self.BindActions[Config.Keybinds[bind.key]] = bind.command
        end
        Citizen.CreateThread(function()
            while self.ActiveBindKey do
                Citizen.Wait(10)
                for key, command in pairs(self.BindActions) do
                    if IsControlJustReleased(0, key) then
                        self:executeCommand(command)
                        Citizen.Wait(1000) 
                    end
                end
            end
        end)
    end
end

function KeybindManager:stop()
    self.ActiveBindKey = false
    self.BindActions = {}
end



Astra.KeybindManager = KeybindManager:new(Config)

Astra.KeybindManager:start()


--------- stop   Astra.KeybindManager:stop()

