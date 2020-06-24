##Give Item
execute as @a[nbt={Inventory:[{id: "minecraft:endermite_spawn_egg", Count: 63b}]}] run tag @s add auto.item
execute as @a[tag=auto.item] run clear @s endermite_spawn_egg 63
execute as @a[tag=auto.item] run give @s minecraft:endermite_spawn_egg{display:{Name:"{\"text\":\"Spawn Auto\"}"},EntityTag:{NoGravity:0b,Silent:1b,Invulnerable:1b,PersistenceRequired:1b,NoAI:1b,Health:2f,Tags:["auto.spawn"],Attributes:[{Name:generic.maxHealth,Base:2}]}} 1
execute as @a[tag=auto.item] run tag @s remove auto.item

##Spawn car
execute as @e[tag=auto.spawn] at @s run tag @s add auto.sp
execute as @e[tag=auto.sp] at @s run summon armor_stand ~ ~ ~ {Small:1b,Marker:1b,Invulnerable:1b,Marker:0b,Invisible:1b,NoBasePlate:1b,PersistenceRequired:1b,Tags:["auto.car"],Passengers:[{id:"minecraft:minecart",Invulnerable:1b,Tags:["auto.car","inv"]}]}
execute as @e[tag=auto.sp] at @s run tp @s ~ ~-100 ~
execute as @e[tag=auto.sp] at @s run tag @s remove auto.sp

##Vorbereiten
execute as @a at @s unless entity @e[tag=auto.car,distance=..1] run scoreboard players reset @s auto.driver
execute as @a at @s if entity @e[tag=auto.car,distance=..1] unless score @s auto.driver matches 1 run scoreboard players set @s auto.driver 2
execute as @a[scores={auto.driver=2}] run scoreboard players set @s auto.motion 0
execute as @a[scores={auto.driver=2}] run scoreboard players set @s auto.motion.x 0
execute as @a[scores={auto.driver=2}] run scoreboard players set @s auto.motion.z 0
execute as @a[scores={auto.driver=2}] run scoreboard players set @s auto.motion.xn 0
execute as @a[scores={auto.driver=2}] run scoreboard players set @s auto.motion.xp 0
execute as @a[scores={auto.driver=2}] run scoreboard players set @s auto.motion.zn 0
execute as @a[scores={auto.driver=2}] run scoreboard players set @s auto.motion.zp 0
execute as @a[scores={auto.driver=2}] run scoreboard players set @s auto.break 0
execute as @a[scores={auto.driver=2}] store result score @s auto.hot.last run data get entity @s SelectedItemSlot
#execute as @a[scores={auto.driver=2}] run replaceitem entity @s hotbar.0 minecraft:player_head{display:{Name:"{\"text\":\"Go!\"}"},SkullOwner:{Id:"022af981-c544-465a-b7bf-4d4087f11166",Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvY2I0NWM1ZWI3OGRmZjZmYzQzZjdmOGUzOTg3Mjk0MTQ0MjJhOGViNmYzMTQ1MDVkZjhmZjlhMzNiZGQ2ZDEyZiJ9fX0="}]}}} 1
execute as @a[scores={auto.driver=2}] run scoreboard players set @s auto.driver 1

##TempeSet
#Standart
execute as @a[scores={auto.driver=1}] at @s as @e[type=minecraft:armor_stand,tag=auto.car,distance=..1.5] at @s unless block ~ ~-1 ~ minecraft:air unless block ~ ~-2 ~ #auto:up_fullblock unless block ~ ~-1 ~ #auto:up_fullblock unless block ~ ~ ~ #auto:up_slab unless block ~ ~-1 ~ #auto:up_slab unless block ~ ~-1 ~ #auto:streifen as @p[distance=..1.25] unless score @s auto.settempor matches 30 run scoreboard players set @s auto.settempor 30
#Blöcke

