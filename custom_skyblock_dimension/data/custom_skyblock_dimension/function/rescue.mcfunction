# 1. 瞬间将玩家 tp 回主世界的锚点绝对坐标
tp @s @e[tag=return_point,limit=1,sort=nearest]

# 2. 🌟【原版溢出缓冲垫】：利用 255 级跳跃提升，单帧内物理抵消 255 格坠落高度！
# 最后的 true 确保隐藏粒子效果。由于数据溢出，玩家落地绝不会跳起来，但 20.27f 瞬间被完全抹平！
effect give @s minecraft:jump_boost 1 254 true

# 3. 过河拆桥：功成身退，清除对应的 marker 实体
execute at @s if dimension minecraft:overworld run kill @e[tag=return_point,limit=1,sort=nearest]

execute as @a[scores={use_spyglass=1..}] run scoreboard players set @s use_spyglass 0