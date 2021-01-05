Remove local 'origin' branches that have been removed:
`git fetch origin --prune`

Delete pushed commit:
VSCode VCS undo last commit
checkout to new branch and commit there
go back to other branch
For commit `aaaaaa`
`git rebase -i aaaaaa^`
Delete the line with your commit(s).
`git rebase --continue`
`git push <remote_repo> <remote_branch> -f`