execute as @a[scores={auto.driver=1}] at @s as @e[type=minecraft:armor_stand,tag=auto.car,distance=..1.5] at @s if block ~ ~-1 ~ #auto:120 as @p[distance=..1.25] run scoreboard players set @s auto.settempor 120
execute as @a[scores={auto.driver=1}] at @s as @e[type=minecraft:armor_stand,tag=auto.car,distance=..1.5] at @s if block ~ ~-1 ~ #auto:170 as @p[distance=..1.25] run scoreboard players set @s auto.settempor 170
execute as @a[scores={auto.driver=1}] at @s as @e[type=minecraft:armor_stand,tag=auto.car,distance=..1.5] at @s if block ~ ~-1 ~ #auto:100 as @p[distance=..1.25] run scoreboard players set @s auto.settempor 100
execute as @a[scores={auto.driver=1}] at @s as @e[type=minecraft:armor_stand,tag=auto.car,distance=..1.5] at @s if block ~ ~-1 ~ #auto:200 as @p[distance=..1.25] run scoreboard players set @s auto.settempor 200
execute as @a[scores={auto.driver=1}] at @s as @e[type=minecraft:armor_stand,tag=auto.car,distance=..1.5] at @s if block ~ ~-1 ~ #auto:250 as @p[distance=..1.25] run scoreboard players set @s auto.settempor 250
execute as @a[scores={auto.driver=1}] at @s as @e[type=minecraft:armor_stand,tag=auto.car,distance=..1.5] at @s if block ~ ~-1 ~ #auto:300 as @p[distance=..1.25] run scoreboard players set @s auto.settempor 300

execute as @a[scores={auto.driver=1}] at @s as @e[type=minecraft:armor_stand,tag=auto.car,distance=..1.5] at @s if score @s auto.auto < @p[distance=..1.25] auto.settempor run scoreboard players operation @p[distance=..1.25] auto.settempor = @s auto.auto
execute as @a[scores={auto.driver=1}] at @s if score @s auto.settempor >= @s auto.tself run scoreboard players operation @s auto.settempo = @s auto.tself
execute as @a[scores={auto.driver=1}] at @s if score @s auto.settempor <= @s auto.tself run scoreboard players operation @s auto.tself = @s auto.settempor
execute as @a[scores={auto.driver=1}] at @s as @e[type=minecraft:armor_stand,tag=auto.car,distance=..1.5] at @s run scoreboard players operation @p[distance=..1.25] auto.settempo *= #2 auto.calc

##Bremsen
#Reset
execute as @a[scores={auto.driver=1,auto.break=1..}] at @s run scoreboard players remove @s auto.break 1
#Erkennen

#execute break
execute as @a[scores={auto.driver=1,auto.break=1..}] at @s run scoreboard players remove @s[scores={auto.motion=1..}] auto.motion 2

##Calculation

#Get Rotation
execute as @a[scores={auto.driver=1}] at @s store result score @s auto.facing run data get entity @s Rotation[0]
execute as @a[scores={auto.driver=1}] at @s if score @s auto.facing matches ..0 run scoreboard players add @s auto.facing 360
execute as @a[scores={auto.driver=1}] at @s store result score @s auto.fac run data get entity @s Rotation[0]

#Tempo bestimmen
execute as @a[scores={auto.driver=1}] at @s if score @s auto.motion < @s auto.settempo run scoreboard players add @s auto.motion 5
execute as @a[scores={auto.driver=1}] at @s unless score @s auto.break matches 1.. if score @s auto.motion > @s auto.settempo run scoreboard players remove @s auto.motion 2
execute as @a[scores={auto.driver=1,auto.motion.xp=1..}] at @s run scoreboard players set @s auto.motion.xp 0
execute as @a[scores={auto.driver=1,auto.motion.xn=..-1}] at @s run scoreboard players set @s auto.motion.xn 0
execute as @a[scores={auto.driver=1,auto.motion.zp=1..}] at @s run scoreboard players set @s auto.motion.zp 0
execute as @a[scores={auto.driver=1,auto.motion.zn=..-1}] at @s run scoreboard players set @s auto.motion.zn 0

