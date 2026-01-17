# ЗАЩИТА: Если хранилище занято (кто-то другой прямо сейчас лутает), отменяем.
execute if data storage grave_star:ram Items[0] run return 0

# Если таймер защиты (60 тиков) еще не прошел - запрещаем
execute if score @s gs_timer matches 1.. run tellraw @a[tag=current_looter] {"text":"Wait a second...","color":"red"}
execute if score @s gs_timer matches 1.. run tag @a[tag=current_looter] remove current_looter
execute if score @s gs_timer matches 1.. run return 0

tag @s add active_grave

# Звук и эффекты для Лутера
execute at @s run playsound minecraft:entity.experience_orb.pickup player @a[tag=current_looter] ~ ~ ~ 1 1
execute at @s run particle minecraft:totem_of_undying ~ ~0.5 ~ 0.2 0.5 0.2 1 30

# --- ВОССТАНОВЛЕНИЕ ОПЫТА ---
# Берем очки из звезды и пишем в скорборд ЛУТЕРА
execute store result score @a[tag=current_looter,limit=1] gs_math run data get entity @s Item.tag.StoredPoints

# Отладка
tellraw @a[tag=current_looter] ["",{"text":"[Grave] Restoring ","color":"green"},{"score":{"name":"@a[tag=current_looter,limit=1]","objective":"gs_math"},"color":"white"},{"text":" XP points.","color":"green"}]

# Запускаем выдачу опыта лутеру
execute as @a[tag=current_looter,limit=1] run function grave_star:xp_loop

# --- ОЧИСТКА ---
# Удаляем голограмму
kill @e[type=text_display,distance=..2,limit=1,tag=grave_text]
# Удаляем кликабельный interaction (он тоже рядом)
kill @e[type=interaction,distance=..2,limit=1,tag=grave_interact]

# --- ВЕЩИ ---
# Загружаем вещи в глобальное хранилище
data modify storage grave_star:ram Items set from entity @s Item.tag.SavedInv

# Снимаем тег с игрока, работа закончена
tag @a[tag=current_looter] remove current_looter

# Запускаем цикл выброса вещей
function grave_star:give_item_loop