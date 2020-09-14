####
# Death Swap
# Game Originaly By Sethbling
# Datapack By RageGamingPE
####

execute if score @p player matches 1 run scoreboard players remove @r timer 1

execute if score @p timer matches 0 at @p[scores={player=1}] run summon minecraft:armor_stand ~ ~ ~ {NoGravity:1,Invisible:1,CustomName:{"text":"DeathSwap"}}
execute if score @p timer matches 0 run effect give @p minecraft:resistance 5 2 true
execute if score @p timer matches 0 run tp @p[scores={player=1}] @p[scores={player=2}]
execute if score @p timer matches 0 run tp @p[scores={player=2}] @e[type=armor_stand,name=DeathSwap,limit=1]
execute if score @p timer matches 0 run kill @e[type=armor_stand,name=DeathSwap]
execute if score @p timer matches 0 run scoreboard players set @a timer 600
