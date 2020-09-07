function fast_travel:marker/pin
execute if entity @e[type=item,nbt={Item:{id:"minecraft:filled_map"}},distance=..2] run function fast_travel:map_ui/open/main

scoreboard players reset @s FastTravel_Drop
