#マーカー召喚
execute if score #Facing FastTravel matches 2 align xy run summon area_effect_cloud ~1 ~1 ~ {Tags:[MarkerPos,New],Duration:1}
execute if score #Facing FastTravel matches 3 align xy run summon area_effect_cloud ~ ~1 ~ {Tags:[MarkerPos,New],Duration:1}
execute if score #Facing FastTravel matches 4 align yz run summon area_effect_cloud ~ ~1 ~ {Tags:[MarkerPos,New],Duration:1}
execute if score #Facing FastTravel matches 5 align yz run summon area_effect_cloud ~ ~1 ~1 {Tags:[MarkerPos,New],Duration:1}
#座標取得 *2048倍
execute if score #Facing FastTravel matches 2..3 store result score #X FastTravel run data get entity @e[tag=MarkerPos,tag=New,distance=..2,limit=1] Pos[0] 2048
execute store result score #Y FastTravel run data get entity @e[tag=MarkerPos,tag=New,distance=..2,limit=1] Pos[1] 2048
execute if score #Facing FastTravel matches 4..5 store result score #Z FastTravel run data get entity @e[tag=MarkerPos,tag=New,distance=..2,limit=1] Pos[2] 2048

#マーカーの補正座標計算
execute store result score #Xd FastTravel run data get storage fast_travel: Marks[-1].x
execute store result score #Zd FastTravel run data get storage fast_travel: Marks[-1].z

execute if score #Scale FastTravel matches 0 run function fast_travel:map_ui/open/scale/0
execute if score #Scale FastTravel matches 1 run function fast_travel:map_ui/open/scale/1
execute if score #Scale FastTravel matches 2 run function fast_travel:map_ui/open/scale/2
execute if score #Scale FastTravel matches 3 run function fast_travel:map_ui/open/scale/3
execute if score #Scale FastTravel matches 4 run function fast_travel:map_ui/open/scale/4


execute if score #Facing FastTravel matches 3 run scoreboard players operation #Xd FastTravel *= #-1 FastTravel
execute if score #Facing FastTravel matches 4 run scoreboard players operation #Xd FastTravel *= #-1 FastTravel

#合算
execute if score #Facing FastTravel matches 2..3 run scoreboard players operation #X FastTravel -= #Xd FastTravel
scoreboard players operation #Y FastTravel -= #Zd FastTravel
execute if score #Facing FastTravel matches 4..5 run scoreboard players operation #Z FastTravel -= #Xd FastTravel
#代入
execute if score #Facing FastTravel matches 2..3 store result entity @e[tag=MarkerPos,tag=New,distance=..2,limit=1] Pos[0] double 0.00048828125 run scoreboard players get #X FastTravel
execute store result entity @e[tag=MarkerPos,tag=New,distance=..2,limit=1] Pos[1] double 0.00048828125 run scoreboard players get #Y FastTravel
execute if score #Facing FastTravel matches 4..5 store result entity @e[tag=MarkerPos,tag=New,distance=..2,limit=1] Pos[2] double 0.00048828125 run scoreboard players get #Z FastTravel

#表示用AEC召喚
execute positioned as @e[tag=MarkerPos,tag=New,distance=..2,limit=1] run summon area_effect_cloud ^ ^ ^0.1 {Tags:[Marker,TeleportMarker,New],Duration:2100000000,Radius:0.01f,Owner:[I;0,0,0,0]}
data modify entity @e[tag=Marker,tag=New,distance=..2,limit=1] Particle set from storage fast_travel: Marks[-1].Particle
data modify entity @e[tag=Marker,tag=New,distance=..2,limit=1] CustomName set from storage fast_travel: Marks[-1].CustomName
data modify entity @e[tag=Marker,tag=New,distance=..2,limit=1] Tags append from storage fast_travel: Marks[-1].Dimension
#バナーPos代入
data modify entity @e[tag=Marker,tag=New,distance=..2,limit=1] Owner[1] set from storage fast_travel: Marks[-1].x
data modify entity @e[tag=Marker,tag=New,distance=..2,limit=1] Owner[2] set from storage fast_travel: Marks[-1].y
data modify entity @e[tag=Marker,tag=New,distance=..2,limit=1] Owner[3] set from storage fast_travel: Marks[-1].z

kill @e[tag=MarkerPos,tag=New,distance=..2]

data remove storage fast_travel: Marks[-1]
execute if data storage fast_travel: Marks[0] run function fast_travel:map_ui/open/marker
