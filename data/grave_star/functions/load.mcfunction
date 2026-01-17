scoreboard objectives add gs_death deathCount
scoreboard objectives add gs_timer dummy
scoreboard objectives add gs_id dummy
scoreboard objectives add gs_math dummy
scoreboard objectives add gs_info dummy
scoreboard objectives add gs_config dummy

# Настройки
scoreboard players set #xp_percent gs_config 50
scoreboard players set #const_100 gs_config 100

gamerule keepInventory true
gamerule commandBlockOutput false

tellraw @a {"text":"[Grave Star] Multiplayer Fix Loaded.","color":"green"}