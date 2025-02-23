# A Short-term Fix to Stop SSD from going to sleep

Have you gotten this error after observing `tail -n 100 -f /var/log/syslog` while you get problems on linux?

```
[  603.860958] nvme nvme0: controller is down; will reset: CSTS=0xffffffff, PCI_STATUS=0xffff
[  603.860967] nvme nvme0: Does your device have a faulty power saving mode enabled?
[  603.860969] nvme nvme0: Try "nvme_core.default_ps_max_latency_us=0 pcie_aspm=off" and report a bug
[  603.956325] nvme nvme0: Removing after probe failure status: -19
```

## The good but insufficient fixes

I did get to reduce the incidence of that problem by adding the following to my /etc/defaut/grub

```
GRUB_CMDLINE_LINUX_DEFAULT="amdgpu.dcdebugmask=0x10 fsck.mode=force nvme_core.default_ps_max_latency_us=0 pcie_aspm=off pci_port_pm=off iommu=soft amd_iommu=off"
```

I also switched the power mode to "performance".

## The additional short-term fix 

Despite the above, I do still get that problem occassionally. The code in this repository touches a file every 2 seconds, and syncs it to disk. Hopefully this will stop my SSD from going into sleep. 

To use it,

```
git clone https://github.com/NunoSempere/ssd-sleep-fix.git
cd ssd-sleep-fix
vim ssd-activity.service # change /home/nuno/.../ssd-sleep-fix/update-file.sh to the corresponding location in your filesystem.
sudo make install
sudo make start
# make watch
```

## Longer-term fix

- Update Samsung firmware with a Windows machine
- Wait for newer Linux kernels to arrive. E.g., there will be an Ubuntu 25.04 2025 release on April 17th which will use the Linux 6.14 kernel. 
- Try a different SSD, maybe from a different brand. SSDs only cost ~$100 these days, though the cost is also in the time to install programs and move files to a new drive.
