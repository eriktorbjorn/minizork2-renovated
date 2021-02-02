"SYNTAX for
	        Mini-Zork II: The Wizard of Frobozz
	(c) Copyright 1988 Infocom, Inc.  All Rights Reserved."

"Buzzwords, Prepositions and Directions"

<BUZZ A AN THE IS AND OF THEN ALL ONE BUT EXCEPT \. \, \" YES NO Y HERE
      FEEBLE FUMBLE FREEZE FALL FRY FLUORESCE FERMENT FLOAT FIREPROOF
      FENCE FUDGE FANTASIZE AGAIN G OOPS>

<SYNONYM WITH USING THROUGH THRU>
<SYNONYM IN INSIDE INTO>
<SYNONYM ON ONTO>
<SYNONYM UNDER UNDERNEATH BENEATH BELOW>

<SYNONYM NORTH N>
<SYNONYM SOUTH S>
<SYNONYM EAST E>
<SYNONYM WEST W>
<SYNONYM DOWN D>
<SYNONYM UP U>
<SYNONYM NW NORTHWEST>
<SYNONYM NE NORTHE>
<SYNONYM SW SOUTHWEST>
<SYNONYM SE SOUTHE>
\^L
"Game Commands"

<SYNTAX VERBOSE = V-VERBOSE>

<SYNTAX BRIEF = V-BRIEF>

<SYNTAX SUPER = V-SUPER-BRIEF>
<SYNONYM SUPER SUPERBRIEF>

<SYNTAX DIAGNOSE = V-DIAGNOSE>

<SYNTAX INVENTORY = V-INVENTORY>
<SYNONYM INVENTORY I>

<SYNTAX QUIT = V-QUIT>
<SYNONYM QUIT Q>

<SYNTAX RESTART = V-RESTART>

<SYNTAX RESTORE = V-RESTORE>

<SYNTAX SAVE = V-SAVE>

<SYNTAX SCORE = V-SCORE>

<SYNTAX SCRIPT = V-SCRIPT>

<SYNTAX UNSCRIPT = V-UNSCRIPT>

<SYNTAX VERSION = V-VERSION>

<SYNTAX $VERIFY = V-VERIFY>

<SYNTAX \#RANDOM OBJECT = V-RANDOM>

<SYNTAX \#COMMAND = V-COMMAND-FILE>

<SYNTAX \#RECORD = V-RECORD>

<SYNTAX \#UNRECORD = V-UNRECORD>

;<SYNTAX DEBUG = V-DEBUG>
\^L
"Real Verbs"

<SYNTAX ATTACK OBJECT (FIND ACTORBIT) (ON-GROUND IN-ROOM) = V-ATTACK>
<SYNTAX ATTACK OBJECT (FIND ACTORBIT) (ON-GROUND IN-ROOM) WITH OBJECT
	(HELD CARRIED HAVE) = V-ATTACK>
<SYNONYM ATTACK FIGHT HIT KILL MURDER SLAY STAB>

<SYNTAX BLOW OBJECT = V-BLAST>
<SYNTAX BLOW OUT OBJECT = V-LAMP-OFF>
<SYNTAX BLOW UP	OBJECT WITH OBJECT (FIND TOOLBIT) = V-INFLATE>
<SYNTAX BLOW UP OBJECT = V-BLAST>
<SYNONYM BLOW BLAST>

<SYNTAX BURN OBJECT (FIND BURNBIT) WITH OBJECT (FIND FLAMEBIT) (HAVE)
	= V-BURN PRE-BURN>
<SYNTAX BURN DOWN OBJECT (FIND BURNBIT) WITH OBJECT (FIND FLAMEBIT) (HAVE)
	= V-BURN PRE-BURN>
<SYNONYM BURN IGNITE>

