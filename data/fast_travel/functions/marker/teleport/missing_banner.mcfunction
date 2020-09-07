#キャンセル用マーカー召喚
execute align xyz run summon area_effect_cloud ~0.5 ~0.9 ~0.5 {Tags:[Marker,UndoMarker,New],Duration:200,Particle:"block air",Radius:0.5f,Particle:"minecraft:dust 1 1 1 0.5",Owner:[I;0,0,0,0]}
#看板設置
execute in dimension:void run forceload add 2 2
execute in dimension:void run setblock 2 0 2 oak_sign
#キャンセル用マーカー編集
execute store result entity @e[tag=Marker,tag=New,distance=..8,limit=1] Owner[0] int 1 run scoreboard players get #Map FastTravel
execute in dimension:void run data modify block 2 0 2 Text1 set value '[{"text":"q: 登録キャンセル(マップ"},{"score":{"name":"#Map","objective":"FastTravel"}},{"text":")"}]'
execute as @e[tag=Marker,tag=New,distance=..8] in dimension:void run data modify entity @s CustomName set from block 2 0 2 Text1
#看板削除
execute in dimension:void run setblock 2 0 2 minecraft:air
execute in dimension:void run forceload remove 2 2
