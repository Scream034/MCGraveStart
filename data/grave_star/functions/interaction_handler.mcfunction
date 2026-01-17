# @s = сущность interaction

# 1. Находим игрока, который кликнул (on target - новая фича 1.20)
# Помечаем его тегом looter
execute on target run tag @s add current_looter

# 2. Находим звезду, привязанную к этому interaction (она в том же месте)
# И запускаем восстановление ОТ ИМЕНИ ЗВЕЗДЫ (как раньше), но зная, кто лутает
execute at @s as @e[type=item,tag=grave_star,distance=..0.5,limit=1] run function grave_star:restore_items

# 3. Сбрасываем статус клика у interaction
# Это нужно на случай, если хранилище занято и лут не выдался - чтобы можно было кликнуть снова.
data remove entity @s interaction
data remove entity @s attack