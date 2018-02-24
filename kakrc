def -docstring 'invoke fzf to open a file' \
    fzf-file %{
    %sh{
        if [ -z "$TMUX" ]; then
            echo echo only works inside tmux
        else
        (
            FILE=$(rg --files --hidden | fzf-tmux -d 15)
            if [ -n "$FILE" ]; then
                printf 'eval -client %%{%s} edit %%{%s}\n' "${kak_client}" "${FILE}" | kak -p "${kak_session}"
            fi
        ) > /dev/null 2>&1 </dev/null &
        fi
    }
}

def -docstring 'invoke fzf to select a buffer' \
    fzf-buffer %{ %sh{
        if [ -z "$TMUX" ]; then
            echo echo only works inside tmux
        else
        (
            BUFFER=$(printf %s\\n "${kak_buflist}" | tr : '\n' | fzf-tmux -d 15)
            if [ -n "$BUFFER" ]; then
                echo "eval -client '$kak_client' 'buffer ${BUFFER}'" | kak -p ${kak_session}
            fi
        ) > /dev/null 2>&1 < /dev/null &
        fi
} }

# Aliases for fzf
alias global ff fzf-file
alias global fb fzf-buffer

# Use as ctrl-p
map global normal <c-p> :ff<ret>
