# --- ЗАЩИТА ОТ ПУСТОТЫ ---
execute positioned ~ -64 ~ if entity @s[dy=-1000] run tp @s ~ 0 ~

# Сообщаем координаты
tellraw @a[scores={gs_id=1..}] ["",{"text":"[Grave] ","color":"red"},{"text":"Grave for ","color":"yellow"},{"selector":"@a[tag=dying_victim,limit=1]","color":"gold"},{"text":" at ","color":"yellow"},{"nbt":"Pos[0]","entity":"@s","interpret":false},{"text":" ","color":"yellow"},{"nbt":"Pos[1]","entity":"@s","interpret":false},{"text":" ","color":"yellow"},{"nbt":"Pos[2]","entity":"@s","interpret":false}]

# 1. Спавним Звезду (Предмет)
summon item ~ ~ ~ {Tags:["grave_star"],Item:{id:"minecraft:nether_star",Count:1b},CustomName:'{"text":"Death Point","color":"yellow","bold":true}',CustomNameVisible:1b,Glowing:1b,NoGravity:1b,Invulnerable:1b,PickupDelay:32767,Age:-32768}

# 2. НОВОЕ: Спавним Interaction (Хитбокс для клика)
# width и height создают невидимый куб, по которому можно кликнуть
summon interaction ~ ~ ~ {Tags:["grave_interact"],width:1.2f,height:1.2f,response:1b}

# Передача данных
tag @s add current_grave_marker
execute as @a[tag=dying_victim,limit=1] run function grave_star:transfer_data

# Таймер защиты
scoreboard players set @e[type=item,tag=grave_star,sort=nearest,limit=1,distance=..1] gs_timer 60

# Спавним Голограмму (добавляем подсказку про ПКМ)
summon text_display ~ ~1.5 ~ {Tags:["grave_text"],billboard:"vertical",text:'["",{"text":"† R.I.P. †","color":"dark_red","bold":true},{"text":"\\nOwner: ","color":"gray"},{"selector":"@a[tag=dying_victim,limit=1]","color":"white"},{"text":"\\nXP Saved: ","color":"green"},{"nbt":"Item.tag.StoredPoints","entity":"@e[type=item,tag=grave_star,limit=1,sort=nearest]","color":"green","bold":true},{"text":" pts\\n","color":"green"},{"text":"[Right Click to Loot]","color":"gold","bold":true}]'}