####
# Survival Games
# By: RageGamingPE
####

team join Spectator @a[scores={death=1}]
gamemode spectator @a[team=Spectator]
scoreboard players set @a[scores={death=1}] death 0
execute if score #InGame settings matches 1 run gamemode survival @a[team=Tribute]

scoreboard players set #Tributes settings 0
execute as @a[team=Tribute] run scoreboard players add #Tributes settings 1

# execute if score #InGame settings matches 1 if score #Tributes settings matches 1 run tellraw @a {%end/winner%}
# execute if score #InGame settings matches 0 if score #Tributes settings matches 0 run tellraw @a {%end/draw%}
# execute if score #InGame settings matches 0..1 if score #Tributes settings matches 0..1 run function survival_games:game/end

execute if score #InGame settings matches 1 if score #Mins settings matches 10.. if score #Secs settings matches 10.. run title @a actionbar {%timer/time__%}
execute if score #InGame settings matches 1 if score #Mins settings matches 10.. if score #Secs settings matches ..9 run title @a actionbar {%timer/time_0%}
execute if score #InGame settings matches 1 if score #Mins settings matches ..9 if score #Secs settings matches 10.. run title @a actionbar {%timer/time0_%}
execute if score #InGame settings matches 1 if score #Mins settings matches ..9 if score #Secs settings matches ..9 run title @a actionbar {%timer/time00%}
