param namePrefix string
param serverfarmId string
param sku string = 'B1'
param linuxFxVersion string = 'python|3.8'

resource site 'Microsoft.Web/sites@2020-06-01' = {
  name: '${namePrefix}-site'
  location: resourceGroup().location
  kind: 'app'
  properties: {
    enabled: true
    hostNameSslStates: [
      {
        name: '${namePrefix}-site.azurewebsites.net'
        sslState: 'Disabled'
        hostType: 'Standard'
      }
      {
        name: '${namePrefix}-site.scm.azurewebsites.net'
        sslState: 'Disabled'
        hostType: 'Repository'
      }
    ]
    serverFarmId: serverfarmId
    reserved: true
    isXenon: false
    hyperV: false
    siteConfig: {
      linuxFxVersion: linuxFxVersion
    }
    scmSiteAlsoStopped: false
    clientAffinityEnabled: true
    clientCertEnabled: false
    hostNamesDisabled: false
    containerSize: 0
    dailyMemoryTimeQuota: 0
    httpsOnly: false
    redundancyMode: 'None'
  }
}