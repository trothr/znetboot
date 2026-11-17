/*                                                                    *
 *                                                                    *
 *        Name: VMCP REXX (CMS Pipelines stage in Rexx)               *
 *              a better name is 'hcp' but things cannot be forced    *
 *        Date: 2026-11-17 (Tue)                                      *
 *              This program is part of the CMS Make package.         *
 *                                                                    *
 *                                                                    */

make_version = "2.0.43"

/* if no other output then attach the console */
'STREAMSTATE OUTPUT'
If rc = 4 Then rc = 0
If rc = 8 Then rc = 0
If rc = 12 Then 'ADDPIPE *.OUTPUT: | CONSOLE'
If rc ^= 0 Then Exit rc

Parse Arg args
'CALLPIPE *: | CP' args '| *:'
Exit rc


