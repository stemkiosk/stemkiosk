
## References:
#  - https://westurner.github.io/tools/#bash 


# %%
echo "$SHELL"
echo "${SHELL}"
type bash

# %%
bash --help
help help
help type

# %%
apropos bash

# %%
info bash
man bash

# %%
man man

# %%
info info  # [down arrow] and then [enter] to select, or 'n' for next

# %%
true
echo "$?"  # 0
false
echo "$?"  # 1
echo "Hello" && echo " World!"  # Hello World!
false || echo "World!"          # World!


# %%
function add_a {
   echo "$1 + $2 = $(( $1 + $2 ))"
}
add_b () {
   echo "$1 + $2 = $(( $1 + $2 ))"
}
add_xy () {
   echo "$x + $y = $(( $x + $y ))"
}
add_a 3 5       # "3 + 5 = 8"
add_b 3 5       # "3 + 5 = 8"

x=3 y=5 add_xy  # "3 + 5 = 8"
x=3; y=5;
add_xy          # "3 + 5 = 8"

output=$(add_a 3 5)
echo "${output}"


# %%
type -a test
type -a [
help test
help [
help [[

# %%
help return

# %%
test "$(add_a 3 5)" == "3 + 5 = 8" && echo 'OK'
test_add_a () {
   if [[ "$(add_a 3 5)" == "3 + 5 = 8" ]]; then
       echo 'OK'
       return 0
   else
       echo 'Test failed'
       return 1
   fi
}
test_add_a

# %%
help trap
help exit


# TODO: whyquote.sh , "strypes"

# TODO: correct way to loop over paths from find in a bash script:
