# xiaomi-R4a-room
小米 R4A 千兆版定制 OpenWrt，浙工大可用，支持l2tp，pppoe，ui美化，clash，广告屏蔽
本项目为小米 R4A 千兆版量身打造的 OpenWrt 固件，适配浙工大校园网环境，集成多种实用插件与美化功能，致力于实现一站式网络优化与科学上网体验。


L2TP / PPPoE | 支持校园网认证协议，适配浙工大网络环境，L2TP为移动PPPoE为电信
🎨 UI 美化	| 默认采用 Material 主题，界面清爽美观
🚫 广告过滤	| 集成 AdGuard Home，有效屏蔽网页广告
🔀 科学上网	| 集成 OpenClash，支持规则分流与多种代理协议
⚡ DNS 加速	| 集成 SmartDNS，提升域名解析速度
🌐 IPv6 支持	| 完善的 IPv6 协议栈与 NAT6 支持
📶 多拨支持	| 可选开启 mwan3 + syncdial，实现多线路负载均衡

插件配置脚本（DIY Part 1）
自动添加以下插件至 .config 文件：
luci-i18n-base-zh-cn
luci-proto-l2tp, ppp-mod-pppol2tp
luci-proto-ppp, ppp
luci-app-adguardhome
luci-app-openclash
luci-app-smartdns, smartdns
ipv6helper, luci-proto-ipv6
luci-theme-material

系统定制脚本（DIY Part 2）
执行 feeds 更新后运行，完成以下定制：
设置主机名为 Xiaomi-R4A
编译版本号标识为 ZhangYufeng build YYYY.MM.DD @ OpenWrt
默认主题设为 Material
默认 WiFi 名称为 Xiaomi_R4A
系统语言设为中文 zh_cn

目标架构：ramips/mt7621
精简系统组件：使用 ip-tiny 替代 ip-full，禁用部分不必要模块（如 SSR、Xray、ZeroTier）
保留常用库：libstdcpp、libminiupnpc、libnatpmp、kmod-tun

本项目采用 AGPL-3.0 协议，欢迎自由使用与修改，但请保持开源。
