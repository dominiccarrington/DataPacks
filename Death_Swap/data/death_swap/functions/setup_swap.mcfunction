####
# Death Swap
# Game Originaly By Sethbling
# Datapack By RageGamingPE
####

execute as @a[gamemode=survival] run summon minecraft:armor_stand ~ ~ ~ {NoGravity:1,Invisible:1,CustomName:'"DeathSwap"'}
execute as @a[gamemode=survival] run scoreboard players operation @e[type=minecraft:armor_stand,name=DeathSwap,sort=nearest,limit=1] player = @s player
scoreboard players add @e[type=minecraft:armor_stand,name=DeathSwap,sort=nearest,limit=1] player 1
execute as @e[type=minecraft:armor_stand,name=DeathSwap] run scoreboard players operation @s _player = @s player
scoreboard players operation @e[type=minecraft:armor_stand,name=DeathSwap] _player -= #temp player
scoreboard players set @e[type=minecraft:armor_stand,name=DeathSwap,scores={_player=0}] player 1

execute as @a[gamemode=survival] run scoreboard players operation @s _player = @s player
function death_swap:do_swap
scoreboard players reset @a _player

effect give @a minecraft:resistance 5 2 true
kill @e[type=armor_stand,name=DeathSwap]
scoreboard players operation @a timer = #default timer

scoreboard players set @a player 0
function death_swap:set_players