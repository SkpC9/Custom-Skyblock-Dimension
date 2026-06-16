# ==========================================
# 回程子模块：空岛维度 -> 主世界原路返回
# ==========================================

# 1. 聊天栏提示
#say [Debug 2] 时空核心（望远镜）校验成功！正在原路返回主世界...

# 2. 跨维度追踪：寻找主世界距离最近的 return_point 锚点，精准tp回玩家出发前的绝对坐标和视角
tp @s @e[tag=return_point,limit=1,sort=nearest]

# 3. 功成身退：如果玩家成功回到主世界，瞬间将用掉的那个 Marker 记忆实体物理清除，不留任何垃圾
execute at @s if dimension minecraft:overworld run kill @e[tag=return_point,limit=1,sort=nearest]

# 4. 🌟 核心状态机洗牌：回程完毕后，立刻将分数彻底清零，恢复到最初可以再次去空岛的状态
scoreboard players set @s use_spyglass 0