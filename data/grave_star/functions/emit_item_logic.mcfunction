# Спавним предмет (камень-болванку)
summon item ~ ~0.5 ~ {Tags:["temp_loot"],Item:{id:"minecraft:stone",Count:1b},Motion:[0.0,0.4,0.0],PickupDelay:0}

# Копируем данные из хранилища в этот предмет
data modify entity @e[type=item,tag=temp_loot,limit=1,sort=nearest] Item set from storage grave_star:ram Items[0]

# Удаляем глючный тег Slot (чтобы вещи не исчезали)
data remove entity @e[type=item,tag=temp_loot,limit=1,sort=nearest] Item.Slot

# Убираем метку temp_loot
tag @e[type=item,tag=temp_loot,limit=1,sort=nearest] remove temp_loot

# Удаляем выданный предмет из списка хранилища
data remove storage grave_star:ram Items[0]