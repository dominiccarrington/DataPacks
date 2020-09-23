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

tellraw @a {%load%}
