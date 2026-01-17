# Помечаем себя, чтобы маркер знал, к кому лететь
tag @s add gs_target
scoreboard players operation #temp_id gs_id = @s gs_id

# 1. Сброс тегов поиска
tag @e[type=marker,tag=gs_tracker] remove found

# 2. Ищем СВОЙ маркер по ID
execute as @e[type=marker,tag=gs_tracker] if score @s gs_id = #temp_id gs_id run tag @s add found

# 3. Если нашли - телепортируем к себе
execute as @e[type=marker,tag=found] run tp @s @a[tag=gs_target,limit=1]

# 4. Если НЕ нашли - создаем новый
execute unless entity @e[type=marker,tag=found] run function grave_star:tracker/create

# Убираем метку с себя
tag @s remove gs_target