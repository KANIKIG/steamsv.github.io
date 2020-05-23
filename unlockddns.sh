#!/usr/bin/env bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
export TZ=Asia/Shanghai

#=================================================
#	System Required: CentOS/Debian/Ubuntu
#	Description: System Checker
#	Version: 1.0.0
#	Author: Hellcat
#=================================================

sh_ver="1.0.0"

Green_font_prefix="\033[32m" && Red_font_prefix="\033[31m" && Green_background_prefix="\033[42;37m" && Red_background_prefix="\033[41;37m" && Font_color_suffix="\033[0m"
Info="${Green_font_prefix}[信息]${Font_color_suffix}"
Error="${Red_font_prefix}[错误]${Font_color_suffix}"
Tip="${Green_font_prefix}[注意]${Font_color_suffix}"

check_root(){
	[[ $EUID != 0 ]] && echo -e "${Error} 当前非ROOT账号(或没有ROOT权限)，无法继续操作，请更换ROOT账号或使用 ${Green_background_prefix}sudo su${Font_color_suffix} 命令获取临时ROOT权限（执行后可能会提示输入当前账号的密码）。" && exit 1
}
#检查系统
check_sys(){
	if [[ -f /etc/redhat-release ]]; then
		release="centos"
	elif cat /etc/issue | grep -q -E -i "debian"; then
		release="debian"
	elif cat /etc/issue | grep -q -E -i "ubuntu"; then
		release="ubuntu"
	elif cat /etc/issue | grep -q -E -i "centos|red hat|redhat"; then
		release="centos"
	elif cat /proc/version | grep -q -E -i "debian"; then
		release="debian"
	elif cat /proc/version | grep -q -E -i "ubuntu"; then
		release="ubuntu"
	elif cat /proc/version | grep -q -E -i "centos|red hat|redhat"; then
		release="centos"
    fi
	bit=`uname -m`
}

checkhk1(){
	echo && echo -e "${Red_font_prefix}获取脚本并执行中："
	wget https://steamsv.com.wiki/dns/hk1-ddns.py
	python hk1-ddns.py
	echo "*/10 * * * * python /root/checkdns.py" >> /var/spool/cron/root
	echo && echo -e "${Font_color_suffix}"

	start
}

checkhk2(){
	echo && echo -e "${Red_font_prefix}获取脚本并执行中："
	wget https://steamsv.com.wiki/dns/hk2-ddns.py
	python hk1-ddns.py
	echo "*/10 * * * * python /root/checkdns.py" >> /var/spool/cron/root
	echo && echo -e "${Font_color_suffix}"

	start
}

checktw1(){
	echo && echo -e "${Red_font_prefix}获取脚本并执行中："
	wget https://steamsv.com.wiki/dns/tw1-ddns.py
	python hk1-ddns.py
	echo "*/10 * * * * python /root/checkdns.py" >> /var/spool/cron/root
	echo && echo -e "${Font_color_suffix}"

	start	
}

checktw2(){
    echo && echo -e "${Red_font_prefix}获取脚本并执行中："
	wget https://steamsv.com.wiki/dns/tw2-ddns.py
	python hk1-ddns.py
	echo "*/10 * * * * python /root/checkdns.py" >> /var/spool/cron/root
	echo && echo -e "${Font_color_suffix}"

	start
}

checktw3(){
    echo && echo -e "${Red_font_prefix}获取脚本并执行中："
	wget https://steamsv.com.wiki/dns/tw3-ddns.py
	python hk1-ddns.py
	echo "*/10 * * * * python /root/checkdns.py" >> /var/spool/cron/root
	echo && echo -e "${Font_color_suffix}"

	start
}

checkus1(){
    echo && echo -e "${Red_font_prefix}获取脚本并执行中："
	wget https://steamsv.com.wiki/dns/us1-ddns.py
	python hk1-ddns.py
	echo "*/10 * * * * python /root/checkdns.py" >> /var/spool/cron/root
	echo && echo -e "${Font_color_suffix}"

	start
}

checkus2(){
    echo && echo -e "${Red_font_prefix}获取脚本并执行中："
	wget https://steamsv.com.wiki/dns/us2-ddns.py
	python hk1-ddns.py
	echo "*/10 * * * * python /root/checkdns.py" >> /var/spool/cron/root
	echo && echo -e "${Font_color_suffix}"

	start
}

checkus3(){
    echo && echo -e "${Red_font_prefix}获取脚本并执行中："
	wget https://steamsv.com.wiki/dns/us3-ddns.py
	python hk1-ddns.py
	echo "*/10 * * * * python /root/checkdns.py" >> /var/spool/cron/root
	echo && echo -e "${Font_color_suffix}"

	start
}

checkus4(){
    echo && echo -e "${Red_font_prefix}获取脚本并执行中："
	wget https://steamsv.com.wiki/dns/us4-ddns.py
	python hk1-ddns.py
	echo "*/10 * * * * python /root/checkdns.py" >> /var/spool/cron/root
	echo && echo -e "${Font_color_suffix}"

	start
}

