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

tellraw @a [{"text":">","color":"dark_green"},{"text":" Datapack ","color":"white"},{"text":"[Death Swap]","bold":true,"color":"white"},{"text":" Installed!","color":"white"}]
tellraw @a [{"text":">","color":"dark_green"},{"text":" Run ","color":"white"},{"text":"/function death_swap:start","color":"dark_gold","clickEvent":{"action":"run_command","value":"/function death_swap:start"}},{"text":" to start the game","color":"white"}]
tellraw @a [{"text":">","color":"dark_green"},{"text":" Originally By ","color":"white"},{"text":"[SethBling]","color":"red","clickEvent":{"action":"open_url","value":"https://www.youtube.com/watch?v=r5rEaHPt6mw"},"hoverEvent":{"action":"show_text","contents":"Original Video"}}]
tellraw @a [{"text":">","color":"dark_green"},{"text":" Datapack Created by ","color":"white"},{"text":"[RageGamingPE]","color":"dark_purple","clickEvent":{"action":"open_url","value":"https://dominiccarrington.github.io/DataPacks"},"hoverEvent":{"action":"show_text","contents":"My DataPacks"}}]