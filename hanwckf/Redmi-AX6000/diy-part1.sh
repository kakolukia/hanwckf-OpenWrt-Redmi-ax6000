#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
# sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default
# sed -i '$a src-git smpackage https://github.com/kenzok8/small-package' feeds.conf.default
# sed -i '1i src-git kenzo https://github.com/kenzok8/openwrt-packages' feeds.conf.default
# sed -i '2i src-git small https://github.com/kenzok8/small' feeds.conf.default

# Add a feed source
# echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall;main' >>feeds.conf.default
echo 'src-git passwall_packages https://github.com/xiaorouji/openwrt-passwall-packages;main' >>feeds.conf.default
# echo 'src-git openclash https://github.com/vernesong/OpenClash.git;master' >>feeds.conf.default
# echo 'src-git ddns-go https://github.com/sirpdboy/luci-app-ddns-go.git;main' >>feeds.conf.default
# git clone https://github.com/kenzok8/golang feeds/packages/lang/golang
# echo 'src-git lucky https://github.com/sirpdboy/luci-app-lucky;main' >>feeds.conf.default
# echo 'src-git mosdns https://github.com/sbwml/luci-app-mosdns;v5' >>feeds.conf.default
# echo 'src-git v2ray-geodata https://github.com/sbwml/v2ray-geodata' >>feeds.conf.default
# echo 'src-git istore https://github.com/linkease/istore;main' >>feeds.conf.default
# echo 'src-git alist https://github.com/sbwml/luci-app-alist' >>feeds.conf.default
# echo 'src-git messense https://github.com/messense/aliyundrive-webdav' >>feeds.conf.default

# git clone
# git clone https://github.com/sbwml/luci-app-mosdns -b v5 package/mosdns
# git clone https://github.com/sbwml/v2ray-geodata package/v2ray-geodata
