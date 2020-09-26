####
# Survival Games
# By: RageGamingPE
####

scoreboard players set #InGame settings 1
schedule clear survival_games:message

# Nuke everything from everyone
time set 0
effect clear @a
xp set @a 0
clear @a
advancement revoke @a everything

# Setup timers
scoreboard players operation #GracePeriod settings = GracePeriod settings
scoreboard players operation #GracePeriod settings *= #60 settings

scoreboard players operation #TimeLimit settings = TimeLimit settings
scoreboard players operation #TimeLimit settings *= #60 settings

scoreboard objectives setdisplay sidebar ingame

# Join players to Tribute, apart from players that want to spectate
team join Tribute @a[team=!Spectator]

# Define a center point of the world, should allow for the game to be played in the same world multiple times
tag @r[team=Tribute] add primary
spreadplayers 0 0 10000 1000000 false @a[tag=primary]
execute as @p[tag=primary] run summon minecraft:armor_stand ~ ~ ~ {NoGravity:1,CustomName:'"Center"'}
tag @a remove primary
execute as @e[type=armor_stand,name="Center",limit=1] run spawnpoint @a

# Teleport all players to new spawn
teleport @a @e[type=armor_stand,name="Center",limit=1]
effect give @a[team=Tribute] minecraft:regeneration 10 255 true
effect give @a[team=Tribute] minecraft:saturation 10 255 true
effect give @a[team=Tribute] minecraft:mining_fatigue 10 255 true
effect give @a[team=Tribute] minecraft:slowness 10 255 true
effect give @a[team=Tribute] minecraft:jump_boost 10 129 true
title @a subtitle {"text": "10 seconds"}
title @a title {"text": "Game Begins In:"}
team modify Tribute friendlyFire false
schedule function survival_games:game/go 10s