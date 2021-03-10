targetScope = 'subscription'

param environment string

resource rg 'Microsoft.Resources/resourceGroups@2020-06-01' = {
  name: 'todo-rg-${environment}'
  location: deployment().location
}

var rgScope = resourceGroup('todo-rg-${environment}') // use the scope of the newly-created resource group

module appPlanDeploy 'appPlanParameters.bicep' = {
  name: 'appPlanDeploy'
  scope: rgScope
  params: {
    namePrefix: 'todo-rg-${environment}'
  }
}

module containerRegDeploy 'containerRegParameters.bicep' = {
  name: 'containerRegDeploy'
  scope: rgScope
  params: {
    namePrefix: 'todoRg${environment}'
  }
}

module siteDeploy 'site.bicep' = {
  name: 'siteDeploy'
  scope: rgScope
  params: {
    namePrefix: 'todo-rg-${environment}'
    serverfarmId: appPlanDeploy.outputs.planId
  }
}