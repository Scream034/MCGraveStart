# @s = сущность interaction

# 1. Находим игрока, который кликнул
execute on target run tag @s add current_looter

# 2. Находим звезду и запускаем восстановление
execute at @s as @e[type=item,tag=grave_star,distance=..0.5,limit=1] run function grave_star:restore_items

# 3. Сбрасываем статус клика
data remove entity @s interaction
data remove entity @s attack