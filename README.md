# PowerShell Registry Validation Script

This script provides a simple and effective way to validate the existence of a registry key and ensure its value matches a required setting. This is a crucial first step for many automation and security-focused tasks, where a system's configuration needs to be verified before proceeding with other actions.

---

### Purpose

This script is designed for **configuration auditing** and **pre-remediation checks**. It helps you quickly determine if a specific registry path and key exist, and if the value of that key is configured as required. This prevents issues that can arise from applying a fix to a system that is already compliant or has a different configuration than expected.

---

### Usage

Before running the script, you must define the following variables at the top of the file:

* `$regPath`: The full registry path (e.g., `HKLM:\Software\Microsoft\Windows\CurrentVersion\Run`).
* `$valueName`: The name of the registry key's value to check (e.g., `MSConfig`).
* `$requiredValue`: The value that the key's data must match (e.g., `C:\Windows\System32\msconfig.exe`).

Once these variables are set, you can run the script:

```
.\validate-registry.ps1
```

The script will output a clear message indicating one of the following:

* The registry key and value match the required setting.
* The registry key exists, but the value does not match.
* The registry value does not exist.
* The registry key path does not exist.

---

### Notes

* **Error Handling:** The script includes basic error handling to gracefully manage situations where a registry path or value does not exist. This prevents the script from failing and provides a clear output.
* **Adaptability:** This script can be easily adapted to a wide range of use cases, from security auditing to ensuring software installation prerequisites are met. By simply changing the three variables at the top, you can check any registry setting on a Windows machine.
