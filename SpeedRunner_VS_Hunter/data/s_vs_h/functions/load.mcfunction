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

tellraw @a [{"text":">","color":"dark_green"},{"text":" Datapack ","color":"white"},{"text":"[Speedrunner VS Hunters]","bold":true,"color":"white"},{"text":" Installed!","color":"white"}]
tellraw @a [{"text":">","color":"dark_green"},{"text":" Run ","color":"white"},{"text":"/trigger speedrunner set 1","color":"dark_gold","clickEvent":{"action":"run_command","value":"/trigger speedrunner set 1"}},{"text":" to become the speedrunner","color":"white"}]
tellraw @a [{"text":">","color":"dark_green"},{"text":" Run ","color":"white"},{"text":"/trigger speedrunner set 2","color":"dark_gold","clickEvent":{"action":"run_command","value":"/trigger speedrunner set 2"}},{"text":" to randomally choose the speedrunner","color":"white"}]
tellraw @a [{"text":">","color":"dark_green"},{"text":" Originally By ","color":"white"},{"text":"[3boood_pro]","color":"green","clickEvent":{"action":"open_url","value":"https://www.planetminecraft.com/member/3boood_pro/"},"hoverEvent":{"action":"show_text","contents":"Planet Minecraft"}}]
tellraw @a [{"text":">","color":"dark_green"},{"text":" Updated By ","color":"white"},{"text":"[RageGamingPE]","color":"dark_purple","clickEvent":{"action":"open_url","value":"https://dominiccarrington.github.io/DataPacks"},"hoverEvent":{"action":"show_text","contents":"My DataPacks"}}]
