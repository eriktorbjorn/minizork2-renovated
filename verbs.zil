"VERBS for
	        Mini-Zork II: The Wizard of Frobozz
	(c) Copyright 1988 Infocom, Inc.  All Rights Reserved."

"Verb Functions for Game Commands"

<GLOBAL VERBOSE <>>
<GLOBAL SUPER-BRIEF <>>
<GDECL (VERBOSE SUPER-BRIEF) <OR ATOM FALSE>>

<ROUTINE V-VERBOSE ()
	 <SETG VERBOSE T>
	 <SETG SUPER-BRIEF <>>
	 <TELL "Maximum verbosity." CR>>

<ROUTINE V-BRIEF ()
	 <SETG VERBOSE <>>
	 <SETG SUPER-BRIEF <>>
	 <TELL "Brief descriptions." CR>>

<ROUTINE V-SUPER-BRIEF ()
	 <SETG SUPER-BRIEF T>
	 <TELL "Superbrief descriptions." CR>>

<ROUTINE V-DIAGNOSE ()
	 <TELL "You are ">
	 <COND (,DEAD
		<TELL "dead">)
	       (<EQUAL? ,SPELL? ,S-FERMENT>
		<TELL "drunk">)
	       (<EQUAL? ,SPELL? ,S-FEEBLE>
		<TELL "unusually weak">)
	       (<EQUAL? ,SPELL? ,S-FLOAT>
		<TELL "floating">)
	       (<EQUAL? ,SPELL? ,S-FREEZE>
		<TELL "frozen stiff">)
	       (T
		<TELL "in perfect health">)>
	 <COND (<NOT <0? ,DEATHS>>
		<TELL ". You have been killed ">
		<COND (<1? ,DEATHS>
		       <TELL "once">)
		      (<EQUAL? ,DEATHS 2>
		       <TELL "twice">)
		      (T
		       <TELL "an awful lot">)>)>
	 <TELL ,PERIOD-CR>>

<ROUTINE V-INVENTORY ()
	 <COND (<FIRST? ,WINNER>
		<PRINT-CONT ,WINNER>)
	       (T
		<TELL "You are empty-handed." CR>)>>

<ROUTINE FINISH ("AUX" WRD)
	 <CRLF>
	 <CRLF>
	 <V-SCORE>
	 <REPEAT ()
		 <CRLF>
		 <TELL
"Would you like to start over, restore a saved position, or stop playing?|
(Type RESTART, RESTORE, or QUIT):|>">
		 <READ ,P-INBUF ,P-LEXV>
		 <SET WRD <GET ,P-LEXV 1>>
		 <COND (<EQUAL? .WRD ,W?RESTART>
			<RESTART>
			<TELL "Failed." CR>)
		       (<EQUAL? .WRD ,W?RESTORE>
			<RESTORE>
			<TELL "Failed." CR>)
		       (<EQUAL? .WRD ,W?QUIT ,W?Q>
			<QUIT>)>>>

<ROUTINE V-QUIT ()
	 <COND (<DO-YOU-WISH "leave the game">
	 	<QUIT>)
	       (T
		<TELL "Ok." CR>)>>

<ROUTINE V-RESTART ()
	 <COND (<DO-YOU-WISH "restart">
		<TELL "Restarting." CR>
		<RESTART>
		<TELL "Failed." CR>)>>

