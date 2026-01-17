# @s = Маркер могилы (находится в пустоте)

# tellraw @a[tag=dying_victim] {"text":"[DEBUG] > Начало проверки (Void Fix)...","color":"aqua"}

# --- 1. ЗАГРУЗКА ГЛОБАЛЬНОГО СПАВНА ---
# Сначала копируем координаты из конфига (которые мы задали через set_spawn)
# По умолчанию считаем, что глобальный спавн в Overworld
tag @s add dest_overworld
scoreboard players operation #void_x gs_math = #global_x gs_config
scoreboard players operation #void_y gs_math = #global_y gs_config
scoreboard players operation #void_z gs_math = #global_z gs_config

# --- 2. ПРОВЕРКА ЛИЧНОЙ КРОВАТИ ---
# Проверяем, есть ли у игрока личная кровать/якорь
tag @a remove has_bed
execute as @a[tag=dying_victim,limit=1] if data entity @s SpawnX run tag @s add has_bed

# Логика сообщений
# execute unless entity @a[tag=has_bed] run tellraw @a[tag=dying_victim] {"text":"[DEBUG] > Личный спавн не найден. Используем серверный спавн.","color":"yellow"}
# execute if entity @a[tag=has_bed] run tellraw @a[tag=dying_victim] {"text":"[DEBUG] > Найден личный спавн. Переписываем координаты.","color":"green"}

# --- 3. ПЕРЕЗАПИСЬ КООРДИНАТ (Если кровать есть) ---
# Если личная кровать есть, она важнее глобального спавна. Переписываем переменные #void_
execute as @a[tag=has_bed,limit=1] store result score #void_x gs_math run data get entity @s SpawnX
execute as @a[tag=has_bed,limit=1] store result score #void_y gs_math run data get entity @s SpawnY
execute as @a[tag=has_bed,limit=1] store result score #void_z gs_math run data get entity @s SpawnZ

# --- 4. ОПРЕДЕЛЕНИЕ ИЗМЕРЕНИЯ (Если кровать есть) ---
# Если мы летим на кровать, нужно узнать её измерение.
# Если летим на глобальный спавн - оставляем Overworld (по умолчанию).
execute as @a[tag=has_bed,limit=1] if data entity @s {SpawnDimension:"minecraft:the_nether"} run tag @s remove dest_overworld
execute as @a[tag=has_bed,limit=1] if data entity @s {SpawnDimension:"minecraft:the_nether"} run tag @s add dest_nether

execute as @a[tag=has_bed,limit=1] if data entity @s {SpawnDimension:"minecraft:the_end"} run tag @s remove dest_overworld
execute as @a[tag=has_bed,limit=1] if data entity @s {SpawnDimension:"minecraft:the_end"} run tag @s add dest_end

# --- 5. ТЕЛЕПОРТАЦИЯ В НУЖНЫЙ МИР ---
execute if entity @s[tag=dest_overworld] in minecraft:overworld run tp @s ~ 300 ~
execute if entity @s[tag=dest_nether] in minecraft:the_nether run tp @s ~ 300 ~
execute if entity @s[tag=dest_end] in minecraft:the_end run tp @s ~ 300 ~

# tellraw @a[tag=dying_victim] {"text":"[DEBUG] > Измерение применено. Устанавливаем координаты...","color":"aqua"}

# --- 6. ПРИМЕНЕНИЕ КООРДИНАТ ---
# Берем итоговые числа (Глобал или Кровать) и ставим могиле
execute store result entity @s Pos[0] double 1 run scoreboard players get #void_x gs_math
execute store result entity @s Pos[1] double 1 run scoreboard players get #void_y gs_math
execute store result entity @s Pos[2] double 1 run scoreboard players get #void_z gs_math

# Небольшая коррекция (+1 блок)
execute at @s run tp @s ~ ~1 ~

# tellraw @a[tag=dying_victim] {"text":"[DEBUG] > Финиш. Могила спасена.","color":"gold"}

# Чистка тегов
tag @s remove dest_overworld
tag @s remove dest_nether
tag @s remove dest_end