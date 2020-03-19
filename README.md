This is a basic template Terraform template for Cloudskiff, that creates a Standard_DS1 VM on Azure.
It also creates:
- a resource group: `cloudskiff_demo_resource_group`
- a storage account: `cloudskiff_storage_account`
- a security group: `CloudSkiffSecurityGroup`


# Source
Source: https://docs.microsoft.com/en-us/azure/terraform/terraform-create-complete-vm

Here is a list of available locations:

```
$ azure location list
{
    "value": [
        {
            "id": "/subscriptions/c3dfd792-49a4-4b06-80fc-6fc6d06c4742/locations/eastasia",
            "name": "eastasia",
            "displayName": "East Asia",
            "longitude": "114.188",
            "latitude": "22.267"
        },
        {
            "id": "/subscriptions/c3dfd792-49a4-4b06-80fc-6fc6d06c4742/locations/southeastasia",
            "name": "southeastasia",
            "displayName": "Southeast Asia",
            "longitude": "103.833",
            "latitude": "1.283"
        },
        {
            "id": "/subscriptions/c3dfd792-49a4-4b06-80fc-6fc6d06c4742/locations/centralus",
            "name": "centralus",
            "displayName": "Central US",
            "longitude": "-93.6208",
            "latitude": "41.5908"
        },
        {
            "id": "/subscriptions/c3dfd792-49a4-4b06-80fc-6fc6d06c4742/locations/eastus",
            "name": "eastus",
            "displayName": "East US",
            "longitude": "-79.8164",
            "latitude": "37.3719"
        },
        {
            "id": "/subscriptions/c3dfd792-49a4-4b06-80fc-6fc6d06c4742/locations/eastus2",
            "name": "eastus2",
            "displayName": "East US 2",
            "longitude": "-78.3889",
            "latitude": "36.6681"
        },
        {
            "id": "/subscriptions/c3dfd792-49a4-4b06-80fc-6fc6d06c4742/locations/westus",
            "name": "westus",
            "displayName": "West US",
            "longitude": "-122.417",
            "latitude": "37.783"
        },
        {
            "id": "/subscriptions/c3dfd792-49a4-4b06-80fc-6fc6d06c4742/locations/northcentralus",
            "name": "northcentralus",
            "displayName": "North Central US",
            "longitude": "-87.6278",
            "latitude": "41.8819"
        },
        {
            "id": "/subscriptions/c3dfd792-49a4-4b06-80fc-6fc6d06c4742/locations/southcentralus",
            "name": "southcentralus",
            "displayName": "South Central US",
            "longitude": "-98.5",
            "latitude": "29.4167"
        },
        {
            "id": "/subscriptions/c3dfd792-49a4-4b06-80fc-6fc6d06c4742/locations/northeurope",
            "name": "northeurope",
            "displayName": "North Europe",
            "longitude": "-6.2597",
            "latitude": "53.3478"
        },
        {
            "id": "/subscriptions/c3dfd792-49a4-4b06-80fc-6fc6d06c4742/locations/westeurope",
            "name": "westeurope",
            "displayName": "West Europe",
            "longitude": "4.9",
            "latitude": "52.3667"
        },
        {
            "id": "/subscriptions/c3dfd792-49a4-4b06-80fc-6fc6d06c4742/locations/japanwest",
            "name": "japanwest",
            "displayName": "Japan West",
            "longitude": "135.5022",
            "latitude": "34.6939"
        },
        {
            "id": "/subscriptions/c3dfd792-49a4-4b06-80fc-6fc6d06c4742/locations/japaneast",
            "name": "japaneast",
            "displayName": "Japan East",
            "longitude": "139.77",
            "latitude": "35.68"
        },
        {
            "id": "/subscriptions/c3dfd792-49a4-4b06-80fc-6fc6d06c4742/locations/brazilsouth",
            "name": "brazilsouth",
            "displayName": "Brazil South",
            "longitude": "-46.633",
            "latitude": "-23.55"
        },
        {
            "id": "/subscriptions/c3dfd792-49a4-4b06-80fc-6fc6d06c4742/locations/australiaeast",
            "name": "australiaeast",
            "displayName": "Australia East",
            "longitude": "151.2094",
            "latitude": "-33.86"
        },
        {
            "id": "/subscriptions/c3dfd792-49a4-4b06-80fc-6fc6d06c4742/locations/australiasoutheast",
            "name": "australiasoutheast",
            "displayName": "Australia Southeast",
            "longitude": "144.9631",
            "latitude": "-37.8136"
        },
        {
            "id": "/subscriptions/c3dfd792-49a4-4b06-80fc-6fc6d06c4742/locations/southindia",
            "name": "southindia",
            "displayName": "South India",
            "longitude": "80.1636",
            "latitude": "12.9822"
        },
        {
            "id": "/subscriptions/c3dfd792-49a4-4b06-80fc-6fc6d06c4742/locations/centralindia",
            "name": "centralindia",
            "displayName": "Central India",
            "longitude": "73.9197",
            "latitude": "18.5822"
        },
        {
            "id": "/subscriptions/c3dfd792-49a4-4b06-80fc-6fc6d06c4742/locations/westindia",
            "name": "westindia",
            "displayName": "West India",
            "longitude": "72.868",
            "latitude": "19.088"
        }
    ]
}
```

Sources:

- https://azureprice.net/?region=northeurope
