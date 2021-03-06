# Android adb commands
alias adbw='adb_wrapper.sh'
alias logcat='adb logcat -v time '
alias logam='adb logcat -v time -s ActivityManager:v'

alias em='emacs -nw'
alias vi='vim'
alias ls='ls --color=auto'
alias ll='ls -alh'
eval $(dircolors -b)
alias xopen='xdg-open'

alias gvim='gvim -c "call Maximize_Window()"'
alias na='nautilus'
alias vi='vim'
alias sudo='sudo -E'

#alias rm=trash
alias lsrm='ls -al ~/.local/share/Trash/files'
trash()
{
    mv $@ ~/.local/share/Trash/files
}

alias touch=touchmore
touchmore()
{
    mkdir -p `dirname $@`
    /usr/bin/touch $@
}

alias aget='sudo apt-get'
alias gitp='git push origin HEAD:refs/for/master'
alias gsync='gclient sync -j1'
alias rh='gclient runhooks'

#release=`cat /etc/lsb-release |grep DISTRIB_ID|cut -c12-`;
#case "$release" in 
#Ubuntu) 
#
#    ;;
#Archlinux)
#    ;;
#esac

if [ -f /etc/arch-release ] ; then
    alias pacupg='sudo pacman-color -Syu'                # 同步软件仓库信息然后升级系统
    alias pacin='sudo pacman-color -Sy'                   # 从软件仓库安装软件包
    alias pacinl='sudo pacman-color -U'                  # 从本地文件安装软件包
    alias pacrm='sudo pacman-color -R'                   # 删除软件包，保留配置和依赖
    alias pacrmp='sudo pacman-color -Rns'                # 彻底删除软件包，清除配置，删除无用依赖
    alias pacrep='pacman-color -Si'                      # 显示软件仓库中某软件包的信息
    alias pacs='pacman-color -Ss'                        # 在软件仓库搜索软件包
    alias pacloc='pacman-color -Qi'                      # 显示本地数据库中某软件包的信息
    alias paclocs='pacman-color -Qs'                     # 在本地数据库搜索软件包
    alias pacupd='sudo pacman-color -Sy && sudo abs'     # 同步软件仓库信息并更新abs
    alias pacinsd='sudo pacman-color -S --asdeps'        # 将某软件包作为其它软件包的依赖安装
    alias pacmir='sudo pacman-color -Syy'                # 强制刷新软件仓库信息
fi

alias grep='grep --color '
