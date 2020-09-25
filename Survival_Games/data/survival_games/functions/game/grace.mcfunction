####
# Survival Games
# By: RageGamingPE
####

scoreboard players remove #GracePeriod settings 1

execute if score #GracePeriod settings matches 30 run tellraw @a {"text": "Grace Period ends in 30 seconds"}
execute if score #GracePeriod settings matches 10 run tellraw @a {"text": "Grace Period ends in 10 seconds"}
execute if score #GracePeriod settings matches 3 run tellraw @a {"text": "Grace Period ends in 3 seconds"}
execute if score #GracePeriod settings matches 2 run tellraw @a {"text": "Grace Period ends in 2 seconds"}
execute if score #GracePeriod settings matches 1 run tellraw @a {"text": "Grace Period ends in 1 second"}
execute if score #GracePeriod settings matches 0 run tellraw @a {"text": "Grace Period over. PVP is enabled!"}
execute if score #GracePeriod settings matches 0 run team modify Tribute friendlyFire true

execute if score #GracePeriod settings matches 1.. run schedule function survival_games:game/grace 1s