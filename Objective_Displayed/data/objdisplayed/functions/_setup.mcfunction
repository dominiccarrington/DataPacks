scoreboard objectives add withersKilled minecraft.killed:minecraft.wither {"text":"Withers Killed"}
scoreboard objectives add dragonsKilled minecraft.killed:minecraft.ender_dragon  {"text":"Dragons Murdered"}
scoreboard objectives add playersKilled playerKillCount {"text":"Players Killed"}

scoreboard objectives add objDisplayed dummy
scoreboard players set Timer objDisplayed 600
scoreboard players set Shown objDisplayed 0
scoreboard objectives setdisplay belowName withersKilled