<SYNTAX CLIMB UP OBJECT (FIND RLANDBIT) = V-CLIMB>
<SYNTAX CLIMB DOWN OBJECT (FIND RLANDBIT) = V-CLIMB-DOWN>
<SYNTAX CLIMB OBJECT (FIND CLIMBBIT) (ON-GROUND IN-ROOM) = V-CLIMB>
<SYNTAX CLIMB IN OBJECT (FIND VEHBIT) (ON-GROUND IN-ROOM) = V-ENTER PRE-ENTER>
<SYNTAX CLIMB ON OBJECT (FIND VEHBIT) (ON-GROUND IN-ROOM) = V-CLIMB-ON>
<SYNONYM CLIMB SIT>	

<SYNTAX CLOSE OBJECT (FIND DOORBIT) (HELD CARRIED ON-GROUND IN-ROOM) = V-CLOSE>

<SYNTAX COMMAND OBJECT (FIND ACTORBIT) = V-COMMAND>

<SYNTAX COUNT OBJECT = V-COUNT>

<SYNTAX CROSS OBJECT = V-WALK-AROUND>
<SYNONYM CROSS FORD>

<SYNTAX CUT OBJECT WITH OBJECT (FIND WEAPONBIT) (CARRIED HELD) = V-CUT>
<SYNONYM CUT SLICE>

<SYNTAX CURSE = V-CURSES>
<SYNTAX CURSE OBJECT (FIND ACTORBIT) = V-CURSES>
<SYNONYM CURSE SHIT FUCK DAMN>

<SYNTAX DEFLATE OBJECT = V-DEFLATE>

<SYNTAX DESTROY OBJECT WITH OBJECT (HELD CARRIED TAKE)	= V-MUNG PRE-MUNG>
<SYNTAX DESTROY DOWN OBJECT WITH OBJECT (HELD CARRIED TAKE) = V-MUNG PRE-MUNG>
<SYNONYM DESTROY BREAK SMASH>

<SYNTAX DISEMBARK OBJECT (FIND VEHBIT) (ON-GROUND IN-ROOM) = V-DISEMBARK>

<SYNTAX DISENCHANT OBJECT = V-DISENCHANT>

<SYNTAX DRINK OBJECT (FIND DRINKBIT) = V-DRINK>
<SYNTAX DRINK FROM OBJECT (HELD CARRIED) = V-DRINK-FROM>

<SYNTAX DROP OBJECT (HELD MANY HAVE) = V-DROP PRE-DROP>
<SYNTAX DROP OBJECT (HELD MANY HAVE) DOWN OBJECT = V-PUT PRE-PUT>
<SYNTAX DROP OBJECT (HELD MANY HAVE) IN OBJECT = V-PUT PRE-PUT>
<SYNTAX DROP OBJECT (HELD MANY HAVE) ON OBJECT = V-PUT-ON PRE-PUT>

<SYNTAX EAT OBJECT (FIND FOODBIT) (HAVE TAKE) = V-EAT>
<SYNONYM EAT TASTE BITE>

<SYNTAX ENCHANT OBJECT (ON-GROUND IN-ROOM) = V-ENCHANT>

<SYNTAX ENTER = V-ENTER PRE-ENTER>
<SYNTAX ENTER OBJECT (FIND VEHBIT) (ON-GROUND IN-ROOM) = V-ENTER PRE-ENTER>
<SYNONYM ENTER BOARD>

<SYNTAX EXAMINE OBJECT (MANY) = V-EXAMINE>
<SYNTAX EXAMINE IN OBJECT (MANY) = V-LOOK-INSIDE>
<SYNTAX EXAMINE ON OBJECT (MANY) = V-LOOK-INSIDE>
<SYNONYM EXAMINE DESCRIBE WHAT WHATS>

<SYNTAX EXIT = V-EXIT>
<SYNTAX EXIT OBJECT = V-EXIT>

<SYNTAX EXTINGUISH OBJECT (FIND ONBIT) (TAKE HAVE) = V-LAMP-OFF>
<SYNONYM EXTINGUISH DOUSE>

<SYNTAX FILL OBJECT (FIND CONTBIT) WITH OBJECT = V-FILL PRE-FILL>
<SYNTAX FILL OBJECT (FIND CONTBIT) = V-FILL PRE-FILL>

