# [pro git](https://git-scm.com/book)

## git basics

### recording changes to the repository

- `git status -s`: short, simplified output
- `git commit -am`: auto stage tracked files
- `git rm --cached`: remove file from staging area

### viewing the commit history

- `git log -p`: show commit patches
- `git log --stat`: show commit stats
- `git log --graph`: graph of branches and merges
- `git log --oneline` == `--pretty=oneline --abbrev-commit`
- `git log --no-merges`: exclude merge commits

- `git log -2`: show last 2x commits 
- `git log --since=2.weeks` || `git log --since="2024-01-15`
- `git log --author="Eric Krenz"`: filter for author
- `git log -S function_name`: filter for add/rm code
- `git log -- path/to/file`: filter for a directory/file

- `git log --pretty=oneline`: simplified commit history
- `git log --pretty=format:"%h %s" --graph`: history with branches
- `git log --pretty=format:"%h - %an, %ar : %s"`: custom formatting

### undoing things

- `git commit --amend`: replace last local commit

- `git restore --staged <file>`: unstage changes
- `git restore <file>`: discard changes

### working with remotes

- `git remote add <shortname> <url>`: add remote repository
- `git remote add origin <url>`: add origin remote url

- `git remote rename <old> <new>`: change remote's shortname
- `git remote remove <shortname>`: remove remote server, remote branches, and remote configuration

- `git remote -v`: shows urls of remote servers
- `git remote show <shortname>`: more information about a server

- `git fetch <shortname>`: only download remote repository information
- `git fetch origin`: only download origin repository information

- `git pull`: auto fetch and merge remote into current branch
- `git config --global pull.rebase "false"`: fast forward if possible, else create merge commit (default)
- `git config --global pull.rebase "true"`: rebase when pulling

- `git push origin main`: push local changes to remote
- `git push origin <branchname>`: push local branch to remote

### tagging

- `git tag`: list all existing tags
- `git tag -l "v1.8.*"`: list all tags, filtered by string

- `git tag <tagname>`: create lightweight tag
- `git tag -a <tagname> -m <message>`: create annotated tag
- `git tag -a <tagname> <checksum>`: create tag for existing commit

- `git show <tagname>`: show tag and commit data

- `git push origin <tagname>`: push tag to remote server
- `git push origin --tags`: push all tags to remote server

- `git tag -d <tagname>`: delete local tag
- `git push origin --delete <tagname>`: delete remote tag

- `git checkout <tagname>`: view tagged version files
- `git checkout -b <branchname> <tagname>`: create branch from tag

### git aliases

- `git config --global alias.last "log -1"`: see last commit easily
- `git config --global alias.cam "commit -am"`: simplify commit alias

## git branching

### branches in a nutshell

- `HEAD`: special pointer to the branch you are currently on

- `git branch <branchname>`: create branch from current commit
- `git switch -c <branchname>`: `--create` && switch to new branch

- `git switch <branchname>`: switch to an existing branch
- `git switch -`: switch to previous branch

- `git branch -d <branchname>`: delete named branch

- `git log <branchname>`: show commit history for branch
- `git log --all`: show commit history for all branches
- `git log --oneline --graph --all`: pretty print branches

### basic branching and merging

- `git merge <branchname>`: merge named branch into current branch

- `git mergetool`: graphical tool to resolve merge conflicts
- `git config --global merge.tool <toolname>`: set merge tool (i.e. vimdiff, nvimdiff)

### branch management

- `git branch -v`: list all branches with their previous commits

- `git branch --merged`: list branches that have merged with current branch
- `git branch --no-merged`: list branches that have not merged with current branch

- `git branch --move <oldname> <newname>`: change branch name locally
- `git push --set-upstream origin <newname>`: change remote branch
- `git push origin --delete <oldname>`: remove pre-rename branch from remote

### remote branches 

- `git branch -vv`: list all local branches and remote tracking branches
- `git fetch --all; git branch -vv`: get updated information about all branches

