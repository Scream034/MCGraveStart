# 1. ID и Трекеры
execute as @a unless score @s gs_id matches 1.. store result score @s gs_id run scoreboard players add #next gs_id 1
execute as @a run function grave_star:tracker/update

# FAILSAFE (Авто-починка)
tag @a[nbt={DeathTime:0s},tag=gs_processing] remove dying_victim
tag @a[nbt={DeathTime:0s},tag=gs_processing] remove gs_processing

# 2. Обработка смерти
execute as @a[scores={gs_death=1..},tag=!gs_processing] run function grave_star:death_handler

# 3. Таймеры (ИСПРАВЛЕНО на item_display)
scoreboard players remove @e[type=item_display,tag=grave_star,scores={gs_timer=1..}] gs_timer 1

# 4. ВРАЩЕНИЕ И ЗАЩИТА ОТ КРАЖИ (ЯКОРЬ)
# Исправлено: ищем type=item_display
# Исправлено: tp @s ~ ~0.5 ~ (поднимаем звезду на полблока вверх, чтобы она висела как раньше)
execute as @e[type=interaction,tag=grave_interact] at @s run tp @e[type=item_display,tag=grave_star,distance=..2,limit=1] ~ ~0.5 ~ ~5 ~

# 5. Проверка клика ПКМ
execute as @e[type=interaction,tag=grave_interact] if data entity @s interaction run function grave_star:interaction_handler

# 6. Защита от деспавна (ИСПРАВЛЕНО на item_display)
# Примечание: item_display вообще не деспавнится сам по себе, но команда не повредит
execute as @e[type=item_display,tag=grave_star] run data modify entity @s PickupDelay set value 32767s
