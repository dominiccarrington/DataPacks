####
# Death Swap
# Game Originaly By Sethbling
# Datapack By RageGamingPE
####

scoreboard players set @r[scores={player=0}] player 1
scoreboard players set @r[scores={player=0}] player 2

clear @a
xp set @a 0
gamemode survival @a
time set 0
weather clear 24000

effect give @a minecraft:resistance 30 2 true
effect give @a minecraft:slowness 10 5 true

kill @e[type=item]

spreadplayers 0 0 10000 1000000 false @a