- `git ls-remote <remote>`: list all references in remote server (i.e. origin)

- `git branch -u <remote>/<branch>`: set remote branch to track in current branch

- `git pull` == `git fetch --all` && `git merge <remote>/<branch>`

### rebasing

#### overview
1. `git switch feature`: switch to the feature branch
1. `git rebase main`: rebase feature branch into main
1. `git switch main`: switch back to the main branch
1. `git merge feature`: fast-forward merge

#### auto switch branches
1. `git rebase main feature`: rebase feature branch into main
1. `git switch main`: switch back to the main branch
1. `git merge feature`: fast-forward merge

#### takeaways
- `git pull --rebase` == `git fetch --all` && `git rebase <remote>/<branch>`
- `git config --global pull.rebase true`

## distributed git

### contributing to a project

- `git diff --check`: identifies whitespace errors
- `git log <branch>..<remote>/<branch>`: compare local and remote branches

- `git merge --squash <branch>`: takes all branch work into one changeset

#### forked public project
1. `git clone <url>`
1. `cd project`
1. `git switch -c <branch>`
1. `git commit`
1. `git remote add myfork <myurl>`
1. `git push -u myfork <branch>`
1. `git request-pull -u origin/master myfork`

### maintaining a project

- `git cherry-pick <checksum>`: rebase for single commits

- `git config --global rerere.enabled true`: cache and reuse recorded resolutions

- `git describe <branch>`: human readable name with checksum
- `git shortlog --no-merges <branch> --not v1.0.1`: clean summary of all commits since `v1.0.1`, grouped by author

- `git archive master --prefix='project/' | gzip > $(git describe master).tar.gz`: create release build

## github

### contributing to a project

#### the github flow

1. fork the project
1. create a topic branch from master
1. make some commits to improve the project
1. push this branch to your github project
1. open a pull request on github
1. discuss, and optionally continue committing
1. the project owner merges or closes the pull request
1. sync the updated master back to your fork

### maintaining a project

#### pull request refs

##### `.git/config`
```
[remote "origin"]
    url = <url>
    fetch = +refs/heads/*:refs/remotes/origin/*
    fetch = +refs/pull/*/head:refs/remotes/origin/pr/*
```

## git tools - advanced features

### revision selection

- `git show <hash>`: view commit message and diff
- `git log --abbrev-commit --pretty=oneline`: view short sha1 values
- `git reflog`: logs where your HEAD has been recently
- `git log -g`: git reflog, formatted like `git log`

- `git log main..feature`: shows all commits in feature not merged in main
- `git log feature..main`: shows all commits in main not reachable in feature

### interactive staging

- `git add -i`: interactive shell mode for staging

### stashing and cleaning

- `git stash`: stash changes and push onto stack
- `git stash list`: view stashes previously stored

- `git stash apply`: reapply previous stash
- `git stash apply stash@{2}`: reapply specific stash

- `git stash drop`: remove stash from stack
- `git stash pop`: apply previous stash and remove from stack

- `git stash --keep-index`: stash changes and staged changes
- `git stash -u`: stash changes and untracked files
- `git stash apply --index`: reapply previous stack and staged changes
- `git stash --patch`: interactive shell stashing

- `git stash branch <branchname>`: created new branch, applies stash, drops changes

- `git clean`: remove untracked files
- `git clean -d`: includes directories
- `git clean -x`: includes files from .gitignore
- `git clean -n` == `git clean --dry-run`
- `git clean -i`: interactive mode

### signing your work

### searching

- `git grep -n <string>`: search for string with files and line numbers
- `git grep -c <string>`: counts matches for each file
- `git grep -p <string>`: adds context of enclosing method or function

- `git log -S <string> --oneline`: searches for commits containing string
- `git log -L :<function>:<file>`: searches for commits changing the funciton+file

### rewriting history

- `git commit --amend`: replaces last commit with new, improved commit
- `git commit --amend --no-edit`: replaces last commit with same commit message

