"VOLCANO for
	        Mini-Zork II: The Wizard of Frobozz
	(c) Copyright 1988 Infocom, Inc.  All Rights Reserved."

<GLOBAL BALLOON-TIED <>>

<GLOBAL BALLOON-INFLATED <>>

<GLOBAL LABEL-REVEALED <>>

<ROOM VOLCANO-BOTTOM
      (IN ROOMS)
      (DESC "Volcano Bottom")
      (LDESC
"You are at the base of a dormant volcano. High above, light enters the
cone of the volcano. The only exit is east.")
      (EAST TO ICE-ROOM)
      (FLAGS RLANDBIT NONLANDBIT)>

<OBJECT RUBY
	(IN VOLCANO-BOTTOM)
	(DESC "ruby")
	(LDESC "On the floor lies a moby ruby.")
	(SYNONYM RUBY TREASURE)
	(ADJECTIVE MOBY)
	(VALUE 15)
	(FLAGS TAKEBIT)>

<GLOBAL BALLOON-LOC VOLCANO-BOTTOM> ;"balloon location"

<OBJECT BALLOON
	(IN VOLCANO-BOTTOM)
	(DESC "basket")
	(SYNONYM BALLOON BASKET)
	(ADJECTIVE WICKER)
	(CAPACITY 100)
	(SIZE 70)
	(FLAGS VEHBIT OPENBIT)
	(DESCFCN BALLOON-F)
	(ACTION BALLOON-F)>

<ROUTINE BALLOON-F ("OPTIONAL" (RARG <>) "AUX" M RC)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<COND (,BALLOON-INFLATED
		       <TELL "The cloth bag is inflated and ">
		       <COND (<FSET? ,RECEPTACLE ,OPENBIT>
			      <TELL
A ,BALLOON-INFLATED " is burning in the">)
			     (T
			      <TELL "smoke leaks out of the closed">)>
		       <TELL " receptacle">)
		      (T
		       <TELL
"The cloth bag is draped over the side of the basket. In the middle of the
basket is a metal receptacle which is ">
		       <COND (<FSET? ,RECEPTACLE ,OPENBIT>
			      <TELL "open">
			      <SET RC <FIRST? ,RECEPTACLE>>
			      <COND (.RC
				     <TELL ". " CA .RC " is ">
				     <COND (<EQUAL? ,BALLOON-INFLATED .RC>
					    <TELL "burning">)
					   (T
					    <TELL "nestled">)>
				     <TELL " inside">)>)
			     (T
			      <TELL "closed">)>)>
		<TELL ". A braided wire ">
		<COND (,BALLOON-TIED
		       <TELL "connects the balloon to the hook">)
		      (T
		       <TELL "dangles from the basket">)>
		<TELL ,PERIOD-CR>)
	       (<EQUAL? .RARG ,M-OBJDESC>
		<TELL
"There is a large heavy wicker basket here. A huge cloth bag is
attached to the basket and ">
		<COND (,BALLOON-INFLATED
		       <TELL "inflated">)
		      (T
		       <TELL "and draped over the side">)>
		<TELL
". A metal receptacle is fastened to the center of the basket">
		<COND (,BALLOON-INFLATED
		       <COND (<FSET? ,RECEPTACLE ,OPENBIT>
			      <TELL
". In it is a burning " D ,BALLOON-INFLATED>)
			     (T
			      <TELL ". Smoke leaks from its closed lid">)>)>
		<TELL ". A piece of braided wire ">
		<COND (,BALLOON-TIED
		       <TELL
"tied to the hook holds the balloon in place." CR>)
		      (T
		       <TELL "dangles from the basket." CR>)>)
	       (<EQUAL? .RARG ,M-BEG>
		<COND (<VERB? WALK>
		       <COND (<SET M <GETPT ,HERE ,PRSO>>
			      <COND (,BALLOON-TIED
				     <TELL "You are tied to the ledge." CR>
				     <RTRUE>)
				    (T
				     <COND (<EQUAL? <PTSIZE .M> ,UEXIT>
					    <SETG BALLOON-LOC
						  <GETB .M ,REXIT>>)>
				     <ENABLE <QUEUE I-BALLOON 3>>
				     <RFALSE>)>)
			     (T
			      <TELL
"You can't control the balloon this way." CR>
			      <RTRUE>)>)>)
	       (<ZERO? .RARG>
	        <COND (<VERB? INFLATE>
		       <TELL
"It takes more than words to inflate a balloon." CR>)>)>>

