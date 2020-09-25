tag @p[tag=compass_update,sort=arbitrary] add compass_next
execute as @p[tag=compass_next] run tag @p[tag=!compass_next] add compass_track

setblock ~ 250 ~ shulker_box
replaceitem block ~ 250 ~ container.0 minecraft:compass{LodestoneTracked:0}

data modify block ~ 250 ~ Items[0].tag.LodestoneDimension set from entity @a[tag=compass_track,limit=1] Dimension
data modify block ~ 250 ~ Items[0].tag.LodestonePos.X set from entity @a[tag=compass_track,limit=1] Pos[0]
data modify block ~ 250 ~ Items[0].tag.LodestonePos.Y set from entity @a[tag=compass_track,limit=1] Pos[1]
data modify block ~ 250 ~ Items[0].tag.LodestonePos.Z set from entity @a[tag=compass_track,limit=1] Pos[2]

execute as @p[tag=compass_next,nbt={Inventory:[{Slot:0b,id:"minecraft:compass"}]}] run loot replace entity @s hotbar.0 1 mine ~ 250 ~
execute as @p[tag=compass_next,nbt={Inventory:[{Slot:1b,id:"minecraft:compass"}]}] run loot replace entity @s hotbar.1 1 mine ~ 250 ~
execute as @p[tag=compass_next,nbt={Inventory:[{Slot:2b,id:"minecraft:compass"}]}] run loot replace entity @s hotbar.2 1 mine ~ 250 ~
execute as @p[tag=compass_next,nbt={Inventory:[{Slot:3b,id:"minecraft:compass"}]}] run loot replace entity @s hotbar.3 1 mine ~ 250 ~
execute as @p[tag=compass_next,nbt={Inventory:[{Slot:4b,id:"minecraft:compass"}]}] run loot replace entity @s hotbar.4 1 mine ~ 250 ~
execute as @p[tag=compass_next,nbt={Inventory:[{Slot:5b,id:"minecraft:compass"}]}] run loot replace entity @s hotbar.5 1 mine ~ 250 ~
execute as @p[tag=compass_next,nbt={Inventory:[{Slot:6b,id:"minecraft:compass"}]}] run loot replace entity @s hotbar.6 1 mine ~ 250 ~
execute as @p[tag=compass_next,nbt={Inventory:[{Slot:7b,id:"minecraft:compass"}]}] run loot replace entity @s hotbar.7 1 mine ~ 250 ~
execute as @p[tag=compass_next,nbt={Inventory:[{Slot:8b,id:"minecraft:compass"}]}] run loot replace entity @s hotbar.8 1 mine ~ 250 ~

tag @p[tag=compass_next] remove compass_update
tag @a remove compass_next
tag @a remove compass_track

execute as @p[tag=compass_update] run function survival_games:compass