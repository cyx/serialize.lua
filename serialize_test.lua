local serialize = require("serialize")

assert(serialize(1) == "1")

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

-- let"s do some hackery and verify that the serialized
-- form can be loaded back into lua via loadstring
--
-- we assign the loaded value to the global variable `t`
loadstring("t = " .. serialize(o))()

assert(t.a == 1)
assert(t.b == 2)
assert(t.c.d == 3)
assert(t.c.e == 4)

assert(t[1] == "g")
assert(t[2] == "h")
assert(t[3] == "i")
assert(t[4] == 10)
assert(t[5] == 11)
assert(t[6] == 12)
assert(t[7] == 13)

assert(t.z[1] == "foo")
assert(t.z[2] == "bar")
assert(t.z[3] == "baz")

assert(t.y == false)
assert(t.x == true)

print("all tests passed.")
