RUNID := $(shell date +%F.%H-%M-%S)
bicepFile = ./main.bicep

help:
	@echo '$(RUNID): $(bicepFile)'

deployment.dev:

	time az deployment sub create --template-file $(bicepFile) -l northeurope -c --parameters environment=dev