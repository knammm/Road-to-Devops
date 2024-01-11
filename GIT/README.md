## Versioning section

1. `git init`: Create a `.git` directory to maintain all the versions.
2. `git status`: Tell the current state of the repository.
3. `git add .` (not recommended, use `git add <FileName>` instead!): Track every file in the current state => go to staging area (still not committed).
4. `git commit -m "<message>"`: Tell the message for the changes.
5. `git config --global user.email "<your email>"`.
6. `git config --global user.name "<your name>"`: Tells git who you are. Global for all repository, Local will for this only repository.
7. `git remote add origin <Link>`: Give new entry that is a remote repository path (link github).
8. `git branch -M main`: Change branch master into main.
9. `git push -origin main` (for the first time need to add `-u` before `-origin`): Basically push all the data to the GitHub repository remotely on branch main.
10. `git log` (add `--oneline` for shorter): Shows all the previous commit of branch.
11. `git show <commit ID>`: Shows the changes.
12. `git pull`: To pull back what has been changed on the remote to local.

## Branch & More section

1. `git branch -c <New Name>`: Create a new branch with name.
2. `git branch -a`: Show all branches.
3. `git checkout <branch name>` = `git switch <branch name>`: Switch to that branch.
4. `git rm <file name> <file name>...`: Remove file.
5. `git mv <source path/name> <destination path/name>`: Move file or rename that file.
6. `git merge <branch name>`: Merge the contents of "branch name" into the current branch.
7. `vim .gitignore`: Create a file to ignore paths. For example, add the content as `"*.log"` => git will ignore the changes of all file with that tail if their contents were changed.
8. `git push --all origin`: Push all the branches contents to remote repo.
9. `git clone <link repo>`: Clone the remote-repo into local.

## Rollback section

1. `git checkout <FileName>`: If you have changes that have not gone into stage.
2. `git diff`: Will show you the difference in the file that you have changed.
3. `git diff --cached`: Gives the differences of the file that was staged. Or in summary, if you want to see the differences between the CURRENT commit with the NEXT commit that is going to happen.
4. `git restore --staged <FileName>`: Restore from the staged level.
5. `git diff <previous commit id>..<current commit id>`: To see the differences between the commits.
6. `git revert HEAD`: HEAD is the current commit => revert HEAD will go to previous (in commit phase). Note: this reverts will store in history (like making a new commit but this commit is actually the same content with the previous HEAD).
7. `git reset --hard <commit id>`: Will rollback but it will not store the "past future" of the commit. It is a direct way of rollback.

## Git ssh connection section

1. `ssh-keygen`: Create public key and private key in `.ssh` folder (private in `id_rsa`, public in `id_rsa.pub`). Paste the public key to your GitHub setting => ssh... => paste your public key.
2. `git clone <ssh path>`: Clone the repo. It will check the public with the private key in the local.
