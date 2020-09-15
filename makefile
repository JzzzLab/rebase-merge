MASTER=master
branch=
file=

#new branch
.PHONY: nb
nb:
	git checkout -b $(branch)
	touch $(branch)
	git add .
	git commit -m "$(branch) branch commit"
	git push -u origin $(branch)
	git checkout $(MASTER)

#new commit
.PHONY: nc
nc:
	touch $(file)
	git add .
	git commit -m "commit $(file)"
	git push

#rebase + merge + delete(local & remote branch) + push
.PHONY: rmdp
rmdp:
	#把功能分支rebase到master
	git checkout $(branch)
	git rebase $(MASTER)

	#master分支跟上進度
	git checkout $(MASTER)
	git merge $(branch)

	#強制刪除功能分支（因為遠端倉庫還未更新本地端功能分支之變動）
	git branch -D $(branch)

	#刪除遠端功能分支，並推送master分支
	git push origin -d $(branch)
	git push