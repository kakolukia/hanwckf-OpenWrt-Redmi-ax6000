#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# Custom for REDMI AX6000
# del_data="
# feeds/luci/applications/luci-app-passwall
# feeds/luci/applications/luci-app-wechatpush
# feeds/luci/applications/luci-app-smartdns
# feeds/luci/applications/luci-app-serverchan
# feeds/luci/applications/luci-app-mosdns
# feeds/packages/net/brook
# feeds/packages/net/dns2socks
# feeds/packages/net/microsocks
# feeds/packages/net/pdnsd-alt
# feeds/packages/net/v2ray-geodata
# feeds/packages/net/naiveproxy
# feeds/packages/net/shadowsocks-rust
# feeds/packages/net/shadowsocksr-libev
# feeds/packages/net/simple-obfs
# feeds/packages/net/sing-box
# feeds/packages/net/tcping
# feeds/packages/net/trojan
# feeds/packages/net/trojan-go
# feeds/packages/net/trojan-plus
# feeds/packages/net/v2ray-core
# feeds/packages/net/v2ray-plugin
# feeds/packages/net/xray-plugin
# feeds/packages/net/chinadns-ng
# feeds/packages/net/dns2tcp
# feeds/packages/net/tcping
# feeds/packages/net/hysteria
# feeds/packages/net/tuic-client
# feeds/packages/net/smartdns
# feeds/packages/net/ipt2socks
# feeds/packages/net/xray-core
# feeds/packages/net/cdnspeedtest
# feeds/packages/lang/rust
# feeds/packages/lang/golang
# feeds/packages/devel/gn
# target/linux/mediatek/patches-5.4/0504-macsec-revert-async-support.patch
# target/linux/mediatek/patches-5.4/0005-dts-mt7622-add-gsw.patch
# target/linux/mediatek/patches-5.4/0993-arm64-dts-mediatek-Split-PCIe-node-for-MT2712-MT7622.patch
# target/linux/mediatek/patches-5.4/1024-pcie-add-multi-MSI-support.patch
# "
# 
# for data in ${del_data};
# do
#     if [[ -d ${data} || -f ${data} ]];then
#         rm -rf ${data}
#         echo "Deleted ${data}"
#     fi
# done

# ./scripts/feeds update -a

# clean dupe package makefile
rm -rf feeds/luci/applications/luci-app-mosdns
# rm -rf feeds/packages/lang/golang
rm -rf feeds/packages/net/mosdns
# rm -rf feeds/packages/net/v2ray-core
# rm -rf feeds/packages/net/v2ray-plugin
rm -rf feeds/packages/net/v2ray-geodata
# rm -rf feeds/packages/net/xray-core
# rm -rf feeds/packages/net/xray-plugin
# rm -rf feeds/packages/net/{alist,adguardhome,mosdns,xray*,v2ray*,v2ray*,sing*,smartdns}
# rm -rf feeds/packages/utils/v2dat
rm -rf feeds/smpackage/{base-files,dnsmasq,firewall*,fullconenat,libnftnl,nftables,ppp,opkg,ucl,upx,vsftpd*,miniupnpd-iptables,wireless-regdb}
# find ./ | grep Makefile | grep v2ray-geodata | xargs rm -f
# find ./ | grep Makefile | grep mosdns | xargs rm -f
# find ./ | grep Makefile | grep ddns-go | xargs rm -f

# 3rd packages
# git clone https://github.com/kenzok8/golang feeds/packages/lang/golang
# git clone --depth 1 --single-branch https://github.com/sbwml/packages_lang_golang -b 23.x feeds/packages/lang/golang
git clone https://github.com/sbwml/luci-app-mosdns -b v5 package/mosdns
git clone https://github.com/sbwml/v2ray-geodata package/v2ray-geodata
git clone https://github.com/sirpdboy/luci-app-ddns-go.git package/ddns-go
git clone https://github.com/gdy666/luci-app-lucky.git package/lucky
# git clone https://github.com/sbwml/luci-app-alist package/alist
# git clone https://github.com/vernesong/OpenClash.git package/luci-app-openclash

./scripts/feeds install -a

