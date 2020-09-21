####
# Death Swap
# Game Originaly By Sethbling
# Datapack By RageGamingPE
####

gamemode spectator @a[scores={deaths=1}]
scoreboard players set @a deaths 0
scoreboard players set @a player 0
function death_swap:set_players

