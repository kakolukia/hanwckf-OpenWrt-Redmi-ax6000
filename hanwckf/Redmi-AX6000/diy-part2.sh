#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# Custom for REDMI AX6000

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
