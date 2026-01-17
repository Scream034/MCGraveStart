# Скорборд для смертей
scoreboard objectives add gs_death deathCount

# Скорборд для таймера задержки
scoreboard objectives add gs_timer dummy

# Скорборд для математики (хранение опыта)
scoreboard objectives add gs_math dummy

gamerule keepInventory true
gamerule commandBlockOutput false

tellraw @a {"text":"[Grave Star] Система обновлена: XP + Голограммы!","color":"green"}