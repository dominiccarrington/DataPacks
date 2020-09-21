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
execute as @a run scoreboard players add #players player 1
scoreboard players set #default timer 1200
scoreboard players operation #default timer /= #players player
scoreboard players operation @a timer = #default timer

kill @e[type=armor_stand,name=DeathSwap]

tellraw @a [{"text":"> ","color":"dark_green","italic":true},{"text":"Datapack [","color":"white","italic":true},{"text":"Death Swap","color":"white","italic":true},{"text":"]","color":"white","italic":true},{"text":" Installed!","color":"white"}]

tellraw @a [{"text":"> ","color":"dark_green","italic":true},{"text":"Type ","color":"white","italic":true},{"text":" /function death_swap:start","color":"gold","italic":true},{"text":" to start the game!","color":"white","italic":true}]
tellraw @a [{"text":"> ","color":"dark_green","italic":true},{"text":"Originally By ","color":"white","italic":true},{"text":"[SethBling]","color":"red","italic":true,"hoverEvent":{"action":"show_text","value":[{"text":"Original Video"}]},"clickEvent":{"action":"open_url","value":"https://www.youtube.com/watch?v=r5rEaHPt6mw"}}]
tellraw @a [{"text":"> ","color":"dark_green","italic":true},{"text":"Datapack By ","color":"white","italic":true},{"text":"[RageGamingPE]","color":"dark_purple","italic":true,"hoverEvent":{"action":"show_text","value":[{"text":"GitHub"}]},"clickEvent":{"action":"open_url","value":"https://github.com/dominiccarrington"}}]
