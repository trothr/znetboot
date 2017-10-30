
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

--- Z is a succession designs, originating from the early System/360
instruction set (with that early subset of implemented Machine Language
instructions still supported, and represented in a human-readible form in
Basic Assembly Language ('BAL')) and surrounding 'ecosystem' of I/O Channel
Co-Processor design (similarly programmed in a CCP language).  Those IO
co-processors were designed to permit the central computation hardware and
RAM store to be able to 'hand off any I/O task to the proper 'CCP'k, and
then 'task switch' to another 'ready to go' computational task, and so to
engage in multi-task processing.  This was used to have a very early (pre
Unix) form of three seeming virtual but seperate task processor spaces
(called BG, F1 and F2 -- the Background task, and Foreground 1 and 2 tasks)
which was in use in the last 1960's, and has been extended ever since

--- P is the 'Power' RISC -- Reduced Instruction Set Computer --
architecture redesign.  RISC epresented a trend in the hardware
'processing' the instructions, to 'shrink' the nunber of instruction
primitives which given semiconductor needed to implement, and so, to get a
net increase of speed, reduction of power needs, and so, more cost effective
performance.