<SYNTAX FIND OBJECT = V-FIND>
<SYNONYM FIND WHERE>

<SYNTAX FOLLOW = V-FOLLOW>
<SYNTAX FOLLOW OBJECT = V-FOLLOW>
<SYNONYM FOLLOW CHASE>

<SYNTAX GIVE OBJECT (MANY HELD HAVE) TO OBJECT (FIND ACTORBIT) (ON-GROUND)
	= V-GIVE PRE-GIVE>
<SYNTAX GIVE OBJECT (FIND ACTORBIT) (ON-GROUND) OBJECT (MANY HELD HAVE)
	= V-SGIVE>
<SYNONYM GIVE OFFER FEED>

<SYNTAX HELLO = V-HELLO>
<SYNTAX HELLO OBJECT = V-HELLO>
<SYNONYM HELLO HI>

<SYNTAX INCANT = V-INCANT>
<SYNONYM INCANT CHANT>

<SYNTAX INFLAT OBJECT WITH OBJECT (FIND TOOLBIT) = V-INFLATE>

<SYNTAX JUMP = V-LEAP>
<SYNTAX JUMP OVER OBJECT = V-LEAP>
<SYNTAX JUMP ACROSS OBJECT = V-LEAP>
<SYNTAX JUMP IN OBJECT = V-LEAP>
<SYNTAX JUMP FROM OBJECT = V-LEAP>
<SYNTAX JUMP OFF OBJECT = V-LEAP>
<SYNONYM JUMP LEAP DIVE>

<SYNTAX KICK OBJECT = V-KICK>

<SYNTAX KISS OBJECT (FIND ACTORBIT) (ON-GROUND IN-ROOM) = V-KISS>

<SYNTAX KNOCK AT OBJECT = V-KNOCK>
<SYNTAX KNOCK ON OBJECT = V-KNOCK>
<SYNTAX KNOCK DOWN OBJECT (FIND ACTORBIT) (ON-GROUND IN-ROOM) = V-ATTACK>
<SYNONYM KNOCK RAP>

<SYNTAX LAUNCH OBJECT (FIND VEHBIT) = V-LAUNCH>

<SYNTAX LEAVE = V-LEAVE>
<SYNTAX LEAVE OBJECT = V-DROP PRE-DROP>

<SYNTAX LIGHT OBJECT (FIND LIGHTBIT) (TAKE HAVE) = V-LAMP-ON>
<SYNTAX LIGHT OBJECT (FIND LIGHTBIT) WITH OBJECT (FIND FLAMEBIT)
	(HELD CARRIED TAKE HAVE) = V-BURN PRE-BURN>

<SYNTAX LISTEN TO OBJECT = V-LISTEN>

<SYNTAX LOCK OBJECT (ON-GROUND IN-ROOM)	WITH OBJECT (FIND TOOLBIT) (TAKE)
	= V-LOCK>

<SYNTAX LOOK = V-LOOK>
<SYNTAX LOOK AROUND OBJECT (FIND RLANDBIT) = V-LOOK>
<SYNTAX LOOK UP OBJECT (FIND RLANDBIT) = V-LOOK>
<SYNTAX LOOK DOWN OBJECT (FIND RLANDBIT) = V-LOOK>
<SYNTAX LOOK AT OBJECT (MANY) = V-EXAMINE>
<SYNTAX LOOK ON OBJECT = V-LOOK-INSIDE>
<SYNTAX LOOK WITH OBJECT (MANY) = V-LOOK-INSIDE>
<SYNTAX LOOK UNDER OBJECT = V-LOOK-UNDER>
<SYNTAX LOOK BEHIND OBJECT = V-LOOK-BEHIND>
<SYNTAX LOOK IN OBJECT (MANY) = V-LOOK-INSIDE>
<SYNTAX LOOK FOR OBJECT = V-FIND>
<SYNONYM LOOK L>

<SYNTAX LOWER OBJECT = V-LOWER>

<SYNTAX MELT OBJECT WITH OBJECT (FIND FLAMEBIT) = V-MELT>

