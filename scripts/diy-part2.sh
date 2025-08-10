#!/bin/bash
# OpenWrt DIY Script Part 2 - 系统定制配置（feeds 更新后执行）

echo "🎯 正在执行系统定制配置..."

# ✅ 设置主机名
HOSTNAME="Xiaomi-R4A"
sed -i "/uci commit system/i\uci set system.@system[0].hostname='${HOSTNAME}'" \
  package/lean/default-settings/files/zzz-default-settings
echo "🖥️ 主机名设置为：${HOSTNAME}"

# ✅ 设置版本号标识（北京时间）
BUILD_TAG="ZhangYufeng build $(date -u -d '8 hours' '+%Y.%m.%d') @ OpenWrt"
sed -i "s/OpenWrt /${BUILD_TAG} /g" \
  package/lean/default-settings/files/zzz-default-settings
echo "📦 版本号标识设置为：${BUILD_TAG}"

# ✅ 设置默认主题（精确替换）
DEFAULT_THEME="luci-theme-material"
sed -i "s/\"luci-theme-bootstrap\"/\"${DEFAULT_THEME}\"/" \
  feeds/luci/collections/luci/Makefile
echo "🎨 默认主题设置为：${DEFAULT_THEME}"

# ✅ 设置 Luci 默认主题路径
THEME_PATH="uci set luci.main.mediaurlbase='/luci-static/material'"
sed -i "/uci commit luci/i\\${THEME_PATH}" \
  package/lean/default-settings/files/zzz-default-settings
echo "🧩 Luci 默认主题路径设置完成"

# ✅ 修改默认 WiFi 名称与加密方式
WIFI_SSID="Xiaomi_R4A"
WIFI_PASS="12345678"
sed -i "s/ssid=OpenWrt/ssid=${WIFI_SSID}/g" \
  package/kernel/mac80211/files/lib/wifi/mac80211.sh
sed -i "/set wireless.default_radio\${devidx}.ssid/a\\\ \ \ \ set wireless.default_radio\${devidx}.encryption='psk2'\n\ \ \ \ set wireless.default_radio\${devidx}.key='${WIFI_PASS}'" \
  package/kernel/mac80211/files/lib/wifi/mac80211.sh
echo "📶 默认 WiFi 名称设置为：${WIFI_SSID}，密码：${WIFI_PASS}"

# ✅ 设置系统默认语言为中文
LANG_SETTING='uci set luci.main.lang=zh_cn\nuci commit luci'
sed -i "/uci commit system/a\\${LANG_SETTING}" \
  package/lean/default-settings/files/zzz-default-settings
echo "🌐 系统默认语言设置为：中文"

# ✅ 修改默认 LAN IP 地址
LAN_IP="192.168.101.1"
sed -i "s/192.168.1.1/${LAN_IP}/g" package/base-files/files/bin/config_generate
echo "🌐 默认 LAN IP 地址设置为：${LAN_IP}"

echo "✅ 系统定制配置完成。"
