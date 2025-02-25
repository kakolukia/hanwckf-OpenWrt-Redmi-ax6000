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
rm -rf feeds/luci/applications/luci-app-alist
rm -rf feeds/luci/applications/luci-app-mosdns
rm -rf feeds/luci/applications/luci-app-unblockneteasemusic
rm -rf feeds/luci/applications/luci-app-ddns-go
rm -rf feeds/packages/lang/golang
rm -rf feeds/packages/net/alist
rm -rf feeds/packages/net/cdnspeedtest
rm -rf feeds/packages/net/chinadns-ng
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
git clone https://github.com/sbwml/packages_lang_golang -b 23.x feeds/packages/lang/golang
# git clone https://github.com/vernesong/OpenClash.git package/luci-app-openclash
git clone https://github.com/pexcn/openwrt-chinadns-ng.git package/chinadns-ng
git clone https://github.com/sbwml/luci-app-mosdns -b v5 package/mosdns
git clone https://github.com/sbwml/v2ray-geodata package/v2ray-geodata
git clone https://github.com/sirpdboy/luci-app-ddns-go.git package/ddns-go
git clone https://github.com/gdy666/luci-app-lucky.git package/lucky && cd package/lucky/ && git checkout 3f856de2d521e1b9b9c6e4f51b24c19a0938f2da && cd -
git clone https://github.com/sbwml/luci-app-alist package/alist
git clone https://github.com/UnblockNeteaseMusic/luci-app-unblockneteasemusic.git -b js package/luci-app-unblockneteasemusic
git clone https://github.com/immortalwrt-collections/openwrt-cdnspeedtest.git -b master package/cdnspeedtest
# git clone https://github.com/hubbylei/openwrt-cdnspeedtest -b master package/openwrt-cdnspeedtest
git clone https://github.com/hubbylei/luci-app-cloudflarespeedtest -b main package/luci-app-cloudflarespeedtest
# git clone https://github.com/sirpdboy/netspeedtest.git package/netspeedtest
