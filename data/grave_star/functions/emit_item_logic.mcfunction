# Спавним временный предмет-болванку
summon item ~ ~0.5 ~ {Tags:["temp_loot"],Item:{id:"minecraft:stone",Count:1b},Motion:[0.0,0.4,0.0],PickupDelay:0}

# Копируем данные реального предмета из хранилища в болванку
data modify entity @e[type=item,tag=temp_loot,limit=1,sort=nearest] Item set from storage grave_star:ram Items[0]

# Удаляем тег Slot, чтобы предмет стакался в инвентаре нормально
data remove entity @e[type=item,tag=temp_loot,limit=1,sort=nearest] Item.Slot

# Снимаем технический тег
tag @e[type=item,tag=temp_loot,limit=1,sort=nearest] remove temp_loot

# Удаляем этот предмет из очереди хранилища
data remove storage grave_star:ram Items[0]