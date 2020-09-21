####
# Death Swap
# Game Originaly By Sethbling
# Datapack By RageGamingPE
####

execute as @p[scores={deaths=1}] run function death_swap:on_death
execute as @p[scores={player=1}] run scoreboard players remove @r timer 1
execute as @p[scores={timer=0}] run function death_swap:setup_swap