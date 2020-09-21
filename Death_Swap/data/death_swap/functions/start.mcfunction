####
# Death Swap
# Game Originaly By Sethbling
# Datapack By RageGamingPE
####

scoreboard players set #temp player 1
function death_swap:set_players

clear @a
xp set @a 0
gamemode survival @a
time set 0
weather clear 24000

effect give @a minecraft:resistance 30 2 true
effect give @a minecraft:slowness 10 5 true

kill @e[type=item]

spreadplayers 0 0 10000 1000000 false @a