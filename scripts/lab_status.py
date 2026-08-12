import os

from azure.identity import DefaultAzureCredential
from azure.mgmt.resource.resources import ResourceManagementClient
from azure.mgmt.compute import ComputeManagementClient
from azure.core.exceptions import ResourceNotFoundError
from azure.mgmt.containerservice import ContainerServiceClient

def get_vm_status(compute_client, resource_group, vm_name):
    try:
        vm_instance_view = compute_client.virtual_machines.instance_view(
            resource_group,
            vm_name
        )

        for status in vm_instance_view.statuses:
            if status.code.startswith("PowerState/"):
                return status.display_status

        return "Unknown"

    except ResourceNotFoundError:
        return "Not Found"

def get_resource_group_status(resource_client, resource_group):
    try:
        resource_client.resource_groups.get(resource_group)
        return "Found"

    except ResourceNotFoundError:
        return "Not Found"

def get_aks_status(container_client, resource_group, aks_cluster_name):
    try:
        cluster = container_client.managed_clusters.get(
            resource_group,
            aks_cluster_name
        )

        return cluster.provisioning_state

    except ResourceNotFoundError:
        return "Not Found"

def get_cost_risk(vm_power_state, aks_status):
    vm_active = vm_power_state not in ["VM deallocated", "Not Found"]
    aks_active = aks_status != "Not Found"

    if vm_active and aks_active:
        return "HIGH"
    elif vm_active or aks_active:
        return "MEDIUM"
    else:
        return "LOW"

    
resource_group = "rg-terraform-lab-1"
environment = "dev"
vm_name = "vm-linux-01"
aks_cluster_name = "aks-dev-01"

subscription_id = os.getenv("ARM_SUBSCRIPTION_ID")

credential = DefaultAzureCredential()

resource_client = ResourceManagementClient(
    credential,
    subscription_id
)

compute_client = ComputeManagementClient(
    credential,
    subscription_id
)

container_client = ContainerServiceClient(
    credential,
    subscription_id
)

resource_group_status = get_resource_group_status(
    resource_client,
    resource_group
)

vm_power_state = get_vm_status(
    compute_client,
    resource_group,
    vm_name
)

aks_status = get_aks_status(
    container_client,
    resource_group,
    aks_cluster_name
)

cost_risk = get_cost_risk(
    vm_power_state,
    aks_status
)

print("Azure Lab Status")
print("----------------")
print("Environment:", environment)
print("Resource Group:", resource_group)
print("Resource Group Status:", resource_group_status)
print("Linux VM:", vm_power_state)
print("AKS Cluster:", aks_status)
print("Cost Risk:", cost_risk)