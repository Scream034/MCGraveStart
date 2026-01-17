# Проверяем условия восстановления:
# 1. Звезда НЕ активна
# 2. Игрок рядом
# 3. Игрок жив
execute unless entity @s[tag=active_grave] if entity @a[distance=..1,limit=1,sort=nearest,nbt={DeathTime:0s}] run function grave_star:restore_items