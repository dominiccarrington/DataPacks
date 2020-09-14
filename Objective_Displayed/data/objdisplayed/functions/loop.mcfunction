scoreboard players remove Timer objDisplayed 1

execute if score Timer objDisplayed matches ..0 if score Shown objDisplayed matches 0 run scoreboard objectives setdisplay belowName od_dragonsKilled
execute if score Timer objDisplayed matches ..0 if score Shown objDisplayed matches 0 run scoreboard players set Shown objDisplayed 101

execute if score Timer objDisplayed matches ..0 if score Shown objDisplayed matches 1 run scoreboard objectives setdisplay belowName od_withersKilled
execute if score Timer objDisplayed matches ..0 if score Shown objDisplayed matches 1 run scoreboard players set Shown objDisplayed 102

execute if score Timer objDisplayed matches ..0 if score Shown objDisplayed matches 2 run scoreboard objectives setdisplay belowName od_playersKilled
execute if score Timer objDisplayed matches ..0 if score Shown objDisplayed matches 2 run scoreboard players set Shown objDisplayed 100

execute if score Timer objDisplayed matches ..0 run scoreboard players set Timer objDisplayed 600
execute if score Shown objDisplayed matches 100 run scoreboard players set Shown objDisplayed 0
execute if score Shown objDisplayed matches 101 run scoreboard players set Shown objDisplayed 1
execute if score Shown objDisplayed matches 102 run scoreboard players set Shown objDisplayed 2