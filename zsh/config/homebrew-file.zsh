# vim:ft=zsh
# https://homebrew-file.readthedocs.io/en/latest/brew-wrap.html

# brewfile management setup
if [ -f $(brew --prefix)/etc/brew-wrap ]; then
  source $(brew --prefix)/etc/brew-wrap
fi