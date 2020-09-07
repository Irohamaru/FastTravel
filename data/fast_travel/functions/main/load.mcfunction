scoreboard objectives add FastTravel dummy
execute unless score #-1 FastTravel matches -1 run function fast_travel:main/load_once
