# Работаем только с живыми
execute if entity @s[nbt={DeathTime:0s}] run function grave_star:tracker/move_logic