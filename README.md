# Oremax Innovations: DevOps Engineering Lab
### Targeted Role: Junior DevOps / System Administrator

This repository serves as a technical log of my transition into DevOps Engineering. It documents the deployment, security hardening, and automation of a Linux-based infrastructure.

## 🛠 Tech Stack
* **OS:** Ubuntu 26.04 LTS (Headless)
* **Web Server:** Nginx
* **Security:** UFW, SSH Hardening
* **Version Control:** Git / GitHub
* **Automation:** Bash Scripting & Cron

---

## 📈 Milestone Log

### Day 1: Environment & Terminal Mastery
* **Objective:** Provision a stable Linux environment and master CLI navigation.
* **Key Tasks:** * Configured VirtualBox with Ubuntu 26.04.
  * Mastered absolute/relative paths and file permissions (`chmod`, `chown`).
  * Implemented log monitoring using `tail -f` and `grep` for real-time troubleshooting.

### Day 2: Configuration & Networking
* **Objective:** Deploy web services and establish secure remote access.
* **Key Tasks:**
  * Deployed a production-ready **Nginx** web server.
  * Established a **Secure Shell (SSH)** tunnel from a Windows host.
  * Implemented a **UFW Firewall** policy (Allowing only Ports 80, 443, and 2222).
  * Resolved DNS resolution conflicts by modifying `systemd-resolved` configurations.

### Day 3: Automation & Persistence
* **Objective:** Remove manual toil through scripting and task scheduling.
* **Key Tasks:**
  * Developed a **Bash Script** (`backup.sh`) to automate compressed archives of web directories.
  * Scheduled recurring maintenance using **Crontab**.
  * Implemented **tmux** for session persistence during remote administration.

---

## 📂 Project Structure
* `/scripts`: Automation utilities and maintenance scripts.
* `/configs`: Hardened configuration files for Nginx and SSH.
* `/documentation`: Technical write-ups and architectural diagrams.

## 🌐 Day 4: Multi-Tenant Web Hosting & DNS Resolution

### **The Essence**
Modern DevOps involves hosting multiple services on shared infrastructure. The goal of this module was to implement **Nginx Server Blocks** to isolate traffic and manage local DNS resolution to bridge the Host-Guest network gap.

### **Key Technical Tasks**
* **Virtual Host Configuration:** Provisioned a new web root at `/var/www/oremax_lab/html` and architected an Nginx server block for `oremax.lab`.
* **Layer 7 Name Resolution:** Manually modified the Windows `hosts` file to map the Ubuntu VM's internal IP to the `oremax.lab` domain, simulating a production DNS environment.
* **Traffic Telemetry:** Utilized `tail -f /var/log/nginx/access.log` to monitor real-time HTTP request/response cycles (Status 200/404/500).

### **Troubleshooting Log**
* **Issue:** `oremax.lab` failed to resolve in the browser.
* **Root Cause:** Incorrect mapping to the loopback address (127.0.0.1) in the Windows host file.
* **Resolution:** Updated mapping to the actual VM Bridge IP identified via `ip addr`.

## 🗄️ Day 5: Data Persistence & RDBMS Hardening

### **The Essence**
A server is the "brain," but the database is the "memory." This module focused on the **Data Tier**, ensuring that application information is stored securely and is decoupled from the web server logic.

### **Key Technical Tasks**
* **Instance Hardening:** Executed `mysql_secure_installation` to eliminate default security backdoors (anonymous users and test databases).
* **Principle of Least Privilege:** Created a dedicated service user (`oremax_admin`) restricted exclusively to the `oremax_db` schema, preventing lateral movement in the event of a web-tier breach.
* **CRUD Operations:** Designed a relational table structure (`projects`) and validated data integrity through SQL insertions and queries.

### **Technical Verification**
* Verified service persistence using `systemctl enable mysql` to ensure database availability upon system reboot.
* Confirmed user-level isolation by verifying that `oremax_admin` cannot access system-level schemas.

## 🚀 Day 6: Dynamic Application Runtimes & FastCGI Gateway

### **The Essence**
Web servers natively distribute flat, static assets. To facilitate business logic and database interactions for **Oremax Innovations**, the architecture must decouple traffic handling from execution environments using a high-performance process manager.

### **Key Technical Tasks**
* **Runtime Orchestration:** Provisioned and configured PHP-FPM on upstream Ubuntu 26.04 infrastructure.
* **FastCGI Proxying:** Integrated Nginx location routing regex (`~ \.php$`) to capture application scripts and proxy them via Unix Domain Sockets.
* **MIME/Execution Triage:** Diagnosed and corrected an uncompiled script delivery issue (browser download trap) by synchronizing Nginx backend handlers with the active PHP-FPM socket layer.

