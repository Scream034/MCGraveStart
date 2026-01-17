# 1. Сообщаем координаты в чат (на всякий случай)
tellraw @s ["",{"text":"[Grave] ","color":"red"},{"text":"X: ","color":"yellow"},{"nbt":"Pos[0]","entity":"@s","interpret":false},{"text":" Y: ","color":"yellow"},{"nbt":"Pos[1]","entity":"@s","interpret":false},{"text":" Z: ","color":"yellow"},{"nbt":"Pos[2]","entity":"@s","interpret":false}]

# 2. Спавним звезду
summon item ~ ~ ~ {Tags:["grave_star"],Item:{id:"minecraft:nether_star",Count:1b},CustomName:'{"text":"Death Point","color":"yellow","bold":true}',CustomNameVisible:1b,Glowing:1b,NoGravity:1b,Invulnerable:1b,PickupDelay:32767,Age:-32768}

# 3. Копируем инвентарь
data modify entity @e[type=item,tag=grave_star,sort=nearest,limit=1,distance=..1] Item.tag.SavedInv set from entity @s Inventory

# --- СОХРАНЕНИЕ ОПЫТА ---
# Копируем общее кол-во очков опыта (XpTotal), чтобы вернуть всё с точностью
data modify entity @e[type=item,tag=grave_star,sort=nearest,limit=1,distance=..1] Item.tag.StoredXpTotal set from entity @s XpTotal
# Копируем просто уровень (XpLevel) для отображения в тексте голограммы
data modify entity @e[type=item,tag=grave_star,sort=nearest,limit=1,distance=..1] Item.tag.StoredXpLevel set from entity @s XpLevel

# --- ГОЛОГРАММА (TEXT DISPLAY) ---
# Спавним текст над звездой.
# selector:@p выберет ближайшего игрока (вас, так как вы умерли здесь), это подставит ваше имя.
# nbt:Item.tag.StoredXpLevel покажет уровень, сохраненный в звезде.
summon text_display ~ ~1.3 ~ {Tags:["grave_text"],billboard:"vertical",text:'["",{"text":"† R.I.P. †","color":"dark_red","bold":true},{"text":"\\n"},{"selector":"@p","color":"gray"},{"text":"\\nXP Level: ","color":"green","bold":true},{"nbt":"Item.tag.StoredXpLevel","entity":"@e[type=item,tag=grave_star,limit=1,sort=nearest]"}]'}

# Чтобы показать "Day", нам нужен скорборд. Если его нет, текст будет пустым, это не страшно. 
# Можно добавить (execute store result score day_count dummy run time query day) перед спавном, если хотите.

# Задержка 3 секунды
scoreboard players set @e[type=item,tag=grave_star,sort=nearest,limit=1,distance=..1] gs_timer 60

# 4. Очищаем инвентарь и опыт
clear @s
experience set @s 0 levels
experience set @s 0 points
scoreboard players set @s gs_death 0

tellraw @s {"text":"Инвентарь и опыт сохранены в звезде.","color":"green"}