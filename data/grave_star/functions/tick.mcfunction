# 1. Выдаем уникальный ID игрокам, у которых его нет
execute as @a unless score @s gs_id matches 1.. store result score @s gs_id run scoreboard players add #next gs_id 1

# 2. Обновляем позиции трекеров (маркеров)
# Мы делаем это ДО обработки смерти, чтобы маркер остался на последней точке, где игрок был жив
execute as @a run function grave_star:tracker/update

# 3. Обработка смерти (только если еще не обработан)
execute as @a[scores={gs_death=1..},tag=!gs_processing] run function grave_star:death_handler

# Уменьшение таймера
scoreboard players remove @e[type=item,tag=grave_star,scores={gs_timer=1..}] gs_timer 1
# Цикл восстановления
execute as @e[type=item,tag=grave_star,scores={gs_timer=0}] at @s run function grave_star:star_tick