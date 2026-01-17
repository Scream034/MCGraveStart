# --- 2. СПАВН ОБЪЕКТОВ ---

# (Tellraw оставил без изменений)
execute at @s run tellraw @a[tag=dying_victim] ["",{"text":"[Могила] ","color":"red"},{"text":"Ваша могила находится на ","color":"yellow"},{"nbt":"Pos[0]","entity":"@s","interpret":false},{"text":" ","color":"yellow"},{"nbt":"Pos[1]","entity":"@s","interpret":false},{"text":" ","color":"yellow"},{"nbt":"Pos[2]","entity":"@s","interpret":false}]

# Спавним item_display
# billboard:"center" заставляет звезду смотреть на игрока
execute at @s run summon item_display ~ ~ ~ {Tags:["grave_star","temp_target_star"],item:{id:"minecraft:nether_star",Count:1b},CustomName:'{"text":"Точка Смерти","color":"yellow","bold":true}',CustomNameVisible:1b,Glowing:1b,billboard:"center"}

# Спавним Interaction
execute at @s run summon interaction ~ ~ ~ {Tags:["grave_interact"],width:1.2f,height:1.2f,response:1b}

# --- 3. ПЕРЕДАЧА ДАННЫХ И ТАЙМЕРЫ ---

execute as @a[tag=dying_victim,limit=1] run function grave_star:transfer_data

# Таймер защиты
execute at @s run scoreboard players set @e[type=item_display,tag=grave_star,sort=nearest,limit=1,distance=..1] gs_timer 60

# Спавним Голограмму
# В selector ищем type=item_display
# В nbt ищем item.tag.StoredPoints (с маленькой буквы item!)
execute at @s run summon text_display ~ ~1.5 ~ {Tags:["grave_text"],billboard:"vertical",text:'["",{"text":"† R.I.P. †","color":"dark_red","bold":true},{"text":"\\nВладелец: ","color":"gray"},{"selector":"@a[tag=dying_victim,limit=1]","color":"white"},{"text":"\\nОпыт: ","color":"green"},{"nbt":"item.tag.StoredPoints","entity":"@e[type=item_display,tag=temp_target_star,limit=1,sort=nearest]","color":"green","bold":true},{"text":" pts\\n","color":"green"},{"text":"[ПКМ чтобы забрать]","color":"gold","bold":true}]'}

# Удаляем временный тег
tag @e[tag=temp_target_star] remove temp_target_star