#!/bin/bash
# OpenWrt DIY Script Part 1 - 插件与功能配置
# 原始功能保持不变，结构优化，便于维护

echo "🔧 正在配置 OpenWrt 插件和功能..."

# 定义要添加的配置项
CONFIGS=(
  # Luci 中文界面
  CONFIG_PACKAGE_luci-i18n-base-zh-cn

  # L2TP 拨号支持
  CONFIG_PACKAGE_luci-proto-l2tp
  CONFIG_PACKAGE_ppp-mod-pppol2tp

  # PPPoE 拨号支持
  CONFIG_PACKAGE_luci-proto-ppp
  CONFIG_PACKAGE_ppp

  # AdGuard Home 广告过滤
  CONFIG_PACKAGE_luci-app-adguardhome

  # Clash 科学上网（OpenClash）
  CONFIG_PACKAGE_luci-app-openclash

  # SmartDNS DNS 加速
  CONFIG_PACKAGE_luci-app-smartdns
  CONFIG_PACKAGE_smartdns

  # IPv6 支持
  CONFIG_PACKAGE_ipv6helper
  CONFIG_PACKAGE_luci-proto-ipv6

  # Material 主题美化
  CONFIG_PACKAGE_luci-theme-material
)

# 遍历配置项并追加到 .config 文件
for item in "${CONFIGS[@]}"; do
  grep -q "$item=y" .config || echo "$item=y" >> .config
done

echo "✅ 插件配置完成，已更新 .config 文件。"
