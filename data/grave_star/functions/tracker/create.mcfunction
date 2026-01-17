# Спавним новый маркер прямо в игроке
summon marker ~ ~ ~ {Tags:["gs_tracker"]}

# Присваиваем ID ближайшему новому маркеру (только что созданному)
# Мы ищем маркер с тегом gs_tracker в радиусе 0.1 и копируем в него ID игрока
scoreboard players operation @e[type=marker,tag=gs_tracker,distance=..0.5,limit=1,sort=nearest] gs_id = @s gs_id