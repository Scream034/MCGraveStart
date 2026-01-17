# 1. ПРОВЕРКА: Если вещей в хранилище БОЛЬШЕ НЕТ
# Мы находим нашу активную звезду и удаляем её.
execute unless data storage grave_star:ram Items[0] as @e[type=item,tag=active_grave] run kill @s

# Если вещей нет - останавливаем функцию, чтобы не было ошибок
execute unless data storage grave_star:ram Items[0] run return 0


# 2. ВЫДАЧА
# Запускаем логику спавна предмета от имени активной звезды
execute as @e[type=item,tag=active_grave,limit=1] at @s run function grave_star:emit_item_logic

# 3. ПОВТОР
# Планируем следующий выброс через 1 тик (очень быстро)
schedule function grave_star:give_item_loop 1t