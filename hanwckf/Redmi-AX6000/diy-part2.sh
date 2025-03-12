#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

### 清理重复插件 ###
del_data="
feeds/luci/applications/luci-app-alist
feeds/luci/applications/luci-app-ddns-go
feeds/luci/applications/luci-app-dockerman
feeds/luci/applications/luci-app-mosdns
feeds/luci/applications/luci-app-passwall
feeds/luci/applications/luci-app-smartdns
feeds/luci/applications/luci-app-unblockneteasemusic
feeds/luci/applications/luci-app-wechatpush
feeds/luci/collections/luci-lib-docker
feeds/modemfeed/luci/themes/luci-theme-routerich
feeds/modemfeed/packages/net/accel-ppp
feeds/packages/devel/gn
feeds/packages/lang/golang
feeds/packages/net/adguardhome
feeds/packages/net/alist
feeds/packages/net/cdnspeedtest
feeds/packages/net/chinadns-ng
feeds/packages/net/dns2socks
feeds/packages/net/dns2tcp
feeds/packages/net/ddns-go
feeds/packages/net/hysteria
feeds/packages/net/ipt2socks
feeds/packages/net/microsocks
feeds/packages/net/mosdns
feeds/packages/net/naiveproxy
feeds/packages/net/pdnsd-alt
feeds/packages/net/simple-obfs
feeds/packages/net/sing-box
feeds/packages/net/smartdns
feeds/packages/net/tcping
feeds/packages/net/trojan
feeds/packages/net/trojan-go
feeds/packages/net/trojan-plus
feeds/packages/net/tuic-client
feeds/packages/net/v2ray-core
feeds/packages/net/v2ray-geodata
feeds/packages/net/v2ray-plugin
feeds/packages/net/xray-core
feeds/packages/net/xray-plugin
"
for data in ${del_data};
do
    if [[ -d ${data} || -f ${data} ]];then
        rm -rf ${data}
        echo "Deleted ${data}"
    fi
done

# 
# rm -rf feeds/luci/applications/luci-app-alist
# rm -rf feeds/luci/applications/luci-app-mosdns
# rm -rf feeds/luci/applications/luci-app-unblockneteasemusic
# rm -rf feeds/packages/lang/golang
# rm -rf feeds/packages/net/alist
# rm -rf feeds/packages/net/cdnspeedtest
# rm -rf feeds/packages/net/chinadns-ng
# rm -rf feeds/packages/net/mosdns
# rm -rf feeds/packages/net/v2ray-core
# rm -rf feeds/packages/net/v2ray-plugin
# rm -rf feeds/packages/net/v2ray-geodata
# rm -rf feeds/packages/net/xray-core
# rm -rf feeds/packages/net/xray-plugin
# rm -rf feeds/packages/utils/v2dat
# rm -rf feeds/passwall_packages/shadowsocks-rust
# rm -rf feeds/packages/net/{alist,adguardhome,mosdns,xray*,v2ray*,v2ray*,sing*,smartdns}
# rm -rf feeds/kenzo/{base-files,dnsmasq,firewall*,fullconenat,libnftnl,nftables,ppp,opkg,ucl,upx,vsftpd-alt,miniupnpd-iptables,wireless-regdb}
# rm -rf feeds/smpackage/{base-files,dnsmasq,firewall*,fullconenat,libnftnl,nftables,ppp,opkg,ucl,upx,vsftpd*,miniupnpd-iptables,wireless-regdb}
# find ./ | grep Makefile | grep v2ray-geodata | xargs rm -f
# find ./ | grep Makefile | grep mosdns | xargs rm -f


### 自定义插件 ###
# Git 稀疏克隆，只克隆指定目录到本地
function git_sparse_clone() {
  branch="$1" repourl="$2" && shift 2
  git clone --depth=1 -b $branch --single-branch --filter=blob:none --sparse $repourl
  repodir=$(echo $repourl | awk -F '/' '{print $(NF)}')
  cd $repodir && git sparse-checkout set $@
  mv -f $@ ../package
  cd .. && rm -rf $repodir
}