### **Technical Verification**
* Confirmed End-to-End processing: Browser requests dynamically invoke backend calculations, rendering real-time server timestamps on every page initialization.

## 💾 Day 7: Database Consolidation & Dynamic Object Access (PDO)

### **The Essence**
An isolated application tier lacks utility without access to persistent enterprise records. This module centered on constructing a secure data access channel using PHP Data Objects (PDO) to query a relational backend securely.

### **Key Technical Tasks**
* **Schema Definition:** Architected a relational `services` schema inside the `oremax_db` database environment to support structured data entries.
* **Data Layer Connection:** Established an abstraction layer connection string utilizing a native database driver protocol to communicate securely under the restricted `oremax_admin` role.
* **Dynamic Iteration:** Implemented server-side logic loops to extract unparsed query tables and format them dynamically into readable elements for the Presentation Tier.

### **Technical Verification**
* Verified that updating database rows inside MySQL instantly alters the front-facing layout without requiring direct modifications to the web presentation files.

---

## 🤖 Day 8: Automation Engine Provisioning & Inventory Architecture

### **The Essence**
Manual system configuration (imperative administration) introduces human error and configuration drift across environments. This module initiated the transition to Infrastructure as Code (IaC) by establishing an isolated configuration management control tier using Ansible to govern host states.

### **Key Technical Tasks**
* **Engine Provisioning:** Depended on upstream APT package repositories to install and verify the Ansible runtime core natively on Ubuntu 26.04 infrastructure.
* **Control Mapping:** Architected an environment inventory topology mapping (`inventory.ini`) utilizing the `ansible_connection=local` transport plugin to safely isolate management tasks to the native loopback address.
* **Ad-Hoc Control Validation:** Executed low-level framework assertions via the `ping` system module to confirm execution stream readiness and Python runtime compatibility.

### **Technical Verification**
* Verified connection integrity: Received successful JSON status responses matching the exact system parameters:
  ```json
  localhost | SUCCESS => {
      "changed": false,
      "ping": "pong"
  }
---

## 📄 Day 9: Idempotent Blueprinting & Privilege Escalation Triage
### **The Essence**
Automated configuration blueprints must execute predictably without manual interaction or unexpected permission blocks. This module focused on translating administrative tasks into structured, declarative templates using YAML syntax while resolving root security gates.

### **Key Technical Tasks**
* **Declarative Tasks:** Engineered a structured play (`site.yml`) utilizing strict indentation maps to handle state validation for core administrative logging zones.
* **Privilege Pipeline Sorting:** Diagnosed and corrected a non-interactive authentication failure (Premature end of stream waiting for become success) caused by interactive sudo prompts blocking background engine buffers.
* **Execution Wrapping:** Restructured execution strategies to utilize standard privilege delivery paths (`sudo ansible-playbook`), passing administrative authorization directly through the host kernel.

### **Technical Verification**
* Verified state synchronization: Confirmed automated provisioning of system directories (`/var/log/oremax_audit`) and tracked files with custom read/write mode bits (`0755/0644`).

## 🤖 Day 10: Declarative Configuration Management (Ansible)

### **The Essence**
Manual configurations do not scale and introduce systemic configuration drift. This milestone focused on shifting from imperative administration to idempotent infrastructure automation utilizing the Ansible framework.

### **Key Technical Tasks**
* **Control Mapping:** Provisioned Ansible on Ubuntu 26.04 and drew an explicit local host environment inventory tree map.
* **Privilege Pipeline Sorting:** Triaged and resolved a non-interactive privilege escalation bottleneck (`become` timeout) by wrapping the executor stream inside system root run states.
* **Declarative Blueprinting:** Wrote and deployed a multi-stage YAML infrastructure playbook managing system apt caches, systemd unit definitions, and configuration template delivery.

### **Technical Verification**
* Verified system idempotence: Secondary playbook runs return a clean `changed=0` state payload.
* Confirmed delivery of automated system health templates directly onto client-facing ports.

## 🎭 Day 11: Dynamic Variable Injection & Jinja2 Template Compilation

### **The Essence**
Hardcoded parameters introduce configuration rigidness and eliminate system portability. This milestone decoupled operational data from core logic by implementing structural variables and dynamic Jinja2 templating, transforming static runbooks into adaptable orchestration engines.

### **Key Technical Tasks**
* **Time Drift Mitigation:** Diagnosed and corrected an asymmetric VM guest clock synchronization lag that blocked cryptographic repository validation (`Release file is not valid yet`).
* **Decoupled Architecture:** Engineered an abstract HTML template (`.html.j2`) utilizing double-curly brace namespaces to isolate system identities from text strings.
* **Namespace Standardization:** Refactored template variables from legacy global shorthands to the modern, future-proof structured dictionary format (`ansible_facts['hostname']`) to eliminate deprecation noise.

### **Technical Verification**
* Verified compilation loop output: Executed the template assembly module successfully, dynamically rendering the local kernel facts cleanly on `http://localhost`.

