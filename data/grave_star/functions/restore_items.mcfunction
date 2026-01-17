# ЗАЩИТА: Если хранилище занято
execute if data storage grave_star:ram Items[0] run return 0

# Если таймер защиты еще не прошел
execute if score @s gs_timer matches 1.. run tellraw @a[tag=current_looter] {"text":"Подождите немного...","color":"red"}
execute if score @s gs_timer matches 1.. run tag @a[tag=current_looter] remove current_looter
execute if score @s gs_timer matches 1.. run return 0

tag @s add active_grave

# Звук и эффекты
execute at @s run playsound minecraft:entity.experience_orb.pickup player @a[tag=current_looter] ~ ~ ~ 1 1
execute at @s run particle minecraft:totem_of_undying ~ ~0.5 ~ 0.2 0.5 0.2 1 30

# --- ВОССТАНОВЛЕНИЕ ОПЫТА ---
execute store result score @a[tag=current_looter,limit=1] gs_math run data get entity @s item.tag.StoredPoints

tellraw @a[tag=current_looter] ["",{"text":"[Могила] Восстановлено ","color":"green"},{"score":{"name":"@a[tag=current_looter,limit=1]","objective":"gs_math"},"color":"white"},{"text":" очков опыта.","color":"green"}]

execute as @a[tag=current_looter,limit=1] run function grave_star:xp_loop

# Обнуляем опыт в звезде
data modify entity @s item.tag.StoredPoints set value 0

# --- ОЧИСТКА ---
kill @e[type=text_display,distance=..2,limit=1,tag=grave_text]
kill @e[type=interaction,distance=..2,limit=1,tag=grave_interact]
# Удаляем визуальную звезду (item_display)
kill @e[type=item_display,distance=..2,limit=1,tag=grave_visual]

# --- ВЕЩИ ---
data modify storage grave_star:ram Items set from entity @s item.tag.SavedInv

tag @a[tag=current_looter] remove current_looter

# Запускаем цикл выброса вещей
function grave_star:give_item_loop