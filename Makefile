kubectl:
	docker build -t hausdorff/kubectl kubectl

vim:
	docker build -t hausdorff/vim vim 


.PHONY: all kubectl vim

