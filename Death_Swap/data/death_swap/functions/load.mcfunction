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

tellraw @a [{"text":">","bold":false,"italic":false,"underline":false,"strikethrough":false,"obfuscated":false,"color":"dark_green"},{"text":" Datapack ","bold":false,"italic":false,"underline":false,"strikethrough":false,"obfuscated":false,"color":"white"},{"text":"[Death Swap]","bold":true,"italic":false,"underline":false,"strikethrough":false,"obfuscated":false,"color":"white"},{"text":" Installed!","color":"white"}]
tellraw @a [{"text":">","bold":false,"italic":false,"underline":false,"strikethrough":false,"obfuscated":false,"color":"dark_green"},{"text":" Run ","bold":false,"italic":false,"underline":false,"strikethrough":false,"obfuscated":false,"color":"white"},{"text":"/function death_swap:start","bold":false,"italic":false,"underline":false,"strikethrough":false,"obfuscated":false,"color":"dark_gold","clickEvent":{"action":"run_command","value":"/function death_swap:start"}},{"text":" to start the game","color":"white"}]
tellraw @a [{"text":">","bold":false,"italic":false,"underline":false,"strikethrough":false,"obfuscated":false,"color":"dark_green"},{"text":" Originally By ","bold":false,"italic":false,"underline":false,"strikethrough":false,"obfuscated":false,"color":"white"},{"text":"[SethBling]","bold":false,"italic":false,"underline":false,"strikethrough":false,"obfuscated":false,"color":"red","clickEvent":{"action":"open_url","value":"https://www.youtube.com/watch?v=r5rEaHPt6mw"},"hoverEvent":{"action":"show_text","contents":"Original Video"}}]
tellraw @a [{"text":">","bold":false,"italic":false,"underline":false,"strikethrough":false,"obfuscated":false,"color":"dark_green"},{"text":" Datapack Created by ","bold":false,"italic":false,"underline":false,"strikethrough":false,"obfuscated":false,"color":"white"},{"text":"[RageGamingPE]","bold":false,"italic":false,"underline":false,"strikethrough":false,"obfuscated":false,"color":"dark_purple","clickEvent":{"action":"open_url","value":"https://dominiccarrington.github.io/DataPacks"},"hoverEvent":{"action":"show_text","contents":"My DataPacks"}}]