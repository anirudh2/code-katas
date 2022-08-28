# code-katas

A code kata a software development exercise where a developer seeks to regularly **practice** new skills within a fixed amount of time, the kata practice session.

The code variant of a kata derives from the karate kata, an exercise focusing on repetition of a form with incremental improvement every time a form is repeated.

Code katas should have a duration of 30 to 90 minutes.  The focus of a code kata is **not** to solve a problem, as is typically the task of software engineering.   Rather, the focus is on **practice** of a particular code skill, such as file IO.

A hypothetical comparison between code development and code kata (practice) follows:

|  | code development | code kata |
|:--:|:--:|:--:|
| time | open ended | 30 to 90 minutes |
| frequency | as needed | daily/weekly |
| objective | problem solution | skill practice | 

## 2022-08-29

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

### Fish Shell

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

### Bob kata

* https://exercism.org/tracks/julia/exercises/bob

## References

* [Awesome code katas](https://github.com/gamontal/awesome-katas)
* [Dave Thomas code kata](http://codekata.com)
