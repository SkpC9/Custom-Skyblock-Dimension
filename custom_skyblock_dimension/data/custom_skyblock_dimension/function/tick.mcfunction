# 1. 初始化计分板（高频监听望远镜使用计数）
scoreboard objectives add use_spyglass minecraft.used:minecraft.spyglass

# ----------------- 📦 钥匙防伪校验 -----------------
tag @a remove has_key
execute as @a at @s if items entity @s weapon.mainhand spyglass[custom_data={skyblock_key:1b}] run tag @s add has_key

# 物理截杀线：未带防伪标签开镜（1..9），一律瞬间抹分！
execute as @a[scores={use_spyglass=1..9},tag=!has_key] run scoreboard players set @s use_spyglass 0


# ----------------- 🛡️ 【子模块分流 1：虚空救援】 -----------------
execute as @a at @s if dimension minecraft:skyblock_dim if predicate custom_skyblock_dimension:below_y80 run function custom_skyblock_dimension:rescue


# ----------------- 🚀 【子模块分流 2：去程（主世界开镜）】 -----------------
execute as @a[scores={use_spyglass=1},tag=has_key] at @s if dimension minecraft:overworld run function custom_skyblock_dimension:go_to_skyblock


# ----------------- 🏡 【子模块分流 3：回程（空岛再次开镜）】 -----------------
execute as @a[scores={use_spyglass=11},tag=has_key] at @s if dimension minecraft:skyblock_dim run function custom_skyblock_dimension:return_from_skyblock


# ----------------- 🧼 脏数据日常兜底与洗牌 -----------------
execute as @a[scores={use_spyglass=11..}] run scoreboard players set @s use_spyglass 10
execute as @a[scores={use_spyglass=2..9}] run scoreboard players set @s use_spyglass 0

tag @a remove has_key