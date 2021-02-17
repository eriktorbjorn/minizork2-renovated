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

## Differences

Compared to the full game, the map and some of the puzzles have been
simplified and much of the text has been shortened. The Bank of Zork
and Oddly-angled rooms have been dropped completely, and the Wizard
has lost a few of his spells.

I think it still holds up pretty well, though.

## Known bugs

* If you fill the teapot with water, there are ways to empty the
  teapot without even being near it. That's because ```WATER-F``` will
  remove the ```WATER``` object in some cases.
