scoreboard objectives add gs_death deathCount
scoreboard objectives add gs_timer dummy
scoreboard objectives add gs_id dummy
scoreboard objectives add gs_math dummy
scoreboard objectives add gs_info dummy
scoreboard objectives add gs_config dummy

# Настройки процентов (по умолчанию)
execute unless score #xp_percent gs_config matches 0.. run scoreboard players set #xp_percent gs_config 50
execute unless score #const_100 gs_config matches 0.. run scoreboard players set #const_100 gs_config 100

# --- ГЛОБАЛЬНЫЙ СПАВН (Defaults) ---
# Если координаты еще не заданы, ставим 0 100 0
execute unless score #global_x gs_config matches -30000000..30000000 run scoreboard players set #global_x gs_config 0
execute unless score #global_y gs_config matches -64..320 run scoreboard players set #global_y gs_config 100
execute unless score #global_z gs_config matches -30000000..30000000 run scoreboard players set #global_z gs_config 0

gamerule keepInventory true
gamerule commandBlockOutput false

# --- README / ПРИВЕТСТВИЕ ---
tellraw @a ["",{"text":"\n======================================\n","color":"dark_gray"},{"text":" [Grave Star] ","color":"gold","bold":true},{"text":"Datapack Loaded (RU)\n","color":"green"},{"text":"--------------------------------------\n","color":"gray"},{"text":" Мод добавляет могилы с сохранением опыта.\n","color":"white"},{"text":" > Void Fix:","color":"aqua","bold":true},{"text":" При смерти в пустоте могила возвращается\n на спавн игрока или глобальный спавн.\n","color":"gray"},{"text":" > Установка спавна:","color":"gold","bold":true},{"text":" Встаньте в нужную точку и пропишите:\n ","color":"gray"},{"text":"/function grave_star:set_spawn","color":"yellow","clickEvent":{"action":"suggest_command","value":"/function grave_star:set_spawn"},"hoverEvent":{"action":"show_text","contents":"Нажмите, чтобы получить команду"}},{"text":"\n======================================\n","color":"dark_gray"}]