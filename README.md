# Rampart

contemplating an hobby rewrite of the classic arcade game "Rampart"

### Notes

Rotation of tetrominos (sort of) is probably best done with matrix multiplication - need to look that up

During the building phase, we need to figure out which castles are enclosed. We only _really_ need to do this at the end of the building round, but it would be nice to do it after each block is placed.

One way to do it would be with a flood fill algorithm. Flood fill from (0,0) if the castle ends up being filled then it cannot be enclosed. This way we can deduce whether all castles are enclosed in a single pass through the grid (i.e. each cell is visited at most once).

```
********************************
*..............................*
*............xxxxxxxxxxx.......*
*.........xxxxx........xx......*
*............xx...c....x.......*
*.............x........x.......*
*.........xxxxxxxxxxxxxxx......*
*..............................*
*..............................*
********************************

After flood fill
********************************
*ffffffffffffffffffffffffffffff*
*ffffffffffffxxxxxxxxxxxfffffff*
*fffffffffxxxxx........xxffffff*
*ffffffffffffxx...c....xfffffff*
*fffffffffffffx........xfffffff*
*fffffffffxxxxxxxxxxxxxxxffffff*
*ffffffffffffffffffffffffffffff*
*ffffffffffffffffffffffffffffff*
********************************
```
