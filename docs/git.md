# git tips

Many of these tips were inspired from the [So You Think You Know Git](https://www.youtube.com/watch?v=aolI_Rz0ZqY) talk from one of GitHub's creators, Scott Chacon. Here are the links to the [blog](https://blog.gitbutler.com/git-tips-and-tricks/) for this [presentation](https://blog.gitbutler.com/fosdem-git-talk/).

## ~/.gitconfig files

### basic stuff

Save git username and email (required):

```yml
[user]
    name = <name>
    email = <email>
```

### maintenance

Use this on all commonly used repos:
```bash
git maintenance start
```

### word diff

Diff by words, instead of whole lines:
```bash
git diff --word-diff
```

### Reuse Recorded Resolution

Remember selections from previous merges:

```bash
git config --global rerere.enabled true
git config --global rerere.autoupdate true
```

### conditional configs

To separate out your "personal" git config from your "work" stuff:

```yml
[includeIf "gitdir:~/home"]
    path = ~/.gitconfig-home

[includeIf "gitdir:~/work"]
    path = ~/.gitconfig-work
```

### better branch

Displays git branch using columns:
```bash
git config --global column.ui auto
git config --global branch.sort -committerdate
```

### better force

Always use this instead:
```bash
git push --force-with-lease
```

### sign commits with ssh

Setup gpg signing:
```bash
git config gpg.format ssh
git config user.signingkey ~/.ssh/key.pub
```
... then you can sign stuff:
```bash
git commit -S
# or
git push --signed
```

*Note: you will need to save your public key on GitHub to appear as verified

### sendemail for kernel development

To set up using gmail:

```yml
[sendemail]
    smtpserver = smtp.gmail.com
    smtpserverport = 587
    smtpencryption = tls
    smtpuser = <username>
    smtppass = <password>
```

### main > master

```bash
git config --global init.defaultBranch main
```
