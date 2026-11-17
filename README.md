# ZNETBOOT

ZNETBOOT makes it easy to bring up Linux on z/VM.
Just enter the command `znetboot` from the CMS "Ready;" prompt.

ZNETBOOT is designed to simplify things for those hosting Linux on z/VM
who are unfamiliar with z/VM.

ZNETBOOT is intended to reduce the number of manual steps required
to boot Linux on a VM/CMS system. It should make things much easier
for non-VM and non-mainframe users. After more than two decades of
Linux on z/VM, mainframe Linux should be *at least* this easy.

## Running ZNETBOOT

ZNETBOOT reads an installation file and retrieves the kernel
and initrd indicated. Other statements in the installation file
are passed to the kernel as boot parameters. For example, create and
upload to CMS a file like ...

    # the following are used by ZNETBOOT EXEC
    ZNETBOOT_KERNEL=http://znetboot.casita.net/nord/image
    ZNETBOOT_INITRD=http://znetboot.casita.net/nord/ramdisk.gz

    # the following are used by the bootstrap and vary from Linux to Linux
    HOSTNAME=mynord.mydomain.com
    IPADDR=192.168.0.64
    GATEWAY=192.168.0.1

Then enter `znetboot` from the CMS "Ready;" prompt. Next stop, Linux.

## Working ZNETBOOT Distributions

Installers for the following Linux distributions are known to work with ZNETBOOT:

* ClefOS
* Alpine
* Debian
* Fedora
* Ubuntu
* OpenSUSE
* NORD

Support for the following Linux distributions are wanted:

* CentOS
* Slack/390
* Gentoo
* Red Hat

## z/VM Community Tools

This project is duplicated as a sub-folder of the z/VM Community Tools
repository.

https://github.com/openmainframeproject/zvm-community-tools/tree/main/znetboot/


