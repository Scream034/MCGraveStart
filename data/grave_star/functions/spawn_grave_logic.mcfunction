# --- ЗАЩИТА ОТ ПУСТОТЫ (ИСПРАВЛЕНО) ---
# Проверяем, если маркер ниже высоты -64 (от -64 до -1064), телепортируем его на высоту 0
execute positioned ~ -64 ~ if entity @s[dy=-1000] run tp @s ~ 0 ~

# Сообщаем координаты в чат
tellraw @a[scores={gs_id=1..}] ["",{"text":"[Grave] ","color":"red"},{"text":"Grave for ","color":"yellow"},{"selector":"@a[tag=dying_victim,limit=1]","color":"gold"},{"text":" at ","color":"yellow"},{"nbt":"Pos[0]","entity":"@s","interpret":false},{"text":" ","color":"yellow"},{"nbt":"Pos[1]","entity":"@s","interpret":false},{"text":" ","color":"yellow"},{"nbt":"Pos[2]","entity":"@s","interpret":false}]

# Спавним Звезду
summon item ~ ~ ~ {Tags:["grave_star"],Item:{id:"minecraft:nether_star",Count:1b},CustomName:'{"text":"Death Point","color":"yellow","bold":true}',CustomNameVisible:1b,Glowing:1b,NoGravity:1b,Invulnerable:1b,PickupDelay:32767,Age:-32768}

# Передача данных
# Мы ищем игрока с тегом dying_victim (это наш умерший)
tag @s add current_grave_marker
execute as @a[tag=dying_victim,limit=1] run function grave_star:transfer_data

# Устанавливаем таймер защиты
scoreboard players set @e[type=item,tag=grave_star,sort=nearest,limit=1,distance=..1] gs_timer 60

# Спавним Голограмму
summon text_display ~ ~1.3 ~ {Tags:["grave_text"],billboard:"vertical",text:'["",{"text":"† R.I.P. †","color":"dark_red","bold":true},{"text":"\\nOwner: ","color":"gray"},{"selector":"@a[tag=dying_victim,limit=1]","color":"white"},{"text":"\\nXP Saved: ","color":"green"},{"nbt":"Item.tag.StoredPoints","entity":"@e[type=item,tag=grave_star,limit=1,sort=nearest]","color":"green","bold":true},{"text":" pts","color":"green"}]'}