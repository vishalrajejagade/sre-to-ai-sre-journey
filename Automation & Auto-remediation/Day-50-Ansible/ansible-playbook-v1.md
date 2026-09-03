
⚙️ Infrastructure Automation with Ansible


Overview
This project demonstrates practical infrastructure automation using Ansible with a focus on safe operations, service validation, patching workflows, and production readiness.
The objective is to reduce manual operational effort while maintaining reliability and minimizing deployment risk.


Technologies

- Ansible
- Linux
- SSH
- YAML
- Azure Virtual Machines
- Site Reliability Engineering (SRE)


Key Concepts Practiced
Ansible Inventory
Used inventory files to organize and manage multiple Linux hosts.
Example:

- ansible-control
- linux-vm01
- linux-vm02
- linux-vm03


Ad-Hoc Commands
Executed remote commands for validation and troubleshooting.
Examples:

- Ping validation
- Uptime checks
- Package status checks
- Service status checks


Ansible Playbooks
Created reusable automation playbooks for:

- Health checks
- Service validation
- Linux administration tasks
- Safe rollout execution


Dry Run Validation
Used:
ansible-playbook --check
Purpose:

- Preview changes
- Validate automation logic
- Prevent unintended modifications


Safe Automation
Implemented production-safe practices:

- Dry-run validation
- Canary execution
- Batch deployment
- Rollback awareness
- Blast radius reduction


Serial Execution
Used:
serial: 1
Purpose:

- Execute changes one server at a time
- Reduce production risk
- Validate health before continuing


Blast Radius Control
Minimized operational impact by:

- Testing changes on one server
- Validating outcomes
- Expanding gradually to additional servers


Service Health Validation
Validated:

- Service status
- Disk usage
- Memory consumption
- System uptime
Examples:
uptime

df -h

free -m


Learning Outcomes
Through this project I learned:

- Infrastructure Automation
- Production-safe deployment techniques
- Configuration management fundamentals
- Validation-driven operations
- Basic Site Reliability Engineering practices
- Automation troubleshooting techniques


Real-World SRE Workflow
Pre-Check
    ↓
Dry Run
    ↓
Canary Server
    ↓
Validation
    ↓
Batch Execution
    ↓
Post Validation
    ↓
Completion


Future Improvements

- Dynamic inventories
- Roles and reusable modules
- Azure integration
- Auto-remediation workflows
- Integration with Power Automate
- Integration with Azure Automation

