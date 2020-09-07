#Tagsのappend前後の長さを比較する
execute store result score #LenBefore FastTravel run data get entity @e[tag=MarkPos,distance=..0.01,limit=1] Tags

#OldMarksの座標JSONをTagsに入れる
execute in dimension:void run data modify block 2 0 2 Text1 set value '[{"nbt":"OldMarks[-1].x","storage":"fast_travel:"},{"nbt":"OldMarks[-1].y","storage":"fast_travel:"},{"nbt":"OldMarks[-1].z","storage":"fast_travel:"}]'
execute as @e[tag=MarkPos,distance=..0.01,limit=1] in dimension:void run data modify entity @s Tags append from block 2 0 2 Text1

execute store result score #LenAfter FastTravel run data get entity @e[tag=MarkPos,distance=..0.01,limit=1] Tags

#重複しないものをMarksに移す
execute if score #LenBefore FastTravel = #LenAfter FastTravel run scoreboard players set #Duplicated FastTravel 1
execute unless score #LenBefore FastTravel = #LenAfter FastTravel run data modify storage fast_travel: Marks append from storage fast_travel: OldMarks[-1]

data remove storage fast_travel: OldMarks[-1]
execute if data storage fast_travel: OldMarks[0] run function fast_travel:mark_banner/check_duplicate
