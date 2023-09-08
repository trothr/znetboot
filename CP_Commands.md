# CP Commands

This document discusses
z/VM "Control Program" commands for use with Linux.

*NOTE: CP is unique to z/VM. CP commands remain available even when your
virtual machine is running a guest operating system such as Linux.*
No other hypervisor has a command processor, so CP commands are unlike
the interface to KVM or VMware or Parallels or Xen or any other.

Linux on z/VM can issue "CP commands" by way of the `vmcp` utility.
The number and nature of all CP commands is far beyond scope
of this document, so only the most relevant for Linux are listed.

Some CP commands are distruptive, rebooting your virtual machine
or placing it into a state needing manual intervention.
Some CP commands are harmless, such as `query`, which is entirely safe.

CP commands can be abbreviated.
The hypervisor will recognize the shortest unique value
of any command and its arguments.

## CP versus CMS

The z/VM system has two components: CP and CMS. <br/>
CP is the Control Program. It is the hypervisor. It creates and manages
the virtual machines. <br>
CMS is the "Conversational Monitor System", a very efficient command
environment specifically adapted to z/VM.

As of this writing, most people use z/VM more for CP and hosting virtual
machines than for CMS. But CMS comes in handy, so some users should
learn it. There is also some confusion because many newcomers do not
at first recognize the difference between CP commands and CMS commands.

## `vmcp` versus `#cp`

On Linux, from a privileged shell, you can issue CP commands using the
`vmcp` command. From the virtual console of a 3270 session, you can issue
CP commands using the `#cp` prefix. (Virtual console input is otherwise
delivered to the running guest operating system, either CMS or Linux
or any other.) In this document, CP commands are presented both ways.

Keep in mind that the shell treats any word starting with "`#`"
as a comment. If you enter the "`#cp`" form of these commands
from a shell, nothing will happen. (Also see advanced tricks below.)

Some common CP commands of use with Linux follow. 

## query [something]

Of all CP commands, `query` deserves special mention.
But it requires an argument and is meaningless without one.

`query` can be abbreviated `q` and is commonly expressed that way.

    vmcp q [something]
    #cp q [something]

## query virtual all

Use the `q v all` command to show all devices associated with
your virtual machine. The devices themselves may be virtual or real.

    vmcp q v all
    #cp q v all

The output of `q v all` shows all virtual devices of your virtual machine.
Some of those devices will be bootable, including bootable disks
but also tape drives or your virtual card reader.

## query virtual dasd

In the mainframe world, DASD is an acronym for "direct access
storage device". On other systems we'd just say "disk".

To query virtual dasd is to list the virtual disks
presently attached to your virtual machine.

    vmcp q v dasd
    #cp q v dasd

The output of this query lists all disks by virtual I/O address
(hexadecimal) and also the device type for each and the label of
the physical disk holding this virtual disk and other information.

The size of each virtual disk may be in cylinders (roughly 720K each
for 3390 type disks) or in blocks (512 bytes each for 9336 or FBA disks).

## query userid

In case you lose track of which virtual machine you're on, use the
`q userid` command to interrogate CP for your virtual machine name.

    vmcp q userid
    #cp q userid

Note: the z/VM system considers a virtual machine to be a "user".
This is historical, but continues to make sense when you consider
how resources are secured by the hypervisor. In any case, your VMID
is the username of your virtual machine.

Note that the USERID (or VMID) may have no relation to the hostname
of the Linux system running in your virtual machine. The hostname
(as presented locally)
is a function of the guest operating system. The DNS hostname is a
function of the domain name service.

When opening trouble tickets it may be helpful to mention the VMID
to provide another identity factor.

## query names

z/VM is a community system. You can
find out the names of other virtual
machines on the same z/VM host with the `q names` command.

    vmcp q names
    #cp q names

The resulting list enumerates the VMIDs of all virtual machines
presently "logged on".

Terminology varies between z/VM and other
hypervisors: Launching a virtual machine is referred to as "logging on"
as if your virtual machine were a user, where other hypervisors might
say "create". Shutting down a z/VM virtual machine is "logging off",
not "destroy" as other hypervisors would say.

## query terminal

Use the `q term` command to show z/VM session terminal settiings,
including 3270-specific settings.

    vmcp q term
    #cp q term

`vmcp q term` is not very informative when you are connected
to Linux using SSH because the z/VM terminal session settings
have no effect on your SSH session or pseudo-terminal TTY.

The settings of the virtual console are important when you are
connected to the z/VM system using a 3270 emulator, which in turn
is vital whenever manual intervention is needed.

See below for discussion of the `terminal` command 
(not prefixed with `query`).

## query virtual storage

Use the `q v stor` command to show the memory presently defined for
your virtual machine. The size can be changed. (see `define storage` below)

    vmcp q v stor
    #cp q v stor

## define storage

Use the `define storage` command to change the size of
your virtual machines memory (internal storage, RAM).
The syntax is straightforward: `define storage [size]`.

    vmcp def stor 1G
    #cp def stor 1G

