Git docker image (minidocks/git)
================================

![](https://upload.wikimedia.org/wikipedia/commons/thumb/e/e0/Git-logo.svg/150px-Git-logo.svg.png)

Git is a distributed version control system designed to handle everything from small to very large projects with speed 
and efficiency.

Enhancements
------------

- Git Large File Storage (LFS)
- [git-subsplit](https://github.com/dflydev/git-subsplit): Automate and simplify the process of managing one-way read-only subtree splits.
- [git-hooks](https://github.com/icefox/git-hooks): A tool to manage project, user, and global Git hooks for multiple git repositories.
- [git-standup](https://github.com/kamranahmedse/git-standup): Recall what you did on the last working day ..or be nosy and find what someone else did.
- [tomono](https://github.com/unravelin/tomono): Merge multiple repositories into one big monorepository. Migrates every branch in every subrepo to the eponymous branch in the monorepo, with all files (including in the history) rewritten to live under a subdirectory.
- [splitsh](https://github.com/splitsh/lite/commits/master): splitsh-lite replaces the subtree split Git built-in command to make splitting a monolithic repository to read-only standalone repositories easy and fast.

Usage
-----

```bash
docker run --rm -it -v "`pwd`:`pwd`" -w "`pwd`" minidocks/git sh
```

Tags
----

 Tag       | Size
 ---       | ----
 latest, 2 | [![](https://images.microbadger.com/badges/image/minidocks/git.svg)](https://microbadger.com/images/minidocks/git)
 2         | [![](https://images.microbadger.com/badges/image/minidocks/git:2.svg)](https://microbadger.com/images/minidocks/git:2)

Alternatives
------------

- https://github.com/jderusse/docker-gitsplit
