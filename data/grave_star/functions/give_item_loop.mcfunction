# 1. Если вещей больше нет
execute unless data storage grave_star:ram Items[0] as @e[type=item,tag=active_grave] run kill @s
execute unless data storage grave_star:ram Items[0] run return 0

# 2. Спавним предмет (визуальный эффект вылета)
execute as @e[type=item,tag=active_grave,limit=1] at @s run function grave_star:emit_item_logic

# 3. Планируем следующий тик
schedule function grave_star:give_item_loop 1t