"MINI2 for
	        Mini-Zork II: The Wizard of Frobozz
	(c) Copyright 1988 Infocom, Inc.  All Rights Reserved."

<CONSTANT RELEASEID 11>
<VERSION ZIP>

<ORDER-TREE? REVERSE-DEFINED>
<FREQUENT-WORDS?>
<SETG COMPACT-SYNTAXES? T>

<SETG DEBUGGING? T>

<DEFINE DEBUG-CODE ('X "OPT" ('Y T))
	<COND (,DEBUGGING? .X)
	      (ELSE .Y)>>

<INSERT-FILE "misc" T>
<INSERT-FILE "parser" T>
<INSERT-FILE "syntax" T>
<INSERT-FILE "verbs" T>
<INSERT-FILE "globals" T>
<INSERT-FILE "wizard" T>
<INSERT-FILE "dungeon" T>
<INSERT-FILE "princess" T>
<INSERT-FILE "alice" T>
<INSERT-FILE "volcano" T>

%<DEBUG-CODE <INSERT-FILE "debug" T>>

<PROPDEF SIZE 5>
<PROPDEF CAPACITY 0>