<ROUTINE I-BALLOON ()
	 <COND (<AND <FSET? ,RECEPTACLE ,OPENBIT>
		     ,BALLOON-INFLATED>
		<RISE-AND-SHINE>)
	       (<EQUAL? ,HERE ,NARROW-LEDGE ,WIDE-LEDGE>
		<RISE-AND-SHINE>)
	       (T
		<DECLINE-AND-FALL>)>>

<ROUTINE BALLOON-BURN ()
 	<TELL "The " D ,PRSO " burns inside the receptacle." CR>
	<ENABLE <QUEUE I-BURNUP <* <GETP ,PRSO ,P?SIZE> 20>>>
	<FSET ,PRSO ,FLAMEBIT>
	<FSET ,PRSO ,ONBIT>
	<FCLEAR ,PRSO ,TAKEBIT>
	<FCLEAR ,PRSO ,READBIT>
	<COND (,BALLOON-INFLATED
	       <RTRUE>)
	      (T
	       <TELL "The cloth bag inflates as it fills with hot air." CR>
	       <COND (<NOT ,LABEL-REVEALED>
		      <MOVE ,BALLOON-LABEL ,BALLOON>
		      <TELL "A label drops from the bag into the basket." CR>)>
	       <SETG LABEL-REVEALED T>
	       <SETG BALLOON-INFLATED ,PRSO>
	       <ENABLE <QUEUE I-BALLOON 3>>)>>

<ROUTINE PUT-BALLOON (THERE STR)
	<COND (<EQUAL? ,HERE ,NARROW-LEDGE ,WIDE-LEDGE ,VOLCANO-BOTTOM>
	       <TELL "You watch as the balloon slowly " .STR CR>)>
	<MOVE ,BALLOON .THERE>
	<SETG BALLOON-LOC .THERE>>

