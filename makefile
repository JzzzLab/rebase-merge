MASTER=master
branch=
file=

#new branch
.PHONY: nb
nb:
	git checkout -b $(branch)
	touch $(branch)
	git add .
	git commit -m "$(branch) commit"
	git push -u origin $(branch)
	git checkout $(MASTER)

#new commit
.PHONY: nc
nc:
	touch $(file)
	git add .
	git commit -m "commit $(file)"
	git push

#rebase + merge + delete(local & remote branch)
.PHONY: rmd
rmd: 
	git checkout $(branch)
	git rebase $(MASTER)
	git checkout $(MASTER)
	git merge $(branch)
	git branch -d $(branch)
	git push origin --delete $(branch)