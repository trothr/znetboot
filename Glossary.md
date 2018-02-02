# Glossary

Many terms used by maniframers are acronyms, assumed to be already 
known and in the daily working language of end users.  For people coming to 
the mainframe world, this can be quite confusing. This document serves as a
'Rosetta Stone' for translating mainframe-speak.


Distributed -- term for non-mainframe stand-alone computers,
often derived from 'desktop' PC architectures:

--- Intel and AMD x86 
    [a largely obsolete 32 bit processors, but still commonly found in use]

--- Intel and AMD x86_64 
    [more modern 64 bit processors, most of which are capable of running PC 
    'virtualization' programs, such as Xen, Libvirt, and the proprietary VMWare]

--- Intel IA64 (Itanium II) [obsolete early 64 bit processor family]

Mainframe -- informal term for IBM "Z" class architecture.
Other architectures include "I" and "P", which have mostly merged,
and "X" for PC class systems.

--- Z is a succession of mostly backward conmpatible designs, originating 
from the early System/360 instruction set (with that early subset of 
implemented binary Machine Language instructions still supported, and 
represented in a human-readible form in Basic Assembly Language LINK 
and surrounding ecosystem of I/O Channel Co-Processor design 
(similarly programmed in a CCP language).  An I/O co-processor is 
designed to receive at high rate, commands and content data, and so to 
permit off-loading by the central computation hardware 
and RAM store to be able to hand off substantially all I/O tasks to 
the proper 'CCP', and then to task switch to another ready-to-go 
computational job in its 'runnable' job queue.  

The switch in context permitted a processor  to engage in multi-task 
processing.  This was used in release 360/VM to have a very early 
(pre Unix) form of three seeming virtual, but seperate task processor 
spaces (called BG, F1 and F2 -- the Background task, and Foreground 1 
and 2 tasks) which was in use in the late 1960's, and has been extended 
ever since.

--- P is the 'Power' RISC -- Reduced Instruction Set Computer --
architecture redesign.  RISC represented a trend in the hardware
processing the instructions, to shrink the nunber of instruction
primitives which given semiconductor die or processor chipset  needed to 
implement, and so, to get a net increase of speed, reduction of power 
needs, and so, more cost effective performance.

## Glossary

-- ASCII: American Standard Code for Information Interchange;
see: EBCDIC, infra

-- BAL: Basic Assembly Language 

-- BCD: Binary Coded Decimal -- a character set use by IBM on their 1401 series
predecessor (discrete transistors and plugboards based), proposed to 
transition off of Hollerith 'tab' cards encoding a 12 rows, 
called: A B, and 0 through 9 

-- CMS: officially the Conversational Monitor System,
a single user operating system packaged with z/VM
and used for the majority of housekeeping work in z/VM.
CMS provides the interactive environment which defines the user experience
when z/VM is employed as an operating system product.

-- CURL: local convention, after the network file transfer utility; another
example might be 'wget'

-- DASD: Direct Access Storage Device, i.e., disk

-- EBCDIC: Extended Binary Coded Decimal Interchange Code,
IBM's preferred character set for S/390 and AS/400 and successor to BCD.
EBCDIC is a character encoding conceptually similar to ASCII but with different
(and incompatible) character-to-bit-pattern assignments. Translation between 
EBCDIC and ASCII is usually done transparently, but some differences
occasionally leak out.

-- EXEC: in CMS is the filetype for a scripted command. (think shell script)
CMS provides three interpreters, the preferred being REXX. To indicate that an
EXEC should be interpreted as REXX, the file must start with a REXX comment
and thus begin with slash asterisk /*.

-- FOSS: Free and Open Source Software

-- FLOSS: Free/Libre Open Source Software, a variant of FOSS
with essentially the same meaning.

-- GPLv2: one of several licenses documented by the Free Software
Foundation, providing generaly that if one transfers a binary form of
software to someone, one must also make the sources and documentation of the
methods used to produce it, and to continue that license requirement on the
transferee to any later successor or sub-transferee

-- I/O: Input / output communucation outside of the given processor 
chassis, as to a punch card reader (1402), line printer (1403), hard drive
(3390), console device (3270).  FIXME -0- what is a network connection

-- IFL: Integrated Facility for Linux; a ham-strung mainframe processor
which can boot Linux and can boot z/VM but cannot boot z/OS or other
operating systems. IFLs are priced lower than general purpose engines.

-- Linux: specifically, a computer core executive program developed
initially by Linus Torvalds, and as time passes a commuinity of developers,
some completely unpaid, others sponsored by an employer; It is copyrighted,
but freely available on terms of a license known as the GPLv2.  Generally a
shorthand way to refer to an ecosystem of libraries and programs which make
that core executive useful in performing general computing tasks

-- LPAR: a Logical PARtition is a section of persistent storage (usually in
a hard disk like DASD) reserved for a perticular operating system instance.

-- OSA-Express: Open Systems Adapter; a networking interconnect method
used by IBM hardware, and dynamically managable under software control,
rather than by setting up a physical Ethernet network of interfaces, patch
cables, and network switches.  It can perform similar ISO seven layer stack
functions, and operates at layers 2 and 3 of that stack.  WIthin a single
mainframe, it removes the potential for covert interception of network
traffic, as there is no point of attack available to a person lacking rights
to 'tap' into and 'tee' content off of (passively6 or via active 'spoofing')

-- REXX: a scripting language widely use by IBM products

-- RISC: Reduced Instruction Set Computer

-- SFS: Shared FileSystem; in CMS, SFS is a filesystem which can be used
by several virtual machines simultaneously. Historical CMS filesystems
reside on virtual disks which cannot be shared without side-channel
locking and related coordination.

-- TCP/IP: one of several protocols for of data transfer between computing
-- devices (Mainframes, CCP devices, remote systems)

-- Unit Record equipment; 'tab' card based computing; 026 keypunch, 029 
key verified, 082 sorter, 5xx series plugboard and patch cable' programmed 
relay based electronic computing devices; successor was the 1401 family and BCD

-- X3270: a IP network console with a variant form of the 'telnet' type 
of interface; As it dates from an earlier era, there are areas of the screen, 
called 'fields' in which input mat be typed; the TAB key will advance to the 
next available field (some fields may be 'display only') after the present 
cursor position. ENTER customarily submits all of the 'fill-in' fields to 
the remote server for processing as a transaction.  Until ENTER is selected, 
one may cycle and wrap around through all editable fields, and either 
over-type, or use minimal in-field edit commands

-- wget: see: CURL

-- XEDIT: the primary file editor in CMS

-- z/VM: 'Z' for Virtual Machines; at time of preparation, at revision level
	6.4 (November 2017) FIXME; discuss the prediliction of IBM to
	renaming the same product over time, and so causing confusion. 

	Described fully at:

    IBM document: z/VM (product number 5741-A07)
     

	more generally in 

     z/VM: General Information, IBM document GC24-6193

     http://publibz.boulder.ibm.com/epubs/pdf/hcsf8c30.pdf

-- Z: a shorthand way to rever to the 's390x' hardware processor architure

====

IBM also publishes several Glossaries:

z/VM Glossary

http://publibz.boulder.ibm.com/epubs/pdf/hcsl9c30.pdf

IBM document:  GC24-6195-05 

There is an excellent and curated 'link-farm' at PDF page 152 (document
pagination 143)


