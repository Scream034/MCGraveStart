tag @s add gs_processing

# 1. СЧИТАЕМ ОПЫТ (ВЫСАСЫВАЕМ ВСЁ)
scoreboard players set @s gs_math 0
function grave_star:calc/drain_xp

# 2. СОХРАНЯЕМ ИСХОДНОЕ ЗНАЧЕНИЕ (Для красоты в чате/голограмме)
scoreboard players operation @s gs_info = @s gs_math

# 3. ПРИМЕНЯЕМ ШТРАФ (МАТЕМАТИКА)
# Формула: (Опыт * Процент) / 100
scoreboard players operation @s gs_math *= #xp_percent gs_config
scoreboard players operation @s gs_math /= #const_100 gs_config

# Сообщение в чат с деталями
tellraw @s ["",{"text":"[Grave] ","color":"red"},{"text":"XP was: ","color":"gray"},{"score":{"name":"@s","objective":"gs_info"},"color":"gray"},{"text":" -> Saved: ","color":"green"},{"score":{"name":"@s","objective":"gs_math"},"color":"green"},{"text":" pts.","color":"green"}]

# 4. Спавн могилы
scoreboard players operation #dead_id gs_id = @s gs_id

execute as @e[type=marker,tag=gs_tracker] if score @s gs_id = #dead_id gs_id at @s run function grave_star:spawn_grave_logic
execute as @e[type=marker,tag=gs_tracker] if score @s gs_id = #dead_id gs_id run kill @s

# Чистка
clear @s
scoreboard players set @s gs_death 0
tag @s remove gs_processing