WARNING:
This command may reset your virtual machine and so should be issued
when you have access to the virtual console or should be stacked with
an IPL command.

## message

When logged on using a 3270 session, virtual machines can talk to
each other. This is unrelated to network connections. It is a
human-to-human communication. When you `message` another virtual
machine, you are sending a one-line message to the user at the
virtual console. (Assuming the virtual console is connected.)

Use the `message` command to send an interactive message to another
virtual machine. `message` can be abbreviated `msg` or just `m`.
The syntax is `msg [target] [message]` where "target" is the
virtual machine you wish to send a message to.

    vmcp msg otherguy want to go get lunch?
    #cp msg otherguy want to go get lunch?

If the receiving virtual machine is connected, your message would
usually be
presented on its virtual console (in the output area). If the target
virtual machine is not connected and it has no listener then you'll get:

    HCPMFS057I OTHERGUY not receiving; disconnected

Receiving messages when disconnected is possible, but requires
a specialized driver which can accept the traffic from the z/VM
control program. Most Linux distributions provide such a driver.

Sending interactive messages to other virtual machines is unique to z/VM
and not found with other hypervisors. The feature is inherently related
to the z/VM idea of a user being a virtual machine and a virtual machine
being a user.

## smsg

SMSG is the "special message" command. Use it for sending commands
to z/VM "service machines". Similarity with the MSG command is that
the commands are textual like an ordinary message. But the channel
for delivering the message is different.

    vmcp smsg server do something
    #cp smsg server do something

In order to receive these special messages, the target virtual machine
must be running a program or kernel function which communicates with
the z/VM hypervisor to accept the traffic. Most Linux distributions
do have such a driver.

## ipl

Use the `ipl` command (Initial Program Load) to boot your virtual machine. 

    vmcp ipl 1b0 clear
    #cp ipl 1b0 clear

This command WILL reset your virtual machine so should be issued
when you have access to the virtual console if there is any likelihood
that it will fail to work as expected. 

In this example `1B0` is the address of a bootable disk
and `clear` means to also reset memory before performing the load.

`clear` is optional. The kernel will likely clear memory on its own.
Many people use `clear` when booting from a device as a matter of hygiene.

On z/VM one can boot from a "named saved system" (NSS).
This is akin to the direct kernel load function of other hypervisors.
An example is:

    vmcp ipl linux
    #cp ipl linux

In this example, if there is no NSS named LINUX, then the command
results in an error and your virtual machine continues to run whatever
kernel it was running when the command was issued.

You cannot add the `clear` option when booting a named system.

You can invoke a CMS environment by IPLing CMS.

    vmcp ipl cms
    #cp ipl cms

CMS is an efficient environment standard with z/VM which is actually
an operating system in its own right. CMS cannot be used simultaneously
with Linux. Recommend you only do this when you have access to the
virtual console because CMS is only useable from there.
This command WILL reset your virtual machine.

## disconnect

Use the `disconnect` command to release your virtual console
without logging off (and "destroying" your virtual machine).
This is essential at some point if you have been working from
a 3270 session because the session will eventually break due to
network interruptions or other disruptions. But you'll no doubt
want your Linux virtual machine to continue running.

    vmcp disc
    #cp disc

You can reconnect by logging back onto z/VM.
When you logon to z/VM, your virtual machine is instantiated.
If it was already instantiated, you are reconnected to its virtual console.

## logoff

Use the `logoff` command to de-instantiate your virtual machine.
It is equivalent to a `virsh destroy` except that you're destroying
your own virtual machine. (There is no "target domain" argument.)
The "destroy" concept is unnerving: `logoff` is a better term because
when you logoff your virtual machine continues to exist. Its definition
is still in the system. It's simply not using any physical resources.

Note: if you're in the middle of installing Linux and get interrupted
you can safely `#cp logoff` from the virtual console (3270 session).

Your virtual machine ceases to exist, though its disks and configuration
remain intact. ("destroy" is such a harsh word)

    vmcp logoff
    #cp logoff

"Immediately terminate the [virtual machine].
This doesn't give the [guest] OS any chance to react, and it's
the equivalent of ripping the power cord out on a physical machine."

The `logoff` command will usually also terminate your 3270 session.

If you're working on a properly installed Linux system,
you should you NOT use `logoff` without first shutting down Linux.
(Which means that the `vmcp logoff` variant is of questionable value.)
It has the same effect as pulling the plug on a physical computer.
Filesystems will be left in an unknown state.

## indicate

Use the `indicate` command to indicate system or virtual machine status.

    vmcp ind
    #cp ind

`indicate` without arguments displays very simplistic z/VM status,
such as (physical) processor utilization, host system paging, etc.

    vmcp ind user
    #cp ind user

