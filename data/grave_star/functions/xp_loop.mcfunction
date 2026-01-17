execute if score @s gs_math matches 1000.. run xp add @s 1000 points
execute if score @s gs_math matches 1000.. run scoreboard players remove @s gs_math 1000
execute if score @s gs_math matches 1000.. run function grave_star:xp_loop
execute if score @s gs_math matches 1000.. run return 1

execute if score @s gs_math matches 100.. run xp add @s 100 points
execute if score @s gs_math matches 100.. run scoreboard players remove @s gs_math 100
execute if score @s gs_math matches 100.. run function grave_star:xp_loop
execute if score @s gs_math matches 100.. run return 1

execute if score @s gs_math matches 10.. run xp add @s 10 points
execute if score @s gs_math matches 10.. run scoreboard players remove @s gs_math 10
execute if score @s gs_math matches 10.. run function grave_star:xp_loop
execute if score @s gs_math matches 10.. run return 1

execute if score @s gs_math matches 1.. run xp add @s 1 points
execute if score @s gs_math matches 1.. run scoreboard players remove @s gs_math 1
execute if score @s gs_math matches 1.. run function grave_star:xp_loop