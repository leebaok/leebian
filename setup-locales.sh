#!/bin/bash

sed -e "s/# ja_JP.UTF-8/ja_JP.UTF-8/g" \
    -e "s/# ko_KR.UTF-8/ko_KR.UTF-8/g" \
    -e "s/# zh_CN GB2312/zh_CN GB2312/g" \
    -e "s/# zh_CN.GB18030/zh_CN.GB18030/g" \
    -e "s/# zh_CN.GBK/zh_CN.GBK/g" \
    -e "s/# zh_CN.UTF-8/zh_CN.UTF-8/g" \
    /etc/locale.gen > locales-temp

mv locales-temp /etc/locale.gen

locale-gen

# run dpkg-reconfigure locales to set default locale
