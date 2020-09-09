scoreboard players operation #ID FastTravel = @e[tag=TargetMarker,distance=..8,limit=1,sort=nearest] FastTravel
#シュルカーボックス設置
execute in dimension:void run forceload add 2 2
execute in dimension:void run setblock 2 2 2 shulker_box

#マップをgive
execute as @e[tag=FTMap,distance=..2,limit=1,sort=nearest] in dimension:void run data modify block 2 2 2 Items append from entity @s Item
execute if data entity @s SelectedItem in dimension:void run loot give @s mine 2 2 2 debug_stick
execute unless data entity @s SelectedItem in dimension:void run loot replace entity @s weapon.mainhand mine 2 2 2 debug_stick

#シュルカーボックス削除
execute in dimension:void run setblock 2 2 2 minecraft:air
execute in dimension:void run forceload remove 2 2

#マップとマーカー消去
execute as @e[distance=..4] if score #ID FastTravel = @s FastTravel run kill @s
kill @e[type=item,nbt={Item:{tag:{MapPin:1b}}}]
execute unless entity @e[tag=FTMap,distance=..8] run clear @s redstone_torch{MapPin:1b}

playsound minecraft:item.book.page_turn master @s ~ ~ ~ 2 1
