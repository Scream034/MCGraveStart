# Проверяем условия восстановления:
# 1. Звезда НЕ активна (не выплевывает вещи прямо сейчас)
# 2. Игрок рядом (0.5 блока)
# 3. Игрок жив
execute unless entity @s[tag=active_grave] if entity @a[distance=..1,limit=1,sort=nearest,nbt={DeathTime:0s}] run function grave_star:restore_items