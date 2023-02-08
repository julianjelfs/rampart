# List of things that need doing

1. implement the overall (single player) flow

   - castle selection
   - auto build around the first castle
   - cannon placement
   - battle
   - building
   - back to cannon placement or to next round

2. Castle selection

   - run a countdown

3. Cannon placement

   - run a countdown

   - make sure that we can only place a cannon in an enclosed empty space
   - make sure we maintain the number of available cannon
   - if cannons are not enclosed, they stay there, but they do not fire

4. Battle

   - run a countdown
   - randomly generate a list of ships
   - have ships meander towards ????
   - have the ships randomly target a piece of wall (that encloses a castle?)
   - allow player to click on any point to target cannon fire
   - restrict the rate of cannon fire according to the number of cannon
   - calculate and plot cannonball trajectory
   - maintain ship and wall damage
   - look into how the landing craft work
   - look into how permanent fires work (should prevent subsequent building)

   Round one there are four ships, round two there are seven, then nine, then twelve
   The ships move in straight lines in random directions and some don't move at all or they move and then stop
   I _think_ the ships only fire the next cannonball after the first has landed.
   Some ships fire red cannonballs which leave a burn spot where they impact which cannot be built on
   Not clear how many rounds there are or what constitutes victory.

5. Building

   - sweep the territory and remove any walls that have no neighbouring walls or something like that
     otherwise it gets very fragmented. Perhaps remove walls with no contiguous N,S,E,W neighbours.
   - run a countdown
   - generate random tetrominos
   - allow placement of tetromino where valid
   - allow rotation of tetromino
   - calculate enclosed castles

6. Graphics

   - consider rendering (html, svg, webgl, 3D, isometric)
   - how to render the cannonballs in flight
   - images for castles, cannons, ships, cannonballs

7. Sound effect
   - see if we can record samples from the original game.
   - or maybe the audio samples can be downloaded from somewhere.
   - definitely important part of the feel of the game

## Problems

We need to somehow encode where the coastline is.
