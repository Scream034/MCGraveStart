# Только для живых игроков (DeathTime:0s). Если игрок мертв, мы НЕ двигаем маркер.
execute if entity @s[nbt={DeathTime:0s}] run function grave_star:tracker/move_logic