# Vagrant RHCE Lab

This repository provides a pre-configured Vagrant environment designed to support individuals preparing for the Red Hat Certified Engineer (RHCE) certification. The setup aims to replicate real-world scenarios and simplify lab creation, allowing you to focus on honing your skills.

---

## Prerequisites

Before using this repository, ensure the following software is installed on your local machine:

1. **Vagrant**: Vagrant is required to manage and configure the virtualized environments used in this lab. You can download and install Vagrant from [Vagrant's official website](https://www.vagrantup.com/). Refer to the installation guide for your operating system.

2. **Virtualization Provider**: Vagrant requires a provider to create and manage virtual machines. Supported providers include:
   - VirtualBox (recommended)
   - VMware
   - libvirt (for Linux users)
   - Hyper-V (for Windows users)

3. **Git**: Ensure Git is installed for cloning this repository and managing version control. Download Git from [git-scm.com](https://git-scm.com/).

4. **A stable network connection**: Some setup scripts may download additional dependencies during provisioning.

---

## How to Use This Repository

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/eklizia/vagrant-rhce-lab.git
   cd vagrant-rhce-lab
   ```

2. **Start the Vagrant Environment**:
   ```bash
   vagrant up
   ```
   This command will:
   - Initialize and provision virtual machines defined in the `Vagrantfile`.
   - Configure the network and system settings automatically.

3. **Access Virtual Machines**:
   ```bash
   vagrant ssh <vm-name>
   ```
   Replace `<vm-name>` with the name of the virtual machine as defined in the `Vagrantfile`.

4. **Stop the Environment**:
   When done, stop and clean up the environment using:
   ```bash
   vagrant halt
   ```

---

## Customization

The provided `Vagrantfile` is designed to be flexible. You can modify the following sections to suit your needs:

- **Network Configuration**:
  Adjust IP addresses and subnets to fit your local network environment.

- **VM Specifications**:
  Update CPU, memory, or disk space allocations to match your system's capabilities.

- **Provisioning Scripts**:
  Add or modify scripts to customize the setup process for your specific use case.

---

## Known Issues

- **Provider-Specific Issues**: Ensure your chosen virtualization provider is properly installed and configured.
- **Firewall or Network Restrictions**: If VMs cannot communicate, check your host machine’s firewall settings.

---

## Contributions

Contributions are welcome! If you have ideas or improvements, please:

1. Fork this repository.
2. Create a feature branch:
   ```bash
   git checkout -b feature-branch-name
   ```
3. Commit your changes and push to your fork.
4. Submit a pull request for review.

---

## Support

If you encounter any issues or have questions, feel free to open an issue in this repository. We’ll do our best to assist you.

---

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

## Acknowledgments

This project is inspired by the need for a convenient and flexible RHCE lab environment. Special thanks to the open-source community for tools like Vagrant and VirtualBox, which make this setup possible.


