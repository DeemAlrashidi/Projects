# 🔐 IT Infrastructure Management Project - Cyber Security Network

This project involves designing, configuring, and verifying a secure and efficient network infrastructure for a **Cyber Security Company** using **Cisco Packet Tracer**. It integrates **OSPF** and **RIP** routing protocols, VLAN configurations, and multiple servers to ensure secure communication and scalable performance.

## 📜 Project Overview

### 📝 Key Features:
- **Routing Protocols**:
  - **OSPF**: Link-state routing between core routers.
  - **RIP**: Distance-vector routing for edge connectivity.
- **VLAN Implementation**:
  - Segregates departmental traffic for enhanced security.
  - Departments: Sales, Finance, Marketing, HR.
- **Server Integration**:
  - DNS, Web, and DHCP servers deployed for network services.
- **Wireless LAN Controller (WLC)**:
  - Manages access points for wireless connectivity.
- **Cloud Migration**:
  - Integration with **VMware Cloud Services** for cost-effective and scalable operations.

## 🎯 Objectives
- Design and configure a network topology with multiple departments.
- Implement secure VLAN-based traffic segregation.
- Ensure inter-department connectivity and internet access.
- Migrate physical infrastructure to **VMware Cloud** for virtualized operations.

## 📍 Network Topology

![Network Topology](path_to_image/network_topology.png)

### 💻 Department VLANs:
| Department  | VLAN ID | Subnet         | Gateway       |
|-------------|---------|----------------|---------------|
| Servers     | 10      | 10.10.10.0/24 | 10.10.10.254  |
| Marketing   | 20      | 10.10.20.0/24 | 10.10.20.254  |
| Sales       | 30      | 10.10.30.0/24 | 10.10.30.254  |
| Finance     | 40      | 10.10.40.0/24 | 10.10.40.254  |
| HR          | 50      | 10.10.50.0/24 | 10.10.50.254  |

## ⚙️ Server Configuration
| Server Role | IP Address      | Gateway       |
|-------------|-----------------|---------------|
| **DNS**     | 10.10.10.1/24  | 10.10.10.254  |
| **Web**     | 10.10.10.2/24  | 10.10.10.254  |
| **DHCP**    | 10.10.10.3/24  | 10.10.10.254  |

## 🚀 Cloud Integration
- Migrated to **VMware Cloud Services** for enhanced agility and cost-effectiveness.
- **Cloud Services Used**:
  - VMware Cloud on AWS.
  - vRealize Network Insight Cloud.
  - Virtualized servers for network resource optimization.

## 📑 Device Configuration Files
- `R1_Config.txt`: OSPF & RIP routing configuration.
- `R2_Config.txt`: RIP configuration and VLAN setup.
- `R3_Config.txt`: OSPF configuration and VLAN setup.

## 🔍 End-to-End Connectivity Tests
Successfully tested connectivity between departments and to the ISP, verifying the network design.

## 📜 References
1. VMware Cloud Provider Documentation.
2. Cisco Packet Tracer Official Guide.
3. [Cybersecurity Ltd Website](https://cybersecurity.com)

---

## 💡 How to Run the Project
1. Open the **Network Simulation File** in **Cisco Packet Tracer**.
2. Start the simulation and test connectivity using ping commands.
3. Access the web server via [cybersecurity.com](https://cybersecurity.com).
4. Explore cloud migration details in the `VMware_Cloud_Details.docx`.