## 🌐 Day 12: Automated Multi-Tenant Provisioning (Nginx Server Blocks)

### **The Essence**
Enterprise scalability requires automated environment isolation to eliminate manual virtual host misconfigurations. This module abstracted server block deployments into a highly reusable Jinja2 network template, implementing event-driven handlers to maintain zero-downtime operations.

### **Key Technical Tasks**
* **Vhost Abstraction:** Created a variable-driven Nginx configuration layout (`nginx_vhost.conf.j2`) utilizing Jinja2 default filters (`| default(80)`) to parameterize entry points, server scopes, and directory structures.
* **State Enforcement Loops:** Expanded the orchestration play to automatically provision system web roots, handle ownership attributes (`www-data`), drop compiled page templates, and establish symbolic run links inside secure configuration spaces (`/etc/nginx/sites-enabled/`).
* **Event-Driven Handlers:** Implemented a systemd monitoring handler (`notify: Reload Nginx Engine`) to intercept structural changes and reload the runtime daemon only when updates occur, protecting production uptime.

### **Technical Verification**
* **Handler Assertions:** Verified execution trails cleanly showing target state overrides triggering specific handlers:
  ```text
  RUNNING HANDLER [Reload Nginx Engine] ***************************
  changed: [localhost]


## 🔁 Day 13: Array Matrix Orchestration & Dynamic Processing Loops

### **The Essence**
Writing separate tasks for identical infrastructure entities creates messy code duplication and maintenance debt. This module integrated list arrays and iterative loops (`loop`), allowing a single declarative task pipeline to dynamically scale, provision, and map a multi-tenant environment matrix automatically.

### **Key Technical Tasks**
* **Array Matrix Definition:** Restructured the playbook parameter space to hold an explicit domain array string containing distinct deployment profiles (`labs`, `api`, and `dev`).
* **Iterative Asset Generation:** Refactored web root tasks and site-compilation blocks to cycle dynamically via the standard loop evaluation register (`{{ item }}`), creating distinct secure files concurrently.
* **Orchestration Verification:** Validated conditional handler updates across the entire processing ring, maintaining configuration state updates cleanly across separate storage lanes.

### **Technical Verification**
* Verified deployment loops: Confirmed execution sequences output independent, trackable step validations for all nested collection parameters:
  ```text
  CHANGED: [localhost] => (item=labs.oremax.local)
  CHANGED: [localhost] => (item=api.oremax.local)
  CHANGED: [localhost] => (item=dev.oremax.local)


## 🗄️ Day 14: Dual-Tier Orchestration & Database Security Hardening

### **The Essence**
Production infrastructure demands secure, isolated database layers that bypass default out-of-the-box system vulnerabilities. This module scaled our automation footprint into a full dual-tier web and database stack, mitigating stateful authentication plugin regressions to provision a locked-down, specialized MySQL relational backend.

### **Key Technical Tasks**
* **State Verification & Credential Injection:** Configured an automated global authentication file (`/root/.my.cnf`) restricted to strict owner-read privileges (`chmod 600`) to let the orchestration engine securely check database state conditions without hitting plain-text parameter gates.
* **Database Hardening:** Implemented strict sanitation policies by removing all anonymous database user privileges and completely purging the default insecure public `test` database.
* **Authentication Regressions Mitigation:** Bypassed legacy module assumptions regarding deprecated native password formats (`mysql_native_password`) by wrapping user and privilege queries inside an abstract execution command using modern SHA-2 based (`caching_sha2_password`) database mechanisms.