<ROUTINE RISE-AND-SHINE ("AUX" (IN <IN? ,WINNER ,BALLOON>) R)
	<ENABLE <QUEUE I-BALLOON 3>>
	<COND (<EQUAL? ,BALLOON-LOC ,VOLCANO-BY-WIDE-LEDGE>
	       <DISABLE <INT I-BURNUP>>
	       <DISABLE <INT I-BALLOON>>
	       <REMOVE ,BALLOON>
	       <COND (.IN
		      <JIGS-UP
"The balloon floats majestically out of the volcano, revealing a breathtaking
view of a forest clearing with a white house. High winds carry you into the
snow-capped (and jagged) cliffs of the Flathead Mountains!">)
		     (<EQUAL? ,HERE ,NARROW-LEDGE ,WIDE-LEDGE ,VOLCANO-BOTTOM>
		      <TELL
"You watch the balloon drift over the rim and away on the wind." CR>)>
	       <SETG BALLOON-LOC ,VOLCANO-BOTTOM>)
	      (<SET R <GETP ,BALLOON-LOC ,P?BALLOON-UP>>
	       <COND (.IN
		      <TELL "The balloon ascends." CR CR>
		      <SETG BALLOON-LOC .R>
		      <GOTO .R>)
		     (T
		      <PUT-BALLOON .R "ascends.">)>)
	      (<SET R <GETP ,BALLOON-LOC ,P?BALLOON-FLOAT>>
	       <COND (.IN
		      <TELL "The balloon leaves the ledge." CR CR>
		      <SETG BALLOON-LOC .R>
		      <GOTO .R>)
		     (T
		      <PUT-BALLOON .R
"floats, ascending due to its light load.">
		      <FSET ,RECEPTACLE ,OPENBIT>)>)
	      (.IN
	       <SETG BALLOON-LOC ,VOLCANO-CORE>
	       <TELL "The balloon rises slowly from the ground." CR CR>
	       <GOTO ,VOLCANO-CORE>)
	      (T
	       <PUT-BALLOON ,VOLCANO-CORE "lifts off.">)>>

<ROUTINE DECLINE-AND-FALL ("AUX" (IN <IN? ,WINNER ,BALLOON>) R)
    <ENABLE <QUEUE I-BALLOON 3>>
    <COND (<EQUAL? ,BALLOON-LOC ,VOLCANO-CORE>
	   <COND (.IN
		  <SETG BALLOON-LOC ,VOLCANO-BOTTOM>
		  <COND (,BALLOON-INFLATED
			 <TELL "The balloon has landed." CR CR>
			 <GOTO ,VOLCANO-BOTTOM>)
			(T
			 <REMOVE ,BALLOON>
			 <MOVE ,ADVENTURER ,HERE>
			 <DISABLE <INT I-BALLOON>>
			 <TELL
"The balloon smashes into dust against the volcano floor.
You, miraculously, survive." CR CR>
			 <GOTO ,VOLCANO-BOTTOM>)>)
		 (T
		  <PUT-BALLOON ,VOLCANO-BOTTOM "lands.">)>)
	   (<SET R <GETP ,BALLOON-LOC ,P?BALLOON-DOWN>>
	    <COND (.IN
		   <TELL "The balloon descends." CR CR>
		   <SETG BALLOON-LOC .R>
		   <GOTO .R>)
		  (T
		   <PUT-BALLOON .R "descends.">)>)>>

<ROUTINE I-BURNUP ("AUX" (OBJ <FIRST? ,RECEPTACLE>))
	 <COND (<EQUAL? ,HERE ,BALLOON-LOC>
		<TELL
"The " D .OBJ " has now burned out, and the cloth bag starts to deflate." CR>)>
	 <REMOVE .OBJ>
	 <SETG BALLOON-INFLATED <>>
	 <RTRUE>>

<OBJECT BALLOON-LABEL
	(DESC "blue label")
	(LDESC "There is a blue label here.")
	(SYNONYM LABEL)
	(ADJECTIVE BLUE)
	(FLAGS READBIT TAKEBIT BURNBIT)
	(SIZE 1)
	(TEXT
"\"FROBOZZ MAGIC BALLOON COMPANY! Hello, Aviator!|
|
To land your balloon, say LAND. Otherwise, you're on your own! (No warranty
expressed or implied.)\"")>

<OBJECT BRAIDED-WIRE
	(IN BALLOON)
	(DESC "braided wire")
	(SYNONYM ROPE WIRE)
	(ADJECTIVE BRAIDED)
	(FLAGS NDESCBIT)
	(ACTION BRAIDED-WIRE-F)>

<ROUTINE BRAIDED-WIRE-F ()
        <COND (<AND <VERB? TIE>
		    <EQUAL? ,PRSO ,BRAIDED-WIRE>
		    <EQUAL? ,PRSI ,HOOK>>
	       <DISABLE <INT I-BALLOON>>
	       <TELL "The balloon is ">
	       <COND (,BALLOON-TIED
		      <TELL "already ">)>
	       <TELL "fastened to the hook." CR>
	       <SETG BALLOON-TIED T>)
	      (<AND <VERB? UNTIE>
	            <EQUAL? ,PRSO ,BRAIDED-WIRE>>
	       <TELL "The wire is no">
	       <COND (,BALLOON-TIED
		      <ENABLE <QUEUE I-BALLOON 3>>
		      <SETG BALLOON-TIED <>>
	              <TELL "w unhooked." CR>)
		     (T
		      <TELL "t tied to anything." CR>)>)
	      (T
	       <BCONTENTS>)>>

<OBJECT CLOTH-BAG
	(IN BALLOON)
	(DESC "cloth bag")
	(SYNONYM BAG)
	(ADJECTIVE CLOTH)
	(FLAGS NDESCBIT)
	(ACTION BCONTENTS)>

<OBJECT RECEPTACLE
	(IN BALLOON)
	(DESC "receptacle")
	(SYNONYM RECEPTACLE)
	(ADJECTIVE METAL)
	(CAPACITY 6)
	(FLAGS CONTBIT SEARCHBIT NDESCBIT)
	(CONTFCN RECEPTACLE-CONT)
	(ACTION RECEPTACLE-F)>

