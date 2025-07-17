if [ -f $HOME/.bashrc ]; then
        source $HOME/.bashrc
fi

eval "$(/opt/homebrew/bin/brew shellenv)"

eval "$(thefuck --alias)"

# pyenv requires this before bashrc
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init --path)";
  eval "$(pyenv init -)";
  eval "$(pyenv virtualenv-init -)"
fi
mkvirtualenv() {
  pyenv virtualenv $1 $2
  pyenv activate $2
}
alias workon='pyenv activate'

# for NVM
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"
eval "$(fzf --bash)"

atlasJenkins(){
    ssh -N -L localhost:9999:aibuild080.cern.ch:8080 gstark@lxplus.cern.ch
}

#function llpass() {
#  lpass status || LPASS_AGENT_TIMEOUT=86400 lpass login --trust kratsg@gmail.com
#  lpass show --password 622087230793016457 | kinit --password-file=STDIN gstark@CERN.CH
#}

function llpass() {
  NERSC_KEY="ptrqwcxtz4ihabsb5rzq7wgop4"
  eval $(op signin)
  #op item get c4sdr3xxizaixhzxtk5fxkknei --fields password | kinit --password-file=STDIN gstark@SLAC.STANFORD.EDU
  #echo "SLAC finished"
  op item get 6y2pfjvzejcjrorfwfeppgfbri --fields password | kinit --password-file=STDIN gstark@CERN.CH
  echo "CERN finished"
  ~/sshproxy.sh -u kratsg <<< "$(op item get ${NERSC_KEY} --fields password)$(op item get ${NERSC_KEY} --otp)"
  echo "Perlmutter finished"
}

export PYTHONSTARTUP=~/.pythonrc
PATH=/usr/local/bin:/usr/local/share/npm/bin:$PATH
#PATH=/Library/TeX/Distributions/.DefaultTeX/Contents/Programs/texbin:$PATH
PATH=/usr/local/texlive/2021/bin/universal-darwin/:$PATH
export PATH=/usr/local/sbin:$PATH

alias atlas-jets='cd ~/Dropbox/UChicagoSchool/DavidMiller'
alias netlook='lsof -Pni'
export PS1="\[\e[1;31;40m\]Lord Stark\[\e[0m\]:\[\e[36;40m\]\w\[\e[0;37;40m\]\$(__git_ps1)\[\e[1;33;40m\]$ \[\e[0m\]"

alias ls='gls -GFplavh --color=auto'
LS_COLORS='rs=0:di=38;5;27:ln=38;5;51:mh=44;38;5;15:pi=40;38;5;11:so=38;5;13:do=38;5;5:bd=48;5;232;38;5;11:cd=48;5;232;38;5;3:or=48;5;232;38;5;9:mi=05;48;5;232;38;5;15:su=48;5;196;38;5;15:sg=48;5;11;38;5;16:ca=48;5;196;38;5;226:tw=48;5;10;38;5;16:ow=48;5;10;38;5;21:st=48;5;21;38;5;15:ex=38;5;34:*.tar=38;5;9:*.tgz=38;5;9:*.arj=38;5;9:*.taz=38;5;9:*.lzh=38;5;9:*.lzma=38;5;9:*.tlz=38;5;9:*.txz=38;5;9:*.zip=38;5;9:*.z=38;5;9:*.Z=38;5;9:*.dz=38;5;9:*.gz=38;5;9:*.lz=38;5;9:*.xz=38;5;9:*.bz2=38;5;9:*.tbz=38;5;9:*.tbz2=38;5;9:*.bz=38;5;9:*.tz=38;5;9:*.deb=38;5;9:*.rpm=38;5;9:*.jar=38;5;9:*.rar=38;5;9:*.ace=38;5;9:*.zoo=38;5;9:*.cpio=38;5;9:*.7z=38;5;9:*.rz=38;5;9:*.jpg=38;5;13:*.jpeg=38;5;13:*.gif=38;5;13:*.bmp=38;5;13:*.pbm=38;5;13:*.pgm=38;5;13:*.ppm=38;5;13:*.tga=38;5;13:*.xbm=38;5;13:*.xpm=38;5;13:*.tif=38;5;13:*.tiff=38;5;13:*.png=38;5;13:*.svg=38;5;13:*.svgz=38;5;13:*.mng=38;5;13:*.pcx=38;5;13:*.mov=38;5;13:*.mpg=38;5;13:*.mpeg=38;5;13:*.m2v=38;5;13:*.mkv=38;5;13:*.ogm=38;5;13:*.mp4=38;5;13:*.m4v=38;5;13:*.mp4v=38;5;13:*.vob=38;5;13:*.qt=38;5;13:*.nuv=38;5;13:*.wmv=38;5;13:*.asf=38;5;13:*.rm=38;5;13:*.rmvb=38;5;13:*.flc=38;5;13:*.avi=38;5;13:*.fli=38;5;13:*.flv=38;5;13:*.gl=38;5;13:*.dl=38;5;13:*.xcf=38;5;13:*.xwd=38;5;13:*.yuv=38;5;13:*.cgm=38;5;13:*.emf=38;5;13:*.axv=38;5;13:*.anx=38;5;13:*.ogv=38;5;13:*.ogx=38;5;13:*.aac=38;5;45:*.au=38;5;45:*.flac=38;5;45:*.mid=38;5;45:*.midi=38;5;45:*.mka=38;5;45:*.mp3=38;5;45:*.mpc=38;5;45:*.ogg=38;5;45:*.ra=38;5;45:*.wav=38;5;45:*.axa=38;5;45:*.oga=38;5;45:*.spx=38;5;45:*.xspf=38;5;45:'; export LS_COLORS