### **Technical Verification**
* **Full-Stack Recaps:** Confirmed completely successful playbook execution trials with zero structural exceptions:
  ```text
  TASK [Create dedicated application user and grant full DB access privileges natively] ***
  changed: [localhost]
  
  PLAY RECAP *******************************************************************************
  localhost                  : ok=13   changed=1    failed=0


## 🗺️ Day 15: Full-Stack Infrastructure Mapping & Core Capstone Validation

### **The Essence**
An automated system is only as reliable as its visibility. This module serves as the architectural validation capstone for the Configuration Management sprint, formalizing our multi-tenant front-end tier and isolated relational database storage layout into a cohesive, production-ready system blueprint.

### **Sprint Achievements Architecture Summary**
* **Front-End Layer:** Variable-driven processing loop dynamically managing multiple runtime environments (`labs`, `api`, `dev`).
* **Web Server Layer:** Event-driven state enforcement using Nginx configuration templates and systemd configuration handlers.
* **Data Tier Layer:** Hardened MySQL server instances running secure local authentication layers (`.my.cnf`) and isolated user access environments.

### **Technical Verification**
* Verified complete execution path integration by successfully testing web routing matrices alongside localized credential access validations.
---
## 🚀 Infrastructure Pipeline Engine: Sprint Documentation (Days 16–26)

This section documents the configuration, architecture, and real-world troubleshooting cycles encountered while implementing a secure, hybrid CI/CD system using **GitHub Actions** and a local **Self-Hosted Runner Node**.

### **🏗️ Architecture Design & Flow**
The control plane lives in the cloud via GitHub, while the execution plane runs natively within an isolated, on-premise virtual machine. This allows the pipeline to interact directly with internal infrastructure, local configuration management playbooks, and development environments without exposing internal endpoints to the public internet.

```Plaintext
[ Developer Push ] ──> [ GitHub Repository (Control Plane) ]
                                    │
                                    │ (Secure Long-Poll Web Hook)
                                    ▼
                     [ Self-Hosted Runner (On-Prem VM) ]
                                    │
        ┌───────────────────────────┴───────────────────────────┐
        ▼                                                       ▼
Stage 1: Syntax & Code Quality                         Stage 2: Infrastructure Deploy
├── Git Repository Checkout                             ├── Strict Dependency Validation
├── Toolchain Check (`yamllint`/`ansible-lint`)          ├── Environment Validation (`ansible --version`)
└── Block on Formatting Rules                           └── Native Automation Execution Pass

