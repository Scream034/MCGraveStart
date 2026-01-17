# Если уровней осталось больше 0, выдаем 1 уровень и отнимаем от счета
execute if score @s gs_lvl matches 1.. run xp add @s 1 levels
execute if score @s gs_lvl matches 1.. run scoreboard players remove @s gs_lvl 1

# Повторяем, пока уровни не закончатся
execute if score @s gs_lvl matches 1.. run function grave_star:loops/give_levels