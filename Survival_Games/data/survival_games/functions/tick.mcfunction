####
# Survival Games
# By: RageGamingPE
####

team join Spectator @a[scores={death=1}]
gamemode spectator @a[team=Spectator]
scoreboard players set @a[scores={death=1}] death 0
execute if score #InGame settings matches 1 run gamemode survival @a[team=Tribute]

scoreboard players set #Tributes settings 0
execute as @a[team=Tribute] run scoreboard players add #Tributes settings 1

# execute if score #InGame settings matches 1 if score #Tributes settings matches 1 run tellraw @a [{"text":"Game Over! ","bold":false,"italic":false,"underline":false,"strikethrough":false,"obfuscated":false,"color":"white"},{"selector":"@p[team=Tribute,limit=1]","bold":false,"italic":false,"underline":false,"strikethrough":false,"obfuscated":false,"color":"gold"},{"text":" is the winner!","color":"white"}]
# execute if score #InGame settings matches 0 if score #Tributes settings matches 0 run tellraw @a [{"text":"Game Over! It's a draw!","color":"white"}]
# execute if score #InGame settings matches 0..1 if score #Tributes settings matches 0..1 run function survival_games:game/end

execute if score #InGame settings matches 1 if score #Mins settings matches 10.. if score #Secs settings matches 10.. run title @a actionbar [{"score":{"name":"#Mins","objective":"settings"},"bold":false,"italic":false,"underline":false,"strikethrough":false,"obfuscated":false,"color":"white"},{"text":":","bold":false,"italic":false,"underline":false,"strikethrough":false,"obfuscated":false,"color":"white"},{"score":{"name":"#Secs","objective":"settings"},"bold":false,"italic":false,"underline":false,"strikethrough":false,"obfuscated":false,"color":"white"}]
execute if score #InGame settings matches 1 if score #Mins settings matches 10.. if score #Secs settings matches ..9 run title @a actionbar [{"score":{"name":"#Mins","objective":"settings"},"bold":false,"italic":false,"underline":false,"strikethrough":false,"obfuscated":false,"color":"white"},{"text":":0","bold":false,"italic":false,"underline":false,"strikethrough":false,"obfuscated":false,"color":"white"},{"score":{"name":"#Secs","objective":"settings"},"bold":false,"italic":false,"underline":false,"strikethrough":false,"obfuscated":false,"color":"white"}]
execute if score #InGame settings matches 1 if score #Mins settings matches ..9 if score #Secs settings matches 10.. run title @a actionbar [{"text":"0","bold":false,"italic":false,"underline":false,"strikethrough":false,"obfuscated":false,"color":"white"},{"score":{"name":"#Mins","objective":"settings"},"bold":false,"italic":false,"underline":false,"strikethrough":false,"obfuscated":false,"color":"white"},{"text":":","bold":false,"italic":false,"underline":false,"strikethrough":false,"obfuscated":false,"color":"white"},{"score":{"name":"#Secs","objective":"settings"},"bold":false,"italic":false,"underline":false,"strikethrough":false,"obfuscated":false,"color":"white"}]
execute if score #InGame settings matches 1 if score #Mins settings matches ..9 if score #Secs settings matches ..9 run title @a actionbar [{"text":"0","bold":false,"italic":false,"underline":false,"strikethrough":false,"obfuscated":false,"color":"white"},{"score":{"name":"#Mins","objective":"settings"},"bold":false,"italic":false,"underline":false,"strikethrough":false,"obfuscated":false,"color":"white"},{"text":":0","bold":false,"italic":false,"underline":false,"strikethrough":false,"obfuscated":false,"color":"white"},{"score":{"name":"#Secs","objective":"settings"},"bold":false,"italic":false,"underline":false,"strikethrough":false,"obfuscated":false,"color":"white"}]
