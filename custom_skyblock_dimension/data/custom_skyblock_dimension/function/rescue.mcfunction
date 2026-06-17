# ==========================================
# 🛡️ 虚空救援子模块：空岛坠落 -> 安全重返主世界
# ==========================================

# 1. 🌟【已修复：继承坠落朝向】跨维度借坐标流
# 重定向到主世界的 Marker 坐标，利用 ~ ~ ~ 借走位置。不接角度参数，完美保留玩家掉进虚空一瞬间的最新视线！
execute as @s at @e[tag=return_point,limit=1,sort=nearest] run tp @s ~ ~ ~

# 2. 🌟【原版溢出缓冲垫】：利用 255 级跳跃提升，单帧内物理抵消 255 格坠落高度！
# 最后的 true 确保隐藏粒子效果。由于数据溢出，玩家落地绝不会跳起来，但 20.27f 瞬间被完全抹平！
effect give @s minecraft:jump_boost 1 254 true

# 3. 过河拆桥：功成身退，清除对应的 marker 实体
execute at @s if dimension minecraft:overworld run kill @e[tag=return_point,limit=1,sort=nearest]

# 4. 状态机大洗牌：只要触发了救援，强行把该玩家的所有望远镜分数全部安全归零
execute as @a[scores={use_spyglass=1..}] run scoreboard players set @s use_spyglass 0