#Blickausrichtung
#270..90
execute as @a[scores={auto.driver=1,auto.facing=271..360}] at @s run scoreboard players operation @s auto.calc = @s auto.facing
execute as @a[scores={auto.driver=1,auto.facing=271..360}] at @s run scoreboard players remove @s auto.calc 360
execute as @a[scores={auto.driver=1,auto.facing=271..360}] at @s run scoreboard players operation @s auto.calc *= #-1 auto.calc
execute as @a[scores={auto.driver=1,auto.facing=271..360}] at @s run scoreboard players operation @s auto.calc *= #100 auto.calc
execute as @a[scores={auto.driver=1,auto.facing=271..360}] at @s run scoreboard players operation @s auto.calc /= #90 auto.calc
execute as @a[scores={auto.driver=1,auto.facing=271..360}] at @s run scoreboard players remove @s auto.calc 100
execute as @a[scores={auto.driver=1,auto.facing=271..360}] at @s run scoreboard players operation @s auto.calc *= #-1 auto.calc
execute as @a[scores={auto.driver=1,auto.facing=271..360}] at @s run scoreboard players operation @s auto.motion.zp = @s auto.motion
execute as @a[scores={auto.driver=1,auto.facing=271..360}] at @s run scoreboard players operation @s auto.motion.zp *= @s auto.calc
execute as @a[scores={auto.driver=1,auto.facing=271..360}] at @s run scoreboard players operation @s auto.motion.zp /= #100 auto.calc
execute as @a[scores={auto.driver=1,auto.facing=1..90}] at @s run scoreboard players operation @s auto.calc = @s auto.facing
execute as @a[scores={auto.driver=1,auto.facing=1..90}] at @s run scoreboard players operation @s auto.calc *= #100 auto.calc
execute as @a[scores={auto.driver=1,auto.facing=1..90}] at @s run scoreboard players operation @s auto.calc /= #90 auto.calc
execute as @a[scores={auto.driver=1,auto.facing=1..90}] at @s run scoreboard players remove @s auto.calc 100
execute as @a[scores={auto.driver=1,auto.facing=1..90}] at @s run scoreboard players operation @s auto.calc *= #-1 auto.calc
execute as @a[scores={auto.driver=1,auto.facing=1..90}] at @s run scoreboard players operation @s auto.motion.zp = @s auto.motion
execute as @a[scores={auto.driver=1,auto.facing=1..90}] at @s run scoreboard players operation @s auto.motion.zp *= @s auto.calc
execute as @a[scores={auto.driver=1,auto.facing=1..90}] at @s run scoreboard players operation @s auto.motion.zp /= #100 auto.calc

#90..270
execute as @a[scores={auto.driver=1,auto.facing=90..270}] at @s run scoreboard players operation @s auto.calc = @s auto.facing
execute as @a[scores={auto.driver=1,auto.facing=90..270}] at @s run scoreboard players remove @s auto.calc 180
execute as @a[scores={auto.driver=1,auto.facing=90..180}] at @s run scoreboard players operation @s auto.calc *= #-1 auto.calc
execute as @a[scores={auto.driver=1,auto.facing=90..270}] at @s run scoreboard players operation @s auto.calc *= #100 auto.calc
execute as @a[scores={auto.driver=1,auto.facing=90..270}] at @s run scoreboard players operation @s auto.calc /= #90 auto.calc
execute as @a[scores={auto.driver=1,auto.facing=90..270}] at @s run scoreboard players remove @s auto.calc 100
execute as @a[scores={auto.driver=1,auto.facing=90..270}] at @s run scoreboard players operation @s auto.calc *= #-1 auto.calc
execute as @a[scores={auto.driver=1,auto.facing=90..270}] at @s run scoreboard players operation @s auto.motion.zn = @s auto.motion
execute as @a[scores={auto.driver=1,auto.facing=90..270}] at @s run scoreboard players operation @s auto.motion.zn *= @s auto.calc
execute as @a[scores={auto.driver=1,auto.facing=90..270}] at @s run scoreboard players operation @s auto.motion.zn /= #100 auto.calc
execute as @a[scores={auto.driver=1,auto.facing=90..270}] at @s run scoreboard players operation @s auto.motion.zn *= #-1 auto.calc