<ROUTINE DO-YOU-WISH (STRING)
	 <V-SCORE>
	 <TELL "Do you wish to " .STRING "? (Y is affirmative): ">
	 <COND (<YES?>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE YES? ()
	 <PRINTI ">">
	 <READ ,P-INBUF ,P-LEXV>
	 <COND (<EQUAL? <GET ,P-LEXV 1> ,W?YES ,W?Y>
		<RTRUE>)
	       (T
		<RFALSE>)>>

<ROUTINE V-RESTORE ()
	 <RESTORE>
	 <TELL "Failed." CR>>

<ROUTINE V-SAVE ()
	 <COND (<SAVE>
	        <TELL "Ok." CR>)
	       (T
		<TELL "Failed." CR>)>>

<GLOBAL RANKINGS
	<TABLE "Amateur" "Junior" "Senior" "Master">>

<ROUTINE V-SCORE ()
	 <TELL
"Your score is " N ,SCORE " (out of 400 points), in " N ,MOVES " move">
	 <COND (<NOT <1? ,MOVES>>
		<TELL "s">)>
	 <TELL ". This score gives you the rank of ">
	 <COND (<G? ,SCORE 399>
		<TELL "Wizard">)
	       (<L? ,SCORE 81>
		<TELL "Beginner">)
	       (T
		<TELL <GET ,RANKINGS </ <- ,SCORE 81> 80>> " Adventurer">)>
	 <TELL ,PERIOD-CR>>

<GLOBAL SCORE 0>

<ROUTINE SCORE-OBJ (OBJ "AUX" TEMP)
	 <COND (<SET TEMP <GETP .OBJ ,P?VALUE>>
		<SETG SCORE <+ ,SCORE .TEMP>>
		<PUTP .OBJ ,P?VALUE 0>)>>

<ROUTINE V-SCRIPT ()
	 <PUT 0 8 <BOR <GET 0 8> 1>>
	 <INTERACTION "begin">>

<ROUTINE INTERACTION (STRING)
	 <TELL "Here " .STRING "s a transcript of interaction with" CR>
	 <V-VERSION>>

<ROUTINE V-UNSCRIPT ()
	 <INTERACTION "end">
	 <PUT 0 8 <BAND <GET 0 8> -2>>
	 <RTRUE>>

<ROUTINE V-VERSION ("AUX" (CNT 17))
	<TELL
"Mini-Zork II: The Wizard of Frobozz|
Copyright (c) 1988, Infocom, Inc. All rights reserved.|
ZORK is a registered trademark of Infocom, Inc.|
Release ">
	<PRINTN <BAND <GET 0 1> *3777*>>
	<TELL " / Serial number ">
	<REPEAT ()
		<COND (<G? <SET CNT <+ .CNT 1>> 23>
		       <RETURN>)
		      (T
		       <PRINTC <GETB 0 .CNT>>)>>
	<CRLF>>

<ROUTINE V-VERIFY ()
	 <TELL "Verifying..." CR>
	 <COND (<VERIFY>
		<TELL "Correct." CR>)
	       (T
		<TELL CR "** Failed! **" CR>)>>

\^L
"Real Verb Functions"

<ROUTINE V-ALARM ()
	 <TELL "The " D ,PRSO " isn't sleeping." CR>>

<ROUTINE WITH-PRSI-IS (WHAT)
	 <TELL " with ">
	 <COND (<PRSI? ,HANDS>
		<TELL "your bare hands">)
	       (T
		<TELL A ,PRSI>)>
	 <TELL " is " .WHAT ,PERIOD-CR>>

<ROUTINE V-ATTACK ()
	 <COND (<NOT <FSET? ,PRSO ,ACTORBIT>>
		<TELL "Fight " A ,PRSO "!?!" CR>
		<RTRUE>)>
	 <COND (<NOT ,PRSI>
		<COND (<IN? ,SWORD ,ADVENTURER>
		       <SETG PRSI ,SWORD>)
		      (T
		       <SETG PRSI ,HANDS>)>)>
	 <TELL "Trying to attack " A ,PRSO>
	 <WITH-PRSI-IS "suicidal">>

<ROUTINE V-BLAST ()
	 <TELL "You can't blast anything by using words." CR>>

<ROUTINE PRE-BURN ()
	 <COND (<NOT ,PRSI>
		<TELL "You didn't say with what!" CR>)
	       (<FLAMING? ,PRSI>
	        <RFALSE>)
	       (T
	        <TELL "With " A ,PRSI "??!?" CR>)>>

<ROUTINE V-BURN ()
	 <COND (<EQUAL? <LOC ,PRSO> ,RECEPTACLE>
		<BALLOON-BURN>
		<RTRUE>)
	       (<FSET? ,PRSO ,BURNBIT>
		<TELL "The " D ,PRSO " catches fire">
		<COND (<IN? ,PRSO ,WINNER>
		       <JIGS-UP
". Unfortunately, you were holding it at the time.">)
		      (T
		       <TELL " and is consumed." CR>)>
		<REMOVE-CAREFULLY ,PRSO>)
	       (T
		<TELL "You can't burn " A ,PRSO ,PERIOD-CR>)>>

<ROUTINE V-CLIMB-DOWN ()
	 <DO-WALK ,P?DOWN>>

<ROUTINE V-CLIMB ()
	 <DO-WALK ,P?UP>>

<ROUTINE V-CLIMB-ON ()
	 <COND (<FSET? ,PRSO ,VEHBIT>
		<PERFORM ,V?ENTER ,PRSO>
		<RTRUE>)
	       (T
		<TELL "You can't climb onto the " D ,PRSO ,PERIOD-CR>)>>

<ROUTINE V-CLOSE ()
	 <COND (<FSET? ,PRSO ,DOORBIT>
		<COND (<FSET? ,PRSO ,OPENBIT>
		       <FCLEAR ,PRSO ,OPENBIT>
		       <TELL "Closed." CR>)
		      (T
	 	       <TELL ,ALREADY>)>)
	       (<OR <FSET? ,PRSO ,SURFACEBIT>
		    <NOT <FSET? ,PRSO ,CONTBIT>>>
		<TELL "You can't close " A ,PRSO ,PERIOD-CR>)
	       (<FSET? ,PRSO ,OPENBIT>
		<FCLEAR ,PRSO ,OPENBIT>
		<TELL "Closed." CR>
		<NOW-DARK?>)
	       (T
		<TELL ,ALREADY>)>>

<ROUTINE V-COMMAND ()
	 <COND (<FSET? ,PRSO ,ACTORBIT>
		<TELL "The " D ,PRSO " pays no attention." CR>)
	       (T
		<TELL "You cannot talk to that!" CR>)>>

<ROUTINE V-COUNT ()
	 <TELL "You have lost your mind." CR>>

<ROUTINE V-CURSES ()
	 <TELL "Such language in a high-class establishment like this!" CR>>

<ROUTINE V-CUT ()
	 <COND (<FSET? ,PRSO ,ACTORBIT>
		<PERFORM ,V?ATTACK ,PRSO ,PRSI>)
	       (<NOT <FSET? ,PRSI ,WEAPONBIT>>
		<TELL
"The \"cutting edge\" of " A ,PRSI " is inadequate." CR>)
	       (<FSET? ,PRSO ,BURNBIT>
		<REMOVE-CAREFULLY ,PRSO>
		<TELL
"You skillfully slice the " D ,PRSO " into slivers, which blow away." CR>)
	       (T
		<TELL "Strange concept, cutting the " D ,PRSO "...." CR>)>>

<ROUTINE V-DEFLATE ()
	 <TELL "Come on, now!" CR>>

<ROUTINE V-DISEMBARK ()
	 <COND (<AND <EQUAL? ,PRSO ,ROOMS>
		     <FSET? <LOC ,WINNER> ,VEHBIT>>
		<PERFORM ,V?DISEMBARK <LOC ,WINNER>>
		<RTRUE>)
	       (<NOT <EQUAL? <LOC ,WINNER> ,PRSO>>
		<TELL ,LOOK-AROUND>
		<RFATAL>)
	       (<FSET? ,HERE ,RLANDBIT>
		<MOVE ,WINNER ,HERE>
		<TELL "You are on your own feet again." CR>)
	       (T
		<TELL "Getting out here would be fatal." CR>
		<RFATAL>)>>

<ROUTINE V-DISENCHANT ()
	 <V-COUNT>>

<ROUTINE V-$DISENCHANT ()
	 <COND (<NOT <IN? ,PRSO ,HERE>>
		<RTRUE>)
	       (<OR <EQUAL? ,SPELL-USED ,W?FEEBLE ,W?FUMBLE>
		    <EQUAL? ,SPELL-USED ,W?FREEZE ,W?FALL ,W?FERMENT>
		    <EQUAL? ,SPELL-USED ,W?FENCE ,W?FANTASIZE>>
		<COND (<FSET? ,PRSO ,ACTORBIT>
		       <COND (<EQUAL? ,SPELL-USED ,W?FEEBLE>
			      <TELL "The " D ,PRSO " seems stronger now." CR>)
			     (<EQUAL? ,SPELL-USED ,W?FUMBLE>
			      <TELL
"The " D ,PRSO " no longer appears clumsy." CR>)
			     (<EQUAL? ,SPELL-USED ,W?FREEZE>
			      <TELL "The " D ,PRSO " moves again." CR>)
			     (<EQUAL? ,SPELL-USED ,W?FERMENT>
			      <TELL "The " D ,PRSO " stops swaying." CR>)>)>)
	       (<EQUAL? ,SPELL-USED ,W?FLOAT>
		<TELL "The " D ,PRSO " sinks to the ground." CR>)
	       (<EQUAL? ,SPELL-USED ,W?FUDGE>
		<TELL "The sweet smell has dispersed." CR>)>>

<ROUTINE V-DRINK ()
	 <V-EAT>>

<ROUTINE V-DRINK-FROM ()
	 <TELL "How peculiar!" CR>>

<ROUTINE PRE-DROP ()
	 <COND (<EQUAL? ,PRSO <LOC ,WINNER>>
		<PERFORM ,V?DISEMBARK ,PRSO>
		<RTRUE>)>>

<ROUTINE V-DROP ()
	 <COND (<IDROP>
		<TELL "Dropped." CR>)>>

<ROUTINE V-EAT ()
	 <COND (<FSET? ,PRSO ,FOODBIT>
		<HIT-SPOT>)
	       (<PRSO? ,GLOBAL-WATER ,POOL>
		<HIT-SPOT>)
	       (<PRSO? ,WATER>
		<COND (<NOT <HELD? <LOC ,PRSO>>>
		       <TELL
"You're not holding the " D <LOC ,PRSO> ,PERIOD-CR>)
		      (T
		       <HIT-SPOT>)>)
	       (T
		<TELL
"It's doubtful the " D ,PRSO " would agree with you." CR>)>>

<ROUTINE HIT-SPOT ()
	 <COND (<FSET? ,PRSO ,TAKEBIT>
		<REMOVE-CAREFULLY ,PRSO>)>
	 <TELL "That really hit the spot." CR>>

<ROUTINE V-ENCHANT ()
	 <TELL "You must be more specific." CR>>

<ROUTINE V-$ENCHANT ()
	 <COND (,WAND-ON
		<SETG SPELL-VICTIM ,WAND-ON>)>
	 <COND (,SPELL-VICTIM
		<COND (<NOT ,SPELL-USED>
		       <V-ENCHANT>
		       <RTRUE>)>
		<COND (<OR <EQUAL? ,SPELL-USED ,W?FEEBLE ,W?FUMBLE>
			  <EQUAL? ,SPELL-USED ,W?FREEZE ,W?FALL ,W?FERMENT>
			  <EQUAL? ,SPELL-USED ,W?FENCE ,W?FANTASIZE>>
		       <COND (<FSET? ,PRSO ,ACTORBIT>
			      <TELL ,WAND-STOPS-GLOWING>)
			     (T
			      <TELL
"That might have done something, but it's
hard to tell with " A ,PRSO ,PERIOD-CR>)>)
		      (<EQUAL? ,SPELL-USED ,W?FUDGE>
		       <TELL "An odor of chocolate permeates the room." CR>)
		      (<EQUAL? ,SPELL-USED ,W?FLUORESCE>
		       <FSET ,PRSO ,LIGHTBIT>
		       <FSET ,PRSO ,ONBIT>
		       <SETG LIT T>
		       <TELL "The " D ,PRSO " begins to glow." CR>)
		      (<AND <EQUAL? ,SPELL-USED ,W?FLOAT>
			    <FSET? ,PRSO ,TAKEBIT>>
		       <COND (<AND <EQUAL? ,SPELL-VICTIM ,COLLAR>
				   <IN? ,COLLAR ,CERBERUS>>
			      <SETG SPELL-VICTIM ,CERBERUS>)>
		       <COND (<HELD? ,PRSO>
			      <MOVE ,PRSO ,HERE>)>
		       <TELL "The " D ,PRSO " floats serenely in midair." CR>)
		      (<AND <EQUAL? ,SPELL-USED ,W?FRY>
			    <FSET? ,PRSO ,TAKEBIT>>
		       <SETG SPELL-HANDLED? T>
		       <TELL "The " D ,PRSO " goes up in a puff of smoke." CR>
		       <REMOVE-CAREFULLY ,PRSO>)
		      (T
		       <SETG SPELL-VICTIM <>>
		       <TELL ,WAND-STOPS-GLOWING>)>)
	       (T
		<SETG SPELL-VICTIM <>>
		<TELL ,NOTHING-HAPPENS>)>>

<ROUTINE REMOVE-CAREFULLY (OBJ "AUX" OLIT)
	 <COND (<EQUAL? .OBJ ,P-IT-OBJECT>
		<SETG P-IT-OBJECT <>>)>
	 <SET OLIT ,LIT>
	 <REMOVE .OBJ>
	 <NOW-DARK?>>

<ROUTINE PRE-ENTER ("AUX" M)
	 <COND (<NOT ,PRSO>
		<DO-WALK ,P?IN>)
	       (<AND <FSET? ,PRSO ,DOORBIT>
		    <SET M <OTHER-SIDE ,PRSO>>>
	        <DO-WALK .M>)
	       (<FSET? ,PRSO ,VEHBIT>
		<COND (<FSET? <LOC ,ADVENTURER> ,VEHBIT>
		       <TELL ,LOOK-AROUND>)>)>>

<ROUTINE V-ENTER ()
	 <COND (<FSET? ,PRSO ,VEHBIT>
		<MOVE ,WINNER ,PRSO>
		<TELL "You are now in the " D ,PRSO ,PERIOD-CR>)
	       (T
		<TELL
"You hit your head against the " D ,PRSO " as you attempt this feat." CR>)>>

<ROUTINE V-EXAMINE ()
	 <COND (<GETP ,PRSO ,P?TEXT>
		<TELL <GETP ,PRSO ,P?TEXT> CR>)
	       (<OR <FSET? ,PRSO ,CONTBIT>
		    <FSET? ,PRSO ,DOORBIT>>
		<V-LOOK-INSIDE>)
	       (T
		<TELL
"There's nothing special about the " D ,PRSO ,PERIOD-CR>)>>

<ROUTINE V-EXIT ()
	 <COND (<OR <AND <EQUAL? ,PRSO <> ,ROOMS>
			 <FSET? <LOC ,WINNER> ,VEHBIT>>
		    <AND ,PRSO
			 <IN? ,WINNER ,PRSO>>>
		<PERFORM ,V?DISEMBARK <LOC ,WINNER>>
		<RTRUE>)
	       (T
		<DO-WALK ,P?OUT>)>>

<ROUTINE PRE-FILL ()
	 <COND (<NOT ,PRSI>
		<COND (<GLOBAL-IN? ,GLOBAL-WATER ,HERE>
		       <PERFORM ,V?FILL ,PRSO ,GLOBAL-WATER>)
		      (<IN? ,WATER <LOC ,WINNER>>
		       <PERFORM ,V?FILL ,PRSO ,WATER>)
		      (T
		       <TELL ,THERE-IS-NOTHING "to fill it with." CR>)>
		<RTRUE>)
	       (<NOT <EQUAL? ,PRSI ,WATER ,GLOBAL-WATER>>
		<PERFORM ,V?PUT ,PRSI ,PRSO>
		<RTRUE>)>>

<ROUTINE V-FILL ()
	 <TELL "Huh?" CR>>

<ROUTINE V-FIND ("AUX" (L <LOC ,PRSO>))
	 <COND (<EQUAL? ,PRSO ,HANDS>
		<TELL "Within six feet of your head, hopefully." CR>)
	       (<EQUAL? .L ,GLOBAL-OBJECTS>
		<TELL "You find it." CR>)
	       (<IN? ,PRSO ,WINNER>
		<TELL "You have it." CR>)
	       (<OR <IN? ,PRSO ,HERE>
		    <GLOBAL-IN? ,PRSO ,HERE>
		    <EQUAL? ,PRSO ,PSEUDO-OBJECT>>
		<TELL "It's right here." CR>)
	       (<FSET? .L ,ACTORBIT>
		<TELL "The " D .L " has it." CR>)
	       (<FSET? .L ,SURFACEBIT>
		<TELL "It's on the " D .L ,PERIOD-CR>)
	       (<FSET? .L ,CONTBIT>
		<TELL "It's in the " D .L ,PERIOD-CR>)
	       (T
		<TELL "Beats me." CR>)>>

<ROUTINE V-FOLLOW ()
	 <V-COUNT>>

<ROUTINE PRE-GIVE ()
	 <COND (<NOT <HELD? ,PRSO>>
		<TELL 
"That's easy for you to say since you don't even have the "
D ,PRSO ,PERIOD-CR>)>>

<ROUTINE V-GIVE ()
	 <COND (<NOT <FSET? ,PRSI ,ACTORBIT>>
		<TELL "You can't give " A ,PRSO " to " A ,PRSI "!" CR>)
	       (T
		<TELL "The " D ,PRSI " refuses it politely." CR>)>>

<ROUTINE V-HELLO ()
	 <COND (,PRSO
		<COND (<FSET? ,PRSO ,ACTORBIT>
		       <TELL
"The " D ,PRSO " bows his head to you in greeting." CR>)
		      (T
		       <TELL
"Only schizophrenics say \"Hello\" to " A ,PRSO ,PERIOD-CR>)>)
	       (T
		<TELL "Goodbye." CR>)>>

<ROUTINE V-INCANT ()
	 <COND (,SPELL-USED
		<TELL ,NOTHING-HAPPENS>)
	       (,WAND-ON
		<SETG SPELL-VICTIM ,WAND-ON>
		<SETG SPELL-USED <GET ,P-LEXV ,P-CONT>>
		<TELL "The wand glows very brightly for a moment." CR>
		<ENABLE <QUEUE I-SPELL <+ 10 <RANDOM 10>>>>
		<SETG WAND-ON <>>
		<PERFORM ,V?$ENCHANT ,SPELL-VICTIM>)
	       (T
		<TELL
"The incantation echoes back faintly, but nothing else happens." CR>)>
	 <SETG QUOTE-FLAG <>>
	 <SETG P-CONT <>>
	 <RTRUE>>

<ROUTINE I-SPELL ()
	 <COND (<AND <NOT ,SPELL-HANDLED?> ,SPELL-VICTIM>
		<PERFORM ,V?$DISENCHANT ,SPELL-VICTIM>)>
	 <SETG SPELL-HANDLED? <>>
	 <SETG WAND-ON <>>
	 <SETG SPELL-USED <>>
	 <SETG SPELL-VICTIM <>>>

<ROUTINE V-INFLATE ()
	 <TELL "How can you inflate that?" CR>>

<ROUTINE V-KICK ()
	 <HACK-HACK "Kicking the ">>

<ROUTINE V-KISS ()
	 <TELL "I'd sooner kiss a pig." CR>>

<ROUTINE V-KNOCK ()
	 <COND (<FSET? ,PRSO ,DOORBIT>
		<TELL "Nobody's home." CR>)
	       (T
		<TELL "Why knock on " A ,PRSO "?" CR>)>>

<ROUTINE V-LAMP-OFF ()
	 <COND (<FSET? ,PRSO ,LIGHTBIT>
		<COND (<NOT <FSET? ,PRSO ,ONBIT>>
		       <TELL ,ALREADY>)
		      (T
		       <FCLEAR ,PRSO ,ONBIT>
		       <TELL "The " D ,PRSO " is now off." CR>
		       <NOW-DARK?>)>)
	       (T
		<TELL "You can't turn that off." CR>)>>

<ROUTINE V-LAMP-ON ()
	 <COND (<FSET? ,PRSO ,LIGHTBIT>
		<COND (<FSET? ,PRSO ,ONBIT>
		       <TELL ,ALREADY>)
		      (T
		       <FSET ,PRSO ,ONBIT>
		       <TELL "The " D ,PRSO " is now on." CR>
		       <COND (<NOT ,LIT>
			      <SETG LIT <LIT? ,HERE>>
			      <CRLF>
			      <V-LOOK>)>)>)
	       (<FSET? ,PRSO ,BURNBIT>
		<TELL
"If you wish to burn the " D ,PRSO ", you should say so." CR>)
	       (T
		<TELL "You can't turn that on." CR>)>>

<ROUTINE V-LAUNCH ()
	 <TELL "You can't launch that by saying \"launch\"!" CR>>

<ROUTINE V-LEAP ("AUX" TX)
	 <COND (,PRSO
		<TELL "That would be a good trick." CR>)
	       (<AND <SET TX <GETPT ,HERE ,P?DOWN>>
		     <EQUAL? <PTSIZE .TX> ,NEXIT>>
		<JIGS-UP "You should have looked before you leaped.">)
	       (T
		<V-SKIP>)>>

<ROUTINE V-LEAVE ()
	 <DO-WALK ,P?OUT>>

<ROUTINE V-LISTEN ()
	 <TELL "The " D ,PRSO " makes no sound." CR>>

<ROUTINE V-LOCK ()
	 <TELL "It doesn't seem to work." CR>>

<ROUTINE V-LOOK ()
	 <DESCRIBE-ROOM T>
	 <COND (,LIT
		<DESCRIBE-OBJECTS T>)>>

<ROUTINE V-LOOK-BEHIND ()
	 <TELL ,THERE-IS-NOTHING "behind the " D ,PRSO ,PERIOD-CR>>

<ROUTINE V-LOOK-INSIDE ()
	 <COND (<FSET? ,PRSO ,DOORBIT>
		<TELL "The " D ,PRSO>
		<COND (<FSET? ,PRSO ,OPENBIT>
		       <TELL " is open, but you can't see beyond it." CR>)
		      (T
		       <TELL ,IS-CLOSED>)>)
	       (<FSET? ,PRSO ,CONTBIT>
		<COND (<FSET? ,PRSO ,ACTORBIT>
		       <TELL ,THERE-IS-NOTHING "special to be seen." CR>)
		      (<SEE-INSIDE? ,PRSO>
		       <COND (<AND <FIRST? ,PRSO>
				   <PRINT-CONT ,PRSO>>
			      <RTRUE>)
			     (T
			      <TELL "The " D ,PRSO " is empty." CR>)>)
		      (T
		       <TELL "The " D ,PRSO ,IS-CLOSED>)>)
	       (T
		<TELL "You can't look inside " A ,PRSO ,PERIOD-CR>)>>

<ROUTINE V-LOOK-UNDER ()
	 <TELL ,THERE-IS-NOTHING "but dust there." CR>>

<ROUTINE V-LOWER ()
	 <HACK-HACK "Playing in this way with the ">>

<ROUTINE V-MELT ()
	 <TELL "You can't melt " A ,PRSO ,PERIOD-CR>>

<ROUTINE V-MOVE ()
	 <COND (<HELD? ,PRSO>
		<TELL "Why juggle objects?" CR>)
	       (<FSET? ,PRSO ,TAKEBIT>
		<TELL "Moving the " D ,PRSO " reveals nothing." CR>)
	       (T
		<TELL "You can't move the " D ,PRSO ,PERIOD-CR>)>>

<ROUTINE V-MUNG ()
	 <COND (<OR <NOT ,PRSI>
		    <NOT <FSET? ,PRSI ,WEAPONBIT>>>
		<TELL "Trying to destroy the " D ,PRSO>
		<WITH-PRSI-IS "futile">)
	       (<FSET? ,PRSO ,ACTORBIT>
		<PERFORM ,V?ATTACK ,PRSO>
		<RTRUE>)
	       (T
		<TELL "Nice try." CR>)>>

<ROUTINE V-OPEN ("AUX" F STR)
	 <COND (<FSET? ,PRSO ,CONTBIT>
		<COND (<FSET? ,PRSO ,OPENBIT>
		       <TELL ,ALREADY>)
		      (T
		       <FSET ,PRSO ,OPENBIT>
		       <FSET ,PRSO ,TOUCHBIT>
		       <COND (<OR <NOT <FIRST? ,PRSO>>
				  <FSET? ,PRSO ,TRANSBIT>>
			      <TELL "Opened." CR>)
			     (<AND <SET F <FIRST? ,PRSO>>
				   <NOT <NEXT? .F>>
				   <NOT <FSET? .F ,TOUCHBIT>>
				   <SET STR <GETP .F ,P?FDESC>>>
			      <TELL "The " D ,PRSO " opens." CR>
			      <TELL .STR CR>)
			     (T
			      <TELL "Opening the " D ,PRSO " reveals ">
			      <PRINT-CONTENTS ,PRSO>
			      <TELL ,PERIOD-CR>)>)>)
	       (<FSET? ,PRSO ,DOORBIT>
		<COND (<FSET? ,PRSO ,OPENBIT>
		       <TELL ,ALREADY>)
		      (T
		       <FSET ,PRSO ,OPENBIT>
		       <TELL "The " D ,PRSO " opens." CR>)>)
	       (T
		<TELL "You can't open " A ,PRSO ,PERIOD-CR>)>>

<ROUTINE V-PICK ()
	 <TELL "You can't pick that." CR>>

<ROUTINE V-PLAY ()
	 <TELL "That's silly!" CR>>

<ROUTINE V-POUR-ON ()
	 <COND (<EQUAL? ,PRSO ,WATER>
		<REMOVE-CAREFULLY ,PRSO>
	        <COND (<FLAMING? ,PRSI>
		       <TELL "The " D ,PRSI " is extinguished." CR>
		       <COND (<EQUAL? ,PRSI ,BALLOON-INFLATED>
			      <SETG BALLOON-INFLATED <>>)>
		       <COND (<EQUAL? ,PRSI ,MATCH>
			      <QUEUE I-MATCH 0>)>
		       <FCLEAR ,PRSI ,ONBIT>
		       <FCLEAR ,PRSI ,FLAMEBIT>
		       <NOW-DARK?>)
	              (T
		       <TELL
"The water spills over the " D ,PRSI " and evaporates." CR>)>)
	       (T
		<TELL "You can't pour that." CR>)>>

<ROUTINE V-PUSH ()
	 <HACK-HACK "Pushing the ">>

<ROUTINE PRE-PUT ()
	 <COND (<EQUAL? ,PRSO ,SERPENT>
		<RFALSE>)     ;"Handled by SERPENT-F"
	       (T
		<PRE-GIVE>)>> ;"That's easy for you to say..."

<ROUTINE V-PUT ()
	 <COND (<AND <NOT <FSET? ,PRSI ,OPENBIT>>
		     <NOT <OPENABLE? ,PRSI>>
		     <NOT <FSET? ,PRSI ,VEHBIT>>>
		<V-PUT-UNDER>)
	       (<NOT <FSET? ,PRSI ,OPENBIT>>
		<SETG P-IT-OBJECT ,PRSI>
		<TELL "The " D ,PRSI " isn't open." CR>)
	       (<EQUAL? ,PRSI ,PRSO>
		<TELL "How can you do that?" CR>)
	       (<IN? ,PRSO ,PRSI>
		<TELL "The " D ,PRSO " is already in the " D ,PRSI ,PERIOD-CR>)
	       (<G? <- <+ <WEIGHT ,PRSI> <WEIGHT ,PRSO>> <GETP ,PRSI ,P?SIZE>>
		    <GETP ,PRSI ,P?CAPACITY>>
		<TELL "There's no room." CR>)
	       (<AND <NOT <HELD? ,PRSO>>
		     <NOT <ITAKE>>>
		<RTRUE>)
	       (T
		<MOVE ,PRSO ,PRSI>
		<FSET ,PRSO ,TOUCHBIT>
		<TELL "Done." CR>)>>

<ROUTINE V-PUT-ON ()
	 <COND (<FSET? ,PRSI ,SURFACEBIT>
		<V-PUT>)
	       (T
		<TELL "There's no good surface on the " D ,PRSI ,PERIOD-CR>)>>

<ROUTINE V-PUT-UNDER ()
	 <TELL "You can't do that." CR>>

<ROUTINE V-RAISE ()
	 <V-LOWER>>

<ROUTINE V-RAPE ()
	 <TELL "What a (ahem!) strange idea." CR>>

<ROUTINE PRE-READ ()
	 <COND (<NOT ,LIT>
		<TELL ,TOO-DARK CR>)>>

<ROUTINE V-READ ()
	 <COND (<NOT <FSET? ,PRSO ,READBIT>>
		<TELL "How does one read " A ,PRSO "?" CR>)
	       (T
		<TELL <GETP ,PRSO ,P?TEXT> CR>)>>

<ROUTINE V-RUB ()
	 <HACK-HACK "Fiddling with the ">>

<ROUTINE V-SAY ("AUX" V)
	 <COND (<OR ,SPELL-USED
		    ,WAND-ON>
		<PERFORM ,V?INCANT>
		<RTRUE>)
	       (<NOT ,P-CONT>
		<TELL "Say what?" CR>)
	       (T
	 	<SETG QUOTE-FLAG <>>
	 	<SETG P-CONT <>>
	 	<COND (<SET V <FIND-IN ,HERE ,ACTORBIT>>
		       <TELL "You must address the " D .V " directly." CR>)
		      (T
		       <TELL ,TALKING-TO-YOURSELF>)>)>>

<ROUTINE V-SEARCH ()
	 <TELL "You find nothing unusual." CR>>

<ROUTINE V-SGIVE ()
	 <PERFORM ,V?GIVE ,PRSI ,PRSO>
	 <RTRUE>>

<ROUTINE V-SHAKE ()
	 <TELL "Shaken." CR>>

<ROUTINE V-SKIP ()
	 <TELL "Wheeeeeeee!!!" CR>>

<ROUTINE V-SMELL ()
	 <TELL "It smells like " A ,PRSO ,PERIOD-CR>>

<ROUTINE V-STAND ()
	 <COND (<FSET? <LOC ,WINNER> ,VEHBIT>
		<PERFORM ,V?DISEMBARK <LOC ,WINNER>>
		<RTRUE>)
	       (T
		<TELL ,LOOK-AROUND>)>>

<ROUTINE V-STRIKE ()
	 <COND (<FSET? ,PRSO ,ACTORBIT>
		<PERFORM ,V?ATTACK ,PRSO ,HANDS>)
	       (T
		<PERFORM ,V?LAMP-ON ,PRSO>)>
	 <RTRUE>>

<ROUTINE V-SWIM ()
	 <TELL "Swimming isn't usually allowed in the ">
	 <COND (<NOT <EQUAL? ,PRSO <> ,WATER ,GLOBAL-WATER>>
		<TELL D ,PRSO ".">)
	       (T
		<TELL "dungeon.">)>
	 <CRLF>>

<ROUTINE V-SWING ()
	 <COND (<NOT ,PRSI>
		<TELL "Whoosh!" CR>)
	       (T
		<PERFORM ,V?ATTACK ,PRSI ,PRSO>)>>

<ROUTINE PRE-TAKE ()
	 <COND (<IN? ,PRSO ,WINNER>
		<TELL "You already have that!" CR>)
	       (<AND <FSET? <LOC ,PRSO> ,CONTBIT>
		     <NOT <FSET? <LOC ,PRSO> ,OPENBIT>>>
		<TELL "You can't reach into a closed container." CR>)
	       (,PRSI
		<COND (<OR <EQUAL? ,PRSI ,GROUND>
		           <EQUAL? ,PRSO ,DOOR-KEEPER>>
		       <SETG PRSI <>>
		       <RFALSE>)
		      (<NOT <EQUAL? ,PRSI <LOC ,PRSO>>>
		       <TELL
"The " D ,PRSO " isn't in the " D ,PRSI ,PERIOD-CR>)
		      (T
		       <SETG PRSI <>>
		       <RFALSE>)>)
	       (<EQUAL? ,PRSO <LOC ,WINNER>>
		<TELL "You're in it!" CR>)>>

<ROUTINE V-TAKE ()
	 <COND (<EQUAL? <ITAKE> T>
		<TELL "Taken." CR>)>>

<ROUTINE V-TELL ()
	 <COND (<FSET? ,PRSO ,ACTORBIT>
		<COND (,P-CONT
		       <SETG WINNER ,PRSO>
		       <SETG HERE <LOC ,WINNER>>)
		      (T
		       <TELL
"The " D ,PRSO " pauses, thinking that you should reread the manual." CR>)>)
	       (T
		<TELL "You can't talk to the " D ,PRSO "!" CR>
		<SETG QUOTE-FLAG <>>
		<SETG P-CONT <>>
		<RFATAL>)>>

<ROUTINE V-THROW ()
	 <COND (<IDROP>
		<COND (<EQUAL? ,PRSI ,ME>
		       <SETG WINNER ,ADVENTURER>
		       <TELL "A terrific throw! The " D ,PRSO>
		       <TELL
" hits your head. By incredible mischance, you fall trying to duck and break
your neck, justice being swift and merciful in" ,GUE-NAME>
		       <JIGS-UP ".">)
		      (<AND ,PRSI <FSET? ,PRSI ,ACTORBIT>>
		       <TELL "The " D ,PRSI " ducks." CR>)
		      (T
		       <TELL "Thrown." CR>)>)>>

<ROUTINE V-THROW-OFF ()
	 <TELL "You can't throw anything off of that!" CR>>

<ROUTINE V-TIE ()
	 <TELL "You can't tie the " D ,PRSO " to that." CR>>

<ROUTINE V-TIE-UP ()
	 <TELL "You could certainly never tie it with that!" CR>>

<ROUTINE V-TURN ()
	 <TELL "You can't turn that!" CR>>

<ROUTINE V-UNLOCK ()
	 <V-LOCK>>

<ROUTINE V-UNTIE ()
	 <TELL "This cannot be tied, so it cannot be untied!" CR>>

<ROUTINE V-WAIT ("AUX" (NUM 3))
	 <TELL "Time passes..." CR>
	 <REPEAT ()
		 <COND (<L? <SET NUM <- .NUM 1>> 0>
			<RETURN>)
		       (<CLOCKER>
			<RETURN>)>>
	 <SETG CLOCK-WAIT T>>

<ROUTINE V-WALK ("AUX" PT PTS STR OBJ ;RM)
	 <COND (<NOT ,P-WALK-DIR>
		<PERFORM ,V?WALK-TO ,PRSO>
		<RTRUE>)
	       (<SET PT <GETPT ,HERE ,PRSO>>
		<COND (<EQUAL? <SET PTS <PTSIZE .PT>> ,UEXIT>
		       <GOTO <GETB .PT ,REXIT>>)
		      (<EQUAL? .PTS ,NEXIT>
		       <TELL <GET .PT ,NEXITSTR> CR>
		       <RFATAL>)
		      ;(<EQUAL? .PTS ,FEXIT>
		       <COND (<SET RM <APPLY <GET .PT ,FEXITFCN>>>
			      <GOTO .RM>)
			     (T
			      <RFATAL>)>)
		      (<EQUAL? .PTS ,CEXIT>
		       <COND (<VALUE <GETB .PT ,CEXITFLAG>>
			      <GOTO <GETB .PT ,REXIT>>)
			     (<SET STR <GET .PT ,CEXITSTR>>
			      <TELL .STR CR>
			      <RFATAL>)
			     (T
			      <TELL ,CANT-GO>
			      <RFATAL>)>)
		      (<EQUAL? .PTS ,DEXIT>
		       <COND (<FSET? <SET OBJ <GETB .PT ,DEXITOBJ>> ,OPENBIT>
			      <GOTO <GETB .PT ,REXIT>>)
			     (<SET STR <GET .PT ,DEXITSTR>>
			      <TELL .STR CR>
			      <RFATAL>)
			     (T
			      <TELL "The " D .OBJ ,IS-CLOSED>
			      <SETG P-IT-OBJECT .OBJ>
			      <RFATAL>)>)>)
	       (<AND <NOT ,LIT>
		     <PROB 80>
		     <EQUAL? ,WINNER ,ADVENTURER>
		     <NOT <FSET? ,HERE ,NONLANDBIT>>>
		<JIGS-UP
"Oh, no! You have walked into the slavering fangs of a lurking grue!">)
	       (T
		<TELL ,CANT-GO>
		<RFATAL>)>>

<ROUTINE V-WALK-AROUND ()
	 <TELL "Use compass directions for movement." CR>>

<ROUTINE V-WALK-TO ()
	 <COND (<AND ,PRSO
		     <OR <IN? ,PRSO ,HERE>
			 <GLOBAL-IN? ,PRSO ,HERE>>>
		<TELL "It's here!" CR>)
	       (T
		<V-WALK-AROUND>)>>

<ROUTINE V-WAVE ()
	 <HACK-HACK "Waving the ">>

<ROUTINE V-YELL ()
	 <TELL "Aaaarrrrgggghhhh!" CR>>

<ROUTINE V-ZORK ()
	 <TELL "At your service!" CR>>

;"describers"

<GLOBAL INDENTS
	<TABLE ""
	       "  "
	       "    "
	       "      "
	       "        "
	       "          ">>

<GLOBAL LIT <>>

<ROUTINE DESCRIBE-ROOM ("OPTIONAL" (LOOK? <>) "AUX" V? STR AV)
	 <SET AV <LOC ,WINNER>>
	 <SET V? <OR .LOOK? ,VERBOSE>>
	 <COND (<NOT ,LIT>
		<TELL
"It is pitch black. You are likely to be eaten by a grue." CR>
		<RFALSE>)>
	 <COND (<NOT <FSET? ,HERE ,TOUCHBIT>>
		<FSET ,HERE ,TOUCHBIT>
		<SET V? T>)>
	 <COND (<IN? ,HERE ,ROOMS>
		<TELL D ,HERE>
		<COND (<FSET? .AV ,VEHBIT>
		       <TELL ", in the " D .AV>)>
		<CRLF>)>
	 <COND (<OR .LOOK?
		    <NOT ,SUPER-BRIEF>
		    <EQUAL? ,HERE ,ZORK3>>
		<COND (<AND .V? <APPLY <GETP ,HERE ,P?ACTION> ,M-LOOK>>
		       T) ;"Was RTRUE but that blocks subsequent descriptions."
		      (<AND .V? <SET STR <GETP ,HERE ,P?LDESC>>>
		       <TELL .STR CR>)
		      (T
		       <APPLY <GETP ,HERE ,P?ACTION> ,M-FLASH>)>
		<COND (<AND <NOT <EQUAL? ,HERE .AV>>
			    <FSET? .AV ,VEHBIT>>
		       <APPLY <GETP .AV ,P?ACTION> ,M-LOOK>)>
		<COND (<AND .V? <FSET? ,HERE ,RMUNGBIT>>
		       <TELL
"The room is cluttered with debris from an explosion. The walls seem ready
to collapse." CR>)>)>>

<ROUTINE DESCRIBE-OBJECTS ("OPTIONAL" (V? <>))
	<COND (<FIRST? ,HERE>
	       <PRINT-CONT ,HERE <SET V? <OR .V? ,VERBOSE>> -1>)>>

"DESCRIBE-OBJECT -- takes object and flag.  if flag is true will print a
long description (fdesc or ldesc), otherwise will print short."

<ROUTINE DESCRIBE-OBJECT (OBJ V? LEVEL "AUX" (STR <>) (PERIOD? <>))
	 <COND (<AND <0? .LEVEL>
		     <APPLY <GETP .OBJ ,P?DESCFCN> ,M-OBJDESC>>
		<RTRUE>)
	       (<AND <0? .LEVEL>
		     <OR <AND <NOT <FSET? .OBJ ,TOUCHBIT>>
			      <SET STR <GETP .OBJ ,P?FDESC>>>
			 <SET STR <GETP .OBJ ,P?LDESC>>>>
		<TELL .STR>)
	       (<0? .LEVEL>
		<TELL "There is " A .OBJ " here">
		<COND (<FSET? .OBJ ,ONBIT>
		       <TELL ,PROVIDING-LIGHT>)>
		<SET PERIOD? T>)
	       (T
		<TELL <GET ,INDENTS .LEVEL>>
		<TELL CA .OBJ>
		<COND (<FSET? .OBJ ,ONBIT>
		       <TELL ,PROVIDING-LIGHT>)>)>
	 <COND (<AND <EQUAL? .OBJ ,SPELL-VICTIM>
		     <EQUAL? ,SPELL-USED ,W?FLOAT>>
		<TELL " (floating in midair)">)>
	 <COND (.PERIOD?
		<TELL ".">)>
	 <CRLF>
	 <COND (<AND <SEE-INSIDE? .OBJ>
		     <FIRST? .OBJ>>
		<PRINT-CONT .OBJ .V? .LEVEL>)>>

<ROUTINE PRINT-CONTENTS (OBJ "AUX" F N (1ST? T) (IT? <>) (TWO? <>))
	 <COND (<SET F <FIRST? .OBJ>>
		<REPEAT ()
			<SET N <NEXT? .F>>
			<COND (.1ST?
			       <SET 1ST? <>>)
			      (T
			       <TELL ", ">
			       <COND (<NOT .N>
				      <TELL "and ">)>)>
			<TELL A .F>
			<COND (<AND <NOT .IT?>
				    <NOT .TWO?>>
			       <SET IT? .F>)
			      (T
			       <SET TWO? T>
			       <SET IT? <>>)>
			<SET F .N>
			<COND (<NOT .F>
			       <COND (<AND .IT? <NOT .TWO?>>
				      <SETG P-IT-OBJECT .IT?>)>
			       <RTRUE>)>>)>>

<ROUTINE PRINT-CONT (OBJ "OPTIONAL" (V? <>) (LEVEL 0)
		     "AUX" Y 1ST? SHIT AV STR (PV? <>) (INV? <>))
	 <COND (<NOT <SET Y <FIRST? .OBJ>>>
		<RTRUE>)>
	 <COND (<AND <SET AV <LOC ,WINNER>>
		     <FSET? .AV ,VEHBIT>>
		T)
	       (T
		<SET AV <>>)>
	 <SET 1ST? T>
	 <SET SHIT T>
	 <COND (<EQUAL? ,WINNER .OBJ <LOC .OBJ>>
		<SET INV? T>)
	       (T
		<REPEAT ()
			<COND (<NOT .Y>
			       <RETURN>)
			      (<EQUAL? .Y .AV>
			       <SET PV? T>)
			      (<EQUAL? .Y ,WINNER>)
			      (<AND <NOT <FSET? .Y ,INVISIBLE>>
				    <NOT <FSET? .Y ,TOUCHBIT>>
				    <SET STR <GETP .Y ,P?FDESC>>>
			       <COND (<NOT <FSET? .Y ,NDESCBIT>>
				      <TELL .STR CR>
				      <SET SHIT <>>)>
			       <COND (<AND <SEE-INSIDE? .Y>
					   <NOT <GETP <LOC .Y> ,P?DESCFCN>>
					   <FIRST? .Y>>
				      <COND (<PRINT-CONT .Y .V? 0>
					     <SET 1ST? <>>)>)>)>
			<SET Y <NEXT? .Y>>>)>
	 <SET Y <FIRST? .OBJ>>
	 <REPEAT ()
		 <COND (<NOT .Y>
			<COND (<AND <0? .LEVEL>
				    <==? ,SPELL? ,S-FANTASIZE>
				    <PROB 20>>
			       <TELL "There is a "
				     <PICK-ONE ,FANTASIES> " here." CR>
			       <SET 1ST? <>>)>
			<COND (<AND .PV? .AV <FIRST? .AV>>
			       <SET LEVEL <+ .LEVEL 1>>
			       <PRINT-CONT .AV .V? .LEVEL>)>
			<RETURN>)
		       (<EQUAL? .Y .AV ,ADVENTURER>)
		       (<AND <NOT <FSET? .Y ,INVISIBLE>>
			     <OR .INV?
				 <FSET? .Y ,TOUCHBIT>
				 <NOT <GETP .Y ,P?FDESC>>>>
			<COND (<NOT <FSET? .Y ,NDESCBIT>>
			       <COND (.1ST?
				      <COND (<FIRSTER .OBJ .LEVEL>
					     <COND (<L? .LEVEL 0>
						    <SET LEVEL 0>)>)>
				      <SET LEVEL <+ 1 .LEVEL>>
				      <SET 1ST? <>>)>
			       <COND (<L? .LEVEL 0> <SET LEVEL 0>)>
			       <DESCRIBE-OBJECT .Y .V? .LEVEL>)
			      (<AND <FIRST? .Y>
				    <SEE-INSIDE? .Y>>
			       <PRINT-CONT .Y .V? .LEVEL>)>)>
		 <SET Y <NEXT? .Y>>>
	 <COND (<AND .1ST? .SHIT>
		<RFALSE>)
	       (T
		<RTRUE>)>>

<ROUTINE FIRSTER (OBJ LEVEL)
	 <COND (<EQUAL? .OBJ ,WINNER>
		<TELL "You have:" CR>)
	       (<NOT <IN? .OBJ ,ROOMS>>
		<COND (<G? .LEVEL 0>
		       <TELL <GET ,INDENTS .LEVEL>>)>
		<COND (<FSET? .OBJ ,SURFACEBIT>
		       <TELL "Sitting on the " D .OBJ " is:" CR>)
		      (<FSET? .OBJ ,ACTORBIT>
		       <TELL "The " D .OBJ " is holding:" CR>)
		      (T
		       <TELL "The " D .OBJ " contains:" CR>)>)>>

<ROUTINE SEE-INSIDE? (OBJ)
	 <AND <NOT <FSET? .OBJ ,INVISIBLE>>
	      <OR <FSET? .OBJ ,TRANSBIT> <FSET? .OBJ ,OPENBIT>>>>

;"(nothing is certain but) death and movement"

<GLOBAL DEAD <>>

<GLOBAL DEATHS 0>

<ROUTINE JIGS-UP (DESC "AUX" F N)
 	 <TELL .DESC CR>
	 <COND (<NOT <EQUAL? ,ADVENTURER ,WINNER>>
		<TELL "|    ****  The " D ,WINNER " has died  ****" CR>
		<REMOVE ,WINNER>
		<SETG WINNER ,ADVENTURER>
		<SETG HERE <LOC ,WINNER>>
		<RFATAL>)>
	 <SETG SCORE <- ,SCORE 10>>
	 <TELL "|    ****  You have died  ****" CR CR>
	 <SETG DEAD T>
	 <SETG SPELL? <>>
	 <PUTP ,ADVENTURER ,P?ACTION 0>
	 <SETG DEATHS <+ ,DEATHS 1>>
	 <MOVE ,WINNER ,HERE>
	 <FCLEAR ,DEAD-PALANTIR-1 ,TOUCHBIT>
	 <FCLEAR ,DEAD-PALANTIR-2 ,TOUCHBIT>
	 <FCLEAR ,DEAD-PALANTIR-3 ,TOUCHBIT>
	 <COND (<IN? ,LAMP ,WINNER>
		<MOVE ,LAMP ,INSIDE-THE-BARROW>)>
	 <SET N <FIRST? ,WINNER>>
	 <REPEAT ()
		 <SET F .N>
		 <COND (<NOT .F>
			<RETURN>)>
		 <SET N <NEXT? .F>>
		 <COND (<GETPT .F ,P?VALUE>
			<MOVE .F ,CAROUSEL-ROOM>)
		       (T
			<MOVE .F ,GAZEBO>)>>
	 <GOTO ,DEAD-PALANTIR-1>
	 <SETG P-CONT <>>
	 <DRAGON-LEAVES>
	 <RFATAL>>

<CONSTANT REXIT 0>
<CONSTANT UEXIT 1>
<CONSTANT NEXIT 2>
<CONSTANT FEXIT 3>
<CONSTANT CEXIT 4>
<CONSTANT DEXIT 5>

<CONSTANT NEXITSTR 0>
<CONSTANT FEXITFCN 0>
<CONSTANT CEXITFLAG 1>
<CONSTANT CEXITSTR 1>
<CONSTANT DEXITOBJ 1>
<CONSTANT DEXITSTR 1>

<ROUTINE GOTO (RM "OPTIONAL" (V? T)
	       "AUX" (LB <FSET? .RM ,RLANDBIT>) WLOC VEH? OLIT OHERE)
	 <SET WLOC <LOC ,WINNER>>
	 <SET VEH? <FSET? .WLOC ,VEHBIT>>
	 <SET OLIT ,LIT>
	 <SET OHERE ,HERE>
	 <COND (<AND <FSET? ,HERE ,RLANDBIT>
		     .VEH?
		     <NOT <FSET? .RM ,NONLANDBIT>>>
		<TELL "You can't go there in " A .WLOC ,PERIOD-CR>
		<RFALSE>)
	       (T
		<COND (.VEH?
		       <MOVE .WLOC .RM>)
		      (T
		       <MOVE ,WINNER .RM>)>
		<SETG HERE .RM>
		<SETG LIT <LIT? ,HERE>>
		<COND (<AND <NOT .OLIT>
			    <NOT ,LIT>
			    <PROB 80>>
		       <TELL "Oh, no! A lurking grue slithered into the ">
		       <COND (.VEH?
			      <TELL D <LOC ,WINNER>>)
			     (T
			      <TELL "room">)>
		       <JIGS-UP " and devoured you!">
		       <RTRUE>)>
		<COND (<AND <NOT ,LIT>
			    <EQUAL? ,WINNER ,ADVENTURER>>
		       <TELL "You have moved into a dark place." CR>
		       <SETG P-CONT <>>)>
		<APPLY <GETP ,HERE ,P?ACTION> ,M-ENTER>
		<SCORE-OBJ .RM>
		<COND (<NOT <EQUAL? ,HERE .RM>> <RTRUE>)
		      (<AND <NOT <EQUAL? ,ADVENTURER ,WINNER>>
			    <IN? ,ADVENTURER .OHERE>>
		       <TELL "The " D ,WINNER " leaves the room." CR>)
		      (<AND .V?
			    <EQUAL? ,WINNER ,ADVENTURER>>
		       <DESCRIBE-ROOM>
		       <COND (<AND ,LIT
				   <NOT ,SUPER-BRIEF>>
			      <DESCRIBE-OBJECTS>)>)>
		<RTRUE>)>>

;"object manipulation"

<GLOBAL FUMBLE-NUMBER 7>

<GLOBAL FUMBLE-PROB 8>

<GLOBAL LOAD-ALLOWED 100>

<ROUTINE ITAKE ("OPTIONAL" (VB T) "AUX" CNT)
	 <COND (<NOT <FSET? ,PRSO ,TAKEBIT>>
		<COND (.VB
		       <TELL <PICK-ONE ,YUKS> CR>)>
		<RFALSE>)
	       (<AND <EQUAL? ,PRSO ,SPELL-VICTIM>
		     <EQUAL? ,SPELL-USED ,W?FLOAT ,W?FREEZE>>
		<COND (<EQUAL? ,SPELL-USED ,W?FLOAT>
		       <TELL
"You can't reach that. It's floating above your head." CR>)
		      (T
		       <TELL "It seems rooted to the spot." CR>)>
		<RFALSE>)
	       (<AND <FSET? <LOC ,PRSO> ,CONTBIT>
		     <NOT <FSET? <LOC ,PRSO> ,OPENBIT>>>
		;"Kludge for parser calling itake"
		<RFALSE>)
	       (<AND <NOT <IN? <LOC ,PRSO> ,WINNER>>
		     <G? <+ <WEIGHT ,PRSO> <WEIGHT ,WINNER>> ,LOAD-ALLOWED>>
		<COND (.VB
		       <TELL "Your load is too heavy">
		       <COND (<L? ,LOAD-ALLOWED 100>
			      <TELL", especially in light of your condition.">)
			     (T
			      <TELL ".">)>
		       <CRLF>)>
		<RFATAL>)
	       (<AND <VERB? TAKE>
		     <G? <SET CNT <CCOUNT ,WINNER>> ,FUMBLE-NUMBER>
		     <PROB <* .CNT ,FUMBLE-PROB>>>
		<TELL "You're holding too many things already!" CR>
		<RFALSE>)
	       (T
		<MOVE ,PRSO ,WINNER>
		<FCLEAR ,PRSO ,NDESCBIT>
		<FSET ,PRSO ,TOUCHBIT>
		<SCORE-OBJ ,PRSO>
		<RTRUE>)>>

<ROUTINE IDROP ()
	 <COND (<AND <NOT <IN? ,PRSO ,WINNER>>
		     <NOT <IN? <LOC ,PRSO> ,WINNER>>>
		<TELL "You're not carrying the " D ,PRSO ,PERIOD-CR>
		<RFALSE>)
	       (<AND <NOT <IN? ,PRSO ,WINNER>>
		     <NOT <FSET? <LOC ,PRSO> ,OPENBIT>>>
		<TELL "The " D ,PRSO ,IS-CLOSED>
		<RFALSE>)
	       (T
		<MOVE ,PRSO <LOC ,WINNER>>
		<RTRUE>)>>

<ROUTINE CCOUNT (OBJ "AUX" (CNT 0) X)
	 <COND (<SET X <FIRST? .OBJ>>
		<REPEAT ()
		     <SET CNT <+ .CNT 1>>
		     <COND (<NOT <SET X <NEXT? .X>>>
			    <RETURN>)>>)>
	 .CNT>

<ROUTINE WEIGHT (OBJ "AUX" CONT (WT 0))
	 <COND (<SET CONT <FIRST? .OBJ>>
		<REPEAT ()
			<SET WT <+ .WT <WEIGHT .CONT>>>
			<COND (<NOT <SET CONT <NEXT? .CONT>>>
			       <RETURN>)>>)>
	 <+ .WT <GETP .OBJ ,P?SIZE>>>
