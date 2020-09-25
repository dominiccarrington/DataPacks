####
# Survival Games
# By: RageGamingPE
####

scoreboard players remove #TimeLimit settings 1

scoreboard players operation #Mins settings = #TimeLimit settings
scoreboard players operation #Mins settings /= #60 settings

scoreboard players operation #Secs settings = #TimeLimit settings
scoreboard players operation #Secs settings %= #60 settings

execute if score #TimeLimit settings matches 60 run title @a subtitle {"text": "Deathmatch in 60 seconds", "color": "gold"}
execute if score #TimeLimit settings matches 60 run title @a title {"text": ""}
execute if score #TimeLimit settings matches 60 run playsound entity.ender_dragon.growl master @a

execute if score #TimeLimit settings matches 30 run title @a subtitle {"text": "Deathmatch in 30 seconds", "color": "gold"}
execute if score #TimeLimit settings matches 30 run title @a title {"text": ""}
execute if score #TimeLimit settings matches 30 run playsound entity.ender_dragon.growl master @a

execute if score #TimeLimit settings matches 10 run title @a subtitle {"text": "Deathmatch in 10 seconds", "color": "gold"}
execute if score #TimeLimit settings matches 10 run title @a title {"text": ""}
execute if score #TimeLimit settings matches 10 run playsound entity.ender_dragon.growl master @a

execute if score #TimeLimit settings matches 1.. run schedule function survival_games:game/main 1s
execute if score #TimeLimit settings matches 0 run function survival_games:game/deathmatch