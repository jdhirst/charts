# Makefile for various helm chart repo actions

default: repo depends lint pack index

# Update helm repositories
repo:
	helm repo update

# Update all dependencies for subcharts
depends:
	for i in src/* ; do \
		helm dependency update $$i ; \
	done

# Generate a new repo index file
index:
	helm repo index --url https://jdhirst.github.io/charts/ .

# Lint the chart source before building
lint:
	helm lint src/*

# Pack charts for distribution
pack:
	helm package -u -d packed/ src/*