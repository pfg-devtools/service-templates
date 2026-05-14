.PHONY: check
check:
	test -f templates/go-service/cmd/server/main.go
	test -f templates/python-service/src/app/main.py
	test -f templates/terraform-module/main.tf
