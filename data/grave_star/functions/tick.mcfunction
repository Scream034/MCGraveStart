# 1. Выдача ID (Если игроков много, #next гарантирует уникальность)
execute as @a unless score @s gs_id matches 1.. store result score @s gs_id run scoreboard players add #next gs_id 1

# 2. Обновление позиций трекеров
execute as @a run function grave_star:tracker/update

# 3. Обработка смерти
execute as @a[scores={gs_death=1..},tag=!gs_processing] run function grave_star:death_handler

# Таймеры и эффекты
scoreboard players remove @e[type=item,tag=grave_star,scores={gs_timer=1..}] gs_timer 1
execute as @e[type=item,tag=grave_star,scores={gs_timer=0}] at @s run function grave_star:star_tick