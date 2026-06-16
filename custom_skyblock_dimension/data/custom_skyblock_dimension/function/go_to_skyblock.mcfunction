# ==========================================
# 去程子模块：主世界 -> 空岛维度
# ==========================================

# 1. 聊天栏提示
#say [Debug 1] 时空核心（望远镜）校验成功！正在前往空岛...

# 2. 强行对空岛中心区块加载，防止 tp 过去时卡进虚空（原版单帧加载安全机制）
execute in minecraft:skyblock_dim run forceload add 0 0 0 0

# 3. 在主世界原地召唤一个隐形的物理锚点（Marker），记忆玩家的绝对坐标和面朝方向
summon minecraft:marker ~ ~ ~ {Tags:["return_point"]}

# 4. 在空岛维度单次生成一块基岩平台底座，keep 模式绝不重复覆盖玩家盖好的建筑
execute in minecraft:skyblock_dim run setblock 0 99 0 minecraft:bedrock keep

# 5. 将玩家精准投射到空岛基岩上方 1 格的绝对安全位置（0.5 保证踩在方块正中心）
execute in minecraft:skyblock_dim run tp @s 0.5 100 0.5

# 6. 过河拆桥：完成传送后，立刻解除空岛该区块的强行加载，释放服务器内存
execute in minecraft:skyblock_dim run forceload remove 0 0 0 0

# 7. 🌟 核心状态机洗牌：去程完毕后，立刻将玩家的使用分数提到 10（锁定为“已处于空岛”状态）
scoreboard players set @s use_spyglass 10