#1..180
execute as @a[scores={auto.driver=1,auto.facing=1..180}] at @s run scoreboard players operation @s auto.calc = @s auto.facing
execute as @a[scores={auto.driver=1,auto.facing=1..180}] at @s run scoreboard players remove @s auto.calc 90
execute as @a[scores={auto.driver=1,auto.facing=1..89}] at @s run scoreboard players operation @s auto.calc *= #-1 auto.calc
execute as @a[scores={auto.driver=1,auto.facing=1..180}] at @s run scoreboard players operation @s auto.calc *= #100 auto.calc
execute as @a[scores={auto.driver=1,auto.facing=1..180}] at @s run scoreboard players operation @s auto.calc /= #90 auto.calc
execute as @a[scores={auto.driver=1,auto.facing=1..180}] at @s run scoreboard players remove @s auto.calc 100
execute as @a[scores={auto.driver=1,auto.facing=1..180}] at @s run scoreboard players operation @s auto.calc *= #-1 auto.calc
execute as @a[scores={auto.driver=1,auto.facing=1..180}] at @s run scoreboard players operation @s auto.motion.xn = @s auto.motion
execute as @a[scores={auto.driver=1,auto.facing=1..180}] at @s run scoreboard players operation @s auto.motion.xn *= @s auto.calc
execute as @a[scores={auto.driver=1,auto.facing=1..180}] at @s run scoreboard players operation @s auto.motion.xn /= #100 auto.calc
execute as @a[scores={auto.driver=1,auto.facing=1..180}] at @s run scoreboard players operation @s auto.motion.xn *= #-1 auto.calc
#181..360
execute as @a[scores={auto.driver=1,auto.facing=181..360}] at @s run scoreboard players operation @s auto.calc = @s auto.facing
execute as @a[scores={auto.driver=1,auto.facing=181..360}] at @s run scoreboard players remove @s auto.calc 270
execute as @a[scores={auto.driver=1,auto.facing=181..269}] at @s run scoreboard players operation @s auto.calc *= #-1 auto.calc
execute as @a[scores={auto.driver=1,auto.facing=181..360}] at @s run scoreboard players operation @s auto.calc *= #100 auto.calc
execute as @a[scores={auto.driver=1,auto.facing=181..360}] at @s run scoreboard players operation @s auto.calc /= #90 auto.calc
execute as @a[scores={auto.driver=1,auto.facing=181..360}] at @s run scoreboard players remove @s auto.calc 100
execute as @a[scores={auto.driver=1,auto.facing=181..360}] at @s run scoreboard players operation @s auto.calc *= #-1 auto.calc
execute as @a[scores={auto.driver=1,auto.facing=181..360}] at @s run scoreboard players operation @s auto.motion.xp = @s auto.motion
execute as @a[scores={auto.driver=1,auto.facing=181..360}] at @s run scoreboard players operation @s auto.motion.xp *= @s auto.calc
execute as @a[scores={auto.driver=1,auto.facing=181..360}] at @s run scoreboard players operation @s auto.motion.xp /= #100 auto.calc

#Gleitmoment
execute as @a[scores={auto.driver=1,auto.motion.xp=1..}] at @s if score @s auto.motion.x < @s auto.motion.xp run scoreboard players add @s auto.motion.x 5
execute as @a[scores={auto.driver=1,auto.motion.zp=1..}] at @s if score @s auto.motion.z < @s auto.motion.zp run scoreboard players add @s auto.motion.z 5
execute as @a[scores={auto.driver=1,auto.motion.xp=1..}] at @s if score @s auto.motion.x > @s auto.motion.xp run scoreboard players remove @s auto.motion.x 5
execute as @a[scores={auto.driver=1,auto.motion.zp=1..}] at @s if score @s auto.motion.z > @s auto.motion.zp run scoreboard players remove @s auto.motion.z 5
execute as @a[scores={auto.driver=1,auto.motion.xn=..-1}] at @s if score @s auto.motion.x > @s auto.motion.xn run scoreboard players remove @s auto.motion.x 5
execute as @a[scores={auto.driver=1,auto.motion.zn=..-1}] at @s if score @s auto.motion.z > @s auto.motion.zn run scoreboard players remove @s auto.motion.z 5
execute as @a[scores={auto.driver=1,auto.motion.xn=..-1}] at @s if score @s auto.motion.x < @s auto.motion.xn run scoreboard players add @s auto.motion.x 5
execute as @a[scores={auto.driver=1,auto.motion.zn=..-1}] at @s if score @s auto.motion.z < @s auto.motion.zn run scoreboard players add @s auto.motion.z 5
execute as @a[scores={auto.driver=1,auto.motion.xp=1..}] at @s if score @s auto.motion.x < @s auto.motion.xp run scoreboard players add @s auto.motion.x 5
execute as @a[scores={auto.driver=1,auto.motion.zp=1..}] at @s if score @s auto.motion.z < @s auto.motion.zp run scoreboard players add @s auto.motion.z 5
execute as @a[scores={auto.driver=1,auto.motion.xp=1..}] at @s if score @s auto.motion.x > @s auto.motion.xp run scoreboard players remove @s auto.motion.x 5
execute as @a[scores={auto.driver=1,auto.motion.zp=1..}] at @s if score @s auto.motion.z > @s auto.motion.zp run scoreboard players remove @s auto.motion.z 5
execute as @a[scores={auto.driver=1,auto.motion.xn=..-1}] at @s if score @s auto.motion.x > @s auto.motion.xn run scoreboard players remove @s auto.motion.x 5
execute as @a[scores={auto.driver=1,auto.motion.zn=..-1}] at @s if score @s auto.motion.z > @s auto.motion.zn run scoreboard players remove @s auto.motion.z 5
execute as @a[scores={auto.driver=1,auto.motion.xn=..-1}] at @s if score @s auto.motion.x < @s auto.motion.xn run scoreboard players add @s auto.motion.x 5
execute as @a[scores={auto.driver=1,auto.motion.zn=..-1}] at @s if score @s auto.motion.z < @s auto.motion.zn run scoreboard players add @s auto.motion.z 5