<SYNTAX MOVE OBJECT (ON-GROUND IN-ROOM) = V-MOVE>
<SYNTAX MOVE OBJECT (HELD MANY HAVE) IN OBJECT = V-PUT PRE-PUT>
<SYNTAX MOVE OBJECT WITH OBJECT (FIND TOOLBIT) = V-TURN>
<SYNONYM MOVE ROLL>

<SYNTAX OPEN OBJECT (FIND DOORBIT) = V-OPEN>
<SYNTAX OPEN UP	OBJECT (FIND DOORBIT) = V-OPEN>
<SYNTAX OPEN OBJECT (FIND DOORBIT) WITH	OBJECT (FIND TOOLBIT) (HAVE) = V-OPEN>

<SYNTAX PICK OBJECT = V-PICK>
<SYNTAX PICK OBJECT WITH OBJECT = V-PICK>
<SYNTAX PICK UP	OBJECT (FIND TAKEBIT) (ON-GROUND MANY) = V-TAKE PRE-TAKE>

<SYNTAX PLAY OBJECT = V-PLAY>

<SYNTAX POKE OBJECT (FIND ACTORBIT) (ON-GROUND IN-ROOM)
	WITH OBJECT (FIND WEAPONBIT) (HELD CARRIED HAVE) = V-MUNG PRE-MUNG>
<SYNONYM POKE PUNCTURE>

<SYNTAX POUR OBJECT (HELD CARRIED) = V-DROP PRE-DROP>
<SYNTAX POUR OBJECT (HELD CARRIED) IN OBJECT = V-DROP PRE-DROP>
<SYNTAX POUR OBJECT (HELD CARRIED) ON OBJECT = V-POUR-ON>
<SYNTAX POUR OBJECT (HELD CARRIED) FROM OBJECT = V-DROP PRE-DROP>
<SYNONYM POUR SPILL>

<SYNTAX PULL OBJECT (ON-GROUND IN-ROOM) = V-MOVE>
<SYNTAX PULL ON OBJECT (ON-GROUND IN-ROOM) = V-MOVE>
<SYNTAX PULL UP OBJECT (ON-GROUND IN-ROOM) = V-MOVE>
<SYNONYM PULL TUG YANK>

<SYNTAX PUSH OBJECT (IN-ROOM ON-GROUND MANY) = V-PUSH>
<SYNTAX PUSH ON OBJECT (IN-ROOM ON-GROUND MANY) = V-PUSH>
<SYNTAX PUSH OBJECT WITH OBJECT (FIND TOOLBIT) = V-TURN>
<SYNTAX PUSH OBJECT UNDER OBJECT = V-PUT-UNDER>
<SYNONYM PUSH PRESS>

<SYNTAX PUT OBJECT (HELD MANY HAVE) IN OBJECT = V-PUT PRE-PUT>
<SYNTAX PUT OBJECT (HELD MANY HAVE) ON OBJECT = V-PUT-ON PRE-PUT>
<SYNTAX PUT DOWN OBJECT (HELD MANY) = V-DROP PRE-DROP>
<SYNTAX PUT OBJECT (HELD HAVE) UNDER OBJECT = V-PUT-UNDER> 
<SYNTAX PUT OUT OBJECT (FIND ONBIT) (TAKE HAVE) = V-LAMP-OFF>
<SYNONYM PUT INSERT PLACE HIDE>

<SYNTAX RAISE OBJECT = V-RAISE>
<SYNTAX RAISE UP OBJECT = V-RAISE>
<SYNONYM RAISE LIFT>

<SYNTAX RAPE OBJECT (FIND ACTORBIT) = V-RAPE>
<SYNONYM RAPE MOLEST>

<SYNTAX READ OBJECT (FIND READBIT) (TAKE) = V-READ PRE-READ>
<SYNTAX READ FROM OBJECT (FIND READBIT) (TAKE) = V-READ PRE-READ>
<SYNONYM READ SKIM>

