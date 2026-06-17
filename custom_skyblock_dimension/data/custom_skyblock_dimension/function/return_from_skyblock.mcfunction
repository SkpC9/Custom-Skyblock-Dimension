# ==========================================
# 回程子模块：空岛维度 -> 主世界原路返回
# ==========================================

# 1. 聊天栏提示
#say [Debug 2] 时空核心（望远镜）校验成功！正在原路返回主世界...

# 2. 🌟【已修复：继承空岛当前朝向】跨维度借坐标流
# 执行者是玩家自己（as @s），但把执行位置重定向到主世界的 Marker（at @e[...]）
# 最后的 ~ ~ ~ 代表 Marker 的绝对坐标。因为没接角度参数，玩家在空岛开镜时的最新视角会被完美继承落地！
execute as @s at @e[tag=return_point,limit=1,sort=nearest] run tp @s ~ ~ ~

# 3. 功成身退：如果玩家成功回到主世界，瞬间将用掉的那个 Marker 记忆实体物理清除，不留任何垃圾
execute at @s if dimension minecraft:overworld run kill @e[tag=return_point,limit=1,sort=nearest]

# 4. 🌟 核心状态机洗牌：回程完毕后，立刻将分数彻底清零，恢复到最初可以再次去空岛的状态
scoreboard players set @s use_spyglass 0