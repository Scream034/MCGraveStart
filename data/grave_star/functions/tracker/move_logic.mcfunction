tag @s add gs_current_target
scoreboard players operation #temp gs_id = @s gs_id

# 1. Помечаем маркер игрока (если он есть) тегом "found"
tag @e[type=marker,tag=gs_tracker] remove found
execute as @e[type=marker,tag=gs_tracker] if score @s gs_id = #temp gs_id run tag @s add found

# 2. Телепортируем найденный маркер к игроку
execute as @e[type=marker,tag=found] run tp @s @a[tag=gs_current_target,limit=1]

# 3. Если маркера с тегом "found" нет — создаем новый
execute unless entity @e[type=marker,tag=found] run function grave_star:tracker/create

tag @s remove gs_current_target