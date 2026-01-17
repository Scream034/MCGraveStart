# --- СТРАТЕГИЯ "ПЫЛЕСОС" ---
# Мы отнимаем очки (-XP points) и прибавляем их в скорборд.
# Мы не отнимаем уровни (-XP levels), так как их стоимость в очках разная и ее сложно посчитать.

# 1. ГИГАНТСКИЕ КУСКИ (Для 32+ уровней)
# На 32 уровне у игрока точно есть >1000 очков.
execute if entity @s[level=32..] run scoreboard players add @s gs_math 1000
execute if entity @s[level=32..] run xp add @s -1000 points
execute if entity @s[level=32..] run function grave_star:calc/drain_xp
execute if entity @s[level=32..] run return 1

# 2. БОЛЬШИЕ КУСКИ (Для 16+ уровней)
# На 16 уровне точно есть >300 очков. Безопасно снимать 100.
execute if entity @s[level=16..] run scoreboard players add @s gs_math 100
execute if entity @s[level=16..] run xp add @s -100 points
execute if entity @s[level=16..] run function grave_star:calc/drain_xp
execute if entity @s[level=16..] run return 1

# 3. СРЕДНИЕ КУСКИ (Для 5+ уровней)
# На 5 уровне (55 очков суммарно) точно есть >10 очков.
execute if entity @s[level=5..] run scoreboard players add @s gs_math 10
execute if entity @s[level=5..] run xp add @s -10 points
execute if entity @s[level=5..] run function grave_star:calc/drain_xp
execute if entity @s[level=5..] run return 1

# 4. МАЛЫЕ КУСКИ (Для 1-4 уровней)
# Самый "тонкий" момент. Уровень 1 стоит 7 очков.
# Мы не можем снять 10, если игрок 1-го уровня (вдруг у него всего 7?).
# Поэтому снимаем по 1 очку, пока есть хоть 1 уровень.
# (Это быстро пролетит, так как уровней мало).
execute if entity @s[level=1..] run scoreboard players add @s gs_math 1
execute if entity @s[level=1..] run xp add @s -1 points
execute if entity @s[level=1..] run function grave_star:calc/drain_xp
execute if entity @s[level=1..] run return 1

# 5. ОСТАТКИ В ПОЛОСКЕ (Уровень 0)
# Когда уровни кончились (level=0), у игрока могут остаться очки в полоске.
# Считываем их точное количество.
execute store result score #temp_pts gs_math run experience query @s points

# Если осталось больше 10 очков в полоске
execute if score #temp_pts gs_math matches 10.. run scoreboard players add @s gs_math 10
execute if score #temp_pts gs_math matches 10.. run xp add @s -10 points
execute if score #temp_pts gs_math matches 10.. run function grave_star:calc/drain_xp
execute if score #temp_pts gs_math matches 10.. run return 1

# Если остались единицы (1..9)
execute if score #temp_pts gs_math matches 1.. run scoreboard players add @s gs_math 1
execute if score #temp_pts gs_math matches 1.. run xp add @s -1 points
execute if score #temp_pts gs_math matches 1.. run function grave_star:calc/drain_xp
execute if score #temp_pts gs_math matches 1.. run return 1