# Golang
# git clone --depth=1 https://github.com/kenzok8/golang feeds/packages/lang/golang
git clone --depth=1 https://github.com/sbwml/packages_lang_golang -b 24.x feeds/packages/lang/golang
# ./scripts/feeds install -a -p golang

# Lang/rust
# git_sparse_clone master https://github.com/openwrt/packages lang
# unalias cp
# cp -rf package/lang/rust feeds/packages/lang/
# alias cp='cp -i'
# rm -rf package/lang
# ./scripts/feeds install -a -p lang

# 科学上网插件
# git clone --depth=1 -b main https://github.com/fw876/helloworld package/luci-app-ssr-plus
# git clone --depth=1  https://github.com/kenzok8/openwrt-packages package/kenzo
git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall-packages package/openwrt-passwall
git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall package/luci-app-passwall
# git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall2 package/luci-app-passwall2
# git_sparse_clone master https://github.com/vernesong/OpenClash luci-app-openclash

# 科学上网单独插件
# git_sparse_clone master https://github.com/kenzok8/openwrt-packages shadowsocks-rust

# Adguardhome
# git clone --depth=1 https://github.com/kongfl888/luci-app-adguardhome package/luci-app-adguardhome

# Alist
git clone --depth=1 https://github.com/sbwml/luci-app-alist package/luci-app-alist

# Chinadns-ng
# git_sparse_clone main https://github.com/xiaorouji/openwrt-passwall-packages chinadns-ng

# DDNS-GO
# git clone --depth=1 https://github.com/sirpdboy/luci-app-ddns-go.git package/ddns-go

# DDNS.to
# git_sparse_clone main https://github.com/linkease/nas-packages-luci luci/luci-app-ddnsto
# git_sparse_clone master https://github.com/linkease/nas-packages network/services/ddnsto

# Docker
# git clone --depth=1 https://github.com/lisaac/luci-lib-docker.git package/lib-docker
# git clone --depth=1 https://github.com/lisaac/luci-app-dockerman.git package/dockerman

# Filebrowser
# git clone --depth=1 https://github.com/xiaozhuai/luci-app-filebrowser package/luci-app-filebrowser

# iStore
# git_sparse_clone main https://github.com/linkease/istore-ui app-store-ui
# git_sparse_clone main https://github.com/linkease/istore luci

# Lucky
git clone --depth=1 https://github.com/gdy666/luci-app-lucky.git package/lucky
# git clone https://github.com/gdy666/luci-app-lucky.git package/lucky && cd package/lucky/ && git checkout 3f856de2d521e1b9b9c6e4f51b24c19a0938f2da && cd $GITHUB_WORKSPACE/openwrt

# Koolproxy
# git clone --depth=1 https://github.com/ilxp/luci-app-ikoolproxy package/luci-app-ikoolproxy

# MosDNS
git clone --depth=1 https://github.com/sbwml/v2ray-geodata package/v2ray-geodata
git clone --depth=1 https://github.com/sbwml/luci-app-mosdns -b v5 package/luci-app-mosdns

# Netdata
# git clone --depth=1 https://github.com/Jason6111/luci-app-netdata package/luci-app-netdata

# OpenAppFilter
# git clone --depth=1 https://github.com/destan19/OpenAppFilter package/OpenAppFilter

# Poweroff
# git clone --depth=1 https://github.com/esirplayground/luci-app-poweroff package/luci-app-poweroff

# Unblockneteasemusic
git clone --depth=1 https://github.com/UnblockNeteaseMusic/luci-app-unblockneteasemusic.git -b js package/luci-app-unblockneteasemusic

# SmartDNS
# git clone --depth=1 -b master https://github.com/pymumu/luci-app-smartdns package/luci-app-smartdns
# git clone --depth=1 https://github.com/pymumu/openwrt-smartdns package/smartdns