- `git rebase -i HEAD~3`: edit last 3x commit messages

### reset demystified

- `git reset --soft HEAD~`: makes current branch point to previous commit
- `git reset --mixed HEAD~`: point to previous commit, update index(== `git reset HEAD~`)
- `git reset --hard HEAD~`: point to previous commit, update index, update working directory

### advanced merging

- `git log --oneline --left-right --merge`: show commits from both sides that are in conflict

- `git reset --hard HEAD~`: delete previous `git merge`
- `git revert -m 1 HEAD`: reverts previous merge in new commit

- `git merge -Xours <branchname>`: choose `-Xours` or `-Xtheirs` merge strategy

### rerere

- `git config --global rerere.enabled true`: enable rerere (reuse recorded resolution)

- `git rerere`: automatically resolve files using cache resolution
- `git rerere status`: shows recorded files
- `git rerere diff`: shows the current resolution state


### debugging with git

- `git blame -L 69,82 Makefile`: determines author and commits for lines in file
- `git blame -C ...`: determines original location of code, if copied

### submodules

- `git submodule add https://github.com/<user>/<repo>`: track new submodule

- `git diff --cached`: shows submodule commit number, if there are changes
- `git diff --cached --submodule`: view nicer diff output

- `git clone --recursive-submodules https://github.com/<user>/<repo>`: auto import and update submodules
- `git submodule init`: initialize local configuration file
- `git submodule update`: fetch data from submodules, update commit reference in project

### bundling

- `git bundle create repo.bundle HEAD main`: compress all data into `repo.bundle` file
- `git clone repo.bundle repo`: clone repo from compressed bundle

### replace

- `git rebase --onto <new-checksum> <old-checksum>`: replace a specific commit

### credential storage

- `git config --global credential.helper cache`: save credentials for a short period of time

## customizing git

### git configuration

- `git config --global user.name "Eric Krenz"`
- `git config --global user.email <email>`

- `git config --global core.editor nvim`
- `git config --global core.pager ''`: (default: `less`)
- `git config --global merge.tool vimdiff`

### git attributes

- `.gitattributes`: file containing non-text files, merge strategies, or filter content

### git hooks

- `.git/hooks/`: subdirectory containing project hooks

## git and other systems

### git as a client

- `git svn`: use git as a subversion client

- `git svn clone file:///tmp/test-svn -s`: import svn directory into a local git directory
- `git svn dcommit`: push commits to subversion server
- `git svn rebase`: pulls down changes from subversion server

- Other systems: `mercurial`, `perforce`

### migrating to git

## git internals

### plumbing and porcelain

- `.git/`: directory including project specific git features

### git objects

- `.git/objects/`: objects directory, aka objects database

- `git hash-object -w README.md`: takes data and stores it in object database
- `git cat-file -p main^{tree}`: specifies tree object that points to last commit
- `git update-index --add --cacheinfo 100644 <sha1> <filename>`: create index with a normal file
- `git write-tree`: write object to the staging area
- `echo 'commit message' | git commit-tree <sha1>`: commit object

### git references

- `.git/refs/`: references directory containing the SHA-1 values

- `git update-ref refs/head/main <sha1>`: pointer or refernce to head of branch

- `git symbolic-ref HEAD`: safely read value of HEAD
- `git symbolic-ref HEAD refs/heads/main`: safely write value of HEAD

### packfiles

- `zlib`: default git compression library

- `git gc`: create compressed binary packfiles to save space (`.git/objects/pack/...`)
- `git verify-pack -v .git/objects/pack/pack-<hash>.idx`: verify integrity of pack

### refspec

- `git push origin main:refs/heads/qa/main`: push refspec to server
- `git push origin --delete topic`: delete references on server

### transfer protocols

### maintenance and data recovery

- `git gc --auto`: run auto garbage collect, if necessary
- `git count-objects -v`: see how much space is being used

### environment variables

