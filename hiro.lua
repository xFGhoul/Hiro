local discordia = require('discordia')
local client = discordia.Client()

-- Constats
local CONFIG_PATH = "config/config.yaml" -- Replace It With Your Own If You Decide To Change It

-- Functions

function read_token(file)
    local file = io.open(file, "r")
    io.input(file)
    local token_in_file = io.read()
    local token = string.sub(token_in_file, 20)
    io.close(file)
	return token
end

client:on('ready', function()
	print('Logged in as '.. client.user.username)
end)

client:on('messageCreate', function(message)
	if message.content == '!ping' then
		message.channel:send('Pong!')
	end
end)


local BOT_TOKEN = read_token(CONFIG_PATH)

client:run('Bot ' .. BOT_TOKEN)