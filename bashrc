# /etc/bashrc

# System wide functions and aliases
# Environment stuff goes in /etc/profile

# It's NOT a good idea to change this file unless you know what you
# are doing. It's much better to create a custom.sh shell script in
# /etc/profile.d/ to make custom changes to your environment, as this
# will prevent the need for merging in future updates.

# Prevent doublesourcing
if [ -z "$BASHRCSOURCED" ]; then
  BASHRCSOURCED="Y"

  # are we an interactive shell?
  if [ "$PS1" ]; then
    if [ -z "$PROMPT_COMMAND" ]; then
      case $TERM in
      xterm*|vte*)
        if [ -e /etc/sysconfig/bash-prompt-xterm ]; then
            PROMPT_COMMAND=/etc/sysconfig/bash-prompt-xterm
        else
            PROMPT_COMMAND='printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"'
        fi
        ;;
      screen*)
        if [ -e /etc/sysconfig/bash-prompt-screen ]; then
            PROMPT_COMMAND=/etc/sysconfig/bash-prompt-screen
        else
            PROMPT_COMMAND='printf "\033k%s@%s:%s\033\\" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"'
        fi
        ;;
      *)
        [ -e /etc/sysconfig/bash-prompt-default ] && PROMPT_COMMAND=/etc/sysconfig/bash-prompt-default
        ;;
      esac
    fi
    # Turn on parallel history
    shopt -s histappend
    history -a
    # Turn on checkwinsize
    shopt -s checkwinsize
#    [ "$PS1" = "\\s-\\v\\\$ " ] && PS1="[\u@\h \W]\\$ "
    if [[ $USER == "root" ]]; then
           PS1="\[\e[01;30m\]┌———\[\e[01;33m\][\[\e[m\]\[\e[01;06;31m\]\u\[\e[m\]\[\e[01;30m\]@\[\e[m\]\[\e[03;01;38m\]\h\[\e[0m\]\[\e[1;30m\]:\[\e[0m\]\[\e[01;36m\]\w\[\e[m\]\[\e[01;33m\]]\[\e[0m\]\[\e[01;33m\]{\[\e[0m\]\[\e[3;33m\]\$(hostname -I | awk '{print \$2}')\[\e[0m\]\[\e[01;33m\]}\[\e[0m\]\[\e[01;30m\]\n└>\[\e[01;33m\]$ \[\e[0m\]"
   elif [[ $USER == "ansible-user"  ]]; then
	   PS1="\[\e[01;30m\]┌———\[\e[01;33m\][\[\e[m\]\[\e[01;32m\]\u\[\e[m\]\[\e[01;30m\]@\[\e[m\]\[\e[03;01;38m\]\h\[\e[0m\]\[\e[1;30m\]:\[\e[0m\]\[\e[01;36m\]\w\[\e[m\]\[\e[01;33m\]]\[\e[0m\]\[\e[01;33m\]{\[\e[0m\]\[\e[3;33m\]\$(hostname -I | awk '{print \$2}')\[\e[0m\]\[\e[01;33m\]}\[\e[0m\]\[\e[01;30m\]\n└>\[\e[01;33m\]$ \[\e[0m\]"
   else
           PS1="\[\e[01;30m\]┌———\[\e[01;33m\][\[\e[m\]\[\e[01;35m\]\u\[\e[m\]\[\e[01;30m\]@\[\e[m\]\[\e[03;01;38m\]\h\[\e[0m\]\[\e[1;30m\]:\[\e[0m\]\[\e[01;36m\]\w\[\e[m\]\[\e[01;33m\]]\[\e[0m\]\[\e[01;33m\]{\[\e[0m\]\[\e[3;33m\]\$(hostname -I | awk '{print \$2}')\[\e[0m\]\[\e[01;33m\]}\[\e[0m\]\[\e[01;30m\]\n└>\[\e[01;33m\]$ \[\e[0m\]"
    fi


    # You might want to have e.g. tty in prompt (e.g. more virtual machines)
    # and console windows
    # If you want to do so, just add e.g.
    # if [ "$PS1" ]; then
    #   PS1="[\u@\h:\l \W]\\$ "
    # fi
    # to your custom modification shell script in /etc/profile.d/ directory
  

  if ! shopt -q login_shell ; then # We're not a login shell
    # Need to redefine pathmunge, it gets undefined at the end of /etc/profile
    pathmunge () {
        case ":${PATH}:" in
            *:"$1":*)
                ;;
            *)
                if [ "$2" = "after" ] ; then
                    PATH=$PATH:$1
                else
                    PATH=$1:$PATH
                fi
        esac
    }

    # Set default umask for non-login shell only if it is set to 0
    [ `umask` -eq 0 ] && umask 022

    SHELL=/bin/bash
    # Only display echos from profile.d scripts if we are no login shell
    # and interactive - otherwise just process them to set envvars
    for i in /etc/profile.d/*.sh; do
        if [ -r "$i" ]; then
            if [ "$PS1" ]; then
                . "$i"
            else
                . "$i" >/dev/null
            fi
        fi
    done

    unset i
    unset -f pathmunge
  fi
 fi
fi
# vim:ts=4:sw=4
alias controller='ssh vagrant@controller'
alias server1='ssh vagrant@server1'
alias server2='ssh vagrant@server2'
alias server3='ssh vagrant@server3'
alias server4='ssh vagrant@server4'
alias server5='ssh vagrant@server5'
