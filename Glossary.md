
Many terms used by 'maniframers' are acronyms, assumed to be already 
known and in the daily working 'lingo' of end users.  For people coming to 
the 'mainframe' world, this can be quite confusing, and so this 'Rosetta Stone'


Distributed
- IBM's term for non-mainframe stand-alone computer, usually derived from 
'desktop' PC architectures:

--- Intel and AMD x86 
    [a largely obsolete 32 bit processors, but still commonly found in use]

--- Intel and AMD x86_64 
    [more modern 64 bit processors, most of which are capable of running PC 
    'virtualization' programs, such as Xen, Libvirt, and the proprietary VMWare]

--- Intel IA64 (Itanium II) [obsolete early 64 bit processor family]


Mainframe
- IBM's term for its Z, and P class server families

--- Z is a succession of mostly backward conmpatible designs, originating 
from the early System/360 instruction set (with that early subset of 
implemented binary Machine Language instructions still supported, and 
represented in a human-readible form in Basic Assembly Language LINK 
and surrounding 'ecosystem' of I/O Channel Co-Processor design 
(similarly programmed in a CCP language).  An I/O co-processor is 
designed to receive at high rate, commands and content data, and so to 
permit 'off-loading' by the central computation hardware 
and RAM store to be able to 'hand off substantially all I/O tasks to 
the proper 'CCP', and then to 'task switch' to another 'ready to go' 
computational job in its 'runnable' job queue.  

The switch in context permitted a processor  to engage in multi-task 
processing.  This was used in release 360/VM to have a very early 
(pre Unix) form of three seeming virtual, but seperate task processor 
spaces (called BG, F1 and F2 -- the Background task, and Foreground 1 
and 2 tasks) which was in use in the late 1960's, and has been extended 
ever since.

--- P is the 'Power' RISC -- Reduced Instruction Set Computer --
architecture redesign.  RISC represented a trend in the hardware
'processing' the instructions, to 'shrink' the nunber of instruction
primitives which given semiconductor die or processor chipset  needed to 
implement, and so, to get a net increase of speed, reduction of power 
needs, and so, more cost effective performance.

----

- Glossary
/*  keep alpha */

-- ASCII: see: EBCDIC, infra

-- BAL: Basic Assembly Language 

-- BCD: Binary Coded Decimal -- a character set use by IBM on their 1401 series
predecessor (discrete transistors and plugboards based), proposed to 
transition off of Hollerith 'tab' cards encoding a 12 rows, 
called: A B, and 0 through 9 

-- CMS: FIXME

-- CURL: local convention, after the network file transfer utility; another
example might be 'wget'

-- DASD: Direct Access Ssytem <?> Device <?>

-- EBCDIC: IBM's preferred character set for s/390. Extended Binary Coded 
Decimal Interhange Code; a 'not invented here' response to ASCII, which was 
was the alternative character set encoding conpetition of the era; successor to 
BCD encoding on the 1401 series

-- EXEC: similar to Unix' _fork_, _exec_ and friends

-- I/O: Input / output communucation outside of the given processor 
chassis, as to a punch card reader (1402), line printer (1403), hard drive
(3390), console device (3270).  FIXME -0- what is a network connection

-- LPAR: Logical Partition

-- REXX: a scripting language widely use by IBM products

-- RISC: Reduced Instruction Set Computer

-- SFS: FIXME

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

-- XEDIT: FIXME

-- z/VM: FIXME discuss the prediliction of IBM to renaming the same product 
over time, and so causing confusion

-- Z: a shorthand way to rever to the 's390x' hardware processor architure