#Tempo anwenden
execute as @a[scores={auto.driver=1,auto.motion=10..}] at @s unless score @s auto.motion.x matches 0 store result entity @e[tag=auto.car,type=minecraft:armor_stand,distance=..1.5,limit=1] Motion[0] double 0.005 run scoreboard players get @s auto.motion.x
execute as @a[scores={auto.driver=1,auto.motion=10..}] at @s unless score @s auto.motion.z matches 0 store result entity @e[tag=auto.car,type=minecraft:armor_stand,distance=..1.5,limit=1] Motion[2] double 0.005 run scoreboard players get @s auto.motion.z
execute if score #a auto.fac matches ..5 run scoreboard players add #a auto.fac 1
execute if score #a auto.fac matches 5.. run scoreboard players set #a auto.fac 0
execute as @a[scores={auto.driver=1}] at @s as @e[type=minecraft:armor_stand,tag=auto.car,distance=..1.5] at @s run scoreboard players operation @p[distance=..1.25] auto.settempo /= #2 auto.calc
execute as @a[scores={auto.driver=1}] at @s as @e[type=minecraft:armor_stand,tag=auto.car,distance=..1.5] at @s run scoreboard players operation @p[distance=..1.25] auto.tempo /= #2 auto.calc
execute if score #a auto.fac matches 4 as @a[scores={auto.driver=1}] at @s run title @s actionbar ["",{"score":{"name":"@s","objective":"auto.tempo"},"color":"gold"},{"text":" | ","color":"gold"},{"score":{"name":"@s","objective":"auto.settempor"},"color":"gold"},{"text":" | ","color":"gold"},{"score":{"name":"@s","objective":"auto.settempo"},"color":"gold"}]

#Tempo berechnen
execute as @a[scores={auto.driver=1}] at @s run scoreboard players set @s auto.tempo 0
execute as @a[scores={auto.driver=1,auto.motion.x=0..}] at @s run scoreboard players operation @s auto.tempo += @s auto.motion.x
execute as @a[scores={auto.driver=1,auto.motion.x=..-1}] at @s run scoreboard players operation @s auto.tempo -= @s auto.motion.x
execute as @a[scores={auto.driver=1,auto.motion.z=1..}] at @s run scoreboard players operation @s auto.tempo += @s auto.motion.z
execute as @a[scores={auto.driver=1,auto.motion.z=..-1}] at @s run scoreboard players operation @s auto.tempo -= @s auto.motion.z


execute as @a[scores={auto.driver=1}] at @s as @e[type=minecraft:armor_stand,distance=..1.5,tag=auto.car] at @s if block ~ ~ ~-1 #auto:up_fullblock if block ~ ~1 ~-1 air if score @a[sort=nearest,distance=..1.5,limit=1] auto.facing matches 135..225 store result entity @s Motion[1] double 0.3 run scoreboard players get #1 auto.calc
execute as @a[scores={auto.driver=1}] at @s as @e[type=minecraft:armor_stand,distance=..1.5,tag=auto.car] at @s if block ~ ~ ~-1 #auto:up_slab if block ~ ~1 ~-1 air if score @a[sort=nearest,distance=..1.5,limit=1] auto.facing matches 135..225 unless block ~ ~ ~ #auto:up_slab store result entity @s Motion[1] double 0.3 run scoreboard players get #1 auto.calc

