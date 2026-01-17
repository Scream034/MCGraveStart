# --- 1. ПРОВЕРКА ВЫСОТЫ (МАТЕМАТИЧЕСКАЯ) ---
# Считываем точную координату Y маркера в скорборд
execute store result score #y_pos gs_math run data get entity @s Pos[1]

# Если высота меньше или равна, запускаем Void Fix
execute if score #y_pos gs_math matches ..-96 run function grave_star:void/check

# --- 2. СПАВН ОБЪЕКТОВ ---
# ВАЖНО: Используем 'at @s', чтобы команды сработали там, где маркер находится СЕЙЧАС
# (Если сработал Void Fix, маркер уже у кровати, и звезда появится там)

# --- 2. СПАВН ОБЪЕКТОВ ---
# Сообщаем координаты ТОЛЬКО умирающему (@a[tag=dying_victim])
execute at @s run tellraw @a[tag=dying_victim] ["",{"text":"[Grave] ","color":"red"},{"text":"Ваша могила находится на ","color":"yellow"},{"nbt":"Pos[0]","entity":"@s","interpret":false},{"text":" ","color":"yellow"},{"nbt":"Pos[1]","entity":"@s","interpret":false},{"text":" ","color":"yellow"},{"nbt":"Pos[2]","entity":"@s","interpret":false}]

# Спавним Звезду (Предмет)
execute at @s run summon item ~ ~ ~ {Tags:["grave_star"],Item:{id:"minecraft:nether_star",Count:1b},CustomName:'{"text":"Точка Смерти","color":"yellow","bold":true}',CustomNameVisible:1b,Glowing:1b,NoGravity:1b,Invulnerable:1b,PickupDelay:32767,Age:-32768}

# Спавним Interaction (Хитбокс для клика)
execute at @s run summon interaction ~ ~ ~ {Tags:["grave_interact"],width:1.2f,height:1.2f,response:1b}

# Передача данных
tag @s add current_grave_marker
execute at @s as @a[tag=dying_victim,limit=1] run function grave_star:transfer_data

# Таймер защиты
execute at @s run scoreboard players set @e[type=item,tag=grave_star,sort=nearest,limit=1,distance=..1] gs_timer 60

# Спавним Голограмму
execute at @s run summon text_display ~ ~1.5 ~ {Tags:["grave_text"],billboard:"vertical",text:'["",{"text":"† R.I.P. †","color":"dark_red","bold":true},{"text":"\\nВладелец: ","color":"gray"},{"selector":"@a[tag=dying_victim,limit=1]","color":"white"},{"text":"\\nОпыт: ","color":"green"},{"nbt":"Item.tag.StoredPoints","entity":"@e[type=item,tag=grave_star,limit=1,sort=nearest]","color":"green","bold":true},{"text":" pts\\n","color":"green"},{"text":"[ПКМ чтобы забрать]","color":"gold","bold":true}]'}