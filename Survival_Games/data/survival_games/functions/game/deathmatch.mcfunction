####
# Survival Games
# By: RageGamingPE
####

execute at @e[type=armor_stand,name="Center",limit=1] run spreadplayers ~ ~ 10 30 false @a[team=Tribute]
teleport @a[team=Spectator] @e[type=armor_stand,name="Center",limit=1]

execute at @e[type=armor_stand,name="Center",limit=1] run worldborder center ~ ~ 
worldborder set 50