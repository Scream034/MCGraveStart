# Инвентарь
data modify entity @e[type=item,tag=grave_star,sort=nearest,limit=1,distance=..2] Item.tag.SavedInv set from entity @s Inventory

# ОПЫТ (уже посчитанный с процентом штрафа)
execute store result entity @e[type=item,tag=grave_star,sort=nearest,limit=1,distance=..2] Item.tag.StoredPoints int 1 run scoreboard players get @s gs_math