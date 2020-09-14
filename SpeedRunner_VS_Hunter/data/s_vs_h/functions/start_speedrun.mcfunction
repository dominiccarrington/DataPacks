####
# SpeedRunner Vs Hunter
# By: 3boood_pro & RageGamingPE
####

spawnpoint @a ~ ~ ~
time set 0
weather clear 24000

team leave @a
team join Hunter @a

tag @a[limit=1,scores={speedrunner=1}] add SpeedRunner
team leave @a[tag=SpeedRunner]
team join SpeedRunner @a[tag=SpeedRunner]
tag @a[tag=SpeedRunner] remove SpeedRunner

spreadplayers ~ ~ 20 30 true @a[team=Hunter]
spreadplayers ~ ~ 20 30 true @a[team=SpeedRunner]

effect give @a minecraft:saturation 10 255 true
effect give @a minecraft:regeneration 10 255 true

clear @a

effect give @a[team=Hunter] minecraft:slowness 10 255 true
effect give @a[team=Hunter] minecraft:jump_boost 10 207 true

advancement revoke @a everything
give @a[team=Hunter] minecraft:compass{LodestoneTracked:0,LodestoneDimension:"minecraft:overworld"} 1

tellraw @a [{"text":"[","color":"dark_green","bold":true,"italic":true},{"text":"SpeedRunner VS Hunter","color":"dark_purple","bold":true,"italic":true},{"text":"]","color":"dark_green","bold":true,"italic":true},{"text":">","color":"green","bold":true,"italic":true},{"text":" GO! GO! GO!","color":"dark_blue","bold":true,"italic":true}]