<SYNTAX RUB OBJECT = V-RUB>
<SYNTAX RUB OBJECT WITH OBJECT = V-RUB>
<SYNONYM RUB TOUCH FEEL PAT PET>

<SYNTAX SAY = V-SAY>
<SYNTAX SAY OBJECT = V-SAY>
<SYNONYM SAY ANSWER REPLY>

<SYNTAX SEARCH OBJECT = V-SEARCH>
<SYNTAX SEARCH IN OBJECT = V-SEARCH>
<SYNTAX SEARCH FOR OBJECT = V-FIND>

<SYNTAX SHAKE OBJECT (HAVE) = V-SHAKE>

<SYNTAX SKIP = V-SKIP>
<SYNONYM SKIP HOP>

<SYNTAX SLIDE OBJECT UNDER OBJECT = V-PUT-UNDER>

<SYNTAX SMELL OBJECT = V-SMELL>

<SYNTAX STAND = V-STAND>
<SYNTAX STAND UP OBJECT (FIND RLANDBIT) = V-STAND>

<SYNTAX STRIKE OBJECT (FIND ACTORBIT) (ON-GROUND IN-ROOM) WITH OBJECT
	(FIND WEAPONBIT) (HAVE) = V-ATTACK>
<SYNTAX STRIKE OBJECT = V-STRIKE>

<SYNTAX SWIM = V-SWIM>
<SYNTAX SWIM IN OBJECT = V-SWIM>
<SYNTAX SWIM ACROSS OBJECT = V-SWIM>
<SYNONYM SWIM WADE>

<SYNTAX SWING OBJECT (FIND WEAPONBIT) (HELD CARRIED HAVE) = V-SWING>
<SYNTAX SWING OBJECT (FIND WEAPONBIT) (HELD CARRIED HAVE)
	AT OBJECT (FIND ACTORBIT) (ON-GROUND IN-ROOM) = V-SWING>
<SYNONYM SWING THRUST>

<SYNTAX TAKE OBJECT (FIND TAKEBIT) (ON-GROUND IN-ROOM MANY) = V-TAKE PRE-TAKE>
<SYNTAX TAKE IN OBJECT (FIND VEHBIT) (ON-GROUND IN-ROOM) = V-ENTER PRE-ENTER>
<SYNTAX TAKE OUT OBJECT (FIND RLANDBIT) (ON-GROUND IN-ROOM) = V-DISEMBARK>
<SYNTAX TAKE ON OBJECT (FIND VEHBIT) (ON-GROUND IN-ROOM) = V-CLIMB-ON>
<SYNTAX TAKE UP OBJECT (FIND RLANDBIT) = V-STAND>
<SYNTAX TAKE OBJECT (FIND TAKEBIT) (CARRIED IN-ROOM MANY) OUT OBJECT
	= V-TAKE PRE-TAKE>
<SYNTAX TAKE OBJECT (FIND TAKEBIT) (CARRIED IN-ROOM MANY) OFF OBJECT
	= V-TAKE PRE-TAKE>
<SYNTAX TAKE OBJECT (FIND TAKEBIT) (IN-ROOM CARRIED MANY) FROM OBJECT
	= V-TAKE PRE-TAKE>
<SYNONYM TAKE GET HOLD CARRY REMOVE GRAB CATCH>

<SYNTAX TALK TO OBJECT (FIND ACTORBIT) (IN-ROOM) = V-TELL>

<SYNTAX TELL OBJECT (FIND ACTORBIT) (IN-ROOM) = V-TELL>
<SYNTAX TELL OBJECT (FIND ACTORBIT) (IN-ROOM) ABOUT OBJECT = V-TELL>
<SYNONYM TELL ASK>

<SYNTAX THROW OBJECT (HELD CARRIED HAVE) AT OBJECT (FIND ACTORBIT)
	(ON-GROUND IN-ROOM) = V-THROW>
<SYNTAX THROW OBJECT (HELD CARRIED HAVE) WITH OBJECT (FIND ACTORBIT)
	(ON-GROUND IN-ROOM) = V-THROW>
