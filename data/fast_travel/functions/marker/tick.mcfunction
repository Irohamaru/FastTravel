#カーソル合わせ時のTextとパーティクル
execute positioned as @e[tag=Marker,distance=..8] positioned ^ ^ ^1000 facing entity @s eyes positioned ^ ^ ^1000 run tag @e[tag=Marker,distance=..0.1] add TargetMarker

execute positioned as @e[tag=TargetMarker,distance=..8,limit=1,sort=nearest] run particle bubble_pop ~ ~ ~ 0 0 0 0 0 normal @s
execute positioned as @e[tag=TargetMarker,distance=..8,limit=1,sort=nearest] run summon area_effect_cloud ~ ~-0.7 ~ {CustomNameVisible:1b,Tags:[MarkerText,New],Duration:1}
data modify entity @e[tag=MarkerText,tag=New,distance=..8,limit=1] CustomName set from entity @e[tag=TargetMarker,distance=..8,limit=1,sort=nearest] CustomName
tag @e[tag=MarkerText,tag=New,distance=..8] remove New

tag @e[tag=TargetMarker,distance=..8] remove TargetMarker
