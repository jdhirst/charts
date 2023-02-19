# Makefile for various helm chart repo actions

# Generate a new repo index file
index:
	helm repo index --url https://jdhirst.github.io/charts/ .
lint:
	helm lint src/*
pack:
	helm package -u -d packed/ src/*