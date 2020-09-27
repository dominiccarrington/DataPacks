####
# Survival Games
# By: RageGamingPE
####

gamemode survival @a[team=Tribute]

execute if score #Tributes settings matches 1 run tellraw @a [{"text":"Game Over! ","bold":false,"italic":false,"underline":false,"strikethrough":false,"obfuscated":false,"color":"white"},{"selector":"@p[team=Tribute,limit=1]","bold":false,"italic":false,"underline":false,"strikethrough":false,"obfuscated":false,"color":"gold"},{"text":" is the winner!","color":"white"}]
execute if score #Tributes settings matches 0 run tellraw @a [{"text":"Game Over! It's a draw!","color":"white"}]
execute if score #Tributes settings matches 0..1 run function survival_games:game/end

execute if score #Mins settings matches 10.. if score #Secs settings matches 10.. run title @a actionbar [{"score":{"name":"#Mins","objective":"settings"},"bold":false,"italic":false,"underline":false,"strikethrough":false,"obfuscated":false,"color":"white"},{"text":":","bold":false,"italic":false,"underline":false,"strikethrough":false,"obfuscated":false,"color":"white"},{"score":{"name":"#Secs","objective":"settings"},"bold":false,"italic":false,"underline":false,"strikethrough":false,"obfuscated":false,"color":"white"}]
execute if score #Mins settings matches 10.. if score #Secs settings matches ..9 run title @a actionbar [{"score":{"name":"#Mins","objective":"settings"},"bold":false,"italic":false,"underline":false,"strikethrough":false,"obfuscated":false,"color":"white"},{"text":":0","bold":false,"italic":false,"underline":false,"strikethrough":false,"obfuscated":false,"color":"white"},{"score":{"name":"#Secs","objective":"settings"},"bold":false,"italic":false,"underline":false,"strikethrough":false,"obfuscated":false,"color":"white"}]
execute if score #Mins settings matches ..9 if score #Secs settings matches 10.. run title @a actionbar [{"text":"0","bold":false,"italic":false,"underline":false,"strikethrough":false,"obfuscated":false,"color":"white"},{"score":{"name":"#Mins","objective":"settings"},"bold":false,"italic":false,"underline":false,"strikethrough":false,"obfuscated":false,"color":"white"},{"text":":","bold":false,"italic":false,"underline":false,"strikethrough":false,"obfuscated":false,"color":"white"},{"score":{"name":"#Secs","objective":"settings"},"bold":false,"italic":false,"underline":false,"strikethrough":false,"obfuscated":false,"color":"white"}]
execute if score #Mins settings matches ..9 if score #Secs settings matches ..9 run title @a actionbar [{"text":"0","bold":false,"italic":false,"underline":false,"strikethrough":false,"obfuscated":false,"color":"white"},{"score":{"name":"#Mins","objective":"settings"},"bold":false,"italic":false,"underline":false,"strikethrough":false,"obfuscated":false,"color":"white"},{"text":":0","bold":false,"italic":false,"underline":false,"strikethrough":false,"obfuscated":false,"color":"white"},{"score":{"name":"#Secs","objective":"settings"},"bold":false,"italic":false,"underline":false,"strikethrough":false,"obfuscated":false,"color":"white"}]

execute if score Compass settings matches 1..2 run tag @a[team=Tribute] add compass_update
execute if score Compass settings matches 1..2 run function survival_games:compass