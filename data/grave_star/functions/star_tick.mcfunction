# Вращаем звезду (визуально) и ищем игрока
# Условие:
# 1. Игрок ближе 0.5 блока
# 2. Игрок ЖИВ (DeathTime:0s)
# 3. Звезда НЕ АКТИВНА (tag=!active_grave) - ЭТО ВАЖНОЕ ИСПРАВЛЕНИЕ
execute unless entity @s[tag=active_grave] if entity @a[distance=..0.5,limit=1,sort=nearest,nbt={DeathTime:0s}] run function grave_star:restore_items