from scripts.lab_status import get_cost_risk


def test_cost_risk_low():
    assert get_cost_risk(
        "VM deallocated",
        "Not Found"
    ) == "LOW"


def test_cost_risk_medium_vm_only():
    assert get_cost_risk(
        "VM running",
        "Not Found"
    ) == "MEDIUM"


def test_cost_risk_medium_aks_only():
    assert get_cost_risk(
        "VM deallocated",
        "Succeeded"
    ) == "MEDIUM"


def test_cost_risk_high():
    assert get_cost_risk(
        "VM running",
        "Succeeded"
    ) == "HIGH"