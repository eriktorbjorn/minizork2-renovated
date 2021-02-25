# Mini-Zork II - The Wizard of Frobozz

## Background

A typical Infocom game clocks in at about 75-127 KB. This is much too
big to fit in the memory of an 8-bit computer, particularly since you
also need space for the interpreter itself. That meant you needed a
floppy drive, but those were quite expensive in the early 80s.

There were at least two different attempts at making a stripped down
version of Zork I, in 1984 and 1987 respectively. There was also a
stripped-down version of Zork II made in 1987.

All of these are complete games, but the 1984 version of Zork I is
*very* buggy. Zork II is in much better shape, but still has
game-breaking bugs. Only the 1987 versio of Zork I was ever released.
This is known as Mini-Zork I.

In 2019 the Infocom source code was leaked to the Internet by Jason
Scott, of Internet Archive fame. This included the source code for the
Mini-Zorks.

This project is my attempt at turning Mini-Zork II into a playable
game that can be compiled with Jesse McGrew's
[ZILF](http://www.zilf.io) compiler. I have fixed several bugs (some
of which still appear in the full version of the game!), removed some
unused code and rewritten some of it to make it more compact. I have
not cut out any more of the gameplay, so ideally these changes should
be almost invisible to the player.

However, while this is not an official Infocom game, it's still
Infocom source code, and I assert no rights whatsoever to it.

## Differences compared to the full game

Just to name a few:

* Much of the text has been cut.

* The map and some of the puzzles have been simplified. The Bank of
  Zork and the Oddly-angled rooms have been dropped completely.

* The Wizard has lost a few spells, namely Fear, Filch and Fierce.

* The sword does not glow when there is danger nearby.

## Known bugs

* If you fill the teapot with water, there are ways to empty the
  teapot without even being near it. That's because `WATER-F` will
  remove the `WATER` object in some cases.
