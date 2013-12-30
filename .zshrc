# Created by newuser for 5.0.4

# utf8 $B@_Dj(B
export LANG=ja_JP.UTF-8

# $B%W%m%s%W%H$N%9%?%$%k(B
PROMPT="%/%% "
PROMPT2="%_%% "
SPROMPT="%r is correct? [n,y,a,e]: "

# $BF|K\8l%U%!%$%kL>$rI=<(2DG=$K$9$k(B
setopt print_eight_bit

# cd $B$7$?$i<+F0E*$K(Bpushd$B$9$k(B
setopt auto_pushd

# $B=EJ#$7$?%G%#%l%/%H%j$rDI2C$7$J$$(B
setopt pushd_ignore_dups

# $B?'$r;HMQ=PMh$k$h$&$K$9$k(B
autoload -Uz colors
colors

#############################
# $B%(%$%j%"%9(B
#############################
alias la='ls -a'
alias ll='ls -l'
 
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
 
alias mkdir='mkdir -p'

#############################
# $BJd40(B
#############################

# $B$J$s$+Jd40$N$d$D(B
autoload -U compinit
compinit

# $BJd40$G>.J8;z$G$bBgJ8;z$K%^%C%A$5$;$k(B
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# ../ $B$N8e$O:#$$$k%G%#%l%/%H%j$rJd40$7$J$$(B
zstyle ':completion:*' ignore-parents parent pwd ..

#############################
# $B%R%9%H%j(B
#############################

# $BF1;~$K5/F0$7$?(Bzsh$B$N4V$G%R%9%H%j$r6&M-$9$k(B
setopt share_history

# $BF1$8%3%^%s%I$r%R%9%H%j$K;D$5$J$$(B
setopt hist_ignore_all_dups
 
# $B%R%9%H%j%U%!%$%k$KJ]B8$9$k$H$-!"$9$G$K=EJ#$7$?%3%^%s%I$,$"$C$?$i8E$$J}$r:o=|$9$k(B
setopt hist_save_nodups
 
# $B%9%Z!<%9$+$i;O$^$k%3%^%s%I9T$O%R%9%H%j$K;D$5$J$$(B
setopt hist_ignore_space
 
# $B%R%9%H%j$KJ]B8$9$k$H$-$KM>J,$J%9%Z!<%9$r:o=|$9$k(B
setopt hist_reduce_blanks
 
# $BJd408uJd$,J#?t$"$k$H$-$K<+F0E*$K0lMwI=<($9$k(B
setopt auto_menu

#############################
# $BC18l$N$J$s$+(B
#############################

# $BC18l$N6h@Z$jJ8;z$r;XDj$9$k(B
autoload -Uz select-word-style
select-word-style default
# $B$3$3$G;XDj$7$?J8;z$OC18l6h@Z$j$H$_$J$5$l$k(B
# / $B$b6h@Z$j$H07$&$N$G!"(B^W $B$G%G%#%l%/%H%j#1$DJ,$r:o=|$G$-$k(B
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified

#############################
# OS $BJL$N@_Dj(B
#############################
case ${OSTYPE} in
    darwin*)
        #Mac$BMQ$N@_Dj(B
        export CLICOLOR=1
        alias ls='ls -G -F'
        ;;
    linux*)
        #Linux$BMQ$N@_Dj(B
        ;;
esac

#############################
# vcs_info
#############################
RPROMPT=""

autoload -Uz vcs_info
autoload -Uz add-zsh-hook
autoload -Uz is-at-least
autoload -Uz colors

# $B0J2<$N(B3$B$D$N%a%C%;!<%8$r%(%/%9%]!<%H$9$k(B
#   $vcs_info_msg_0_ : $BDL>o%a%C%;!<%8MQ(B ($BNP(B)
#   $vcs_info_msg_1_ : $B7Y9p%a%C%;!<%8MQ(B ($B2+?'(B)
#   $vcs_info_msg_2_ : $B%(%i!<%a%C%;!<%8MQ(B ($B@V(B)
zstyle ':vcs_info:*' max-exports 3

zstyle ':vcs_info:*' enable git svn hg bzr
# $BI8=`$N%U%)!<%^%C%H(B(git $B0J30$G;HMQ(B)
# misc(%m) $B$ODL>o$O6uJ8;zNs$KCV$-49$($i$l$k(B
zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b]' '%m' '<!%a>'
zstyle ':vcs_info:(svn|bzr):*' branchformat '%b:r%r'
zstyle ':vcs_info:bzr:*' use-simple true

if is-at-least 4.3.10; then
    # git $BMQ$N%U%)!<%^%C%H(B
    # git $B$N$H$-$O%9%F!<%8$7$F$$$k$+$I$&$+$rI=<((B
    zstyle ':vcs_info:git:*' formats '(%s)-[%b]' '%c%u %m'
    zstyle ':vcs_info:git:*' actionformats '(%s)-[%b]' '%c%u %m' '<!%a>'
    zstyle ':vcs_info:git:*' check-for-changes true
    zstyle ':vcs_info:git:*' stagedstr "+"    # %c $B$GI=<($9$kJ8;zNs(B
    zstyle ':vcs_info:git:*' unstagedstr "-"  # %u $B$GI=<($9$kJ8;zNs(B
fi
        
