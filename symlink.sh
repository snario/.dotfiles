#!/bin/bash
FILES=`ls -a | tail -n +3 | grep -v "setup-symlinks.sh" | grep -v ".git" | grep -v ".gitignore" | grep -v "README.md"`
cd ..
for f in $FILES
do
  if [ -d $f ]
  then
    echo -n "Symlinking $f/ - "
    if [ -e ./$f ]
    then if [ -h $f ]
            then echo "already linked"
            else echo "exists (could not link)"
         fi
    else
      if ln -s .dotfiles/$f/ ./$f/ 2> /dev/null
      then echo success
      fi
    fi
  else
    echo -n "Symlinking $f - "
    if [ -e $f ]
    then
      if [ -h $f ]
        then echo "already linked"
        else echo "exists (could not link)"
      fi
    else 
      if ln -s .dotfiles/$f $f 2> /dev/null
        then echo success
      fi
    fi
  fi
done
