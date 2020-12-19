#!/usr/bin/env zsh

# Make a directory and immediate change into it
# - requires a new directory name
# - ex: mkcd new-project
mkcd() {
  mkdir -p "$@" && cd $_; i
}

# Uses the http://gitignore.io api to generate contents of a `.gitignore` file
# - requires a command-sep list of keywords, see: from https://docs.gitignore.io/use/command-line
# - ex: `gi node,ruby`
gi() {
  echo "fetching $@ gitignore";
  curl -sLw "\n" https://www.gitignore.io/api/$@ >> .gitignore;
}

# Kills a process by the port number their running on.
# - great for ghost node processes.
# - ex: `killport 8000`
killport() {
  echo "Killing port $1";
  sudo kill -9 $(sudo lsof -t -i:$1)
}

# List out the current $PATH entries as a list
path() {
  echo $PATH | tr ":" "\n" | nl;
}

# Lauches vim and opens the main wiki entry  point.
# - also accepts git commands to run in the context of the repo
# - ex w/ git arg: `wiki git push` works as one might expect
# - TODO add a `wiki sync` - add + commit + push to origin/main
wiki () {
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
  echo "$PWD does not contain a git repository";
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