# Load RVM into a shell session *as a function*
# source ~/.profile

export EDITOR=$(which vim)

alias gpython='ipython qtconsole --profile=root'

export SAUCE_USERNAME=kratsg
export SAUCE_ACCESS_KEY=aec886fc-9611-49ce-a3f7-63c33d0270cb

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export PATH=$HOME/mongodb/bin:$PATH

function light() {
  if [ -z "$2" ]
    then src="pbpaste"
  else
    src="cat $2"
  fi
  $src | highlight -O rtf --syntax $1 --style solarized-dark --font-size 24 | pbcopy
}

export PATH="$PATH:$HOME/.rvm/bin"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# cuda stuff
export CUDA_ROOT=/usr/local/cuda
export LD_LIBRARY_PATH=$CUDA_ROOT/lib:$LD_LIBRARY_PATH
export DYLD_LIBRARY_PATH=$CUDA_ROOT/lib:$DYLD_LIBRARY_PATH
export LIBRARY_PATH=$CUDA_ROOT/lib:$LIBRARY_PATH
export PATH=/usr/local/cuda/bin:$PATH
export PATH="/usr/local/opt/sqlite/bin:$PATH"

# for ROOT
setup_root(){
  . /usr/local/bin/thisroot.sh
  alias roopython3='$(brew --prefix python3)/bin/python3'
}

setup_display() {
  export ip=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')
  xhost + $ip
  echo "run with -e DISPLAY=$ip:0 -v /tmp/.X11-unix:/tmp/.X11-unix"
}

#alias root='open -a XQuartz;xhost + 127.0.0.1; docker run --rm -it -e DISPLAY=host.docker.internal:0 -v $HOME:$HOME -w $PWD rootproject/root root'
#alias hadd='open -a XQuartz;xhost + 127.0.0.1; docker run --rm -it -e DISPLAY=host.docker.internal:0 -v $HOME:$HOME -w $PWD rootproject/root hadd'

# ffmpeg -ss 16.7 -t 1.6 -i /Users/kratsg/Downloads/10000000_1194722684276358_4245912065428022957_n.mp4 -filter_complex "[0:v] fps=12,scale=w=480:h=-1,split [a][b];[a] palettegen=stats_mode=single [p];[b][p] paletteuse=new=1" biden.gif -y
# convert biden.gif -fill white -undercolor '#00000080' -gravity South -stroke black -strokewidth 1 -pointsize 36 -font /Library/Fonts/Impact.ttf -annotate +120+220 'President Biden' biden_anotate.gif
# ffmpeg  -ss 0:0:0.05 -i ~/Downloads/doug.mp4 -filter_complex "[0:v] fps=60,scale=w=600:h=-1,crop=11*iw/16:240:2*iw/16:40,split [a][b];[a] palettegen=stats_mode=single [p];[b][p] paletteuse=new=1" doug_meme.gif -y

# Created by `pipx` on 2024-04-03 01:18:24
export PATH="$PATH:/Users/kratsg/.local/bin"
export PATH="$PATH:/Applications/Docker.app/Contents/Resources/bin/"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/kratsg/staged-recipes/.pixi/envs/osx/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/kratsg/staged-recipes/.pixi/envs/osx/etc/profile.d/conda.sh" ]; then
        . "/Users/kratsg/staged-recipes/.pixi/envs/osx/etc/profile.d/conda.sh"
    else
        export PATH="/Users/kratsg/staged-recipes/.pixi/envs/osx/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# see https://github.com/prefix-dev/pixi/issues/3225
alias claude='/Users/kratsg/.pixi/envs/nodejs/bin/claude'
