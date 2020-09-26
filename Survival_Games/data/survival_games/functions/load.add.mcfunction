####
# Survival Games
# By: RageGamingPE
####

gamerule commandBlockOutput false
gamerule sendCommandFeedback false

scoreboard objectives add player dummy
scoreboard objectives add death deathCount
scoreboard objectives add rest minecraft.custom:minecraft.time_since_death
scoreboard objectives add settings dummy {"text": "Settings"}
scoreboard objectives add Health health
scoreboard objectives add ingame dummy {"text":"In Game"}
scoreboard objectives add action trigger

team add Tribute
team add Spectator
team leave @a

team modify Tribute color gold
team modify Spectator color gray

scoreboard players reset * settings
scoreboard players set #60 settings 60
scoreboard players set GracePeriod settings 0
scoreboard players set TimeLimit settings 30
scoreboard players set Compass settings 2
scoreboard players set WorldBorder settings 2
scoreboard objectives setdisplay sidebar settings

advancement revoke @a everything

function survival_games:game/end

tellraw @a {%load%}

function survival_games:message 
