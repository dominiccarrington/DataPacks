####
# Survival Games
# By: RageGamingPE
####

effect clear @a
tellraw @a {"text": "Go Go Go!"}

execute if score GracePeriod settings matches 1.. run function survival_games:game/grace
execute if score GracePeriod settings matches 0 run team modify Tribute friendlyFire true
function survival_games:game/main