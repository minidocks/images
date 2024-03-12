Git docker image ([minidocks/git](https://hub.docker.com/r/minidocks/git))
==========================================================================

![](https://upload.wikimedia.org/wikipedia/commons/thumb/e/e0/Git-logo.svg/150px-Git-logo.svg.png)

[Git](https://git-scm.com/) is a distributed version control system designed to
handle everything from small to very large projects with speed and efficiency.

Enhancements
------------

- Git Large File Storage (LFS)
- [git-metafile](https://github.com/jirutka/git-metafile): A tool for storing
  and restoring files metadata (mode, owner, group).
- [git-secret](https://git-secret.io/): A bash tool to store private data inside
  a git repo.
- [git-crypt](https://www.agwa.name/projects/git-crypt/): Transparent file
  encryption in git.
- [git-secrets](https://github.com/awslabs/git-secrets): Prevents you from
  committing secrets and credentials into git repositories.
- [git-subsplit](https://github.com/dflydev/git-subsplit): Automate and simplify
  the process of managing one-way read-only subtree splits.
- [git-hooks](https://github.com/icefox/git-hooks): A tool to manage project,
  user, and global Git hooks for multiple git repositories.
- [git-standup](https://github.com/kamranahmedse/git-standup): Recall what you
  did on the last working day ..or be nosy and find what someone else did.
- [tomono](https://github.com/unravelin/tomono): Merge multiple repositories
  into one big monorepository. Migrates every branch in every subrepo to the
  eponymous branch in the monorepo, with all files (including in the history)
  rewritten to live under a subdirectory.
- [splitsh](https://github.com/splitsh/lite/commits/master): splitsh-lite
  replaces the subtree split Git built-in command to make splitting a monolithic
  repository to read-only standalone repositories easy and fast.
- [monorepo-tools](https://github.com/shopsys/monorepo-tools): Tools for
  building and splitting monolithic repository from existing packages.
- [git-quick-stats](https://github.com/arzzen/git-quick-stats): Simple and
  efficient way to access various statistics in a git repository.
- [git-extras](https://github.com/tj/git-extras): GIT utilities – repo summary,
  repl, changelog population, author commit percentages and more.
- [git-fame](https://github.com/casperdcl/git-fame): Pretty-print git repository
  collaborators sorted by contributions.
- [git-filter-repo](https://github.com/newren/git-filter-repo/): The versatile
  tool for rewriting history.
- [git-interactive-rebase-tool](https://gitrebasetool.mitmaro.ca): An improved
  sequence editor for Git
- [git-sizer](https://github.com/github/git-sizer): Compute various size metrics
  for a Git repository, flagging those that might cause problems

Usage
-----

```bash
docker run --rm -it -v "`pwd`:`pwd`" -w "`pwd`" -v ~:/home/user minidocks/git sh
```

Tags
----

| Tag       | Size                                                                                                        |
|-----------|-------------------------------------------------------------------------------------------------------------|
| latest, 2 | ![](https://img.shields.io/docker/image-size/minidocks/git/latest?style=flat-square&logo=docker&label=size) |
| 2         | ![](https://img.shields.io/docker/image-size/minidocks/git/2?style=flat-square&logo=docker&label=size)      |

Alternatives
------------

- https://github.com/jderusse/docker-gitsplit
