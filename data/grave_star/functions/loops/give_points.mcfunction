# Большими кусками (по 100), чтобы не лагало если очков много
execute if score @s gs_pts matches 100.. run xp add @s 100 points
execute if score @s gs_pts matches 100.. run scoreboard players remove @s gs_pts 100
execute if score @s gs_pts matches 100.. run function grave_star:loops/give_points
execute if score @s gs_pts matches 100.. run return 1

# По 10
execute if score @s gs_pts matches 10.. run xp add @s 10 points
execute if score @s gs_pts matches 10.. run scoreboard players remove @s gs_pts 10
execute if score @s gs_pts matches 10.. run function grave_star:loops/give_points
execute if score @s gs_pts matches 10.. run return 1

# По 1
execute if score @s gs_pts matches 1.. run xp add @s 1 points
execute if score @s gs_pts matches 1.. run scoreboard players remove @s gs_pts 1
execute if score @s gs_pts matches 1.. run function grave_star:loops/give_points