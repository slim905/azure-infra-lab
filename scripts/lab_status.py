import os

from azure.identity import DefaultAzureCredential
from azure.mgmt.resource.resources import ResourceManagementClient
from azure.mgmt.compute import ComputeManagementClient
from azure.core.exceptions import ResourceNotFoundError

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

resource_group = "rg-terraform-lab-1"
environment = "dev"
vm_name = "vm-linux-01"

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

vm_power_state = get_vm_status(
    compute_client,
    resource_group,
    vm_name
)

resource_group_status = get_resource_group_status(
    resource_client,
    resource_group
)

print("Azure Lab Status")
print("----------------")
print("Environment:", environment)
print("Resource Group:", resource_group)
print("Resource Group Status:", resource_group_status)
print("Linux VM:", vm_power_state)