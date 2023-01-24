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

5. Building

   - run a countdown
   - generate random tetrominos
   - allow placement of tetromino where valid
   - allow rotation of tetromino
   - calculate enclosed castles

6. Graphics
   - consider rendering (html, svg, webgl, 3D, isometric)
   - how to render the cannonballs in flight
   - images for castles, cannons, ships, cannonballs
