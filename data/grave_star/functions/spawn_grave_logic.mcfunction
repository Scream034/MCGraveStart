# Координаты в чат
tellraw @a[scores={gs_id=1..}] ["",{"text":"[Grave] ","color":"red"},{"text":"Grave for ","color":"yellow"},{"selector":"@a[scores={gs_id=1..},limit=1,sort=nearest]","color":"gold"},{"text":" at ","color":"yellow"},{"nbt":"Pos[0]","entity":"@s","interpret":false},{"text":" ","color":"yellow"},{"nbt":"Pos[1]","entity":"@s","interpret":false},{"text":" ","color":"yellow"},{"nbt":"Pos[2]","entity":"@s","interpret":false}]

# Спавним Звезду
summon item ~ ~ ~ {Tags:["grave_star"],Item:{id:"minecraft:nether_star",Count:1b},CustomName:'{"text":"Death Point","color":"yellow","bold":true}',CustomNameVisible:1b,Glowing:1b,NoGravity:1b,Invulnerable:1b,PickupDelay:32767,Age:-32768}

# Передача данных (инвентарь + опыт)
tag @s add current_grave_marker
execute as @a if score @s gs_id = #dead_id gs_id run function grave_star:transfer_data

# Устанавливаем таймер
scoreboard players set @e[type=item,tag=grave_star,sort=nearest,limit=1,distance=..1] gs_timer 60

# --- СПАВН ГОЛОГРАММЫ С ИНФОЙ ---
# Мы используем NBT компонент, чтобы прочитать сохраненные очки прямо из лежащей звезды.
summon text_display ~ ~1.3 ~ {Tags:["grave_text"],billboard:"vertical",text:'["",{"text":"† R.I.P. †","color":"dark_red","bold":true},{"text":"\\nOwner: ","color":"gray"},{"selector":"@a[scores={gs_id=1..},limit=1,sort=nearest]","color":"white"},{"text":"\\nXP Saved: ","color":"green"},{"nbt":"Item.tag.StoredPoints","entity":"@e[type=item,tag=grave_star,limit=1,sort=nearest]","color":"green","bold":true},{"text":" pts","color":"green"}]'}