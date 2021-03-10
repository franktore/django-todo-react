param namePrefix string
param serverfarmId string
param sku string = 'B1'

resource appResource 'Microsoft.Resources/deployments@2020-06-01' = {
  name: '${namePrefix}-frontendDeploy'
  location: resourceGroup().location
  properties: {
    mode: 'Incremental'
    templateLink: {
      uri: 'https://raw.githubusercontent.com/franktore/django-todo-react/some-changes/infrastructure/azuredeploy.jsonc'
      contentVersion: '1.0.0.0'
    }
    parameters: {
      webAppName: '${namePrefix}-frontend'
      tags: namePrefix
      appserviceResourceId: resourceId('Microsoft.Web/serverfarms', '${namePrefix}-appPlan')
      containerRegistryName: '${namePrefix}Containerreg'
      containerImageTag: 'latest'
      environmentVariables: []
      appGatewayIp: 'Any'
    }
  }
  // dependsOn:[]
}