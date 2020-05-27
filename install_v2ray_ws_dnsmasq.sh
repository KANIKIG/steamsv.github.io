#!/bin/bash

#fonts color
Green="\033[32m"
Red="\033[31m"
Yellow="\033[33m"
GreenBG="\033[42;37m"
RedBG="\033[41;37m"
Font="\033[0m"

if grep -Eqi "CentOS" /etc/issue || grep -Eq "CentOS" /etc/*-release; then
    echo ""
else
    echo "脚本目前仅支持Centos7"
    exit 1
fi

judge(){
    if [[ $? -eq 0 ]];then
        echo -e "${OK} ${GreenBG} $1 完成 ${Font}"
        sleep 1
    else
        echo -e "${Error} ${RedBG} $1 失败${Font}"
        exit 1
    fi
}

install_v2ray(){
    if [[ -d /root/v2ray ]];then
        rm -rf /root/v2ray
    fi
    if [[ -d /etc/v2ray ]];then
        rm -rf /etc/v2ray
    fi
    mkdir -p /root/v2ray && cd /root/v2ray
    wget -N --no-check-certificate https://install.direct/go.sh

    ## wget http://install.direct/go.sh

    if [[ -f go.sh ]];then
        bash go.sh --remove
        bash go.sh --force
        judge "安装 V2ray"
    else
        echo -e "${Error} ${RedBG} V2ray 安装文件下载失败，请检查下载地址是否可用 ${Font}"
        exit 4
    fi
    # 清除临时文件
    rm -rf /root/v2ray

    rm -f /etc/v2ray/config.json
    cat>/etc/v2ray/config.json<<EOF
{
    "inbound": {
        "allocate": {
            "strategy": "always"
        },
        "listen": "0.0.0.0",
        "port": 8090,
        "protocol": "vmess",
        "settings": {
            "clients": [
                {
                    "id" : "179c0060-9c92-3dd4-013a-aba0dbc39054",
                    "alterId" : 0
                }
            ],
            "udp": true
        },
        "sniffing": {
            "destOverride": [
                "http",
                "tls"
            ],
            "enabled": true
        },
        "streamSettings": {
            "network": "ws",
            "security": "auto",
            "wsSettings": {
                "connectionReuse": true,
                "path": "/v2ray/"
            }
        },
        "tag": "proxy"
    },
    "log": {
        "access": "/var/log/v2ray/access.log",
        "error": "/var/log/v2ray/error.log",
        "loglevel": "warning"
    },
    "outbound": {
        "protocol": "freedom",
        "settings": {}
    },
    "outboundDetour": [
        {
            "protocol": "blackhole",
            "settings": {
                "response": {
                    "type": "http"
                }
            },
            "tag": "blocked"
        }
    ],
    "routing": {
        "rules": [
            {
                "ip": [
                    "geoip:private"
                ],
                "outboundTag": "blocked",
                "type": "field"
            }
        ]
    }
}
EOF
systemctl restart v2ray
}

echo_v2ray(){
    echo "v2ray参数"
    local_ip=`curl -4 ip.sb`
    echo -e "服务器ip: ${local_ip}"
    echo "端口: 8090"
    echo "uuid: 179c0060-9c92-3dd4-013a-aba0dbc39054"
    echo "alterid: 0"
    echo "path: /v2ray/"
    echo "v2rayNG一键导入:"
    json=`echo "{\"add\":\"$local_ip\",\"aid\":\"0\",\"host\":\"\",\"id\":\"179c0060-9c92-3dd4-013a-aba0dbc39054\",\"net\":\"ws\",\"path\":\"/v2ray/\",\"port\":\"8090\",\"ps\":\"v2ray+dnsmasq\",\"tls\":\"\",\"type\":\"none\",\"v\":\"2\"}" | base64 | xargs`
    echo "vmess://$json"
}

uninstall_v2ray(){
    systemctl stop v2ray
    systemctl disable v2ray
    systemctl stop dnsmasq
    systemctl disable dnsmasq
    echo "nameserver 8.8.8.8" > /etc/resolv.conf
    echo "卸载成功"
}

install_dnsmasq(){
    yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
    yum install bind-utils -y
    yum install -y dnsmasq
    if [ $? -eq 0 ]; then
        read -p "请输入解锁dns:" dns
        systemctl enable dnsmasq
        rm -f /etc/resolv.conf
        echo "nameserver 127.0.0.1" > /etc/resolv.conf
        touch /etc/dnsmasq.d/unlock.conf
        echo "server=8.8.8.8" > /etc/dnsmasq.d/unlock.conf
        echo "server=8.8.4.4" >> /etc/dnsmasq.d/unlock.conf
        echo "server=/netflix.com/$dns" >> /etc/dnsmasq.d/unlock.conf
        echo "server=/netflix.net/$dns" >> /etc/dnsmasq.d/unlock.conf
        echo "server=/nflximg.net/$dns" >> /etc/dnsmasq.d/unlock.conf
        echo "server=/nflximg.com/$dns" >> /etc/dnsmasq.d/unlock.conf
        echo "server=/nflxvideo.net/$dns" >> /etc/dnsmasq.d/unlock.conf
        echo "server=/nflxso.net/$dns" >> /etc/dnsmasq.d/unlock.conf
        echo "server=/nflxext.com/$dns" >> /etc/dnsmasq.d/unlock.conf
        
        systemctl restart dnsmasq
        systemctl status dnsmasq
        echo "dnsmasq启动成功"
    else
        echo "dnsmasq安装失败, 请检查仓库状况"
    fi    
}

menu(){
    echo -e " V2ray|Trojan dnsmasq奈飞解锁安装管理脚本 ${Red}[${shell_version}]${Font}"
    echo -e "${Green}1.${Font}  安装 v2ray+dnsmasq"
    echo -e "${Green}2.${Font}  卸载 v2ray+dnsmasq"
    echo -e "${Green}3.${Font}  退出 \n"
    read -p "请输入数字：" menu_num
    case $menu_num in
        1)
          install_v2ray
          install_dnsmasq
          echo_v2ray
          ;;
        2)
          uninstall_v2ray
          ;;
        3)
          exit 0
          ;;
        *)
          echo -e "${RedBG}请输入正确的数字${Font}"
          ;;
    esac
}

menu
