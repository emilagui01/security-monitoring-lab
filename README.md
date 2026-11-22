# Security Monitoring Lab

**Live write-up:** https://emilagui01.github.io/security-monitoring-lab/

Home Lab 4 of my IT portfolio. Proxmox VE 9.2 runs nested inside Hyper-V and hosts a small Windows domain
(`seclab.local`): a Windows Server 2022 domain controller and a domain-joined Windows 11 client on a private
NAT bridge. I turned on Advanced Audit Policy, command-line process auditing and PowerShell script block
logging through one GPO, kept Microsoft Defender with Tamper Protection on, then simulated seven attacks
and found each one in the logs.

## Scenarios

| # | Simulated attack | Detected by |
|---|---|---|
| 1 | Password guessing and account lockout | 4771 (0x18), 4740 |
| 2 | Backdoor account added to Domain Admins | 4720, 4728 |
| 3 | Malware download (EICAR test file) | SmartScreen, Defender 1116, 1117 |
| 4 | Turning off Defender | Defender 5013, 5001, 5007 |
| 5 | Base64-encoded PowerShell | 4688, 4104 |
| 6 | Scheduled task persistence | 4698, 4699 |
| 7 | Clearing the Security log | 1102 |

## Files

- `index.html` - the full write-up (Proxmox-style view with an easy-read option)
- `security-hunt.ps1` - pulls the lab's alert events from the Security, Defender and PowerShell logs into one sorted CSV timeline (code generated with AI; run, tested, and documented by me)
- `*.jpg` - screenshots used in the write-up

## Tools

Proxmox VE, Hyper-V, Active Directory, Group Policy, Event Viewer, Microsoft Defender, PowerShell

## Other labs

1. [Windows Server 2022 Active Directory](https://emilagui01.github.io/ad-homelab/)
2. [Help Desk Ticketing System](https://emilagui01.github.io/helpdesk-lab/)
3. [PowerShell Automation](https://emilagui01.github.io/powershell-automation-lab/)
