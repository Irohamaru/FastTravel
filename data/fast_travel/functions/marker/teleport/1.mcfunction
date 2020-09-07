execute store result entity @s Pos[0] double 1 run scoreboard players get #X FastTravel
execute store result entity @s Pos[1] double 1 run scoreboard players get #Y FastTravel
execute store result entity @s Pos[2] double 1 run scoreboard players get #Z FastTravel

execute positioned as @s run function fast_travel:marker/teleport/dimension

kill @s
