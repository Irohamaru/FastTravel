#ID更新
scoreboard players add #GlobalID FastTravel 1

#マップID取得 個数-1
execute store result score #Map FastTravel run data get entity @e[type=item,nbt={Item:{id:"minecraft:filled_map"}},distance=..2,limit=1] Item.tag.map
execute store result score #Count FastTravel run data get entity @e[type=item,nbt={Item:{id:"minecraft:filled_map"}},distance=..2,limit=1] Item.Count
scoreboard players remove #Count FastTravel 1
execute store result entity @e[type=item,nbt={Item:{id:"minecraft:filled_map"}},distance=..2,limit=1] Item.Count byte 1 run scoreboard players get #Count FastTravel

#item_frame設置
execute if entity @s[y_rotation=-45..45] rotated ~ 0 run summon minecraft:item_frame ^ ^1 ^1 {Tags:[FTMap,New],Item:{id:"minecraft:filled_map",Count:1b},Fixed:1b,Facing:2}
execute if entity @s[y_rotation=45..135] rotated ~ 0 run summon minecraft:item_frame ^ ^1 ^1 {Tags:[FTMap,New],Item:{id:"minecraft:filled_map",Count:1b},Fixed:1b,Facing:5}
execute if entity @s[y_rotation=135..-135] rotated ~ 0 run summon minecraft:item_frame ^ ^1 ^1 {Tags:[FTMap,New],Item:{id:"minecraft:filled_map",Count:1b},Fixed:1b,Facing:3}
execute if entity @s[y_rotation=-135..-45] rotated ~ 0 run summon minecraft:item_frame ^ ^1 ^1 {Tags:[FTMap,New],Item:{id:"minecraft:filled_map",Count:1b},Fixed:1b,Facing:4}
execute store result entity @e[tag=FTMap,tag=New,distance=..4,limit=1] Item.tag.map int 1 run scoreboard players get #Map FastTravel

#ロード
execute store result score #Facing FastTravel run data get entity @e[tag=FTMap,tag=New,distance=..4,limit=1] Facing
scoreboard players operation _ OhMyDatID = #Map FastTravel
function oh_its_dat:please

execute store result score #Scale FastTravel run data get storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].FastTravel.Scale
data modify storage fast_travel: Marks set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].FastTravel.Marks

#マーカー設置
execute if data storage fast_travel: Marks[0] at @e[tag=FTMap,tag=New,distance=..4,limit=1] run function fast_travel:map_ui/open/marker
#Scale変更マーカー
execute at @e[tag=FTMap,tag=New,distance=..4,limit=1] run summon area_effect_cloud ^-0.4 ^0.6 ^ {CustomName:'{"text":"Scale 0"}',Tags:[Marker,ScaleMarker,New],Particle:"minecraft:dust 1 0 0 0.3",Duration:2100000000,Radius:0.01f,Owner:[I;0,0,0,0]}
execute at @e[tag=FTMap,tag=New,distance=..4,limit=1] run summon area_effect_cloud ^-0.2 ^0.6 ^ {CustomName:'{"text":"Scale 1"}',Tags:[Marker,ScaleMarker,New],Particle:"minecraft:dust 1 0.5 0 0.3",Duration:2100000000,Radius:0.01f,Owner:[I;0,1,0,0]}
execute at @e[tag=FTMap,tag=New,distance=..4,limit=1] run summon area_effect_cloud ^ ^0.6 ^ {CustomName:'{"text":"Scale 2"}',Tags:[Marker,ScaleMarker,New],Particle:"minecraft:dust 1 1 0 0.3",Duration:2100000000,Radius:0.01f,Owner:[I;0,2,0,0]}
execute at @e[tag=FTMap,tag=New,distance=..4,limit=1] run summon area_effect_cloud ^0.2 ^0.6 ^ {CustomName:'{"text":"Scale 3"}',Tags:[Marker,ScaleMarker,New],Particle:"minecraft:dust 0 1 0 0.3",Duration:2100000000,Radius:0.01f,Owner:[I;0,3,0,0]}
execute at @e[tag=FTMap,tag=New,distance=..4,limit=1] run summon area_effect_cloud ^0.4 ^0.6 ^ {CustomName:'{"text":"Scale 4"}',Tags:[Marker,ScaleMarker,New],Particle:"minecraft:dust 0 0.8 1 0.3",Duration:2100000000,Radius:0.01f,Owner:[I;0,4,0,0]}
execute as @e[tag=ScaleMarker,tag=New] store result entity @s Owner[0] int 1 run scoreboard players get #Map FastTravel

#Closeマーカー
execute at @e[tag=FTMap,tag=New,distance=..4,limit=1] run summon area_effect_cloud ^0.4 ^0.8 ^ {CustomName:'{"text":"Close"}',Tags:[Marker,CloseMarker,New],Particle:"minecraft:dust 0.4 0.4 0.4 0.3",Duration:2100000000,Radius:0.01f}

#ピンをgive
execute if data entity @s SelectedItem run loot give @s loot fast_travel:map_pin
execute unless data entity @s SelectedItem run loot replace entity @s weapon.mainhand loot fast_travel:map_pin

#IDセット
scoreboard players operation @e[tag=New,distance=..4] FastTravel = #GlobalID FastTravel
tag @e[tag=New,distance=..4] remove New
