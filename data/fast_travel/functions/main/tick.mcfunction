execute as @a[scores={FastTravel_Drop=1..}] at @s run function fast_travel:main/drop
execute as @a at @s if entity @e[tag=Marker,distance=..8] run function fast_travel:marker/tick
