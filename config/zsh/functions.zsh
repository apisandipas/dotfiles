# Functions
mkcd() { mkdir -p "$@" && cd $_; }
gi() { echo "fetching $@ gitignore"; curl -sLw "\n" https://www.gitignore.io/api/$@ >> .gitignore;}
killport() { echo "Killing port $1"; sudo kill -9 $(sudo lsof -t -i:$1) }
path() { echo $PATH | tr ":" "\n" | nl; }

vimwiki () {
    if [[ $# == 0 ]]
    then
        nvim +'VimwikiIndex'
    elif [[ $1 == 'git' ]]
    then
        git -C $VIM_WIKI_DIR ${@:2}
    else
        echo 'Usage: vimwiki [git] [args ...]'
    fi
}

yolo() {
 if [ ! -d ./.git ]; then
  echo "$PWD is not a git repository";
  return 1;
 fi

  echo 'YOLO INCOMING!';
  clear;
  sleep .5;
  git add -A
  git commit --amend --no-edit
  git push -f
  echo 'YOLO COMPLETE';
  return 0;
}

flip() {
    echo;
    echo -en "( º_º）  ┬─┬   \r"; sleep .5;
    echo -en " ( º_º） ┬─┬   \r"; sleep .5;
    echo -en "  ( ºДº）┬─┬   \r"; sleep .5;
    echo -en "  (╯'Д'）╯︵⊏   \r"; sleep .5;
    echo -en "  (╯'□'）╯︵ ⊏  \r"; sleep .5;
    echo     "  (╯°□°）╯︵ ┻━┻"; sleep .5;
}


