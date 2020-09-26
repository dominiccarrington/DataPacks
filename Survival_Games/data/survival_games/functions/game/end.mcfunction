####
# Survival Games
# By: RageGamingPE
####

scoreboard players set #InGame settings 0
kill @e[type=armor_stand,name="Center"]
scoreboard players set @a death 0

effect clear @a
team leave @a
gamemode survival @a

worldborder center 0 0
worldborder set 60000000

scoreboard objectives setdisplay sidebar settings

schedule clear survival_games:game/deathmatch
schedule clear survival_games:game/end
schedule clear survival_games:game/go
schedule clear survival_games:game/grace
schedule clear survival_games:game/ingame
schedule clear survival_games:game/main
schedule clear survival_games:game/update_sidebar