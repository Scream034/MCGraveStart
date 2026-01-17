execute if data storage grave_star:ram Items[0] run return 0

tag @s add active_grave
playsound minecraft:entity.experience_orb.pickup player @a[distance=..10] ~ ~ ~ 1 1

# --- ВОССТАНОВЛЕНИЕ ОПЫТА ---
# 1. Мы НЕ обнуляем опыт (убрали experience set 0)
# 2. Считываем сохраненные очки из звезды в скорборд игрока
execute store result score @p[distance=..2] gs_math run data get entity @s Item.tag.StoredPoints

# Отладка
tellraw @p[distance=..2] ["",{"text":"[Grave] Adding ","color":"green"},{"score":{"name":"@p","objective":"gs_math"},"color":"white"},{"text":" XP points (stacked).","color":"green"}]

# 3. Запускаем цикл выдачи (только очки)
execute as @p[distance=..2] run function grave_star:xp_loop

# Удаляем голограмму и выдаем вещи
kill @e[type=text_display,distance=..2,limit=1,tag=grave_text]
data modify storage grave_star:ram Items set from entity @s Item.tag.SavedInv
function grave_star:give_item_loop