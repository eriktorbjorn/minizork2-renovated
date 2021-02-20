# Mini-Zork II

## Background

The only interactive fiction that Infocom ever released for
casette-based systems was a stripped-down version of Zork I, known as
Mini-Zork I. It appears to have been a second attempt, because an
earlier, and quite buggy, version exists.

I was not, however, aware that there existed a Mini-Zork II. As it
turns out, the game was *almost* completed, with only a couple of
completely game-breaking bugs. This is my attempt at restoring it to
working condition.

I have fixed all the bugs I've come across (including some that are
still present in the full game!) and made some changes to the scoring
to bring the total back to 400.

Making it small enough to fit in the memory of a C64, along with its
interpreter? Well... that's a different matter!

## Differences compared to the full game

Just to name a few:

* Much of the text has been cut.

* The map and some of the puzzles have been simplified. The Bank of
  Zork and the Oddly-angled rooms have been dropped completely.

* The Wizard has lost a few spells, namely Fear, Filch and Fierce.

* The sword does not glow when there is danger nearby.

## Known bugs

* If you fill the teapot with water, there are ways to empty the
  teapot without even being near it. That's because ```WATER-F``` will
  remove the ```WATER``` object in some cases.

* The game uses the DISENCHANT action when spells time out. Since this
  is a regular verb you can type "DISENCHANT *object*" yourself, but it
  won't work as intended. Perhaps this should be changed to
  $DISENCHANT to mark it as something internal? (You could still use
  it, but not by mistake.)

* The Float spell prevents you from picking up objects in the room.
  But it does not prevent you from picking up objects inside
  containers in the room (e.g. objects on the table in the Gazebo),
  nor does it prevent implicit taking (e.g. reading an object on the
  ground).

* "PUT *object* IN KEYHOLE" will respond "It already is!" if the door
  isn't locked. That's because the action is interpreted as "UNLOCK
  DOOR WITH *object*".
