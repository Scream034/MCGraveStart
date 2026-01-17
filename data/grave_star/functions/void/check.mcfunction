# @s = Маркер могилы (находится в пустоте)

# 1. Поиск игрока и проверка кровати
tag @a remove has_bed
execute as @a[tag=dying_victim,limit=1] if data entity @s SpawnX run tag @s add has_bed

# Если кровати нет — аварийный подъем на 0
execute unless entity @a[tag=has_bed] run tp @s ~ 0 ~
execute unless entity @a[tag=has_bed] run return 1

# 2. ЗАПИСЬ КООРДИНАТ В СКОРБОРД (Это сохранит их надежно)
# Мы считываем SpawnX (Integer) в переменную скорборда
execute as @a[tag=has_bed,limit=1] store result score #void_x gs_math run data get entity @s SpawnX
execute as @a[tag=has_bed,limit=1] store result score #void_y gs_math run data get entity @s SpawnY
execute as @a[tag=has_bed,limit=1] store result score #void_z gs_math run data get entity @s SpawnZ

# 3. ОПРЕДЕЛЕНИЕ ИЗМЕРЕНИЯ
tag @s add dest_overworld
execute as @a[tag=has_bed,limit=1] if data entity @s {SpawnDimension:"minecraft:the_nether"} run tag @s remove dest_overworld
execute as @a[tag=has_bed,limit=1] if data entity @s {SpawnDimension:"minecraft:the_nether"} run tag @s add dest_nether
execute as @a[tag=has_bed,limit=1] if data entity @s {SpawnDimension:"minecraft:the_end"} run tag @s remove dest_overworld
execute as @a[tag=has_bed,limit=1] if data entity @s {SpawnDimension:"minecraft:the_end"} run tag @s add dest_end

# 4. СМЕНА ИЗМЕРЕНИЯ (ТЕЛЕПОРТАЦИЯ)
# Летим во временную точку в нужном мире
execute if entity @s[tag=dest_overworld] in minecraft:overworld run tp @s ~ 300 ~
execute if entity @s[tag=dest_nether] in minecraft:the_nether run tp @s ~ 300 ~
execute if entity @s[tag=dest_end] in minecraft:the_end run tp @s ~ 300 ~

# 5. КОНВЕРТАЦИЯ ИЗ СКОРБОРДА В ПОЗИЦИЮ (Магия типов)
# 'double 1' заставляет игру превратить число из скорборда в Double
execute store result entity @s Pos[0] double 1 run scoreboard players get #void_x gs_math
execute store result entity @s Pos[1] double 1 run scoreboard players get #void_y gs_math
execute store result entity @s Pos[2] double 1 run scoreboard players get #void_z gs_math

# Небольшая коррекция, чтобы не застрять в кровати (+1 блок вверх)
execute at @s run tp @s ~ ~1 ~

# Чистка тегов
tag @s remove dest_overworld
tag @s remove dest_nether
tag @s remove dest_end