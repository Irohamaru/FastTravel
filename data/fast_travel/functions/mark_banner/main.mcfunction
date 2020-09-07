#マップID取得
execute if data entity @s {SelectedItem:{id:"minecraft:filled_map"}} store result score #Map FastTravel run data get entity @s SelectedItem.tag.map
execute unless data entity @s {SelectedItem:{id:"minecraft:filled_map"}} store result score #Map FastTravel run data get entity @s Inventory[{Slot:-106b}].tag.map

#ロード
scoreboard players operation _ OhMyDatID = #Map FastTravel
function oh_its_dat:please

data modify storage fast_travel: TempMark set value {}
data modify storage fast_travel: Marks set value []
data modify storage fast_travel: OldMarks set from storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].FastTravel.Marks

#バナー情報取得
scoreboard players set #Search FastTravel 0
execute anchored eyes positioned ^ ^ ^ anchored feet run function fast_travel:mark_banner/search
execute store result score #Success FastTravel if data storage fast_travel: TempMark.CustomName

#看板設置
execute in dimension:void run forceload add 2 2
execute in dimension:void run setblock 2 0 2 oak_sign
summon area_effect_cloud ~ ~ ~ {Tags:[MarkPos],Duration:1}

#TempMarkがすでにあれば除去 なければ追加
#座標JSONをMarkPosのTagsに入れて重複を確認
execute in dimension:void run data modify block 2 0 2 Text1 set value '[{"nbt":"TempMark.x","storage":"fast_travel:"},{"nbt":"TempMark.y","storage":"fast_travel:"},{"nbt":"TempMark.z","storage":"fast_travel:"}]'
execute as @e[tag=MarkPos,distance=..0.01,limit=1] in dimension:void run data modify entity @s Tags append from block 2 0 2 Text1

scoreboard players set #Duplicated FastTravel 0
execute if data storage fast_travel: OldMarks[0] run function fast_travel:mark_banner/check_duplicate
execute if score #Success FastTravel matches 1 if score #Duplicated FastTravel matches 0 run data modify storage fast_travel: Marks append from storage fast_travel: TempMark

#保存
data modify storage oh_my_dat: _[-4][-4][-4][-4][-4][-4][-4][-4].FastTravel.Marks set from storage fast_travel: Marks

#キャンセル用マーカー編集
execute store result entity @e[tag=Marker,tag=New,distance=..8,limit=1] Owner[0] int 1 run scoreboard players get #Map FastTravel
execute if score #Duplicated FastTravel matches 0 in dimension:void run data modify block 2 0 2 Text1 set value '[{"text":"q: 登録キャンセル(マップ"},{"score":{"name":"#Map","objective":"FastTravel"}},{"text":")"}]'
execute if score #Duplicated FastTravel matches 0 as @e[tag=Marker,tag=New,distance=..8] in dimension:void run data modify entity @s CustomName set from block 2 0 2 Text1
execute if score #Duplicated FastTravel matches 0 run data modify entity @e[tag=Marker,tag=New,distance=..8,limit=1] Particle set value "minecraft:dust 1 1 1 0.5"
execute if score #Duplicated FastTravel matches 1 in dimension:void run data modify block 2 0 2 Text1 set value '[{"text":"q: 再登録(マップ"},{"score":{"name":"#Map","objective":"FastTravel"}},{"text":")"}]'
execute if score #Duplicated FastTravel matches 1 as @e[tag=Marker,tag=New,distance=..8] in dimension:void run data modify entity @s CustomName set from block 2 0 2 Text1
execute if score #Duplicated FastTravel matches 1 run data modify entity @e[tag=Marker,tag=New,distance=..8,limit=1] Particle set value "minecraft:dust 1 1 0 0.5"
tag @e[tag=Marker,tag=New,distance=..8] remove New
#tellraw
execute if score #Success FastTravel matches 1 if score #Duplicated FastTravel matches 0 run tellraw @s [{"storage":"fast_travel:","nbt":"TempMark.x"},{"text":" "},{"storage":"fast_travel:","nbt":"TempMark.y"},{"text":" "},{"storage":"fast_travel:","nbt":"TempMark.z"},{"text":" をマップ"},{"score":{"name":"#Map","objective":"FastTravel"}},{"text":"に"},{"text":"登録しました","color":"aqua"}]
execute if score #Success FastTravel matches 1 if score #Duplicated FastTravel matches 1 run tellraw @s [{"storage":"fast_travel:","nbt":"TempMark.x"},{"text":" "},{"storage":"fast_travel:","nbt":"TempMark.y"},{"text":" "},{"storage":"fast_travel:","nbt":"TempMark.z"},{"text":" をマップ"},{"score":{"name":"#Map","objective":"FastTravel"}},{"text":"から"},{"text":"登録解除しました","color":"red"}]
execute if score #Success FastTravel matches 0 run tellraw @s {"text":"バナーを見つけられませんでした","color":"red"}
playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 0.5 1

#看板削除
execute in dimension:void run setblock 2 0 2 minecraft:air
execute in dimension:void run forceload remove 2 2
kill @e[tag=MarkPos,distance=..0.01]

advancement revoke @s only fast_travel:mark_banner
