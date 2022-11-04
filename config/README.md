# config

Configuration. Anirudh and Chad have slightly different views on config:

* Anirudh appreciates the ability to tailor the configuration to suit his workflows.  In this sense, *configuration* is actually *customization*.
* Chad often prefers to have zero-config, meaning sensible default values have been *a priori* selected and everything *"works out of the box".

## Key Bindings

We discussed this item in depth on 2022-08-29.

### VS Code Key Bindings

- [x] `Cmd + Shift + E` toggle between File Explorer and Editor
  * `j` down
  * `k` up
  * `h`
    * `if file` select parent folder
    * `if folder` collapse tree branch
  * `l` 
    * `if file` open file and pass focus to editor
    * `if folder` expand tree branch
  * `r` rename file/folder
  * `Enter`
    * `if file` open file and pass focus to editor
    * `if folder` open/close folder
- [x] `Cmd + b` open/close the Explorer window ("Side Bar" window)
- [x] `Cmd + j` open/close the Terminal window

## Fish Shell

In `~/.config/fish/config.fish` file:

```bash
# repeat last command !!
# and repeat last argument !$
# Ref: https://superuser.com/questions/719531/what-is-the-equivalent-of-bashs-and-in-the-fish-shell
function bind_bang
    switch (commandline -t)[-1]
        case "!"
            commandline -t -- $history[1]
            commandline -f repaint
        case "*"
            commandline -i !
    end
end

function bind_dollar
    switch (commandline -t)[-1]
        case "!"
            commandline -f backward-delete-char history-token-search-backward
        case "*"
            commandline -i '$'
    end
end

function fish_user_key_bindings
    bind ! bind_bang
    bind '$' bind_dollar
end
```
