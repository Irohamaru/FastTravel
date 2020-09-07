#バナー座標取得
execute store result score #X FastTravel run data get entity @s Owner[1]
execute store result score #Y FastTravel run data get entity @s Owner[2]
execute store result score #Z FastTravel run data get entity @s Owner[3]

#TP
summon area_effect_cloud ~ ~ ~ {Tags:[TeleportAEC],Duration:1}
data modify entity @e[tag=TeleportAEC,distance=..0.01,limit=1] Tags append from entity @s Tags[]
execute as @e[tag=TeleportAEC,distance=..0.01,limit=1] run function fast_travel:marker/teleport/1
#マップとマーカー消去
execute as @p[tag=MapPin] run function fast_travel:map_ui/close
#演出
execute at @p[tag=MapPin] run playsound minecraft:entity.enderman.teleport master @a ~ ~ ~
particle minecraft:portal ~ ~ ~ 0 0 0 1 100

execute positioned as @p[tag=MapPin] unless block ~ ~ ~ #minecraft:banners run function fast_travel:marker/teleport/missing_banner
