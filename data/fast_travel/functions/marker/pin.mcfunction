execute positioned as @e[tag=Marker,distance=..8] positioned ^ ^ ^1000 facing entity @s eyes positioned ^ ^ ^1000 run tag @e[tag=Marker,distance=..0.1] add TargetMarker
tag @s add MapPin

execute as @e[tag=TargetMarker,tag=TeleportMarker,distance=..8,limit=1,sort=nearest] positioned as @s run function fast_travel:marker/teleport/0
execute positioned as @e[tag=TargetMarker,tag=ScaleMarker,distance=..8,limit=1,sort=nearest] run function fast_travel:marker/scale
execute positioned as @e[tag=TargetMarker,tag=CloseMarker,distance=..8,limit=1,sort=nearest] run function fast_travel:map_ui/close
execute positioned as @e[tag=TargetMarker,tag=UndoMarker,distance=..8,limit=1,sort=nearest] run function fast_travel:mark_banner/undo

tag @e[tag=TargetMarker,distance=..8] remove TargetMarker
tag @s remove MapPin