execute as @a[scores={auto.driver=1}] at @s as @e[type=minecraft:armor_stand,distance=..1.5,tag=auto.car] at @s if block ~ ~ ~1 #auto:up_fullblock if block ~ ~1 ~1 air if score @a[sort=nearest,distance=..1.5,limit=1] auto.facing matches 315.. store result entity @s Motion[1] double 0.3 run scoreboard players get #1 auto.calc
execute as @a[scores={auto.driver=1}] at @s as @e[type=minecraft:armor_stand,distance=..1.5,tag=auto.car] at @s if block ~ ~ ~1 #auto:up_slab if block ~ ~1 ~1 air if score @a[sort=nearest,distance=..1.5,limit=1] auto.facing matches 315.. unless block ~ ~ ~ #auto:up_slab store result entity @s Motion[1] double 0.3 run scoreboard players get #1 auto.calc
execute as @a[scores={auto.driver=1}] at @s as @e[type=minecraft:armor_stand,distance=..1.5,tag=auto.car] at @s if block ~ ~ ~1 #auto:up_fullblock if block ~ ~1 ~1 air if score @a[sort=nearest,distance=..1.5,limit=1] auto.facing matches ..45 store result entity @s Motion[1] double 0.3 run scoreboard players get #1 auto.calc
execute as @a[scores={auto.driver=1}] at @s as @e[type=minecraft:armor_stand,distance=..1.5,tag=auto.car] at @s if block ~ ~ ~1 #auto:up_slab if block ~ ~1 ~1 air if score @a[sort=nearest,distance=..1.5,limit=1] auto.facing matches ..45 unless block ~ ~ ~ #auto:up_slab store result entity @s Motion[1] double 0.3 run scoreboard players get #1 auto.calc

execute as @a[scores={auto.driver=1}] at @s as @e[type=minecraft:armor_stand,distance=..1.5,tag=auto.car] at @s if block ~-1 ~ ~ #auto:up_fullblock if block ~-1 ~1 ~ air if score @a[sort=nearest,distance=..1.5,limit=1] auto.facing matches 45..135 store result entity @s Motion[1] double 0.3 run scoreboard players get #1 auto.calc
execute as @a[scores={auto.driver=1}] at @s as @e[type=minecraft:armor_stand,distance=..1.5,tag=auto.car] at @s if block ~-1 ~ ~ #auto:up_slab if block ~-1 ~1 ~ air if score @a[sort=nearest,distance=..1.5,limit=1] auto.facing matches 45..135 unless block ~ ~ ~ #auto:up_slab store result entity @s Motion[1] double 0.3 run scoreboard players get #1 auto.calc

execute as @a[scores={auto.driver=1}] at @s as @e[type=minecraft:armor_stand,distance=..1.5,tag=auto.car] at @s if block ~1 ~ ~ #auto:up_fullblock if block ~1 ~1 ~ air if score @a[sort=nearest,distance=..1.5,limit=1] auto.facing matches 225..315 store result entity @s Motion[1] double 0.3 run scoreboard players get #1 auto.calc
execute as @a[scores={auto.driver=1}] at @s as @e[type=minecraft:armor_stand,distance=..1.5,tag=auto.car] at @s if block ~1 ~ ~ #auto:up_slab if block ~1 ~1 ~ air if score @a[sort=nearest,distance=..1.5,limit=1] auto.facing matches 225..315 unless block ~ ~ ~ #auto:up_slab store result entity @s Motion[1] double 0.3 run scoreboard players get #1 auto.calc

execute as @a store result score @s auto.hot.now run data get entity @s SelectedItemSlot
execute as @a unless score @s auto.hot.now = @s auto.hot.last run scoreboard players operation @s auto.hot.now -= @s auto.hot.last
execute as @a unless score @s auto.hot.now = @s auto.hot.last run scoreboard players add @s auto.hot.now 100
execute as @a unless score @s auto.hot.now = @s auto.hot.last store result score @s auto.hot.last run data get entity @s SelectedItemSlot

execute as @a[scores={auto.driver=1,auto.hot.now=100..107}] if score @s auto.tself <= #300 auto.calc if score @s auto.settempor > @s auto.tself run scoreboard players add @s auto.tself 10
execute as @a[scores={auto.driver=1,auto.hot.now=92}] if score @s auto.tself <= #300 auto.calc if score @s auto.settempor > @s auto.tself run scoreboard players add @s auto.tself 10
execute as @a[scores={auto.driver=1,auto.hot.now=93..99}] if score @s auto.tself > #1 auto.calc run scoreboard players remove @s auto.tself 10
execute as @a[scores={auto.driver=1,auto.hot.now=93..99,auto.tself=-1..5}] run scoreboard players add @s auto.break 5
execute as @a[scores={auto.driver=1,auto.hot.now=108}] if score @s auto.tself > #1 auto.calc run scoreboard players remove @s auto.tself 10
execute as @a[scores={auto.driver=1,auto.hot.now=108,auto.tself=-1..5}] run scoreboard players add @s auto.break 5