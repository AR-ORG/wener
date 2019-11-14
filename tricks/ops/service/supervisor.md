# Supervisor

* supervisor
  * size: 4161536
  * Python
  * https://pkgs.alpinelinux.org/package/edge/main/x86_64/supervisor
* [runit](http://smarden.org/runit/)
  * https://pkgs.alpinelinux.org/package/edge/community/x86_64/runit
  * size: 258048
* systemd
  * Pythonee
* initd
* upstart
* tini
  * https://github.com/krallin/tini
  * size: 40960
  * docker 1.13 后内建
  * 主要用于处理僵尸集成和信号量处理
* dump-init
  * https://pkgs.alpinelinux.org/package/edge/community/x86_64/dumb-init
* openrc
* Gentoo [Comparison of init systems](https://wiki.gentoo.org/wiki/Comparison_of_init_systems)
* [OpenRC to systemd Cheatsheet](https://wiki.gentoo.org/wiki/OpenRC_to_systemd_Cheatsheet)

## docker
* tinit - 如果使用单个进程
* 如果要允许多个服务，选择 s6 或 runit

## s6
* [s6](https://skarnet.org/software/s6/)
  * size: 765952
  * https://pkgs.alpinelinux.org/package/edge/main/x86_64/s6
* [skarnet/s6](https://github.com/skarnet/s6)
* [just-containers/s6-overlay](https://github.com/just-containers/s6-overlay) - s6 overlay for containers (includes execline, s6-linux-utils & a custom init)
* [Why another supervision suite ?](https://skarnet.org/software/s6/why.html)
* 其他模块
  * s6-linux-init init
  * s6-rc 服务依赖管理
* gentoo wiki [S6](https://wiki.gentoo.org/wiki/S6)
* s6-supervise
  * 实现 supervisor 功能
  * 接收 servicedir 作为参数
* s6-svscan
  * 监视一组进程
  * 接收 scandir 作为参数
  * 2.3 之前默认每 5s 会扫描一次 - 之后需要通过 `-t ms` 指定 - SIGALARM 触发扫描
  * 可通过 s6-svscanctl 控制
  * 针对每个扫描到的 `servicedir` 启动 s6-supervise
  * 控制文件位于 `.s6-svscan`
* s6-log
  * 日志工具
  * `s6-log '!processor-script arg1 arg2' ./dirname` 等同于调用 `execlineb -Pc 'processor-script arg1 arg2'`
* [servicedir](https://www.skarnet.org/software/s6/servicedir.html) - 服务目录 - 表示定义的一个服务 - 除了 run 脚本其他存在可选
  * run - 启动脚本
  * down - 停止脚本
  * log - 子目录或符号链接
  * finish - 每次进程结束后的清理工作
    * 接受两个参数: exitCode 或 256 表示信号, 信号
  * timeout-finish - 运行超时回调 - 接受一个参数: 运行时间毫秒 - 默认 5s 超时
  * nosetsid - 不调用 setsid - 子线程会运行在 s6-supervise 的会话
* [scandir](https://www.skarnet.org/software/s6/scandir.html)
  * 不推荐将服务仓库作为扫描目录
  * 一般在扫描目录下进行软链接

```bash
# services 服务仓库
# run 运行服务目录
mkdir services run

# 启动 - 每 10s 扫描一次
s6-svscan $PWD/run -t 10000

# 定义一个服务
# ====================
install -Dv /dev/null services/ncat-echo/run
cat <<SH >services/ncat-echo/run
#!/usr/bin/env execlineb -P
ncat -e /bin/cat -k -l 8080
SH
# 启动服务
ln -s ../services/ncat-echo run/
s6-svscanctl -a run
# 服务状态
s6-svstat services/ncat-echo
s6-svstat -o up,wantedup,normallyup,ready,paused,pid,exitcode,signal,signum,updownsince,readysince,updownfor,readyfor services/ncat-echo
# 停止服务
s6-svc -dx services/ncat-echo
unlink run/ncat-echo

# 常用脚本
# ====================
# 所有服务状态
for svc in services/*; do echo -n $(basename $svc)' ';s6-svok $svc && echo ok || echo down;done
```

## OpenRC
* http://wiki.alpinelinux.org/wiki/Alpine_Linux_Init_System
* https://wiki.gentoo.org/wiki/Project:OpenRC
* https://en.wikipedia.org/wiki/OpenRC
* https://github.com/openrc/openrc/
