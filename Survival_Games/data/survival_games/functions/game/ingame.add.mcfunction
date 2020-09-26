####
# Survival Games
# By: RageGamingPE
####

gamemode survival @a[team=Tribute]

execute if score #Tributes settings matches 1 run tellraw @a {%end/winner%}
execute if score #Tributes settings matches 0 run tellraw @a {%end/draw%}
execute if score #Tributes settings matches 0..1 run function survival_games:game/end

execute if score #Mins settings matches 10.. if score #Secs settings matches 10.. run title @a actionbar {%timer/time__%}
execute if score #Mins settings matches 10.. if score #Secs settings matches ..9 run title @a actionbar {%timer/time_0%}
execute if score #Mins settings matches ..9 if score #Secs settings matches 10.. run title @a actionbar {%timer/time0_%}
execute if score #Mins settings matches ..9 if score #Secs settings matches ..9 run title @a actionbar {%timer/time00%}

execute if score #Compass settings matches 1..2 run tag @a[team=Tribute] add compass_update
execute if score #Compass settings matches 1..2 run function survival_games:compass