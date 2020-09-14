scoreboard objectives add od_withersKilled minecraft.killed:minecraft.wither {"text":"Withers Killed"}
scoreboard objectives add od_dragonsKilled minecraft.killed:minecraft.ender_dragon  {"text":"Dragons Murdered"}
scoreboard objectives add od_playersKilled playerKillCount {"text":"Players Killed"}

scoreboard objectives add objDisplayed dummy
scoreboard players set Timer objDisplayed 600
scoreboard players set Shown objDisplayed 0
scoreboard objectives setdisplay belowName od_withersKilled