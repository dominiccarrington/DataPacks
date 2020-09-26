####
# Survival Games
# By: RageGamingPE
####

gamerule commandBlockOutput false
# gamerule sendCommandFeedback false

scoreboard objectives add player dummy
scoreboard objectives add death deathCount
scoreboard objectives add rest minecraft.custom:minecraft.time_since_death
scoreboard objectives add settings dummy {"text": "Settings"}
scoreboard objectives add Health health
scoreboard objectives add ingame dummy {"text":"In Game"}

team add Tribute
team add Spectator
team leave @a

scoreboard players reset * settings
scoreboard players set #60 settings 60
scoreboard players set GracePeriod settings 0
scoreboard players set TimeLimit settings 30
scoreboard players set Compass settings 2
scoreboard players set WorldBorder settings 2
scoreboard objectives setdisplay sidebar settings

advancement revoke @a everything

function survival_games:game/end

tellraw @a [{"text":">","bold":false,"italic":false,"underline":false,"strikethrough":false,"obfuscated":false,"color":"dark_green"},{"text":" Datapack ","bold":false,"italic":false,"underline":false,"strikethrough":false,"obfuscated":false,"color":"white"},{"text":"[Survival Games]","bold":true,"italic":false,"underline":false,"strikethrough":false,"obfuscated":false,"color":"white"},{"text":" Installed!","color":"white"}]
tellraw @a [{"text":"> OPs:","bold":false,"italic":false,"underline":false,"strikethrough":false,"obfuscated":false,"color":"red"},{"text":" Type or click ","bold":false,"italic":false,"underline":false,"strikethrough":false,"obfuscated":false,"color":"white"},{"text":"/function survival_games:start","bold":false,"italic":false,"underline":false,"strikethrough":false,"obfuscated":false,"color":"gold","clickEvent":{"action":"run_command","value":"/function survival_games:start"}},{"text":" to start the game","color":"white"}]
tellraw @a [{"text":"> OPs:","bold":false,"italic":false,"underline":false,"strikethrough":false,"obfuscated":false,"color":"red"},{"text":" Type or click ","bold":false,"italic":false,"underline":false,"strikethrough":false,"obfuscated":false,"color":"white"},{"text":"/function survival_games:settings","bold":false,"italic":false,"underline":false,"strikethrough":false,"obfuscated":false,"color":"gold","clickEvent":{"action":"run_command","value":"/function survival_games:settings"}},{"text":" to get the settings book","color":"white"}]
tellraw @a [{"text":">","bold":false,"italic":false,"underline":false,"strikethrough":false,"obfuscated":false,"color":"dark_green"},{"text":" Created By ","bold":false,"italic":false,"underline":false,"strikethrough":false,"obfuscated":false,"color":"white"},{"text":"[RageGamingPE]","bold":false,"italic":false,"underline":false,"strikethrough":false,"obfuscated":false,"color":"dark_purple","clickEvent":{"action":"open_url","value":"https://dominiccarrington.github.io/DataPacks"},"hoverEvent":{"action":"show_text","contents":"My DataPacks"}}]
