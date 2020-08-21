---
layout: post
title:  "AdGuardHome"
date:   2020-08-18
comments: true
categories: AdGuardHome
---

* content
{:toc}

&nbsp;
<p align="center">
  <img src="https://cdn.adguard.com/public/Adguard/Common/adguard_home.svg" width="300px" alt="AdGuard Home" />
</p>
<h3 align="center">为您和您的设备提供隐私保护中心</h3>
<p align="center">
  免费开源，强大的全网广告和跟踪阻止DNS服务器。.
</p>

<p align="center">
    <a href="https://adguard.com/">AdGuard.com</a> |
    <a href="https://github.com/AdguardTeam/AdGuardHome/wiki">Wiki</a> |
    <a href="https://reddit.com/r/Adguard">Reddit</a> |
    <a href="https://twitter.com/AdGuard">Twitter</a> |
    <a href="https://t.me/adguard_en">Telegram</a>
    <br /><br />
    <a href="https://codecov.io/github/AdguardTeam/AdGuardHome?branch=master">
      <img src="https://img.shields.io/codecov/c/github/AdguardTeam/AdGuardHome/master.svg" alt="Code Coverage" />
    </a>
    <a href="https://goreportcard.com/report/AdguardTeam/AdGuardHome">
      <img src="https://goreportcard.com/badge/github.com/AdguardTeam/AdGuardHome" alt="Go Report Card" />
    </a>
    <a href="https://golangci.com/r/github.com/AdguardTeam/AdGuardHome">
      <img src="https://golangci.com/badges/github.com/AdguardTeam/AdGuardHome.svg" alt="GolangCI" />
    </a>
    <br />
    <a href="https://github.com/AdguardTeam/AdGuardHome/releases">
        <img src="https://img.shields.io/github/release/AdguardTeam/AdGuardHome/all.svg" alt="Latest release" />
    </a>
    <a href="https://snapcraft.io/adguard-home">
        <img alt="adguard-home" src="https://snapcraft.io/adguard-home/badge.svg" />
    </a>
    <a href="https://hub.docker.com/r/adguard/adguardhome">
        <img alt="Docker Pulls" src="https://img.shields.io/docker/pulls/adguard/adguardhome.svg?maxAge=604800" />
    </a>
    <a href="https://hub.docker.com/r/adguard/adguardhome">
        <img alt="Docker Stars" src="https://img.shields.io/docker/stars/adguard/adguardhome.svg?maxAge=604800" />
    </a>
</p>

<br />

<p align="center">
    <img src="https://cdn.adguard.com/public/Adguard/Common/adguard_home.gif" width="800" />
</p>

<hr />
AdGuard Home是一个全网络的阻止广告和跟踪的软件。设置完成后，它将覆盖所有家庭设备，而您不需要任何客户端软件。

