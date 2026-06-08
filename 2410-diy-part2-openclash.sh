#!/bin/bash

# 先执行上游原版 diy 脚本(等价于继承)
bash "$GITHUB_WORKSPACE/2410-diy-part2.sh"

# === 追加 OpenClash 相关包 ===
echo "CONFIG_PACKAGE_luci-app-openclash=y" >> .config
echo "CONFIG_PACKAGE_luci-i18n-openclash-zh-cn=y" >> .config

# OpenClash 运行依赖
echo "CONFIG_PACKAGE_coreutils=y" >> .config
echo "CONFIG_PACKAGE_coreutils-nohup=y" >> .config
echo "CONFIG_PACKAGE_bash=y" >> .config
echo "CONFIG_PACKAGE_curl=y" >> .config
echo "CONFIG_PACKAGE_ca-certificates=y" >> .config
echo "CONFIG_PACKAGE_ipset=y" >> .config
echo "CONFIG_PACKAGE_ip-full=y" >> .config
echo "CONFIG_PACKAGE_libcap=y" >> .config
echo "CONFIG_PACKAGE_libcap-bin=y" >> .config
echo "CONFIG_PACKAGE_ruby=y" >> .config
echo "CONFIG_PACKAGE_ruby-yaml=y" >> .config
echo "CONFIG_PACKAGE_kmod-tun=y" >> .config
echo "CONFIG_PACKAGE_kmod-inet-diag=y" >> .config
echo "CONFIG_PACKAGE_unzip=y" >> .config

# dnsmasq-full 替换 dnsmasq(OpenClash 需要 ipset 支持)
echo "CONFIG_PACKAGE_dnsmasq=n" >> .config
echo "CONFIG_PACKAGE_dnsmasq-full=y" >> .config