WORKINGDIR="`pwd`/feeds/packages/net/smartdns"
mkdir $WORKINGDIR -p
rm $WORKINGDIR/* -fr
wget https://github.com/pymumu/openwrt-smartdns/archive/master.zip -O $WORKINGDIR/master.zip
unzip $WORKINGDIR/master.zip -d $WORKINGDIR
mv $WORKINGDIR/openwrt-smartdns-master/* $WORKINGDIR/
rmdir $WORKINGDIR/openwrt-smartdns-master
rm $WORKINGDIR/master.zip

LUCIBRANCH="master" #更换此变量
WORKINGDIR="`pwd`/feeds/luci/applications/luci-app-smartdns"
mkdir $WORKINGDIR -p
rm $WORKINGDIR/* -fr
wget https://github.com/pymumu/luci-app-smartdns/archive/${LUCIBRANCH}.zip -O $WORKINGDIR/${LUCIBRANCH}.zip
unzip $WORKINGDIR/${LUCIBRANCH}.zip -d $WORKINGDIR
mv $WORKINGDIR/luci-app-smartdns-${LUCIBRANCH}/* $WORKINGDIR/
rmdir $WORKINGDIR/luci-app-smartdns-${LUCIBRANCH}
rm $WORKINGDIR/${LUCIBRANCH}.zip

# Speedtest
# git clone --depth=1 https://github.com/immortalwrt-collections/openwrt-cdnspeedtest.git -b master package/openwrt-cdnspeedtest
git clone --depth=1 https://github.com/hubbylei/openwrt-cdnspeedtest -b master package/openwrt-cdnspeedtest
git clone --depth=1 https://github.com/hubbylei/luci-app-cloudflarespeedtest -b main package/luci-app-cloudflarespeedtest
# git clone --depth=1 https://github.com/sirpdboy/netspeedtest.git package/netspeedtest

# Themes
# git clone --depth=1 -b 18.06 https://github.com/kiddin9/luci-theme-edge package/luci-theme-edge
# git clone --depth=1 -b 18.06 https://github.com/jerrykuku/luci-theme-argon package/luci-theme-argon
# git clone --depth=1 https://github.com/jerrykuku/luci-app-argon-config package/luci-app-argon-config
# git clone --depth=1 https://github.com/xiaoqingfengATGH/luci-theme-infinityfreedom package/luci-theme-infinityfreedom
# git_sparse_clone main https://github.com/haiibo/packages luci-theme-atmaterial luci-theme-opentomcat luci-theme-netgear

# Wechatpush
# git clone --depth=1 -b master https://github.com/tty228/luci-app-wechatpush package/luci-app-serverchan


### 更新 feeds（已设置在工作流文件中）###
# ./scripts/feeds install -a


### 程序设置 ###
# 修复 hostapd 报错
# cp -f $GITHUB_WORKSPACE/scripts/011-fix-mbo-modules-build.patch package/network/services/hostapd/patches/011-fix-mbo-modules-build.patch

# 修复 armv8 设备 xfsprogs 报错
# sed -i 's/TARGET_CFLAGS.*/TARGET_CFLAGS += -DHAVE_MAP_SYNC -D_LARGEFILE64_SOURCE/g' feeds/packages/utils/xfsprogs/Makefile

# 修改 Makefile
# find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/..\/..\/luci.mk/$(TOPDIR)\/feeds\/luci\/luci.mk/g' {}
# find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/..\/..\/lang\/golang\/golang-package.mk/$(TOPDIR)\/feeds\/packages\/lang\/golang\/golang-package.mk/g' {}
# find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/PKG_SOURCE_URL:=@GHREPO/PKG_SOURCE_URL:=https:\/\/github.com/g' {}
# find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/PKG_SOURCE_URL:=@GHCODELOAD/PKG_SOURCE_URL:=https:\/\/codeload.github.com/g' {}

# smartdns
# SMARTDNS_JSON=$(curl -sL -H "${headers}" https://api.github.com/repos/pymumu/smartdns/commits)
# SMARTDNS_VER=$(echo ${SMARTDNS_JSON} | jq -r .[0].commit.committer.date | awk -F "T" '{print $1}')
# SMARTDNS_SHA=$(echo ${SMARTDNS_JSON} | jq -r .[0].sha)

# curl -sL -o /tmp/smartdns-${SMARTDNS_SHA}.tar.gz https://codeload.github.com/pymumu/smartdns/tar.gz/${SMARTDNS_SHA}
# SMARTDNS_PKG_SHA=$(sha256sum /tmp/smartdns-${SMARTDNS_SHA}.tar.gz | awk '{print $1}')
# rm -rf /tmp/smartdns-${SMARTDNS_SHA}.tar.gz

