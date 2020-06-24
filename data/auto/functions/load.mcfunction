scoreboard objectives add auto.driver dummy
scoreboard objectives add auto.motion dummy
scoreboard objectives add auto.motion.x dummy
scoreboard objectives add auto.motion.z dummy
scoreboard objectives add auto.motion.zn dummy
scoreboard objectives add auto.motion.zp dummy
scoreboard objectives add auto.motion.xp dummy
scoreboard objectives add auto.motion.xn dummy
scoreboard objectives add auto.settempo dummy
scoreboard objectives add auto.settempor dummy
scoreboard objectives add auto.hot.now dummy
scoreboard objectives add auto.hot.last dummy
scoreboard objectives add auto.break dummy
scoreboard objectives add auto.facing dummy
scoreboard objectives add auto.calc dummy
scoreboard players set #-1 auto.calc -1
scoreboard players set #1 auto.calc 1
scoreboard players set #300 auto.calc 300
scoreboard players set #2 auto.calc 2
scoreboard players set #100 auto.calc 100
scoreboard players set #90 auto.calc 90
scoreboard objectives add auto.tempo dummy
scoreboard objectives add auto.auto dummy
scoreboard objectives add auto.tself dummy
scoreboard objectives add auto.tempoc dummy
scoreboard objectives add auto.fac dummy
scoreboard objectives add auto.foo dummy

execute as @a unless score @s auto.tself matches -100.. run scoreboard players set @s auto.tself 0
execute unless score #a auto.fac matches -100.. run scoreboard players set #a auto.fac 0
