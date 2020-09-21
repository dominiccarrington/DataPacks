####
# Death Swap
# Game Originaly By Sethbling
# Datapack By RageGamingPE
####

scoreboard players operation @r[gamemode=survival,scores={player=0}] player = #temp player
scoreboard players add #temp player 1
execute as @p[gamemode=survival,scores={player=0}] run function death_swap:set_players