```

## 📅 Daily Engineering Log
## 📂 Days 16–22: Runner Provisioning & Core Setup
* **Objective:** Establish a dedicated local background execution runtime environment capable of parsing tasks directly from the GitHub Actions orchestrator.

* **Implementation:**

  * Provisioned an isolated Ubuntu Linux guest node inside VirtualBox.

  * Downloaded, unpackaged, and configured the native GitHub Actions runner application suite binaries inside `~/oremax-capstones/week4/actions-runner`.

  * Generated secure short-lived registration tokens via repository administration settings to perform cryptographic handshakes, registering the local daemon under the custom target tag `self-hosted`.

## 🧪 Day 23: Establishing the Execution Daemon
* **Objective:** Bring the runner online to listen for live platform jobs.

* **Implementation:** * Configured permissions and spun up the runner event listener engine (`./run.sh`).

  * Verified real-time heartbeats, confirming the agent status shifted to an active `Idle / Online` state within the GitHub management console.

## 🧹 Day 24: Syntax Gates & Code Quality Validation
* **Objective:** Implement defensive testing gates to prevent broken or invalid configuration playbooks from ever merging into production states.

* **Implementation:**

  * Created the central pipeline orchestrator manifest file at `.github/workflows/verify-pipeline.yml`.

  * Defined the initial verification block `code_quality_lint` targeted to run exclusively on our `self-hosted` architecture pool.

  * Configured automated environmental checks to silently install and run syntax checkers (`yamllint`, `ansible-lint`) over incoming code commits.

## 🔄 Day 25: The Automated Deployment Loop
* **Objective:** Chain validation gates seamlessly into active execution sequences.

* **Implementation:**

  * Appended a secondary tracking pipeline job named `deploy_infrastructure`.

  * Configured a strict structural dependency constraint rule (`needs: code_quality_lint`) guaranteeing that the deployment routine will instantly abort if any formatting or syntax validation bugs are intercepted in Step 1.

  * Mapped native machine steps to capture the localized system environment variables and confirm binary version readiness (`ansible --version`).

## 🏁 Day 26: The Live Integration Run (End-to-End Complete)
* **Objective:** Trigger, debug, and clear the complete automation cycle via a live source code submission.

* **Implementation:**

  * Pushed changes upstream to `main`, validating the end-to-end webhook architecture.

  * Confirmed clean structural parsing with the runner executing both validation checkouts and reporting successful completion markers back to the repository web status graph.

## 🛠️ Real-World Engineering Hurdles & Resolution Log
The true strength of this deployment sprint was overcoming complex, interlocking system-level errors that naturally arise when bridging local environments with cloud platforms.

1. The Clock-Drift Paradox (System Security Blocks)
  * **The Symptom:** Running `apt-get update` during testing loops crashed with an unexpected error message: `E: Release file for .../InRelease is not valid yet (invalid for another 21min 9s)`.
  * **The Root Cause:** The VirtualBox guest system clock had drifted severely into the past relative to real-world network time. Because security certificates on the internet look "ahead" of the VM's timeline, the operating system treated the legitimate packages as invalid and refused to download updates, preventing the installation of critical runner sync utilities.
  * **The Resolution:**
    1. Temporarily decoupled the global system sync lock: `sudo timedatectl set-ntp false`
    2. Forcefully snapped the system clock to absolute current real-world time: `sudo timedatectl set-time "YYYY-MM-DD HH:MM:SS"`
    3. Installed the missing system time daemon package: `sudo apt-get install -y systemd-timesyncd`
    4. Re-enabled automatic continuous internet pool time synchronization: `sudo timedatectl set-ntp true`

2. Massive Payload Buffer Failures (`HTTP 408 Timeout`)
  * **The Symptom:** Pushing configurations upstream aborted with the message: `error: RPC failed; HTTP 408 curl 22 ... fatal: the remote end hung up unexpectedly`.
  * **The Root Cause:** Running standard wild-card git commands (`git add .`) accidentally swept the raw runner execution directories, diagnostic log outputs, and heavy system binaries (`.tar.gz` and application compiled `.dll` files) into the staging index. This resulted in a massive `352 MiB` upload size that timed out over slower HTTPS channels.
  * **The Resolution:** 
    1. Erased the heavy folder tracking memory from Git's internal index cache without touching local disk files: `git rm -r --cached actions-runner/`
    2. Locked down a robust `.gitignore` file to permanently prevent future file tracking leaks: `text actions-runner/ _work/ *.tar.gz *.log` 
    3. Expanded the network allocation size by boosting the maximum local Git HTTP post buffer space: `git config --global http.postBuffer 524288000` (500MB headroom).
3. Personal Access Token (PAT) Scope Limitations
  * **The Symptom:** Upstream pushes were explicitly rejected by GitHub security lines: `[remote rejected] main -> main (refusing to allow a Personal Access Token to create or update workflow without 'workflow' scope)`.

  * **The Root Cause:** Modifying automation logic inside the `.github/workflows/` directory requires heightened administrative permissions. The HTTPS personal access token being used lacked explicit authorization to write actions files.

  * **The Resolution:** Navigated to developer profile security configurations on GitHub, located the token, and checked the specific `workflow` scope checkbox permission to grant full administrative clearance.
4. YAML Structural Hierarchy Misalignments
  * **The Symptom:** GitHub Actions failed to display the workflow visualization graph, logging an error annotation: `Invalid workflow file ... (Line: 27, Col: 1): Unexpected value 'deploy_infrastructure'`.

  * **The Root Cause:** A 2-space indentation slip occurred when appending the Day 25 configuration block. Placing the key flat against Column 1 caused the parser to interpret `deploy_infrastructure` as a root configuration option instead of nesting it cleanly inside the existing global `jobs:` block parent.

  * **The Resolution:** Restructured the document using standard YAML rules, shifting the target blocks exactly 2 spaces inward to align seamlessly with its sibling job block (`code_quality_lint`), clearing parsing obstacles instantly.
---
## 🎯 Verification Matrix

```Plaintext
===================================================================================
                                VERIFICATION MATRIX                                
===================================================================================
| STEP             | ACTION                     | ANTICIPATED OUTPUT   | STATUS   |
|------------------|----------------------------|----------------------|----------|
| Runner Status    | ./run.sh daemon execution  | Listening for Jobs   | PASSED   |
|                  |                            |                      |          |
| Pipeline Trigger | git push origin main       | Webhook fires event  | PASSED   |
|                  |                            |                      |          |
| Stage 1 (CI)     | code_quality_lint job      | Linter validation    | PASSED   |
|                  |                            | completes cleanly    |          |
|                  |                            |                      |          |
| Stage 2 (CD)     | deploy_infrastructure job  | Ansible binary check | PASSED   |
|                  |                            | executes flawlessly  |          |
===================================================================================

```
