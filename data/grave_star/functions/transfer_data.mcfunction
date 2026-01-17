# @s = Игрок (dying_victim)

# Инвентарь -> в "temp_target_star" (ТИП item_display, ПУТЬ item.tag)
data modify entity @e[type=item_display,tag=temp_target_star,limit=1] item.tag.SavedInv set from entity @s Inventory

# ОПЫТ -> в "temp_target_star" (ТИП item_display, ПУТЬ item.tag)
execute store result entity @e[type=item_display,tag=temp_target_star,limit=1] item.tag.StoredPoints int 1 run scoreboard players get @s gs_math