<ROUTINE RECEPTACLE-F ("AUX" OBJ)
	 <COND (<VERB? EXAMINE>
		<TELL "The receptacle is ">
		<COND (<FSET? ,PRSO ,OPENBIT>
		       <TELL "open." CR>)
		      (T
		       <TELL "closed." CR>)>)
	       (<AND <VERB? LOOK-INSIDE>
		     <SET OBJ <FIRST? ,PRSO>>
		     <FIRST? ,PRSO>>
		<FCLEAR .OBJ ,NDESCBIT>
		<V-LOOK-INSIDE>
		<FSET .OBJ ,NDESCBIT>)
	       (<AND <VERB? OPEN>
		     <NOT <FSET? ,PRSO ,OPENBIT>>
		     ,BALLOON-INFLATED
		     <FIRST? ,PRSO>>
		<FSET ,PRSO ,OPENBIT>
		<TELL
"Opening it reveals a burning " D ,BALLOON-INFLATED ,PERIOD-CR>)
	       (<AND <VERB? PUT>
		     <PRSI? ,RECEPTACLE>>
		<COND (<FIRST? ,PRSI>
		       <TELL "The receptacle is already occupied." CR>)
		      (T
		       <FSET ,PRSO ,NDESCBIT>
		       <RFALSE>)>)
	       (T
		<BCONTENTS>)>>

<ROUTINE RECEPTACLE-CONT ()
	 <COND (<AND <VERB? TAKE>
		     <PRSO? ,BALLOON-INFLATED>>
		<TELL
"You don't really want to hold a burning " D ,PRSO ,PERIOD-CR>)>>

<ROUTINE BCONTENTS ()
	 <COND (<VERB? TAKE>
		<TELL
"The " D ,PRSO " is an integral part of the basket and cannot be removed.">
		<COND (<EQUAL? ,PRSO ,BRAIDED-WIRE>
		       <TELL " It might be tied, though.">)>
		<CRLF>)
	       (<AND <EQUAL? ,PRSO ,CLOTH-BAG>
		     <VERB? LOOK-INSIDE OPEN>>
		<COND (<VERB? OPEN>
		       <TELL
"The bag is enormous. You can't open it by hand." CR>)
		      (T
		       <TELL "It seems empty." CR>)>)
	       (<VERB? FIND EXAMINE>
	        <TELL
"The " D ,PRSO " is part of the basket. It may be manipulated
within the basket but cannot be removed." CR>)>>

<ROOM VOLCANO-CORE
      (IN ROOMS)
      (DESC "Volcano Core")
      (LDESC
"You are about one hundred feet above the bottom of the volcano.")
      (VALUE 10)
      (BALLOON-UP VOLCANO-BY-SMALL-LEDGE)
      (FLAGS NONLANDBIT)>

<ROOM VOLCANO-BY-SMALL-LEDGE
      (IN ROOMS)
      (DESC "Volcano By Small Ledge")
      (EAST TO NARROW-LEDGE)
      (LAND TO NARROW-LEDGE)
      (FLAGS NONLANDBIT)
      (BALLOON-UP VOLCANO-BY-WIDE-LEDGE)
      (BALLOON-DOWN VOLCANO-CORE)
      (ACTION VOLCANO-BY-LEDGE-F)>

<ROOM VOLCANO-BY-WIDE-LEDGE
      (IN ROOMS)
      (DESC "Volcano By Wide Ledge")
      (LAND TO WIDE-LEDGE)
      (WEST TO WIDE-LEDGE)
      (FLAGS NONLANDBIT)
      (BALLOON-DOWN VOLCANO-BY-SMALL-LEDGE)
      (ACTION VOLCANO-BY-LEDGE-F)>

<ROUTINE VOLCANO-BY-LEDGE-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL "You are about ">
		<COND (<EQUAL? ,HERE ,VOLCANO-BY-SMALL-LEDGE>
		       <TELL "15">)
		      (T
		       <TELL "20">)>
		<TELL "0 feet up, ">
		<COND (<EQUAL? ,HERE ,VOLCANO-BY-WIDE-LEDGE>
		       <TELL "very ">)>
		<TELL "near the rim of the volcano. To the ">
		<COND (<EQUAL? ,HERE ,VOLCANO-BY-SMALL-LEDGE>
		       <TELL "east is a narrow">)
		      (T
		       <TELL "west is a wide">)>
		<TELL " ledge." CR>)>>

