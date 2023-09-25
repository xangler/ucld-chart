CHART_DIR ?= demo
REGISTRY_ADDRESS ?= registry.xxx.com
REPO_USERNAME ?= demo
REPO_PASSWORD ?= demo
REPO_PROJECT ?= demo
REPO_ADDRESS := https://$(REGISTRY_ADDRESS)/chartrepo/$(REPO_PROJECT)

CHART_NAME=`cat ${CHART_DIR}/Chart.yaml | grep name: | cut -d ":" -f 2 | tr -d '[:space:]'`
CHART_VERSION=`cat ${CHART_DIR}/Chart.yaml | grep version: | cut -d ":" -f 2 | tr -d '[:space:]'`

helm:
	helm package ./${CHART_DIR}

helm-doc:
	helm-docs ./${CHART_DIR}

helm-repo:
	helm repo remove $(REPO_PROJECT)
	helm repo add $(REPO_PROJECT) $(REPO_ADDRESS) --username '$(REPO_USERNAME)' --password '$(REPO_PASSWORD)' --insecure-skip-tls-verify

helm-plugin: 
	helm plugin install https://github.com/chartmuseum/helm-push

helm-push: helm
	helm cm-push  $(CHART_NAME)-$(CHART_VERSION).tgz $(REPO_PROJECT) --force --insecure

clean:
	@rm -rf *.tgz

.PHONY:
	helm