checkussg1(){
    echo && echo -e "${Red_font_prefix}获取脚本并执行中："
	wget https://steamsv.com.wiki/dns/sg1-ddns.py
	python hk1-ddns.py
	echo "*/10 * * * * python /root/checkdns.py" >> /var/spool/cron/root
	echo && echo -e "${Font_color_suffix}"

	start
}

checksg2(){
    echo && echo -e "${Red_font_prefix}获取脚本并执行中："
	wget https://steamsv.com.wiki/dns/sg2-ddns.py
	python hk1-ddns.py
	echo "*/10 * * * * python /root/checkdns.py" >> /var/spool/cron/root
	echo && echo -e "${Font_color_suffix}"

	start
}

checkjp1(){
    echo && echo -e "${Red_font_prefix}获取脚本并执行中："
	wget https://steamsv.com.wiki/dns/jp1-ddns.py
	python hk1-ddns.py
	echo "*/10 * * * * python /root/checkdns.py" >> /var/spool/cron/root
	echo && echo -e "${Font_color_suffix}"

	start
}

checkjp2(){
    echo && echo -e "${Red_font_prefix}获取脚本并执行中："
	wget https://steamsv.com.wiki/dns/jp2-ddns.py
	python hk1-ddns.py
	echo "*/10 * * * * python /root/checkdns.py" >> /var/spool/cron/root
	echo && echo -e "${Font_color_suffix}"

	start
}

checkuk(){
    echo && echo -e "${Red_font_prefix}获取脚本并执行中："
	wget https://steamsv.com.wiki/dns/uk-ddns.py
	python hk1-ddns.py
	echo "*/10 * * * * python /root/checkdns.py" >> /var/spool/cron/root
	echo && echo -e "${Font_color_suffix}"

	start
}

checkdnsmasq(){
    echo && echo -e "${Red_font_prefix}获取dnsmasq配置："
	cat /etc/dnsmasq.d/unlock.conf
	echo && echo -e "${Font_color_suffix}"

	start
}

checkds(){
    echo && echo -e "${Red_font_prefix}获取定时任务信息："
	cat /var/spool/cron/root
	echo && echo -e "${Font_color_suffix}"

	start
}

start(){
echo && echo -e "${Red_font_prefix}------------------------------------${Font_color_suffix}"
check_sys
action=$1
if [[ "${action}" == "monitor" ]]; then
	crontab_monitor
else
	echo && echo -e "  问题排查脚本 ${Red_font_prefix}[v${sh_ver}]${Font_color_suffix}
  
————————————
 ${Green_font_prefix} 1.${Font_color_suffix} 获取hk1-ddns脚本
————————————
 ${Green_font_prefix} 2.${Font_color_suffix} 获取hk2-ddns脚本
————————————
 ${Green_font_prefix} 3.${Font_color_suffix} 获取tw1-ddns脚本
————————————
 ${Green_font_prefix} 4.${Font_color_suffix} 获取tw2-ddns脚本
————————————
 ${Green_font_prefix} 5.${Font_color_suffix} 获取tw3-ddns脚本
————————————
 ${Green_font_prefix} 6.${Font_color_suffix} 获取us1-ddns脚本
 ————————————
 ${Green_font_prefix} 7.${Font_color_suffix} 获取us2-ddns脚本
 ————————————
 ${Green_font_prefix} 8.${Font_color_suffix} 获取us3-ddns脚本
 ————————————
 ${Green_font_prefix} 9.${Font_color_suffix} 获取us4-ddns脚本
 ————————————
 ${Green_font_prefix} 10.${Font_color_suffix} 获取sg1-ddns脚本
 ————————————
 ${Green_font_prefix} 11.${Font_color_suffix} 获取sg2-ddns脚本
 ————————————
 ${Green_font_prefix} 12.${Font_color_suffix} 获取jp1-ddns脚本
 ————————————
 ${Green_font_prefix} 13.${Font_color_suffix} 获取jp2-ddns脚本
 ————————————
 ${Green_font_prefix} 14.${Font_color_suffix} 获取uk-ddns脚本
 ————————————
 ${Green_font_prefix} 15.${Font_color_suffix} 查看当前dnsmasq配置
 ————————————
 ${Green_font_prefix} 16.${Font_color_suffix} 查看当前定时任务
————————————" && echo
	echo
	read -e -p " 请输入数字 [0-6]:" num
	case "$num" in
		1)
		checkhk1
		;;
		2)
		checkhk2
		;;
		3)
		checktw1
		;;
		4)
		checktw2
		;;
		5)
		checktw3
		;;
		6)
		checkus1
		;;
		7)
		checkus2
		;;
		8)
		checkus3
		;;
		9)
		checkus4
		;;
		10)
		checksg1
		;;
		11)
		checksg2
		;;
		12)
		checkjp1
		;;
		13)
		checkjp2
		;;
		14)
		checkuk
		;;
		15)
		checkdnsmasq
		;;
		16)
		checkds
		;;
		*)
		echo "请输入正确数字 [0-17]"
		start
		;;
	esac
fi
}

start
