# serialize 

Simple library to display structures (without
cyclical checks)

Primary goal is for debugging, but is fast enough for doing
persistence to a file.

## example

Given the following:

```lua
local serialize = require("serialize")

local o = {
	a = 1,
	b = 2,
	c = {
		d = 3,
		e = 4,
	},

	"g", "h", "i", 10, 11, 12, 13,

	z = { "foo", "bar", "baz" },

	y = false,
	x = true
}

print(serialize(o))
```

The output would be:

```lua
{
	[1] = "g", 
	[2] = "h", 
	[3] = "i", 
	[4] = 10, 
	[5] = 11, 
	[6] = 12, 
	[7] = 13, 
	["z"] = {
		[1] = "foo", 
		[2] = "bar", 
		[3] = "baz", 
	}, 
	["y"] = false, 
	["x"] = true, 
	["a"] = 1, 
	["b"] = 2, 
	["c"] = {
		["d"] = 3, 
		["e"] = 4, 
	}, 
}
```

## license

MIT
