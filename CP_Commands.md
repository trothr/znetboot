# CP Commands

z/VM "Control Program" commands for use with Linux

Linux on z/VM can issue "CP commands" by way of the `vmcp` utility.
The number and nature of all CP commands is far beyond scope
of this document, so only the most relevant for Linux are listed.

Some CP commands are distruptive, rebooting your virtual machine
or placing it into a state needing manual attention. Some CP commands
are harmless. Query commands are generally all save.

CP commands can be abbreviated.
The hypervisor will recognize the shortest unique value
of any command and its arguments.

Some common CP commands of use with Linux follow. 

# define storage

Use the `define storage` command to change the size of
your virtual machines memory (internal storage, RAM).

    vmcp def stor 1G

This command may reset your virtual machine so should be issued
when you have access to the virtual console or should be stacked with
an IPL command.

# query virtual storage

Use the `q v stor` command to show the memory presently defined for
your virtual machine.

    vmcp q v stor

# query virtual all

Use the `q v all` command to show all devices associated with
your virtual machine. The devices themselves may be virtual or real.

    vmcp q v all

# ipl

Use the `ipl` command (Initial Program Load) to boot your virtual machine. 

    vmcp ipl 1b0 clear

This command WILL reset your virtual machine so should be issued
when you have access to the virtual console if there is any likelihood
that it will fail to work as expected. 

In this example `1B0` is the address of a bootable disk
and `clear` means to also reset memory before performing the load.

On z/VM one can boot from a "named saved system" (NSS).
This is akin to the direct kernel load function of other hypervisors.
An example is:

    vmcp ipl linux

In this example, if there is no NSS named LINUX, then the command
results in an error and your virtual machine continues to run whatever
kernel it was running when the command was issued.