# hooks $B@_Dj(B
if is-at-least 4.3.11; then
    # git $B$N$H$-$O%U%C%/4X?t$r@_Dj$9$k(B

    # formats '(%s)-[%b]' '%c%u %m' , actionformats '(%s)-[%b]' '%c%u %m' '<!%a>'
    # $B$N%a%C%;!<%8$r@_Dj$9$kD>A0$N%U%C%/4X?t(B
    # $B:#2s$N@_Dj$N>l9g$O(Bformat $B$N;~$O(B2$B$D(B, actionformats $B$N;~$O(B3$B$D%a%C%;!<%8$,$"$k$N$G(B
    # $B3F4X?t$,:GBg(B3$B2s8F$S=P$5$l$k!#(B
    zstyle ':vcs_info:git+set-message:*' hooks \
        git-hook-begin \
        git-untracked \
        git-push-status \
        git-nomerge-branch \
        git-stash-count

    # $B%U%C%/$N:G=i$N4X?t(B
    # git $B$N:n6H%3%T!<$N$"$k%G%#%l%/%H%j$N$_%U%C%/4X?t$r8F$S=P$9$h$&$K$9$k(B
    # (.git $B%G%#%l%/%H%jFb$K$$$k$H$-$O8F$S=P$5$J$$(B)
    # .git $B%G%#%l%/%H%jFb$G$O(B git status --porcelain $B$J$I$,%(%i!<$K$J$k$?$a(B
    function +vi-git-hook-begin() {
        if [[ $(command git rev-parse --is-inside-work-tree 2> /dev/null) != 'true' ]]; then
             # 0$B0J30$rJV$9$H$=$l0J9_$N%U%C%/4X?t$O8F$S=P$5$l$J$$(B
            return 1
        fi

        return 0
    }

    # untracked $B%U%#%"%kI=<((B
    #
    # untracked $B%U%!%$%k(B($B%P!<%8%g%s4IM}$5$l$F$$$J$$%U%!%$%k(B)$B$,$"$k>l9g$O(B
    # unstaged (%u) $B$K(B ? $B$rI=<((B
    function +vi-git-untracked() {
        # zstyle formats, actionformats $B$N(B2$BHVL\$N%a%C%;!<%8$N$_BP>]$K$9$k(B
        if [[ "$1" != "1" ]]; then
            return 0
        fi

        if command git status --porcelain 2> /dev/null \
            | awk '{print $1}' \
            | command grep -F '??' > /dev/null 2>&1 ; then

            # unstaged (%u) $B$KDI2C(B
            hook_com[unstaged]+='?'
        fi
    }

    # $B%^!<%8$7$F$$$J$$7o?tI=<((B
    #
    # master $B0J30$N%V%i%s%A$K$$$k>l9g$K!"(B
    # $B8=:_$N%V%i%s%A>e$G$^$@(B master $B$K%^!<%8$7$F$$$J$$%3%_%C%H$N7o?t$r(B
    # (mN) $B$H$$$&7A<0$G(B misc (%m) $B$KI=<((B
    function +vi-git-nomerge-branch() {
        # zstyle formats, actionformats $B$N(B2$BHVL\$N%a%C%;!<%8$N$_BP>]$K$9$k(B
        if [[ "$1" != "1" ]]; then
            return 0
        fi

        if [[ "${hook_com[branch]}" == "master" ]]; then
            # master $B%V%i%s%A$N>l9g$O2?$b$7$J$$(B
            return 0
        fi

        local nomerged
        nomerged=$(command git rev-list master..${hook_com[branch]} 2>/dev/null | wc -l | tr -d ' ')

        if [[ "$nomerged" -gt 0 ]] ; then
            # misc (%m) $B$KDI2C(B
            hook_com[misc]+="(m${nomerged})"
        fi
    }

    # stash $B7o?tI=<((B
    #
    # stash $B$7$F$$$k>l9g$O(B :SN $B$H$$$&7A<0$G(B misc (%m) $B$KI=<((B
    function +vi-git-stash-count() {
        # zstyle formats, actionformats $B$N(B2$BHVL\$N%a%C%;!<%8$N$_BP>]$K$9$k(B
        if [[ "$1" != "1" ]]; then
            return 0
        fi

        local stash
        stash=$(command git stash list 2>/dev/null | wc -l | tr -d ' ')
        if [[ "${stash}" -gt 0 ]]; then
            # misc (%m) $B$KDI2C(B
            hook_com[misc]+=":S${stash}"
        fi
    }

fi

function _update_vcs_info_msg() {
    local -a messages
    local prompt

    LANG=en_US.UTF-8 vcs_info

    if [[ -z ${vcs_info_msg_0_} ]]; then
        # vcs_info $B$G2?$b<hF@$7$F$$$J$$>l9g$O%W%m%s%W%H$rI=<($7$J$$(B
        prompt=""
    else
        # vcs_info $B$G>pJs$r<hF@$7$?>l9g(B
        # $vcs_info_msg_0_ , $vcs_info_msg_1_ , $vcs_info_msg_2_ $B$r(B
        # $B$=$l$>$lNP!"2+?'!"@V$GI=<($9$k(B
        [[ -n "$vcs_info_msg_0_" ]] && messages+=( "%F{green}${vcs_info_msg_0_}%f" )
        [[ -n "$vcs_info_msg_1_" ]] && messages+=( "%F{yellow}${vcs_info_msg_1_}%f" )
        [[ -n "$vcs_info_msg_2_" ]] && messages+=( "%F{red}${vcs_info_msg_2_}%f" )

        # $B4V$K%9%Z!<%9$rF~$l$FO"7k$9$k(B
        prompt="${(j: :)messages}"
    fi

    RPROMPT="$prompt"
}
add-zsh-hook precmd _update_vcs_info_msg
