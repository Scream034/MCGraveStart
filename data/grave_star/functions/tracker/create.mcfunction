# Спавним маркер
summon marker ~ ~ ~ {Tags:["gs_tracker","gs_new"]}

# Копируем ID
scoreboard players operation @e[type=marker,tag=gs_new,limit=1] gs_id = @s gs_id

# Удаляем временный тег
tag @e[type=marker,tag=gs_new] remove gs_new