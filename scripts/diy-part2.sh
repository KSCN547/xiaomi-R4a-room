#!/bin/bash
# OpenWrt DIY Script Part 2 - 系统定制配置（feeds 更新后执行）

echo "🎯 正在执行系统定制配置..."

# ✅ 设置主机名（硬编码为 Xiaomi-R4A）
HOSTNAME="Xiaomi-R4A"
sed -i "/uci commit system/i\uci set system.@system[0].hostname='${HOSTNAME}'" \
  package/lean/default-settings/files/zzz-default-settings
echo "🖥️ 主机名设置为：${HOSTNAME}"

# ✅ 设置版本号标识（显示编译者和日期）
BUILD_TAG="ZhangYufeng build $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt"
sed -i "s/OpenWrt /${BUILD_TAG} /g" \
  package/lean/default-settings/files/zzz-default-settings
echo "📦 版本号标识设置为：${BUILD_TAG}"

# ✅ 设置默认主题为 Material（与 part1 保持一致）
DEFAULT_THEME="luci-theme-material"
sed -i "s/luci-theme-bootstrap/${DEFAULT_THEME}/g" \
  feeds/luci/collections/luci/Makefile
echo "🎨 默认主题设置为：${DEFAULT_THEME}"

# ✅ 修改默认 WiFi 名称（SSID）
WIFI_SSID="Xiaomi_R4A"
sed -i "s/ssid=OpenWrt/ssid=${WIFI_SSID}/g" \
  package/kernel/mac80211/files/lib/wifi/mac80211.sh
echo "📶 默认 WiFi 名称设置为：${WIFI_SSID}"

# ✅ 设置系统默认语言为中文（zh_cn）
LANG_SETTING='uci set luci.main.lang=zh_cn\nuci commit luci'
sed -i "/uci commit system/a\\${LANG_SETTING}" \
  package/lean/default-settings/files/zzz-default-settings
echo "🌐 系统默认语言设置为：中文"

echo "✅ 系统定制配置完成。"
