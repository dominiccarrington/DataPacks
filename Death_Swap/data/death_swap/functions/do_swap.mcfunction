####
# Death Swap
# Game Originaly By Sethbling
# Datapack By RageGamingPE
####

tp @p[gamemode=survival,scores={_player=1}] @e[type=minecraft:armor_stand,name=DeathSwap,sort=nearest,limit=1,scores={_player=1}]
scoreboard players remove @a[gamemode=survival] _player 1
scoreboard players remove @e[type=minecraft:armor_stand,name=DeathSwap,sort=nearest,limit=1] _player 1

execute as @p[scores={_player=1}] run function death_swap:do_swap