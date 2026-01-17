# ЗАЩИТА: Если хранилище занято
execute if data storage grave_star:ram Items[0] run return 0

# 1. Активируем звезду
tag @s add active_grave

# Звук
playsound minecraft:entity.experience_orb.pickup player @a[distance=..10] ~ ~ ~ 1 1

# --- ВОССТАНОВЛЕНИЕ ОПЫТА ---
# Считываем сохраненный опыт из звезды в скорборд игрока gs_math
execute store result score @p[distance=..2] gs_math run data get entity @s Item.tag.StoredXpTotal
# Запускаем функцию выдачи опыта для ближайшего игрока
execute as @p[distance=..2] run function grave_star:xp_loop

# --- УДАЛЕНИЕ ГОЛОГРАММЫ ---
# Удаляем текст, который висит над этой звездой
kill @e[type=text_display,distance=..2,limit=1,tag=grave_text]

# 2. Переносим вещи в память
data modify storage grave_star:ram Items set from entity @s Item.tag.SavedInv

# 3. Запускаем цикл выброса вещей
function grave_star:give_item_loop