# sed -i 's/PKG_VERSION:=.*/PKG_VERSION:='${SMARTDNS_SHA}'/g' package/custom/smartdns/Makefile
# sed -i 's/PKG_SOURCE_PROTO:=git/PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz/g' package/custom/smartdns/Makefile
# sed -i 's/PKG_SOURCE_URL:=.*/PKG_SOURCE_URL:=https:\/\/codeload.github.com\/pymumu\/smartdns\/tar.gz\/$(PKG_VERSION)?/g' package/custom/smartdns/Makefile
# sed -i '/PKG_SOURCE_VERSION:=.*/d' package/custom/smartdns/Makefile
# sed -i 's/PKG_MIRROR_HASH:=.*/PKG_HASH:='${SMARTDNS_PKG_SHA}'/g' package/custom/smartdns/Makefile
# sed -i 's/PKG_VERSION:=.*/PKG_VERSION:='${SMARTDNS_VER}'/g' package/custom/luci-app-smartdns/Makefile
# sed -i 's/..\/..\/luci.mk/$(TOPDIR)\/feeds\/luci\/luci.mk/g' package/custom/luci-app-smartdns/Makefile

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


### 个性化设置 ###
# Lan IP
sed -i 's/192.168.1.1/192.168.6.1/g' package/base-files/files/bin/config_generate

# 更改 Argon 主题背景
# cp -f $GITHUB_WORKSPACE/images/bg1.jpg package/luci-theme-argon/htdocs/luci-static/argon/img/bg1.jpg

# x86 型号只显示 CPU 型号
# sed -i 's/${g}.*/${a}${b}${c}${d}${e}${f}${hydrid}/g' package/lean/autocore/files/x86/autocore

# 修改本地时间格式
# sed -i 's/os.date()/os.date("%a %Y-%m-%d %H:%M:%S")/g' package/lean/autocore/files/*/index.htm

# 修改版本为编译日期
# date_version=$(date +"%y.%m.%d")
# orig_version=$(cat "package/lean/default-settings/files/zzz-default-settings" | grep DISTRIB_REVISION= | awk -F "'" '{print $2}')
# sed -i "s/${orig_version}/R${date_version} by Haiibo/g" package/lean/default-settings/files/zzz-default-settings

# 取消主题默认设置
# find package/luci-theme-*/* -type f -name '*luci-theme-*' -print -exec sed -i '/set luci.main.mediaurlbase/d' {} \;

# 调整 Docker 到 服务 菜单
# sed -i 's/"admin"/"admin", "services"/g' feeds/luci/applications/luci-app-dockerman/luasrc/controller/*.lua
# sed -i 's/"admin"/"admin", "services"/g; s/admin\//admin\/services\//g' feeds/luci/applications/luci-app-dockerman/luasrc/model/cbi/dockerman/*.lua
# sed -i 's/admin\//admin\/services\//g' feeds/luci/applications/luci-app-dockerman/luasrc/view/dockerman/*.htm
# sed -i 's|admin\\|admin\\/services\\|g' feeds/luci/applications/luci-app-dockerman/luasrc/view/dockerman/container.htm

# 调整 ZeroTier 到 服务 菜单
# sed -i 's/vpn/services/g; s/VPN/Services/g' feeds/luci/applications/luci-app-zerotier/luasrc/controller/zerotier.lua
# sed -i 's/vpn/services/g' feeds/luci/applications/luci-app-zerotier/luasrc/view/zerotier/zerotier_status.htm

# 取消对 samba4 的菜单调整
# sed -i '/samba4/s/^/#/' package/lean/default-settings/files/zzz-default-settings

# 调整 V2ray服务器 到 VPN 菜单
# sed -i 's/services/vpn/g' feeds/luci/applications/luci-app-v2ray-server/luasrc/controller/*.lua
# sed -i 's/services/vpn/g' feeds/luci/applications/luci-app-v2ray-server/luasrc/model/cbi/v2ray_server/*.lua
# sed -i 's/services/vpn/g' feeds/luci/applications/luci-app-v2ray-server/luasrc/view/v2ray_server/*.htm
