####
# Death Swap
# Game Originaly By Sethbling
# Datapack By RageGamingPE
####

gamerule commandBlockOutput false

scoreboard objectives add player dummy
scoreboard objectives add timer dummy
scoreboard objectives add health health
scoreboard objectives setdisplay list health

scoreboard players set @a player 0
scoreboard players set @a timer 400
kill @e[type=armor_stand,name=DeathSwap]