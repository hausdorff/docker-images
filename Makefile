git:
	docker build -t hausdorff/git git

kubectl:
	docker build -t hausdorff/kubectl kubectl

vim:
	docker build -t hausdorff/vim vim 


.PHONY: all git kubectl vim

