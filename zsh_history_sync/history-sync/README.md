# history-sync
> An Oh My Zsh plugin for git-crypt encrypted, Internet synchronized Zsh history using Git.

## Installation
```bash
brew install git-crypt
cd .dotfiles
./install
```

Then open .zshrc file and append history-sync to the plugin line:

```bash
plugins=(... history-sync)
```

And finally, reload zsh:

```bash
zsh
```

## Usage
Before history-sync can be useful, you need two things:

1. A hosted git repository, e.g. GitHub, Bitbucket
   * Ideally with ssh key access
2. git-crypt unlock this repo

and running the commands:

```bash
# pull history
zhpl

# push history
zhps

# pull and push history
zhsync
```