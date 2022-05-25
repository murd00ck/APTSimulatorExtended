# APT Simulator Extended

I forked the original project to add some test-sets.

![Immagine1](https://user-images.githubusercontent.com/10051854/170267027-9d71b898-9c24-45b0-98bc-84bfe9b16aa1.gif)

Important: Don't just ZIP download or clone the repo if you don't plan to develop some test. Use the package in the [release](https://github.com/Neo23x0/APTSimulator/releases) which contains a packaged version with encrypted archives that don't contain cleartext samples and tools.

APT Simulator is a Windows Batch script that uses a set of tools and output files to make a system look as if it was compromised. In contrast to other adversary simulation tools, APT Simulator is designed to make the application as simple as possible. You don't need to run a web server, database or any agents on set of virtual machines. Just download the prepared archive, extract and run the contained Batch file as Administrator. Running APT Simulator takes less than a minute of your time.



## Use Cases

1. POCs: Endpoint detection agents / compromise assessment tools
2. Test your security monitoring's detection capabilities
3. Test your SOCs response on a threat that isn't EICAR or a port scan
4. Prepare an environment for digital forensics classes

## Motives

Customers tested [our scanners](https://www.nextron-systems.com/compare-our-scanners/) in a POC and sent us a complaint that our scanners didn't report on programs that they had installed on their test systems. They had installed an Nmap, dropped a PsExec.exe in the Downloads folder and placed on EICAR test virus on the user's Desktop. That was the moment when I decided to build a tool that simulates a real threat in a more appropriate way.

## Why Batch?

- Because it's simple: Everyone can read, modify or extend it
- It runs on every Windows system without any prerequisites
- It is closest to a real attacker working on the command line

## Focus

The focus of this tool is to simulate adversary activity, not malware. See the [Advanced Solutions](#advanced-solutions) section for advanced tools to simulate adversary and malware activity.

![APT vs Malware](/screenshots/MalwareAPT.png)

## Getting Started

1. Download the latest release from the "release" section
2. Extract the package on a demo system (Password: apt)
3. Start a cmd.exe as Administrator
4. Navigate to the extracted program folder and run APTSimulator.bat

## Avoiding Early Detection

The batch script extracts the tools and shells from an encrypted 7z archive at runtime. Do not download the master repo using the "download as ZIP" button. Instead use the official release from the [release](https://github.com/Neo23x0/APTSimulator/releases) section.

## AV Excluder

APT Simulator contains a module named "AVExcluder" that tries to register the used `%APTDIR%` as AV exclusion in typical AV solutions. As I do not have access to all of the AV software products in the market, please report errors or add new exclusions as pull requests.

## Extending the Test Cases

Since version 0.4 it is pretty easy to extend the test sets by adding a single `.bat` file to one of the test-set category folders.

E.g. If you want to write a simple test case for "privilege escalation", that uses a tool named "privesc.exe", clone the repo and do the following:

1. Add your tool to the `toolset` folder
2. Write a new batch script `privesc-1.bat` and add it to the `./test-sets/privilege-escalation` folder
3. Run `build_pack.bat`
4. Add your test case to the table and test sets section in the README.md
5. Create a pull request

### Tool and File Extraction

If your script includes a tool, web shell, auxiliary or output file, place them in the folders `./toolset` or `./workfiles`. Running the build script `build_pack.bat` will include them in the encrypted archives `enc-toolset.7z` and `enc-files.7z`.

#### Extract a Tool

```batch
"%ZIP%" e -p%PASS% %TOOLARCH% -aoa -o%APTDIR% toolset\tool.exe > NUL
```

#### Extract a File

```batch
"%ZIP%" e -p%PASS% %FILEARCH% -aoa -o%APTDIR% workfile\tool-output.txt > NUL
```

## Detection

The following table shows the different test cases and the expected detection results.

- AV = Antivirus
- NIDS = Network Intrusion Detection System
- EDR = Endpoint Detection and Response
- SM = Security Monitoring
- CA = Compromise Assessment

| Test Case                             | AV  | NIDS | EDR | SM  | CA  |
|---------------------------------------|-----|------|-----|-----|-----|
| Collect Local Files                   |     |      |     |     | X   |
| C2 Connects                           | (X) | X    | X   | X   |     |
| DNS Cache 1 (Cache Injection)         | (X) | X    |     | X   | X   |
| Malicious User Agents (Malware, RATs) |     | X    | X   | X   |     |
| Ncat Back Connect (Drop & Exec)       | X   |      | X   | X   | X   |
| WMI Backdoor C2                       |     |      | X   | X   | X   |
| LSASS Dump (with Procdump)            |     |      | X   | X   | X   |
| Mimikatz 1 (Drop & Exec)              | X   |      | X   | X   | X   |
| WCE 1 (Eventlog entries)              |     |      | X   | X   | X   |
| Active Guest Account Admin            |     |      | X   | X   | X   |
| Fake System File (Drop & Exec)        |     |      | X   | X   | X   |
| Hosts File (AV/Win Update blocks)     | (X) |      | X   |     | X   |
| Obfuscated JS Dropper                 | (X) | X    | X   | X   | X   |
| Obfuscation (RAR with JPG ext)        |     |      |     |     | (X) |
| Nbtscan Discovery (Scan & Output)     |     | X    | X   | (X) | X   |
| Recon Activity (Typical Commands)     |     |      | X   | X   | X   |
| PsExec (Drop & Exec)                  |     |      | X   | X   | X   |
| Remote Execution Tool (Drop)          | (X) |      |     |     | X   |
| At Job                                |     |      | X   | X   | X   |
| RUN Key Entry Creation                |     |      | X   | X   | X   |
| Scheduled Task Creation               |     |      | X   | X   | X   |
| StickyKey Backdoor                    |     |      | X   |     | X   |
| UserInitMprLogonScript Persistence    |     |      | (X) | X   | X   |
| Web Shells                            | X   |      | (X) |     | X   |
| WMI Backdoor                          |     |      | X   |     | X   |

## Cobalt Strike Beacon Activity

You should now be able to find events in your security monitoring solution (SIEM, EDR etc.) for the following keywords:

### Named Pipes

- `MSSE-1337-server`
- `msagent_fedac123`
- `postex_ssh_fedac123`
- `334485` (used in Get System activity)

Note: No Named Pipe Monitoring? You can use Sysmon + this [config](https://github.com/SwiftOnSecurity/sysmon-config/pull/151/files) and [this](https://github.com/SigmaHQ/sigma/blob/master/rules/windows/pipe_created/sysmon_mal_cobaltstrike.yml) Sigma rule to get you started.

### Get System Activity

- `b6a1458f396` (multiple events: new service registration and process creation)

Note: No events? you can use [this](https://github.com/SigmaHQ/sigma/blob/master/rules/windows/builtin/system/win_meterpreter_or_cobaltstrike_getsystem_service_installation.yml) Sigma rule to get you started.

### C2 Beaconing

- `http://10.0.2.15/pixel.gif`
- `https://operaa.net:443/jquery-3.2.2.min.js`
- `https://23.108.57.148:443/jquery-3.2.2.full.js`

## Test Sets

### Collection

#### Collect Local Files

- drops pwdump output to the working dir
- drops directory listing to the working dir

### Command and Control

#### C2 Connects

- Uses Curl to access well-known C2 servers

#### DNS Cache 1

- Looks up several well-known C2 addresses to cause DNS requests and get the addresses into the local DNS cache

#### Malicious User Agents

- Uses malicious user agents to access web sites

#### Ncat Back Connect

- Drops a PowerShell Ncat alternative to the working directory and runs it to back connect to a well-known attacker domain

#### WMI Backdoor C2

- Using Matt Graeber's WMIBackdoor to contact a C2 in certain intervals

### Credential Access

#### LSASS DUMP

- Dumps LSASS process memory to a suspicious folder

#### Mimikatz-1

- Dumps mimikatz output to working directory (fallback if other executions fail)
- Run special version of mimikatz and dump output to working directory
- Run Invoke-Mimikatz in memory (github download, reflection)

#### WCE-1

- Creates Windows Eventlog entries that look as if WCE had been executed

### Defense Evasion

#### Active Guest Account Admin

- Activates Guest user
- Adds Guest user to the local administrators

#### Fake System File

- Drops suspicious executable with system file name (svchost.exe) in %PUBLIC% folder
- Runs that suspicious program in %PUBLIC% folder

#### Hosts

- Adds entries to the local hosts file (update blocker, entries caused by malware)

#### JS Dropper

- Runs obfuscated JavaScript code with wscript.exe and starts decoded bind shell on port 1234/tcp

#### Obfuscation

- Drops a cloaked RAR file with JPG extension

### Discovery

#### Nbtscan Discovery

- Scanning 3 private IP address class-C subnets and dumping the output to the working directory

#### Recon

- Executes command used by attackers to get information about a target system

### Execution

#### PsExec

- Dump a renamed version of PsExec to the working directory
- Run PsExec to start a command line in LOCAL_SYSTEM context

#### Remote Execution Tool

- Drops a remote execution tool to the working directory

### Lateral Movement

No test cases yet

### Persistence

#### At Job

- Creates an at job that runs mimikatz and dumps credentials to file

#### RUN Key

- Create a suspicious new RUN key entry that dumps "net user" output to a file

#### Scheduled Task

- Creates a scheduled task that runs mimikatz and dumps the output to a file

#### Scheduled Task XML

- Creates a scheduled task via XML file using Invoke-SchtasksBackdoor.ps1

#### Sticky Key Backdoor

- Tries to replace sethc.exe with cmd.exe (a backup file is created)
- Tries to register cmd.exe as debugger for sethc.exe

#### Web Shells

- Creates a standard web root directory
- Drops standard web shells to that directory
- Drops GIF obfuscated web shell to that directory

#### UserInitMprLogonScript Persistence

- Using the UserInitMprLogonScript key to get persistence

#### WMI Backdoor

- Using Matt Graeber's [WMIBackdoor](https://github.com/mattifestation/WMI_Backdoor/) to kill local procexp64.exe when it starts

## Batch Mode

Since version 0.8.0 APTSimulator features a batch mode provided by @juju4 that allows to run it in in a scripted way e.g. via [Ansible](https://github.com/juju4/ansible-win-aptsimulator)

```batch
APTSimulator.bat -b
```

## WARNING

This repo contains tools and executables that can harm your system's integrity and stability. Do only use them on non-productive test or demo systems. Create a snapshot before you start. Otherwise you have to remove all the modifications manually, which is a tedious task.

## Screenshots

![Screen](/screenshots/apt-0.png)
![Screen](/screenshots/apt-1.png)
![Screen](/screenshots/apt-2.png)
![Screen](/screenshots/apt-c2.png)

## Advanced Solutions

The CALDERA automated adversary emulation system
[https://github.com/mitre/caldera](https://github.com/mitre/caldera)

Infection Monkey - An automated pentest tool
[https://github.com/guardicore/monkey](https://github.com/guardicore/monkey)

Flightsim - A utility to generate malicious network traffic and evaluate controls
[https://github.com/alphasoc/flightsim](https://github.com/alphasoc/flightsim)

## Integrated Projects / Software

- [Mimikatz](https://github.com/gentilkiwi/mimikatz)
- [PowerSploit](https://github.com/PowerShellMafia/PowerSploit)
- [PowerCat](https://github.com/besimorhino/powercat)
- [PsExec](https://docs.microsoft.com/en-us/sysinternals/downloads/psexec)
- [ProcDump](https://docs.microsoft.com/en-us/sysinternals/downloads/procdump)
- [7Zip](http://www.7-zip.org/download.html)
- [curl](https://curl.haxx.se/)

## Contact

Follow and contact me on Twitter @cyb3rops
