####
# Death Swap
# Game Originaly By Sethbling
# Datapack By RageGamingPE
####

gamerule commandBlockOutput false

scoreboard objectives add player dummy
scoreboard objectives add timer dummy

scoreboard players set @a player 0
scoreboard players set @a timer 600
kill @e[type=armor_stand,name=DeathSwap]