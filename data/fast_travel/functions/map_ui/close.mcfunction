scoreboard players operation #ID FastTravel = @e[tag=TargetMarker,distance=..8,limit=1,sort=nearest] FastTravel
#マップをgive
data modify storage fast_travel: Item set from entity @e[tag=FTMap,distance=..1.5,limit=1,sort=nearest] Item
execute in overworld run data modify block 0 3 0 Items[0] set from storage fast_travel: Item
execute if data entity @s SelectedItem in overworld run loot give @s mine 0 3 0
execute unless data entity @s SelectedItem in overworld run loot replace entity @s weapon.mainhand mine 0 3 0
#マップとマーカー消去
execute as @e[distance=..4] if score #ID FastTravel = @s FastTravel run kill @s
kill @e[type=item,nbt={Item:{tag:{MapPin:1b}}}]
execute unless entity @e[tag=FTMap,distance=..8] run clear @s redstone_torch{MapPin:1b}

playsound minecraft:item.book.page_turn master @s ~ ~ ~ 2 1
