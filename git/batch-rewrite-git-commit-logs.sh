#!/bin/bash

# set the committed user information to be replaced
old_user="old userName"
old_email="old@mail.com"
new_user="new userName"
new_email="new@mail.com"

# get global gpg signing key
signingkey=$(git config --global user.signingkey)

# rewrite the git commit history and sign new commits
git filter-branch --env-filter "
    if [ \"\$GIT_AUTHOR_EMAIL\" = \"$old_email\" ] && [ \"\$GIT_AUTHOR_NAME\" = \"$old_user\" ]; then
        export GIT_AUTHOR_EMAIL=\"$new_email\"
        export GIT_AUTHOR_NAME=\"$new_user\"
        export GIT_COMMITTER_EMAIL=\"$new_email\"
        export GIT_COMMITTER_NAME=\"$new_user\"
        export GIT_COMMITTER_SIGNINGKEY=\"$signingkey\"
        export GIT_AUTHOR_SIGNINGKEY=\"$signingkey\"
    fi
" --tag-name-filter cat --commit-filter 'git commit-tree -S "$@"' -- --branches --tags