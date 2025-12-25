# Add / Apply
abbr -a ga         'git add'
abbr -a gaa        'git add --all'
abbr -a gau        'git add --update'
abbr -a gapa       'git add --patch'
abbr -a gap        'git apply'

# Branch
abbr -a gb         'git branch -vv'
abbr -a gba        'git branch -a -v'
abbr -a gban       'git branch -a -v --no-merged'
abbr -a gbd        'git branch -d'
abbr -a gbD        'git branch -D'
abbr -a ggsup      'git branch --set-upstream-to=origin/(git symbolic-ref --short HEAD)'

# Commit
abbr -a gc         'git commit -v'
abbr -a gc!        'git commit -v --amend'
abbr -a gcn!       'git commit -v --no-edit --amend'
abbr -a gca        'git commit -v -a'
abbr -a gca!       'git commit -v -a --amend'
abbr -a gcan!      'git commit -v -a --no-edit --amend'
abbr -a gcm        'git commit -m'
abbr -a gcam       'git commit -a -m'
abbr -a gcs        'git commit -S'
abbr -a gscam      'git commit -S -a -m'
abbr -a gcfx       'git commit --fixup'

# Clone / Clean
abbr -a gcl        'git clone'
abbr -a gclean     'git clean -di'
abbr -a gclean!    'git clean -df'
abbr -a gclean!!   'git reset --hard; and git clean -df'

# Diff
abbr -a gd         'git diff'
abbr -a gdca       'git diff --cached'
abbr -a gds        'git diff --stat'
abbr -a gdsc       'git diff --stat --cached'
abbr -a gdw        'git diff --word-diff'
abbr -a gdwc       'git diff --word-diff --cached'

# Fetch / Pull
abbr -a gf         'git fetch'
abbr -a gfa        'git fetch --all --prune'
abbr -a gfo        'git fetch origin'
abbr -a gl         'git pull'
abbr -a ggl        'git pull origin (git symbolic-ref --short HEAD)'
abbr -a ggu        'git pull --rebase origin (git symbolic-ref --short HEAD)'
abbr -a gup        'git pull --rebase'
abbr -a gupa       'git pull --rebase --autostash'

# Log
abbr -a glg        'git log --stat'
abbr -a glgg       'git log --graph'
abbr -a glgga      'git log --graph --decorate --all'
abbr -a glo        'git log --oneline --decorate --color'
abbr -a glog       'git log --oneline --decorate --color --graph'
abbr -a gloga      'git log --oneline --decorate --color --graph --all'

# Push
abbr -a gp         'git push'
abbr -a gp!        'git push --force-with-lease'
abbr -a gpo        'git push origin'
abbr -a gpo!       'git push --force-with-lease origin'
abbr -a ggp        'git push origin (git symbolic-ref --short HEAD)'
abbr -a ggp!       'git push origin (git symbolic-ref --short HEAD) --force-with-lease'
abbr -a gpu        'git push origin (git symbolic-ref --short HEAD) --set-upstream'

# Rebase
abbr -a grb        'git rebase'
abbr -a grba       'git rebase --abort'
abbr -a grbc       'git rebase --continue'
abbr -a grbi       'git rebase --interactive'
abbr -a grbm       'git rebase (__git.default_branch)'
abbr -a grbmia     'git rebase (__git.default_branch) --interactive --autosquash'

# Merge
abbr -a gm         'git merge'
abbr -a gma        'git merge --abort'
abbr -a gmc        'git merge --continue'

# Restore / Reset
abbr -a grs        'git restore'
abbr -a grst       'git restore --staged'
abbr -a grh        'git reset'
abbr -a grhh       'git reset --hard'

# Status / Stash
abbr -a gst        'git status'
abbr -a gsb        'git status -sb'
abbr -a gss        'git status -s'
abbr -a gsta       'git stash'
abbr -a gstl       'git stash list'
abbr -a gstp       'git stash pop'
abbr -a gstd       'git stash drop'

# Switch / Checkout
abbr -a gsw        'git switch'
abbr -a gswc       'git switch --create'
abbr -a gco        'git checkout'
abbr -a gcb        'git checkout -b'

# Worktree
abbr -a gwt        'git worktree'
abbr -a gwta       'git worktree add'
abbr -a gwtls      'git worktree list'
abbr -a gwtpr      'git worktree prune'