# v2ray-geodata
# GEOIP_VER=$(echo -n `curl -sL https://api.github.com/repos/Loyalsoldier/v2ray-rules-dat/releases/latest | jq -r .tag_name`)
# GEOIP_HASH=$(echo -n `curl -sL https://github.com/Loyalsoldier/v2ray-rules-dat/releases/download/$GEOIP_VER/geoip.dat.sha256sum | awk '{print $1}'`)
# GEOSITE_VER=$GEOIP_VER
# GEOSITE_HASH=$(echo -n `curl -sL https://github.com/Loyalsoldier/v2ray-rules-dat/releases/download/$GEOSITE_VER/geosite.dat.sha256sum | awk '{print $1}'`)
# sed -i '/HASH:=/d' package/custom/passwall-packages/v2ray-geodata/Makefile
# 
# sed -i 's/GEOIP_VER:=.*/GEOIP_VER:='"$GEOIP_VER"'/g' package/custom/passwall-packages/v2ray-geodata/Makefile
# sed -i 's/https:\/\/github.com\/v2fly\/geoip/https:\/\/github.com\/Loyalsoldier\/v2ray-rules-dat/g' package/custom/passwall-packages/v2ray-geodata/Makefile
# sed -i '/FILE:=$(GEOIP_FILE)/a\\tHASH:='"$GEOIP_HASH"'' package/custom/passwall-packages/v2ray-geodata/Makefile
# 
# sed -i 's/https:\/\/github.com\/v2fly\/domain-list-community/https:\/\/github.com\/Loyalsoldier\/v2ray-rules-dat/g' package/custom/passwall-packages/v2ray-geodata/Makefile
# sed -i 's/GEOSITE_VER:=.*/GEOSITE_VER:='"$GEOSITE_VER"'/g' package/custom/passwall-packages/v2ray-geodata/Makefile
# sed -i 's/dlc.dat/geosite.dat/g' package/custom/passwall-packages/v2ray-geodata/Makefile
# sed -i '/FILE:=$(GEOSITE_FILE)/a\\tHASH:='"$GEOSITE_HASH"'' package/custom/passwall-packages/v2ray-geodata/Makefile
# 
# sed -i 's/URL:=https:\/\/www.v2fly.org/URL:=https:\/\/github.com\/Loyalsoldier\/v2ray-rules-dat/g' package/custom/passwall-packages/v2ray-geodata/Makefile

# 个性化设置
sed -i 's/192.168.1.1/192.168.6.1/g' package/base-files/files/bin/config_generate
# sed -i 's/ImmortalWrt/OpenWrt/g' package/base-files/files/bin/config_generate
# sed -i 's/pool.ntp.org/3.openwrt.pool.ntp.org/g' package/base-files/files/bin/config_generate
# sed -i 's/time1.apple.com/0.openwrt.pool.ntp.org/g' package/base-files/files/bin/config_generate
# sed -i 's/time1.google.com/1.openwrt.pool.ntp.org/g' package/base-files/files/bin/config_generate
# sed -i 's/time.cloudflare.com/2.openwrt.pool.ntp.org/g' package/base-files/files/bin/config_generate
# sed -i 's/default-settings-chn/default-settings/g' include/target.mk
# sed -i 's/ImmortalWrt/OpenWrt/g' include/version.mk
# sed -i 's,https://immortalwrt.org/,https://openwrt.org/,g' include/version.mk
# sed -i 's,https://github.com/immortalwrt/immortalwrt/issues,https://bugs.openwrt.org/,g' include/version.mk
# sed -i 's,https://github.com/immortalwrt/immortalwrt/discussions,https://forum.openwrt.org/,g' include/version.mk
# sed -i 's,https://downloads.immortalwrt.org/releases/21.02-SNAPSHOT,https://downloads.openwrt.org/releases/21.02-SNAPSHOT,g' include/version.mk
# cp $GITHUB_WORKSPACE/hanwckf/Redmi-AX6000/data/mt7986a-xiaomi-redmi-router-ax6000.dtsi target/linux/mediatek/files-5.4/arch/arm64/boot/dts/mediatek/
# cat > package/base-files/files/etc/banner << EOF
#   _______                     ________        __
#  |       |.-----.-----.-----.|  |  |  |.----.|  |_
#  |   -   ||  _  |  -__|     ||  |  |  ||   _||   _|
#  |_______||   __|_____|__|__||________||__|  |____|
#           |__| W I R E L E S S   F R E E D O M
#  -----------------------------------------------------
#  %D %V, %C
#  -----------------------------------------------------
# EOF
