####
# SpeedRunner Vs Hunter
# By: 3boood_pro & RageGamingPE
####

gamerule commandBlockOutput false
# gamerule sendCommandFeedback false

scoreboard objectives add speedrunner trigger
scoreboard objectives add death deathCount
scoreboard objectives add rest minecraft.custom:minecraft.time_since_death
scoreboard objectives add dragonKilled minecraft.killed:minecraft.ender_dragon

team add SpeedRunner
team add Hunter
team modify SpeedRunner prefix "Runner | "
team modify Hunter prefix "Hunter | "
team modify SpeedRunner color light_purple
team modify Hunter color dark_purple
team leave @a

scoreboard objectives add Health health
scoreboard objectives setdisplay belowName Health
scoreboard objectives setdisplay list Health

advancement revoke @a everything

tellraw @a [{"text":"> ","color":"dark_green","italic":true},{"text":"Datapack [","color":"white","italic":true},{"text":"SpeedRunner VS Hunter","color":"white","italic":true},{"text":"]","color":"white","italic":true},{"text":" Installed!","color":"white"}]

tellraw @a [{"text":"> ","color":"dark_green","italic":true},{"text":"Type ","color":"white","italic":true},{"text":" /trigger speedrunner set 1","color":"gold","italic":true},{"text":" to become the speedrunner","color":"white","italic":true}]
tellraw @a [{"text":"> ","color":"dark_green","italic":true},{"text":"Type ","color":"white","italic":true},{"text":" /trigger speedrunner set 2","color":"gold","italic":true},{"text":" to randomally decide the speedrunner","color":"white","italic":true}]
tellraw @a [{"text":"> ","color":"dark_green","italic":true},{"text":"Originally By ","color":"white","italic":true},{"text":"[3boood_pro]","color":"green","italic":true,"hoverEvent":{"action":"show_text","value":[{"text":"Planet Minecraft"}]},"clickEvent":{"action":"open_url","value":"https://www.planetminecraft.com/member/3boood_pro/"}}]
tellraw @a [{"text":"> ","color":"dark_green","italic":true},{"text":"Updated to use 1.16 mechanics by ","color":"white","italic":true},{"text":"[RageGamingPE]","color":"dark_purple","italic":true,"hoverEvent":{"action":"show_text","value":[{"text":"GitHub"}]},"clickEvent":{"action":"open_url","value":"https://github.com/dominiccarrington"}}]