`indicate user` displays the status of your virtual machine
(the status of the "user" from z/VM's perspective),
such as (virtual) processor consumption, working set size, etc.

## terminal

Use the `term` command to modify z/VM virtual console settings.

The complete list of z/VM terminal settings is beyond the scope
of this document.

You can change the output hold and scroll settings,
the "`more`" values, with the command

    vmcp term more 10 10
    #cp term more 10 10

This affects how long z/VM will pause output before it clears the screen 
and displays further output. The first "10" is the number of seconds
to wait before audible alert (beep). The second "1" is the number of
additinal seconds to wait before z/VM will proceed.

If you anticipate a lot of output, like when booting Linux,
you might enter the command

    vmcp term more 1 1
    #cp term more 1 1

If you really don't want to wait *at all* for output to be held

    vmcp term 0 0
    #cp term 0 0

By default, z/VM uses very different reserved characters
for terminal entry. The "#" character, as seeen in `#cp`, is actually line end.
Escape is double quote ("). These can be changed.

## link

Use the `link` CP command to attach a virtual disk which is defined
for your virtual machine but not presently attached. You can also link
to disks owned by other virtual machines when authorized to do so.
(In the z/VM world, sharing disks is a common thing.)

The syntax is:

    vmcp link owner hisaddr myaddr how
    #cp link owner hisaddr myaddr how

where:

* `owner` is the virtual machine for which the disk is defined
* `hisaddr` is the virtual address on the owning virtual machine
* `myaddr` is the virtual address where you want the disk plugged in
* `how` is a token indicating what kind of link (read-only or read-write)

The owner is just another VMID.

`hisaddr` is the hexadecimal address where that disk gets plugged in
when that virtual machine logs on. It does not matter whether the
owning virtual machine is logged on or not.

`myaddr` is the hexadecimal address where you want the disk to appear
on your own virtual machine. Keep in mind that the link entered this way
is not permanent. You can easily deatch the disk and you'll have to
re-do the `link` command if you log off and then log back on
(your own virtual machine).

`how` is a token for which the allowed values include `RR`
for truly read-only disks. (You will get a read-only link if you
are authorized regardless whether others have the disk linked.)
For disks to which you want write access, use `MR`, which means
"allow multiple links" (the M) "but give me read if it is already
linked read-write elsewhere". This is the safest way to link a disk
which you might write to. (Multiple write links without specialized
out-of-band coordination can quickly corrupt
a filesystem.)

Use an asterisk "`*`" as shorthand for your own VMID. To link a disk
which you own (and at the default I/O address), use a command like:

    vmcp link \* addr addr mr
    #cp link \* addr addr mr

This is not normally needed because all disks owned by your virtual
machine get attached when you logon.

## detach

To virtually unplug a virtual device (any device, disk or other),
use the `detach` command.

WARNING:
Make absolutely certain that the operating system is no longer using
a device before you detach it. You can corrupt filesystems if you
detach a disk without cleanly unmounting it and ensuring its buffers
have been flushed. Worse, you can cause your operating system to crash.
The Linux kernel continues to improve its handling of sudden and
unexpected I/O configuration changes, but the `detach` command remains
a powerful tool to be used with extreme care.

    vmcp det addr
    #cp det addr

`addr` is the hexadecimal I/O address of the device you wish to detach.

## spool

z/VM has its own spooling system. Think of it at first as a way to
convey print files, much like spoolers on other systems. But the z/VM
spooling system can also handle your virtual console: output from the
kernel which gets written to the console can be captured automatically
by z/VM with no additional burden on Linux (or whatever operating
system you're running).

To begin collecting console output:

    vmcp spool con to \* start
    #cp spool con to \* start

The console log can be "closed" at any time with:

    vmcp close con
    #cp close con

Since it was spooled "to" your virtual machine, the console log
will show up in your virtual reader queue.

`spool` are *not* harmful to the state of the guest operating system.

## query reader

Use the CP command `q rdr` to list spool files awaiting processing.
By default, your virtual machine was given a virtual reader. Think of
it as a card reader, but it is generic. (Not limited to arcane things
like punched cards. It can handle any type of sequential spool file.)

    vmcp q rdr
    #cp q rdr

 ... or ...

    vmcp q rdr all
    #cp q rdr all

The latter form (the "all" option) provides additional information
such as the time the file was created and the name (if any).
The first seven fields of the output from either form are the same.

Spool files on z/VM might not be named but they are always numbered.
You can refer to a specific spool file by its number.

On Linux, use the `vmur` command to process spool files.
CMS provides a number of commands which work similar to the
functions of `vmur`. (But CMS is a very different environment.
Eash guest operating system must provide its own interface to the
z/VM spooling system.

See:

    man vmur

 ... on Linux.

## purge

To discard a z/VM spool file (without processing it or if you have
finished processing it) use the `purge` command.

    vmcp purge rdr [spoolid]
    #cp purge rdr [spoolid]

You should always specify "`rdr`" because z/VM spooling allows you
to address other queues.

The `spoolid` is simply the number of the file, and all spool files
have such a number, even if they don't have a name.


