# prank-zshrc-zoo
Let's educate your colleague who left their computer open and unattended!

## usage
Clone once to set up your prank base, then import the latest pranks anytime.
```
git clone https://github.com/Motifman/prank-zshrc-zoo.git
cd prank-zshrc-zoo
```
Import the latest pranks later (run inside the base directory):
```
sh update.sh
```
## Remote usage (no clone left behind)
Apply a prank to a target machine without cloning the repo there.
Run it with `source` so it affects the current shell, and **prefix with a space**
so the command itself is not saved to history:
```
 source <(curl -fsSL https://raw.githubusercontent.com/Motifman/prank-zshrc-zoo/main/train_remote.sh) virus.sed
```
What it cleans up to stay undetectable:
- No `prank-zshrc-zoo` directory is left on the target machine.
- The `~/.zshrc.aonaon` sed backup is removed immediately.
- `~/.zshrc` modification time is restored, so `ls -l` / Finder do not show a recent edit.
- Install traces are scrubbed from the history file and `~/.zsh_sessions` (the
  separate session history macOS Terminal.app keeps).

Stealth tips:
- The leading space matters: with `setopt HIST_IGNORE_SPACE` the command never
  enters history in the first place. Confirm it is set before relying on it.
- Or pre-disable session saving for that shell: `export SHELL_SESSIONS_DISABLE=1`.

Keep your own clone as the base and `sh update.sh` to import the latest pranks.
Out of scope: Time Machine / iCloud snapshots and network/proxy logs cannot be undone.

## One-Time virus 
You need to use "source" instead of "zsh".
```
source train.sh virus.sed
```
If you accidentally execute a command other than 'source', please run 'reset.sh' before things get complicated.
```
source reset.sh
```
## World's Nabeatsu virus
World's Nabeatsu is famous Japanese Comedian.
```
source train.sh virus_fool.sed
```
Please execute the following command to remove the alias and precmd.
```
source reset_fool.sh
```

## sl virus
```
source train.sh virus_sl.sed
```
Reset:
```
source reset_sl.sh
```

## editor virus
```
source train.sh virus_edit.sed
```
Reset:
```
source reset_edit.sh
```

## catmeme virus
```
source train.sh virus_cat.sed
```
(One-time: prints a cat meme on the first `cat`, then self-destructs.)

## side-job virus
Randomly shows a "looking for a side job" message on the right prompt.
```
source train.sh virus_sidejob.sed
```
Reset:
```
source reset_sidejob.sh
```

## Emergency reset
If you are not sure which virus was applied, this removes everything:
```
source reset_all.sh
```

## Custom virus
If you want to create a custom virus, write the editing command targeting zshrc into a .sed file, and execute it as follows.
```
source train.sh virus_hoge.sed
```


## TODO

- [x] sl virus 
- [x] editor virus
- [x] catmeme virus
- [x] side-job virus 
