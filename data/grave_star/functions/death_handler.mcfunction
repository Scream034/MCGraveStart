tag @s add gs_processing
tag @s add dying_victim

# 1. Подсчет и Штраф Опыта (Ваша логика)
scoreboard players set @s gs_math 0
function grave_star:calc/drain_xp
scoreboard players operation @s gs_info = @s gs_math
scoreboard players operation @s gs_math *= #xp_percent gs_config
scoreboard players operation @s gs_math /= #const_100 gs_config

tellraw @s ["",{"text":"[Grave] ","color":"red"},{"text":"XP Saved: ","color":"green"},{"score":{"name":"@s","objective":"gs_math"},"color":"green"},{"text":" pts.","color":"green"}]

# 2. Поиск маркера смерти
scoreboard players operation #dead_id gs_id = @s gs_id

# Снимаем тег цели со всех маркеров
tag @e[type=marker,tag=gs_tracker] remove target_marker
# Ставим тег только на МОЙ маркер
execute as @e[type=marker,tag=gs_tracker] if score @s gs_id = #dead_id gs_id run tag @s add target_marker

# 3. Запуск спавна могилы
# Если маркера нет (баг?), спавним на игроке (аварийный вариант)
execute unless entity @e[type=marker,tag=target_marker] run function grave_star:spawn_grave_logic
# Штатный вариант: спавним на маркере
execute as @e[type=marker,tag=target_marker] at @s run function grave_star:spawn_grave_logic

# 4. Удаляем маркер
kill @e[type=marker,tag=target_marker]

# 5. Очистка игрока
clear @s
experience set @s 0 levels
experience set @s 0 points
scoreboard players set @s gs_death 0
tag @s remove gs_processing
tag @s remove dying_victim