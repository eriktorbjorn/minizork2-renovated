This is an attempt to document the most notable fixes. Typos and other
adjustments to the text are usually not considered notable, nor are
informing the player when a room goes dark after the last light source
has been removed, or the numerous changes made to reduce the size of
the final game.

# Release 14 / Serial number ??????

# Release 13 / Serial number 210220

* The *Fry* spell no longer works on the dog collar after you put it
  on Cerberus. (In the full game I would have expected something more
  creative, but I did the simplest solution to save space.)

* The **ENCHANT** and **DISENCHANT** verbs can no longer be used to
  interfer with the magic spells. The game used these actions so that
  objects could respond to spells. Typing the commands manually caused
  strange responses sometimes. These actions are now **$ENCHANT** and
  **$DISENCHANT**, and new dummy actions for **ENCHANT** and
  **DISENCHANT** have been added.

* **PUT _object_ IN KEYHOLE** no longer respondsw ith "It already is!"
  if the door is unlocked. The game was treating this as if you had
  typed **UNLOCK DOOR WITH _object_**.

* It is no longer possible to remove the collar from Cerberus by using
  the *Fry* spell.

* When the Wizard uses the `Float` spell on you, it's no longer
  possible to pick up objects from containers in the room, or picking
  up objects automatically.

* **X** can now be used as a synonym for **EXAMINE**.

* The `Freeze` spell no longer prevents you from saving, restoring,
  restarting and quitting.

* **DROP ALL** and similar commands no longer prints messages about
  objects inside containers that you already dropped.

# Release 12 / Serial number 210219

* If the Wizard appears in a dark room, and then immediately retreats
  because he sees you carrying the Black Crystal, only one message is
  printed. In the full game it printed two slightly different
  messages, which made sense. Here it was printing the exact same
  message twice, which made it look like a bug.

* When dying, valuable objects are now moved to the Carousel Room, not
  the Gazebo. This was obviously the intention, but it incorrectly
  checked if the object still had a non-zero `VALUE`, not if the
  object had a `VALUE` property. (The `VALUE` is zeroed when you pick
  up the object so that the score is only awarded once.)

* **TAKE _object_ FROM LIZARD** was handled as **TAKE _object_**. I
  assume that was meant to be that **TAKE LIZARD FROM _object_** is
  handled as **TAKE LIZARD**, e.g. **TAKE LIZARD FROM DOOR**.

* It's no longer possible to open or close the aquarium.

# Release 11 / Serial number 210218

* **New bug fixed: The robot once again dies if you ask him to pick up
  the red sphere.**

* When you shrink down in the Tea Room, all objects in the room are
  given `TRYTAKEBIT` because they're too large to be picked up, even
  automatically. But when you grew to normal size, it would
  indiscriminately remove `TRYTAKEBIT` from the objects. Now objects
  that already had `TRYTAKEBIT` from the start get to keep it. This
  wasn't much of a problem before, but I've added `TRYTAKEBIT` to some
  objects to work around other possible bugs.

* Don't print garbage when typing **ENTER** while under the influence
  of the *Fall* spell.

* Pouring water on a lit match now only prints one message about the
  match being out.

* **ATTACK _object_** now defaults to using the sword if you are
  carrying it. This was obviously the intention, but `V-ATTACK`
  checked if you were in the sword instead of the other way around.

* Throwing the bomb at the aquarium now makes it explode immediately.

* When casting a spell on Cerberus, the game would print a message
  about him snapping at you when the spell wore off, seemingly for no
  reason. Now it prints the default message (if any) instead.

* When using the *Float* spell on Cerberus, don't show him as floating
  in midair afterwards.

# Release 10 / Serial numbe 210217

* **New bug fixed: You shouldn't be able to get rid of your hands any
  more.**

* Don't allow tying the rope to the hook if it's already tied.

* **INFLATE BALLOON WITH _object_** now prints the same message
  whether you're inside the basket or not.

* The balloon's description wasn't printed when looking after landing
  on either of the volcano ledges. This was because `DESCRIBE-ROOM`
  used to stop after calling the room's action routine (if it had
  one), so it would never reach the part where it calls the vehicle's
  action routine with the `M-LOOK` parameter.

* Certain actions surrounding the balloon (e.g. putting objects in the
  receptacle) were only handled correctly if you were inside the
  basket, even though the actions could be carried out from outside.
  Not they should work as intended in both cases.

* Only handle existing exits in the Carousel Room, i.e. don't print
  that you're not sure which direction is which on **IN**, **OUT** or
  **LAND**.

* Only print "The match has gone out." if you can still see the
  matchbook.

* Made it possible to **DESTROY _object_** without specifying with
  what. The game often handles `MUNG` and `ATTACK` as the same thing,
  so it seemed strange that you could attack without a weapon but not
  destroy without one. The main reason, though, was that the game can
  now actually respond to **DESTROY SPHERE** while you are dead.

# Release 9 / Serial number 210215

* **New bug introduced: In an attempt to simplify things, I
  accidentally made it possible to get rid of your hands in several
  ways.**

