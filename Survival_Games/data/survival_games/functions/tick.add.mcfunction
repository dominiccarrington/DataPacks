####
# Survival Games
# By: RageGamingPE
####

team join Tribute @a[scores={settings=101}]
execute as @a[scores={settings=101}] run tellraw @a {%pre/join_tribute%}
team join Spectator @a[scores={settings=102}]
execute as @a[scores={settings=102}] run tellraw @a {%pre/join_spectator%}
scoreboard players set @a settings 0

team join Spectator @a[scores={death=1}]
gamemode spectator @a[team=Spectator]

scoreboard players set #Tributes settings 0
scoreboard players set #Fallen settings 0
scoreboard players set #Spectators settings 0
execute as @a[team=Tribute] run scoreboard players add #Tributes settings 1
execute as @a[team=Spectator,scores={death=1..}] run scoreboard players add #Fallen settings 1
execute as @a[team=Spectator,scores={death=0}] run scoreboard players add #Spectators settings 1

execute if score #InGame settings matches 1 run function survival_games:game/ingame