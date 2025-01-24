
# %%
# # Software tests and shells
# name: software-tests-and-shells.sh
# prereqs: [ "shells/bash-demo.sh", ]

# %%
echo '- Testing is essential to science and to software engineering.'
echo "- Tests assert that one or more conditions are true."
echo '- A "test assertion" is a statement that a condition is true.'

test 0 -eq 0    && echo true
test "A" == "A" && echo true

if [ $? -eq 0 ]; then
    echo true
fi

# %%
echo '- A "shell" is a program that reads and executes commands from a file or from standard input.'
echo '- `sh`, `bash`, and `zsh` are shells'
echo '- Linux distributions typically have bash; and sh is a mode of and symlink to bash.'
echo '- MacOS has zsh as the default shell, but also has bash 3'
echo '- WSL (Windows Subsystem for Linux) has bash. (Windows has cmd.exe, PowerShell, and Windows Terminal)'
echo '- Many devices with just firmware have `sh`, but not bash.'
echo '- `sh` supports POSIX shell specification, but not all of the features of bash shell scripts (like arrays)'

# %%
echo '- Shell variables start with a dollar sign ($) and are case sensitive.'
echo '- $SHELL is a shell variable that contains the path to the current shell:'
echo '$SHELL='"$SHELL"
$SHELL --version
$SHELL --help

sh --help
bash --help
zsh --help


# %%
echo '- `echo` is a command that prints text to the terminal.'
echo '- `test` is a command that tests conditions'
echo '- Test returns 0 if the condition is true, and 1 if it is false.'
echo '&& runs a command only if the previous command was successful.'
echo '|| runs a command only if the previous command failed.'

test 1 == 1 && echo 'Yup, 1 is 1!'
test 1 == 2 || echo 'Nope, 1 is not 2!')

# %%
echo '- The shell sets $?` to the exit code of the last command.'
echo '- We can test the exit code of a command with `test $? -eq 0` or `test $? -ne 0`'

echo 'Hello'
test $? -eq 0 && echo 'world'

# %%
echo '- `test`, `echo`, and `printf` are shell builtin commands and also regular commands on $PATH'
echo '- `type -a` shows all the places a command is found:'
type -a test
type -a [

help test
help [

# help type


# %%
# - `test` can be called like any other command in an if statement,
#    but it is more common to use `[` or `[[`'

if test $? -eq 0; then
    echo 'Yup, 2 is 2!'
else
    echo 'Nope, 2 is not 2!'
fi

# - `[` calls `test` and requires though omits the closing bracket `]`

if [ $? -eq 0 ]; then
    echo 'Yup, 3 is 3!'
else
    echo 'Nope, 3 is not 3!'
fi



# %%
# - TODO: what does `[[` do? How is it different from `[`? 
# - `[[` is a more powerful version of `[` that supports pattern matching and regular expressions.
help [[


# %%
# - TODO: Note that `test "" == ""`` is not the same as `test -z ""`

