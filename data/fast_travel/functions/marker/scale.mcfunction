#マップID取得
scoreboard players operation #ID FastTravel = @e[tag=TargetMarker,distance=..8,limit=1,sort=nearest] FastTravel
execute store result score #Map FastTravel run data get entity @e[tag=TargetMarker,distance=..8,limit=1,sort=nearest] Owner[0]
execute store result score #Scale FastTravel run data get entity @e[tag=TargetMarker,distance=..8,limit=1,sort=nearest] Owner[1]
#ロード
execute as @e[tag=FTMap,distance=..2] if score #ID FastTravel = @s FastTravel store result score #Facing FastTravel run data get entity @s Facing
scoreboard players operation _ OhMyDatID = #Map FastTravel
function oh_its_dat:please

data modify storage fast_travel: Marks set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].FastTravel.Marks

#スケール書き換え
execute store result storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].FastTravel.Scale int 1 run scoreboard players get #Scale FastTravel

#マーカー設置
kill @e[tag=TeleportMarker,distance=..2]
execute if data storage fast_travel: Marks[0] as @e[tag=FTMap,distance=..2] if score #ID FastTravel = @s FastTravel at @s run function fast_travel:map_ui/open/marker

#ピンをgive
execute if data entity @s SelectedItem run loot give @s loot fast_travel:map_pin
execute unless data entity @s SelectedItem run loot replace entity @s weapon.mainhand loot fast_travel:map_pin

kill @e[type=item,nbt={Item:{tag:{MapPin:1b}}}]
playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 0.5 2
