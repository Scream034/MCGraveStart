# Считываем координаты того, кто запустил команду (@s)
# Scoreboard автоматически округлит их до целых чисел (Integer)
execute store result score #global_x gs_config run data get entity @s Pos[0]
execute store result score #global_y gs_config run data get entity @s Pos[1]
execute store result score #global_z gs_config run data get entity @s Pos[2]

# Сообщаем об успехе
tellraw @s ["",{"text":"[Grave Star] ","color":"gold"},{"text":"Глобальный спавн установлен на: ","color":"green"},{"score":{"name":"#global_x","objective":"gs_config"},"color":"white"},{"text":" ","color":"white"},{"score":{"name":"#global_y","objective":"gs_config"},"color":"white"},{"text":" ","color":"white"},{"score":{"name":"#global_z","objective":"gs_config"},"color":"white"}]

setworldspawn #global_x #global_y #global_z

# Проигрываем звук для подтверждения
playsound minecraft:block.note_block.pling master @s ~ ~ ~ 1 2