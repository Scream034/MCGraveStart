# Работаем только с живыми. Если игрок умер, маркер замирает на месте смерти.
execute if entity @s[nbt={DeathTime:0s}] run function grave_star:tracker/move_logic