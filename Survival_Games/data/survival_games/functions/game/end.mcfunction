####
# Survival Games
# By: RageGamingPE
####

scoreboard players set #InGame settings 0
kill @e[type=armor_stand,name="Center"]

effect clear @a
team leave @a
gamemode survival @a

worldborder center 0 0
worldborder set 60000000

schedule clear survival_games:game/deathmatch
schedule clear survival_games:game/end
schedule clear survival_games:game/go
schedule clear survival_games:game/grace
schedule clear survival_games:game/main