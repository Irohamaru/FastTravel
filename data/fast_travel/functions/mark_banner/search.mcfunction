#前方にバナー探索
scoreboard players add #Search FastTravel 1
execute if block ^ ^ ^ #minecraft:banners run function fast_travel:mark_banner/save
execute if score #Search FastTravel matches ..60 unless block ^ ^ ^ #minecraft:banners positioned ^ ^ ^0.1 run function fast_travel:mark_banner/search
