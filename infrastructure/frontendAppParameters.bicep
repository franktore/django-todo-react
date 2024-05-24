param namePrefix string
param serverfarmId string
param containerReg string
param sku string = 'B1'

resource appResource 'Microsoft.Resources/deployments@2020-06-01' = {
  name: '${namePrefix}-frontendDeploy'
  properties: {
    mode: 'Incremental'
    templateLink: {
      uri: 'https://raw.githubusercontent.com/franktore/django-todo-react/some-changes/infrastructure/azuredeploy.jsonc'
      contentVersion: '1.0.0.0'
    }
    parameters: {
      webAppName: {
        'value': 'franktores-${namePrefix}-frontend'
      }
      tags: {
        'value': {
          'Environment': namePrefix
        }
      }
      appserviceResourceId: {
        // 'value': resourceId('Microsoft.Web/serverfarms', '${namePrefix}-appPlan')
        'value': serverfarmId
      }
      containerRegistryName: {
        'value': '${containerReg}'
      }
      containerImageTag: {
        'value': 'latest'
      }
      environmentVariables: {
        'value': []
      }
      appGatewayIp: {
        'value': 'Any'
      }
    }
  }
  // dependsOn:[]
}