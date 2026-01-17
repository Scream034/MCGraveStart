# 1. ID и Трекеры
execute as @a unless score @s gs_id matches 1.. store result score @s gs_id run scoreboard players add #next gs_id 1
execute as @a run function grave_star:tracker/update

# 2. Обработка смерти
execute as @a[scores={gs_death=1..},tag=!gs_processing] run function grave_star:death_handler

# 3. Таймеры
scoreboard players remove @e[type=item,tag=grave_star,scores={gs_timer=1..}] gs_timer 1

# 4. Вращение звезды (чисто визуал, старая логика star_tick больше не нужна для подбора)
execute as @e[type=item,tag=grave_star] at @s run tp @s ~ ~ ~ ~5 ~

# 5. НОВОЕ: Проверка клика ПКМ по Interaction
# Мы ищем сущности, у которых в NBT появился тег interaction (значит, кто-то кликнул)
execute as @e[type=interaction,tag=grave_interact] if data entity @s interaction run function grave_star:interaction_handler

# 6. Защита от случайного подбора (на всякий случай обновляем PickupDelay)
execute as @e[type=item,tag=grave_star] run data modify entity @s PickupDelay set value 32767s