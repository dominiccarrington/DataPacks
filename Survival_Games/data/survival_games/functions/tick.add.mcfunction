####
# Survival Games
# By: RageGamingPE
####

team join Tribute @a[scores={action=101}]
execute as @a[scores={action=101}] run tellraw @a {%pre/join_tribute%}
team join Spectator @a[scores={action=102}]
execute as @a[scores={action=102}] run tellraw @a {%pre/join_spectator%}
scoreboard players set @a action 0
execute if score #InGame settings matches 0 run scoreboard players enable @a action

team join Spectator @a[scores={death=1}]

scoreboard players set #Tributes settings 0
scoreboard players set #Fallen settings 0
scoreboard players set #Spectators settings 0
execute as @a[team=Tribute] run scoreboard players add #Tributes settings 1
execute as @a[team=Spectator,scores={death=1..}] run scoreboard players add #Fallen settings 1
execute as @a[team=Spectator,scores={death=0}] run scoreboard players add #Spectators settings 1

execute if score #InGame settings matches 1 run function survival_games:game/ingame