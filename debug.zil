"DEBUG for
	        Mini-Zork II: The Wizard of Frobozz
	(c) Copyright 1988 Infocom, Inc.  All Rights Reserved."

<SYNTAX \#RANDOM OBJECT = V-RANDOM>
<SYNTAX \#COMMAND = V-COMMAND-FILE>
<SYNTAX \#RECORD = V-RECORD>
<SYNTAX \#UNRECORD = V-UNRECORD>

<ROUTINE V-RANDOM ()
	 <COND (<NOT <EQUAL? ,PRSO ,INTNUM>>
		<TELL "Illegal call to #RND." CR>)
	       (T
		<RANDOM <- 0 ,P-NUMBER>>
		<RTRUE>)>>

<ROUTINE V-COMMAND-FILE ()
	 <DIRIN 1>
	 <RTRUE>>

<ROUTINE V-RECORD ()
	 <DIROUT 4>
	 <RTRUE>>

<ROUTINE V-UNRECORD ()
	 <DIROUT -4>
	 <RTRUE>>
