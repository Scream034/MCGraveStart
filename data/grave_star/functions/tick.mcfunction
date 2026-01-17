# Проверяем умерших
execute as @a[scores={gs_death=1..}] at @s run function grave_star:death_handler

# Уменьшаем таймер задержки у звезд, если он больше 0
scoreboard players remove @e[type=item,tag=grave_star,scores={gs_timer=1..}] gs_timer 1

# Обрабатываем звезды (только те, у которых таймер прошел, то есть gs_timer=0)
execute as @e[type=item,tag=grave_star,scores={gs_timer=0}] at @s run function grave_star:star_tick