<ROOM NARROW-LEDGE
      (IN ROOMS)
      (DESC "Narrow Ledge")
      (DOWN "I wouldn't jump from here.")
      (SOUTH TO LIBRARY)
      (IN TO LIBRARY)
      (FLAGS RLANDBIT NONLANDBIT)
      (GLOBAL HOOK)
      (BALLOON-FLOAT VOLCANO-BY-SMALL-LEDGE)
      (ACTION LEDGE-F)>

<OBJECT COIN
	(IN NARROW-LEDGE)
	(DESC "priceless zorkmid")
	(FDESC
"On the floor is a priceless gold zorkmid (a valuable collector's item).")
	(SYNONYM COIN ZORKMID GOLD TREASURE)
	(ADJECTIVE GOLD PRICELESS)
	(FLAGS READBIT TAKEBIT)
	(SIZE 10)
	(VALUE 20)
	(TEXT
"This octagonal coin reads \"1000 Zorkmids\" and \"In Frobs We Trust\".")>

<ROOM LIBRARY
      (IN ROOMS)
      (DESC "Library")
      (LDESC
"This must have been a large library, probably for the royal family. All
of the shelves have been gnawed to pieces by unfriendly gnomes. To the
north is an exit.")
      (NORTH TO NARROW-LEDGE)
      (OUT TO NARROW-LEDGE)
      (FLAGS RLANDBIT)>

<OBJECT BLUE-BOOK
	(IN LIBRARY)
	(DESC "blue book")
	(FDESC "In one corner sits a blue book.")
	(SYNONYM BOOK BOOKS)
	(ADJECTIVE BLUE)
	(CAPACITY 2)
	(SIZE 10)
	(TEXT "This book is written in an unfamiliar tongue.")
	(FLAGS READBIT TAKEBIT TRYTAKEBIT CONTBIT BURNBIT)
	(ACTION RANDOM-BOOK-F)>

<OBJECT WHITE-BOOK
	(IN LIBRARY)
	(DESC "white book")
	(FDESC "Beside the purple book is a white one.")
	(SYNONYM BOOK BOOKS)
	(ADJECTIVE WHITE)
	(CAPACITY 2)
	(FLAGS READBIT TAKEBIT TRYTAKEBIT CONTBIT BURNBIT)
	(TEXT
"The book details the use of the so-called \"magic wand\". Apparently, these
work by pointing them at the object to be ensorcelled, and then chanting the
appropriate magic word. (Amazing how credulous these ancients were.)")
	(ACTION RANDOM-BOOK-F)>

<ROUTINE RANDOM-BOOK-F ()
	 <COND (<VERB? TAKE MOVE PUT OPEN>
		<FSET ,WHITE-BOOK ,TOUCHBIT>
		<FSET ,PURPLE-BOOK ,TOUCHBIT>
		<FSET ,BLUE-BOOK ,TOUCHBIT>
		<RFALSE>)>>

<OBJECT PURPLE-BOOK
	(IN LIBRARY)
	(DESC "purple book")
	(FDESC "Lying in the dust, covered with mold, is a purple book.")
	(SYNONYM BOOK BOOKS)
	(ADJECTIVE PURPLE)
	(CAPACITY 2)
	(SIZE 10)
	(FLAGS READBIT TAKEBIT TRYTAKEBIT CONTBIT SEARCHBIT BURNBIT)
	(TEXT "This book is written in an unfamiliar tongue.")
	(ACTION PURPLE-BOOK-F)>

<ROUTINE PURPLE-BOOK-F ()
	 <COND (<AND <VERB? READ>
		     <IN? ,STAMP ,PURPLE-BOOK>
		     <NOT <FSET? ,PURPLE-BOOK ,OPENBIT>>>
		<V-READ>
		<PERFORM ,V?OPEN ,PURPLE-BOOK>
		<RTRUE>)
	       (T
		<RANDOM-BOOK-F>)>>

<OBJECT STAMP
	(IN PURPLE-BOOK)
	(DESC "Flathead stamp")
	(SYNONYM STAMP TREASURE)
	(ADJECTIVE FLATHEAD)
	(SIZE 1)
	(VALUE 10)
	(FLAGS READBIT TAKEBIT BURNBIT)
	(TEXT
"This three zorkmid stamp portrays Lord Dimwit Flathead the Excessive.")>

<OBJECT HOOK
	(IN LOCAL-GLOBALS)
	(DESC "hook")
	(SYNONYM HOOK)
	(ADJECTIVE SMALL)>

<ROUTINE LEDGE-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL "You are on a ">
		<COND (<EQUAL? ,HERE ,NARROW-LEDGE>
		       <TELL "small">)
		      (T
		       <TELL "large">)>
		<TELL
" ledge high in the volcano. There is a small opening to the south">
		<COND (<AND <NOT ,DUSTY-ROOM-FLAG>
			    <EQUAL? ,HERE ,WIDE-LEDGE>>
		       <TELL " which is blocked by rubble">)>
		<TELL ". Imbedded in the rock is a small hook." CR>)>>

<ROOM WIDE-LEDGE
      (IN ROOMS)
      (DESC "Wide Ledge")
      (DOWN "It's a long way down.")
      (SOUTH TO DUSTY-ROOM IF DUSTY-ROOM-FLAG ELSE
"The opening is blocked by rubble.")
      (IN TO DUSTY-ROOM IF DUSTY-ROOM-FLAG ELSE
"The opening is blocked by rubble.")
      (FLAGS RLANDBIT NONLANDBIT)
      (GLOBAL HOOK)
      (BALLOON-FLOAT VOLCANO-BY-WIDE-LEDGE)
      (ACTION LEDGE-F)>

<ROOM DUSTY-ROOM
      (IN ROOMS)
      (DESC "Dusty Room")
      (NORTH TO WIDE-LEDGE)
      (OUT TO WIDE-LEDGE)
      (FLAGS RLANDBIT ONBIT)
      (ACTION DUSTY-ROOM-F)>

<ROUTINE DUSTY-ROOM-F (RARG)
	 <COND (<EQUAL? .RARG ,M-LOOK>
		<TELL
"You are in a featureless room with an exit on the north side. Imbedded in the
far wall is a rusty box">
		<COND (<NOT <FSET? ,SAFE ,OPENBIT>>
		       <TELL
". An oblong hole has been chipped out of the front of it">)
		      (T
		       <TELL " whose door has been blown off">)>
		<TELL ,PERIOD-CR>)>>

<OBJECT SAFE
	(IN DUSTY-ROOM)
	(DESC "box")
	(SYNONYM SAFE BOX)
	(ADJECTIVE STEEL RUSTY)
	(FLAGS CONTBIT NDESCBIT)
	(CAPACITY 15)
	(ACTION SAFE-F)>

<ROUTINE SAFE-F ()
	<COND (<AND <VERB? TAKE>
		    <EQUAL? ,PRSO ,SAFE>>
	       <TELL "The box is imbedded in the wall." CR>)
	      (<AND <VERB? OPEN CLOSE>
		    <FSET? ,SAFE ,OPENBIT>>
	       <TELL "The box has no door!" CR>)
	      (<VERB? OPEN>
	       <TELL "The box is rusted shut." CR>)
	      (<VERB? CLOSE>
	       <TELL "The box isn't open!" CR>)>>

<OBJECT SAFE-HOLE
	(IN DUSTY-ROOM)
	(DESC "hole")
	(SYNONYM SLOT HOLE)
	(CAPACITY 10)
	(FLAGS OPENBIT NDESCBIT)
	(TEXT
"The hole was someone's failed attempt to chip their way into the box.")>

<OBJECT CARD
	(IN SAFE)
	(DESC "card")
	(LDESC "There is a card with writing on it here.")
	(SYNONYM CARD NOTE)
	(SIZE 1)
	(FLAGS READBIT TAKEBIT BURNBIT)
	(TEXT
"Warning: This room was constructed near weak rock strata. Detonation
of explosives here is strictly prohibited!")>

<OBJECT CROWN
	(IN SAFE)
	(DESC "gaudy crown")
	(FDESC
"The excessively gaudy crown of Lord Dimwit Flathead sits in the safe.")
	(LDESC "Lord Dimwit's crown is here.")
	(SYNONYM CROWN TREASURE)
	(ADJECTIVE GAUDY)
	(SIZE 10)
	(VALUE 20)
	(FLAGS TAKEBIT)>

;"bomb"

<OBJECT BRICK
	(IN STONE-BRIDGE)
	(DESC "brick")
	(LDESC "There is a square brick here which feels like clay.")
	(SYNONYM BRICK)
	(ADJECTIVE SQUARE CLAY)
	(FLAGS TAKEBIT BURNBIT OPENBIT SEARCHBIT)
	(CAPACITY 2)
	(SIZE 9)
	(ACTION BRICK-F)>

<ROUTINE BRICK-F ()
	 <COND (<VERB? BURN>
		<REMOVE ,BRICK>
		<JIGS-UP ,OTHER-PROPERTIES>)>>

<OBJECT FUSE
	(IN RIDDLE-ROOM)
	(DESC "black string")
	(LDESC "There is a coil of black, braided string here.")
	(SYNONYM FUSE STRING COIL)
	(ADJECTIVE BLACK THIN)
	(SIZE 1)
	(FLAGS TAKEBIT TRYTAKEBIT BURNBIT)
	(ACTION FUSE-F)>

<ROUTINE FUSE-F ()
	<COND (<OR <VERB? BURN>
		   <AND <VERB? LAMP-ON>
			<IN? ,MATCH ,WINNER>
			<FSET? ,MATCH ,ONBIT>>>
	       <TELL "The string starts to burn." CR>
	       <ENABLE <QUEUE I-FUSE 2>>)>>

<ROUTINE I-FUSE ("AUX" BRICK-ROOM F)
	 <COND (<IN? ,FUSE ,BRICK>
		<COND (<NOT <SET BRICK-ROOM <META-LOC ,BRICK>>>
		       <RFALSE>)>
		<FSET .BRICK-ROOM ,RMUNGBIT>
		<FCLEAR .BRICK-ROOM ,TOUCHBIT>
		<COND (<EQUAL? .BRICK-ROOM ,HERE>
		       <JIGS-UP ,OTHER-PROPERTIES>)
		      (T
		       <COND (<IN? ,BRICK ,SAFE-HOLE>
			      <FSET ,SAFE-HOLE ,INVISIBLE>
			      <FSET ,SAFE ,OPENBIT>
			      <FCLEAR ,DUSTY-ROOM ,TOUCHBIT>
			      <ENABLE <QUEUE I-SAFE 5>>)>
		       <TELL "There is an explosion nearby." CR>
		       <COND (<SET F <FIRST? .BRICK-ROOM>>
			      <REPEAT ()
				      <COND (<FSET? .F ,TAKEBIT>
					     <FSET .F ,INVISIBLE>)>
				      <COND (<NOT <SET F <NEXT? .F>>>
					     <RETURN>)>>)>)>
		<REMOVE ,BRICK>)
	       (<EQUAL? <LOC ,FUSE> ,WINNER ,HERE>
		<TELL "The string burns into nothingness." CR>)>
	 <REMOVE ,FUSE>>

<ROUTINE BOMB? (O)
	<COND (<AND <EQUAL? .O ,BRICK>
	            <IN? ,FUSE ,BRICK>
		    <NOT <0? <GET <INT I-FUSE> ,C-ENABLED?>>>>
	       <RTRUE>)
	      (T
	       <RFALSE>)>>

;<OBJECT EXPLOSION
	(DESC "debris from an explosion")
	(LDESC
"The room is cluttered with debris from an explosion. The walls seem ready
to collapse.")
	(SYNONYM KREBF)>

<GLOBAL OTHER-PROPERTIES
"Now you've done it. It seems that the brick is an explosive and you have been
blown to bits.">

<GLOBAL DUSTY-ROOM-FLAG T>

<ROUTINE I-SAFE ()
	 <SETG DUSTY-ROOM-FLAG <>>
	 <COND (<EQUAL? ,HERE ,DUSTY-ROOM>
		<JIGS-UP
"The room trembles and 5000 tons of rock fall on you.">)
	       (<NOT ,DEAD>
		<TELL
"Probably as a result of that recent explosion, an ominous rumbling
indicates that a nearby room has collapsed." CR>)>>
