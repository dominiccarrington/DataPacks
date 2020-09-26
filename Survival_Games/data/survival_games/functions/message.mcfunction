####
# Survival Games
# By: RageGamingPE
####

tellraw @a [{"text":"Join: ","bold":false,"italic":false,"underline":false,"strikethrough":false,"obfuscated":false,"color":"white"},{"text":"[Tributes]","bold":false,"italic":false,"underline":false,"strikethrough":false,"obfuscated":false,"color":"white","clickEvent":{"action":"run_command","value":"/trigger action set 101"}},{"text":" | ","bold":false,"italic":false,"underline":false,"strikethrough":false,"obfuscated":false,"color":"white"},{"text":"[Spectators]","bold":false,"italic":false,"underline":false,"strikethrough":false,"obfuscated":false,"color":"white","clickEvent":{"action":"run_command","value":"/trigger action set 102"}}]

schedule function survival_games:message 10s