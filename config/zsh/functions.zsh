#!/usr/bin/env zsh
# Function to source files if they exist


# Clear and display system profile
function cl() {
	clear;
	# nerdfetch;
  treefetch -xmas
}


# Make a directory and immediate change into it
# - requires a new directory name
# - ex: mkcd new-project
function mkcd() {
  mkdir -p "$@" && cd $_;
}

# Uses the http://gitignore.io api to generate contents of a `.gitignore` file
# - requires a command-sep list of keywords, see: from https://docs.gitignore.io/use/command-line
# - ex: `gi node,ruby`
function gi() {
  echo "fetching $@ gitignore";
  curl -sLw "\n" https://www.gitignore.io/api/$@ >> .gitignore;
}

# Kills a process by the port number their running on.
# - great for ghost node processes.
# - ex: `killport 8000`
function killport() {
  echo "Killing port $1";
  sudo kill -9 $(sudo lsof -t -i:$1)
}

# List out the current $PATH entries as a list
function path() {
  echo $PATH | tr ":" "\n" | nl;
}


function yolo() {
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

function flip() {
		clear;
    echo;
    echo -en "( º_º）  ┬─┬   \r"; sleep .5;
    echo -en " ( º_º） ┬─┬   \r"; sleep .5;
    echo -en "  ( ºДº）┬─┬   \r"; sleep .5;
    echo -en "  (╯'Д'）╯︵⊏   \r"; sleep .5;
    echo -en "  (╯'□'）╯︵ ⊏  \r"; sleep .5;
    echo     "  (╯°□°）╯︵ ┻━┻"; sleep .5;
}