<SYNTAX THROW OBJECT (HELD CARRIED HAVE) IN OBJECT = V-PUT PRE-PUT>
<SYNTAX THROW OBJECT (HELD CARRIED HAVE) ON OBJECT = V-PUT-ON PRE-PUT>
<SYNTAX THROW OBJECT (HELD CARRIED HAVE) OFF OBJECT = V-THROW-OFF>
<SYNTAX THROW OBJECT (HELD CARRIED HAVE) OVER OBJECT = V-THROW-OFF>
<SYNONYM THROW HURL TOSS>

<SYNTAX TIE OBJECT TO OBJECT = V-TIE>
<SYNTAX TIE UP OBJECT (FIND ACTORBIT) (ON-GROUND IN-ROOM) WITH OBJECT
	(FIND TOOLBIT) (HAVE) = V-TIE-UP>
<SYNONYM TIE FASTEN SECURE ATTACH>

<SYNTAX TURN OBJECT WITH OBJECT = V-TURN>
<SYNTAX TURN ON	OBJECT (FIND LIGHTBIT) = V-LAMP-ON>
<SYNTAX TURN ON OBJECT WITH OBJECT (HAVE) = V-LAMP-ON>
<SYNTAX TURN OFF OBJECT (FIND ONBIT) (TAKE HAVE) = V-LAMP-OFF>
<SYNONYM TURN SHUT>

<SYNTAX UNLOCK OBJECT (ON-GROUND IN-ROOM) WITH OBJECT (FIND TOOLBIT) (TAKE)
	= V-UNLOCK>

<SYNTAX UNTIE OBJECT = V-UNTIE>
<SYNTAX UNTIE OBJECT FROM OBJECT = V-UNTIE>
<SYNONYM UNTIE FREE RELEASE UNFASTEN UNATTACH UNHOOK>

<SYNTAX WAIT = V-WAIT>
<SYNONYM WAIT Z>

<SYNTAX WAKE OBJECT (FIND ACTORBIT) (ON-GROUND IN-ROOM) = V-ALARM>
<SYNTAX WAKE UP OBJECT (FIND ACTORBIT) (ON-GROUND IN-ROOM) = V-ALARM>
<SYNONYM WAKE AWAKE>

<SYNTAX WALK = V-WALK-AROUND>
<SYNTAX WALK OBJECT = V-WALK>
<SYNTAX WALK AWAY OBJECT = V-WALK>
<SYNTAX WALK IN OBJECT (FIND VEHBIT) (ON-GROUND IN-ROOM) = V-ENTER PRE-ENTER>
<SYNTAX WALK WITH OBJECT (FIND VEHBIT) (ON-GROUND IN-ROOM) = V-ENTER PRE-ENTER>
<SYNTAX WALK ON OBJECT (FIND VEHBIT) (ON-GROUND IN-ROOM) = V-ENTER PRE-ENTER>
<SYNTAX WALK OVER OBJECT = V-LEAP>
<SYNTAX WALK TO OBJECT = V-WALK-TO>
<SYNTAX WALK AROUND OBJECT (FIND RLANDBIT) = V-WALK-AROUND>
<SYNTAX WALK UP OBJECT (FIND CLIMBBIT) (ON-GROUND IN-ROOM) = V-CLIMB>
<SYNTAX WALK DOWN OBJECT (FIND CLIMBBIT) (ON-GROUND IN-ROOM) = V-CLIMB-DOWN>
<SYNONYM WALK GO RUN PROCEED STEP>

<SYNTAX WAVE OBJECT (HELD CARRIED TAKE HAVE) = V-WAVE>
<SYNTAX WAVE OBJECT (HELD CARRIED TAKE HAVE) AT OBJECT = V-WAVE>
<SYNTAX WAVE AT OBJECT = V-WAVE>
<SYNONYM WAVE POINT>

<SYNTAX YELL = V-YELL>
<SYNONYM YELL SCREAM SHOUT>

<SYNTAX ZORK = V-ZORK>
