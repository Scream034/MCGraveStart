scoreboard objectives add gs_death deathCount
scoreboard objectives add gs_timer dummy
scoreboard objectives add gs_id dummy
scoreboard objectives add gs_math dummy
# Вспомогательный скорборд для текста (чтобы показать исходный опыт)
scoreboard objectives add gs_info dummy
# Скорборд для конфигурации
scoreboard objectives add gs_config dummy

# === НАСТРОЙКИ ===
# Процент сохранения опыта (50 = сохранить 50%, потерять половину)
scoreboard players set #xp_percent gs_config 50
# Константа 100 для математики
scoreboard players set #const_100 gs_config 100

gamerule keepInventory true
gamerule commandBlockOutput false

tellraw @a {"text":"[Grave Star] Config loaded. XP Penalty: Active.","color":"green"}