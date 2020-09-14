####
# SpeedRunner Vs Hunter
# By: 3boood_pro & RageGamingPE
####

# Start the Game, No OP required!
execute as @p[scores={speedrunner=2}] run scoreboard players set @a[limit=1,sort=random] speedrunner 1
execute as @p[scores={speedrunner=1}] run function s_vs_h:start_speedrun
scoreboard players set @a speedrunner 0
scoreboard players enable @a speedrunner

# Check for victory condition for SpeedRunner or Hunters
execute as @a[team=SpeedRunner,scores={death=1}] run title @a subtitle {"text": "The hunters have won!"}
execute as @a[team=SpeedRunner,scores={death=1}] run title @a title {"text": "Game Over!", "color": "gold"}
execute as @a[team=SpeedRunner,scores={dragonKilled=1}] run title @a subtitle {"text": "The speedrunner has won!"}
execute as @a[team=SpeedRunner,scores={dragonKilled=1}] run title @a title {"text": "Game Over!", "color": "gold"}
scoreboard players set @a death 0
scoreboard players set @a dragonKilled 0

# On Death, Give Compass
execute as @a[team=Hunter] at @s if score @s rest matches 1 run give @s minecraft:compass{LodestoneTracked:0,LodestoneDimension:"minecraft:overworld"} 1
execute as @a at @s if score @s rest matches 2.. run scoreboard players set @s rest 1

# Update Compass (AKA Track The SpeedRunner)
setblock ~ 250 ~ shulker_box
replaceitem block ~ 250 ~ container.0 minecraft:compass{LodestoneTracked:0}

data modify block ~ 250 ~ Items[0].tag.LodestoneDimension set from entity @a[team=SpeedRunner,limit=1] Dimension
data modify block ~ 250 ~ Items[0].tag.LodestonePos.X set from entity @a[team=SpeedRunner,limit=1] Pos[0]
data modify block ~ 250 ~ Items[0].tag.LodestonePos.Y set from entity @a[team=SpeedRunner,limit=1] Pos[1]
data modify block ~ 250 ~ Items[0].tag.LodestonePos.Z set from entity @a[team=SpeedRunner,limit=1] Pos[2]

execute as @a[team=Hunter,nbt={Inventory:[{Slot:0b,id:"minecraft:compass"}]}] run loot replace entity @s hotbar.0 1 mine ~ 250 ~
execute as @a[team=Hunter,nbt={Inventory:[{Slot:1b,id:"minecraft:compass"}]}] run loot replace entity @s hotbar.1 1 mine ~ 250 ~
execute as @a[team=Hunter,nbt={Inventory:[{Slot:2b,id:"minecraft:compass"}]}] run loot replace entity @s hotbar.2 1 mine ~ 250 ~
execute as @a[team=Hunter,nbt={Inventory:[{Slot:3b,id:"minecraft:compass"}]}] run loot replace entity @s hotbar.3 1 mine ~ 250 ~
execute as @a[team=Hunter,nbt={Inventory:[{Slot:4b,id:"minecraft:compass"}]}] run loot replace entity @s hotbar.4 1 mine ~ 250 ~
execute as @a[team=Hunter,nbt={Inventory:[{Slot:5b,id:"minecraft:compass"}]}] run loot replace entity @s hotbar.5 1 mine ~ 250 ~
execute as @a[team=Hunter,nbt={Inventory:[{Slot:6b,id:"minecraft:compass"}]}] run loot replace entity @s hotbar.6 1 mine ~ 250 ~
execute as @a[team=Hunter,nbt={Inventory:[{Slot:7b,id:"minecraft:compass"}]}] run loot replace entity @s hotbar.7 1 mine ~ 250 ~
execute as @a[team=Hunter,nbt={Inventory:[{Slot:8b,id:"minecraft:compass"}]}] run loot replace entity @s hotbar.8 1 mine ~ 250 ~

# Kills The Compass
execute as @e[type=minecraft:item,nbt={Item:{id:"minecraft:compass",tag:{LodestoneTracked:0}}}] at @s run kill @s

# Action Bar Text
execute as @a[team=Hunter] at @s run title @s actionbar [{"text":"You are ","color":"dark_green","bold":true,"italic":true},{"text":"Hunter","color":"dark_purple","bold":true,"italic":true}]
execute as @a[team=SpeedRunner] at @s run title @s actionbar [{"text":"You are ","color":"dark_green","bold":true,"italic":true},{"text":"SpeedRunner","color":"light_purple","bold":true,"italic":true}]