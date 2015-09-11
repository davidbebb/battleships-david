# Battle ships
Battle ships game to learn OOP.

# User Stories
## Nouns
1. `ship`
1. `board`
1. `player`

## Verbs
1. `place` (User places a ship with orientation.)
1. `choose_size` (User chooses size of ship.)
1. `in_bounds?` (Is ship on board?)
1. `overlapped?` (Do ships overlap?)
1. `fire` (Fire.)
1. `hit?` (Has the player hit a ship with the fired thingy of doom?)
1. `sunk?` (Is the ship sunk?)
1. `result?` (Has the player won or lost yet?)
1. `map?` (What is the status of the map?)
1. `turn` (Two players can take turns to shoot.)


# Functional Representation
Objects  | Messages
------------- | -------------
`ship` | `place`, `choose_size`, `choose_orientation`, `fire`, `hit?`, `sunk?`
`board` | `in_bounds?`, `overlapped?`, `result?`, `map?`, `turn`
`player` |
