alias ls='ls -l -h'
alias gvim='gvim -c "call Maximize_Window()"'
alias na='nautilus'
alias vi='vim'
alias c='cd'
alias l='ls'
alias logcat='adb logcat -v time '
alias rm='printf "rm is disabled, use trash or rmi instead.\n"'
alias rmi='/bin/rm -I'

release=`cat /etc/lsb-release |grep DISTRIB_ID|cut -c12-`;
case "$release" in 
Ubuntu) 

    ;;
Archlinux)
    alias pacupg='sudo pacman -Syu'                # 同步软件仓库信息然后升级系统
    alias pacin='sudo pacman -S'                   # 从软件仓库安装软件包
    alias pacins='sudo pacman -U'                  # 从本地文件安装软件包
    alias pacre='sudo pacman -R'                   # 删除软件包，保留配置和依赖
    alias pacrem='sudo pacman -Rns'                # 彻底删除软件包，清除配置，删除无用依赖
    alias pacrep='pacman -Si'                      # 显示软件仓库中某软件包的信息
    alias pacreps='pacman -Ss'                     # 在软件仓库搜索软件包
    alias pacloc='pacman -Qi'                      # 显示本地数据库中某软件包的信息
    alias paclocs='pacman -Qs'                     # 在本地数据库搜索软件包
    alias pacupd='sudo pacman -Sy && sudo abs'     # 同步软件仓库信息并更新abs
    alias pacinsd='sudo pacman -S --asdeps'        # 将某软件包作为其它软件包的依赖安装
    alias pacmir='sudo pacman -Syy'                # 强制刷新软件仓库信息
    ;;
esac
