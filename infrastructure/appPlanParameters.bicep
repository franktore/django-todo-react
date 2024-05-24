param namePrefix string
param sku string = 'B1'

resource appPlan 'Microsoft.Web/serverfarms@2020-06-01' = {
  name: '${namePrefix}-appPlan'
  location: resourceGroup().location
  kind: 'linux'
  sku: {
    name: sku
    tier: 'Basic'
    size: 'B1'
    family: 'B'
    capacity: 1
  }
  properties: {
    perSiteScaling: false
    maximumElasticWorkerCount: 1
    isSpot: false
    reserved: true
    isXenon: false
    hyperV: false
    targetWorkerCount: 0
    targetWorkerSizeId: 0
  }
}

output planId string = appPlan.id
output planName string = appPlan.name