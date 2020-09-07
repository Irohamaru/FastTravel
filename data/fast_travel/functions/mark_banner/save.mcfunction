data modify storage fast_travel: TempMark set from block ^ ^ ^ {}

execute if block ^ ^ ^ #fast_travel:red_banners run data merge storage fast_travel: {TempMark:{Particle:"minecraft:dust 1 0 0 0.3",BannerName:'{"text":"Red Banner"}'}}
execute if block ^ ^ ^ #fast_travel:orange_banners run data merge storage fast_travel: {TempMark:{Particle:"minecraft:dust 1 0.5 0 0.3",BannerName:'{"text":"Orange Banner"}'}}
execute if block ^ ^ ^ #fast_travel:yellow_banners run data merge storage fast_travel: {TempMark:{Particle:"minecraft:dust 1 1 0 0.3",BannerName:'{"text":"Yellow Banner"}'}}
execute if block ^ ^ ^ #fast_travel:lime_banners run data merge storage fast_travel: {TempMark:{Particle:"minecraft:dust 0 1 0 0.3",BannerName:'{"text":"Lime Banner"}'}}
execute if block ^ ^ ^ #fast_travel:green_banners run data merge storage fast_travel: {TempMark:{Particle:"minecraft:dust 0 0.7 0.3 0.3",BannerName:'{"text":"Green Banner"}'}}
execute if block ^ ^ ^ #fast_travel:cyan_banners run data merge storage fast_travel: {TempMark:{Particle:"minecraft:dust 0 1 0.8 0.3",BannerName:'{"text":"Cyan Banner"}'}}
execute if block ^ ^ ^ #fast_travel:light_blue_banners run data merge storage fast_travel: {TempMark:{Particle:"minecraft:dust 0 0.8 1 0.3",BannerName:'{"text":"Light Blue Banner"}'}}
execute if block ^ ^ ^ #fast_travel:blue_banners run data merge storage fast_travel: {TempMark:{Particle:"minecraft:dust 0 0 1 0.3",BannerName:'{"text":"Blue Banner"}'}}
execute if block ^ ^ ^ #fast_travel:purple_banners run data merge storage fast_travel: {TempMark:{Particle:"minecraft:dust 0.7 0 1 0.3",BannerName:'{"text":"Purple Banner"}'}}
execute if block ^ ^ ^ #fast_travel:magenta_banners run data merge storage fast_travel: {TempMark:{Particle:"minecraft:dust 1 0 1 0.3",BannerName:'{"text":"Magenta Banner"}'}}
execute if block ^ ^ ^ #fast_travel:pink_banners run data merge storage fast_travel: {TempMark:{Particle:"minecraft:dust 1 0 0.5 0.3",BannerName:'{"text":"Pink Banner"}'}}
execute if block ^ ^ ^ #fast_travel:brown_banners run data merge storage fast_travel: {TempMark:{Particle:"minecraft:dust 0.6 0 0.5 0.3",BannerName:'{"text":"Brown Banner"}'}}
execute if block ^ ^ ^ #fast_travel:white_banners run data merge storage fast_travel: {TempMark:{Particle:"minecraft:dust 1 1 1 0.3",BannerName:'{"text":"White Banner"}'}}
execute if block ^ ^ ^ #fast_travel:light_gray_banners run data merge storage fast_travel: {TempMark:{Particle:"minecraft:dust 0.7 0.7 0.7 0.3",BannerName:'{"text":"Light Gray Banner"}'}}
execute if block ^ ^ ^ #fast_travel:gray_banners run data merge storage fast_travel: {TempMark:{Particle:"minecraft:dust 0.4 0.4 0.4 0.3",BannerName:'{"text":"Gray Banner"}'}}
execute if block ^ ^ ^ #fast_travel:black_banners run data merge storage fast_travel: {TempMark:{Particle:"minecraft:dust 0 0 0 0.3",BannerName:'{"text":"Black Banner"}'}}

execute unless data storage fast_travel: TempMark.CustomName run data modify storage fast_travel: TempMark.CustomName set from storage fast_travel: TempMark.BannerName
data modify storage fast_travel: TempMark.Dimension set from entity @s Dimension

#キャンセル用マーカー召喚
execute align xyz run summon area_effect_cloud ~0.5 ~0.9 ~0.5 {Tags:[Marker,UndoMarker,New],Duration:200,Radius:0.5f,Owner:[I;0,0,0,0]}