* **New bug introduced: The game tried to handle PUT SERPENT IN
  _object_, which the parser rejects because you're not holding the
  serpent. I incorrectly assumed that maybe it should handle PUT
  _object_ IN SERPENT instead, but in retrospect that feels wrong.**

* **LEAVE GAZEBO** now works as intended. This is actually handled by
   the **DROP** action, not the **LEAVE** action.

* It's now possible to **DRINK FROM STREAM**.

* **SWIM** no longer prints garbage.

* **EXAMINE ALL** and similar commands now only examine carried
   objects and objects in the room, not every global object in the
   world. (Some of which are system objects that you shouldn't be able
   to interact with at all.)

# Release 8 / Serial number 210213

* **DRINK WATER** no longer prints garbage in some cases.

* It's now possible to **DRINK FROM POOL**. It's also possible to refer
  to the pool as **WATER**. (In the full game it's a pool of tears, but
  here it's regular water.)

* The debug verbs can now be easily disabled by setting `DEBUGGING?`
  to `<>` in mini2.zil. Historically these debug verbs are enabled in
  Infocom games, but disabling them saves a tiny bit of space if
  necessary.

* Use `FDESC`, not `LDESC`, on the baby sea serpent so that its
  description ("There is a baby sea serpent swimming in the
  aquarium.") is printed. Otherwise it's just listed as something the
  aquarium contains.

* The parser no longer handles time of day, e.g. *8:25*. This is a
  type of number, and parsing numbers is only used for debugging
  anyway.

# Release 7 / Serial number 210211

* It's now possible to put objects in the chasm. (The `CHASM-F`
  routine assumed that the chasm was a pseudo-object, but it's a
  proper object.)

* The Wizard will now only tear his beard if he's present to see you
  give treasures to the demon. (You can chase him away before that by
  attacking him.)

* Attempting to throw an object that couldn't be thrown would print
  double messages.

# Release 6 / Serial number 210210

There were no visible bugfixes in this release.

# Release 5 / Serial number 210208

* Added `<ORDER-TREE? REVERSE-DEFINED>` to hopefully match the object
  creation order of the original a bit better. This is mainly for the
  library books, where the descriptions refer to other books.

* **New bug introduced: The robot no longer dies if you ask him to pick
  up the red sphere.**

# Release 4 / Serial number 210207

There were no visible bugfixes in this release.

# Release 3 / Serial number 210207

* The *Fantasize* spell wasn't working correctly. Hopefully it does
  now.

* The full score for winning the game was only 392. It has been
  rebalanced slightly to make it an even 400.

* Casting *Float* on an object in your inventory now moves it to the
  room.

* Casting *Float* on the collar now only tries to levitate Cerberus if
  he's been collared.

* The game no longer prints garbage if you point the wand at an object
  and then don't cast a spell.

* The menhir was described incorrectly while it was floating in the air.

* It was still possible to interact with the menhir in the Menhir
  Room, even if the demon had removed it from there. (He will if you
  ask him to take it or give it to you.)

* Don't let the Wizard see the demon after it has departed. This would
  only happen if you attacked the Wizard (causing him to leave the
  room) before asking the demon for a favour.

* After the carousel has been deactivated, no longer mention any
  whirring sound in the adjacent rooms (Dark Tunnel and Deep Ford).

* The oak door can no longer be locked or unlocked when it already is.

* Made the Topiary less deadly. A bug meant that if you were unlucky,
  it could skip straight to the instant death, without going through
  the creepy warning messages first.

* The wall etchings now use fixed font.

* **ENTER GAZEBO** no longer causes you to hit your head against it.

* The bucket can no longer be closed.

* Burning a carried object is now fatal again. It was obviously the
  intention, but the object was removed before it checked if you were
  holding it.

* The entrance to the Dusty Room is now blocked after it collapses,
  just like the description says.

* **LIGHT _object_** no longer automatically picks it up. Otherwise,
  **LIGHT FUSE** would cause you to take the fuse out of the bomb.

* Only describe the dragon as blocking the north exit when he's at
  home, not when he's following you.

* The princess is no longer described as being in a trance after she
  wakes up.

* The balloon is now moved to the correct location when leaving a ledge.

* When giving an object to the dragon, check if it is valuable, not if
  it has `TREASUREBIT`. Only the dragon statuette had `TREASUREBIT`,
  and there was no way you could get that while the dragon was still
  alive.

* It was impossible to open the balloon receptacle, making the entire
  volcano section inaccessible.

* The game no longer prints garbage when the key falls from the place
  mat.

* The game now prints the correct direction (southeast, not south)
  when the princess moves from the Dark Tunnel to the Formal Garden.

* The Formal Garden and Topiary are now lit. They are in the full
  game, and without light it makes little sense that the Gazebo itself
  is lit. Also, if the rooms were dark ```I-GARDEN``` would have to
  check before printing messages about the unicorn. (The Wizard's
  Workshop is still dark, unlike the full game, but I think that case
  is less clear.)

* Added a missing map connection from the Guarded Room back to the
  Carousel Room.

* Incorrect use of the ```PICK-ONE``` routine would cause the game to
  crash (at least with modern interpreters) when leaving the Carousel
  Room, describing the Wizard's Quarters, or picking a hallucination
  for the *Fantasize* spell.
