####
# Survival Games
# By: RageGamingPE
####

gamerule commandBlockOutput false
# gamerule sendCommandFeedback false

scoreboard objectives add player dummy
scoreboard objectives add death deathCount
scoreboard objectives add rest minecraft.custom:minecraft.time_since_death

team add Tribute
team add Spectator
team leave @a

scoreboard objectives add Health health
scoreboard objectives setdisplay list Health

advancement revoke @a everything

tellraw @a [{"text":"> ","color":"dark_green","italic":true},{"text":"Datapack [","color":"white","italic":true},{"text":"Survival Games","color":"white","italic":true},{"text":"]","color":"white","italic":true},{"text":" Installed!","color":"white"}]

tellraw @a [{"text":"> ","color":"dark_green","italic":true},{"text":"Type ","color":"white","italic":true},{"text":" /function survival_games:start","color":"gold","italic":true},{"text":" to start the game","color":"white","italic":true}]
tellraw @a [{"text":"> ","color":"dark_green","italic":true},{"text":"By ","color":"white","italic":true},{"text":"[RageGamingPE]","color":"dark_purple","italic":true,"hoverEvent":{"action":"show_text","value":[{"text":"GitHub"}]},"clickEvent":{"action":"open_url","value":"https://github.com/dominiccarrington"}}]