它作为一个DNS服务器运行，将跟踪域重新路由到“黑洞”，从而阻止您的设备连接到这些服务器。它基于我们为我们的公共[AdGuard DNS](https://adguard.com/en/adguard-dns/overview.html)服务器使用的软件-两者共享许多通用代码。

* [入门](#getting-started)
* [AdGuard Home与其它解决方案的比较](#comparison)
    * [这与公共AdGuard DNS服务器有何不同?](#comparison-adguard-dns)
    * [AdGuard Home与Pi Hole相比如何](#comparison-pi-hole)
    * [AdGuard Home与传统广告拦截器相比如何](#comparison-adblock)
* [如何从源代码构建](#how-to-build)
* [贡献](#contributing)
    * [测试不稳定版](#test-unstable-versions)
    * [提交 issues](#reporting-issues)
    * [翻译帮助](#translate)
    * [其它](#help-other)
* [使用AdGuardHome的项目](#uses)
* [致谢](#acknowledgments)

<a id="getting-started"></a>
## 入门

请阅读我们Wiki上的 **[Getting Started](https://github.com/AdguardTeam/AdGuardHome/wiki/Getting-Started)** 文章，了解如何安装AdGuard Home，以及如何配置设备以使用它。

I如果您运行的是 **Linux**, 有一种安全且简单的方法来安装AdGuard Home—您可以从 [Snap Store](https://snapcraft.io/adguard-home)获得它。

或者，您可以使用我们的 [official Docker image](https://hub.docker.com/r/adguard/adguardhome) 镜像。 

### 指南

* [配置](https://github.com/AdguardTeam/AdGuardHome/wiki/Configuration)
* [AdGuard Home作为HTTPS上的DNS或TLS服务器上的DNS](https://github.com/AdguardTeam/AdGuardHome/wiki/Encryption)
* [如何在Raspberry Pi上安装和运行AdGuard Home](https://github.com/AdguardTeam/AdGuardHome/wiki/Raspberry-Pi)
* [如何在虚拟专用服务器上安装和运行AdGuard Home](https://github.com/AdguardTeam/AdGuardHome/wiki/VPS)
* [如何正确编写自己的主机阻止列表](https://github.com/AdguardTeam/AdGuardHome/wiki/Hosts-Blocklists)

### API

如果您想与AdGuard Home集成，您可以使用 [REST API](https://github.com/AdguardTeam/AdGuardHome/tree/master/openapi)。
或者，您可以使用此[python client](https://pypi.org/project/adguardhome/)，该客户端用于构建 [AdGuard Home Hass.io Add-on](https://community.home-assistant.io/t/community-hass-io-add-on-adguard-home)。
加载项。
<a id="comparison"></a>
## AdGuard Home与其它解决方案的比较

<a id="comparison-adguard-dns"></a>
### 这与公共AdGuard DNS服务器有何不同？

通过运行自己的AdGuard Home服务器，您可以比使用公共DNS服务器做更多的事情。 这是一个完全不同的水平。 请看：

* 选择服务器完全阻止还是部分阻止。
* 监视您的网络活动。
* 添加您自己的自定义过滤规则。
* **最重要的是，这是您自己的服务器，并且只有您可以控制服务器.**

<a id="comparison-pi-hole"></a>
### AdGuard Home与Pi Hole相比如何

此时，AdGuard Home与Pi-Hole有很多共同点。 两者都使用“ DNS沉陷”方法阻止广告和跟踪器，并且都允许自定义被阻止的内容。

> 我们不会就这样停止，AdGuard Home功能不限于此，这只是个开始。

AdGuard Home提供了许多现成的功能，无需安装和配置其他软件。 我们希望它简单到可以随意使用的地方。

> 免责声明：可以通过安装其他软件或手动使用SSH终端并重新配置Pi-Hole所包含的一种实用程序，将某些列出的功能添加到Pi-Hole中。 但是，我们认为，这不能合法地视为Pi-Hole的功能。
| 特色                                                                 | AdGuard&nbsp;Home | Pi-Hole                                                |
|-------------------------------------------------------------------------|--------------|--------------------------------------------------------|
| 屏蔽广告和跟踪器                                               | ✅            | ✅                                                      |
| 自定义阻止列表                                                  | ✅            | ✅                                                      |
| 内置DHCP服务器                                                    | ✅            | ✅                                                      |
| Admin界面的HTTPS                                           | ✅            | 有点，但是您需要手动配置lighttpd |
| 加密的DNS上游服务器（HTTPS上的DNS，TLS上的DNS，DNSCrypt） | ✅            | ❌ (需要其它软件）                       |
| 跨平台                                                          | ✅            | ❌ (不是本地的，只能通过Docker)                      |
| 作为基于HTTPS的DNS或基于TLS的DNS服务器运行                      | ✅            | ❌ (需要其它软件)                       |
| 阻止网络钓鱼和恶意软件域                                   | ✅            | ❌ (需要非默认阻止列表)                    |
| 家长控制（阻止成人域）                               | ✅            | ❌                                                      |
| 在搜索引擎上强制安全搜索                                     | ✅            | ❌                                                      |
| 每个客户端配置                                       | ✅            | ✅                                                      |
| 访问设置（选择谁可以使用AGH DNS）                            | ✅            | ❌                                                      |

<a id="comparison-adblock"></a>
### AdGuard Home与传统广告拦截器相比如何

这取决于.

"DNS sinkholing" 功能可以阻止很大一部分广告，但是它缺乏传统广告阻止程序的灵活性和功能。 通过阅读 [本文](https://adguard.com/en/blog/adguard-vs-adaway-dns66/)，您会对这些方法之间的区别有很好的印象。 它将AdGuard for Android（传统的广告拦截器）与主机级广告拦截器（其功能与基于DNS的拦截器几乎相同）进行了比较。

但是，此保护级别对于某些用户而言已足够。 此外，使用基于DNS的阻止程序可以帮助阻止广告，跟踪和分析其他类型设备上的请求，例如SmartTV，智能扬声器或其他类型的IoT设备（您无法在其上安装传统广告阻止程序）。

**已知限制**

以下是一些DNS级别的阻止程序无法阻止的内容的示例：

* YouTube, Twitch ads
* Facebook, Twitter, Instagram sponsored posts

本质上，任何与内容共享域的广告都不能被DNS级别的阻止程序阻止。

将来有机会解决这个问题吗？ DNS永远做不到。 我们唯一的选择是使用内容阻止代理，就像在独立的AdGuard应用程序中一样。 将来，我们将为AdGuard Home带来此功能支持。 不幸的是，即使在这种情况下，仍然有些情况是不够的或需要相当复杂的配置。


## VPS上面安装

要在VPS上运行AdGuard Home，您需要一台centos7x64服务器。

* 开始安装
  
首先，让我们确保您的VPS具有必要的最低要求，以root身份运行此命令：
```bash
yum install bind-utils
```

转到 [AdGuard Home page](https://github.com/AdguardTeam/AdGuardHome#installation) 并下载适用于您的体系结构的二进制文件（在此示例中为64位Linux）。

要下载AdGuard Home并解压缩它，请执行以下命令：

To download AdGuard Home and unpack it execute following commands:
```bash
wget https://static.adguard.com/adguardhome/release/AdGuardHome_linux_amd64.tar.gz
tar xvf AdGuardHome_linux_amd64.tar.gz
```

您可以通过运行以下命令切换到将其解压缩到的目录：
```bash
cd AdGuardHome
pwd
```

运行 `./AdGuardHome -s install` 将AdGuard Home安装为系统服务.

## 通过浏览器继续安装
默认端口为 3000
访问 — `http://ip:3000/`

ip为您的VPS对外的公网IP

这是您可能需要控制服务的其他命令。

* `AdGuardHome -s uninstall` - 卸载AdGuard Home服务。
* `AdGuardHome -s start` - 启动服务。
* `AdGuardHome -s stop` - 停止服务。
* `AdGuardHome -s restart` - 重新启动服务。
* `AdGuardHome -s status` - 显示当前服务状态。

您可以通过运行以下命令来验证其是否正常运行：
```bash
nslookup google.com 127.0.0.1
```

如果一切正常，您将获得以下输出：
```
Using domain server:
Name: 127.0.0.1
Address: 127.0.0.1#53
Aliases:
......
```

## 配置设备以使用AdGuard Home

现在，一旦确定AdGuard Home可以在VPS上运行，就可以通过更改系统DNS设置以使用VPS的公共IP地址在计算机上使用它。

<a id="acknowledgments"></a>
## Acknowledgments

This software wouldn't have been possible without:

 * [Go](https://golang.org/dl/) and it's libraries:
   * [packr](https://github.com/gobuffalo/packr)
   * [gcache](https://github.com/bluele/gcache)
   * [miekg's dns](https://github.com/miekg/dns)
   * [go-yaml](https://github.com/go-yaml/yaml)
   * [service](https://godoc.org/github.com/kardianos/service)
   * [dnsproxy](https://github.com/AdguardTeam/dnsproxy)
   * [urlfilter](https://github.com/AdguardTeam/urlfilter)
 * [Node.js](https://nodejs.org/) and it's libraries:
   * [React.js](https://reactjs.org)
   * [Tabler](https://github.com/tabler/tabler)
   * And many more node.js packages.
 * [whotracks.me data](https://github.com/cliqz-oss/whotracks.me)

You might have seen that [CoreDNS](https://coredns.io) was mentioned here before — we've stopped using it in AdGuardHome. While we still use it on our servers for [AdGuard DNS](https://adguard.com/adguard-dns/overview.html) service, it seemed like an overkill for Home as it impeded with Home features that we plan to implement.

For a full list of all node.js packages in use, please take a look at [client/package.json](https://github.com/AdguardTeam/AdGuardHome/blob/master/client/package.json) file.

