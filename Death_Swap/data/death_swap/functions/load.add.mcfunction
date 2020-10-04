####
# Death Swap
# Game Originaly By Sethbling
# Datapack By RageGamingPE
####

gamerule commandBlockOutput false

scoreboard objectives add player dummy
scoreboard objectives add _player dummy
scoreboard objectives add timer dummy
scoreboard objectives add health health
scoreboard objectives add deaths deathCount
scoreboard objectives setdisplay list health

scoreboard players set @a player 0
scoreboard players set #players player 0
execute as @a run scoreboard players add #players player 1
scoreboard players set #default timer 1200
scoreboard players operation #default timer /= #players player
scoreboard players operation @a timer = #default timer

kill @e[type=armor_stand,name=DeathSwap]

tellraw @a {%load%}