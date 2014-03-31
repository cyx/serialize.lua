local insert = table.insert
local concat = table.concat
local format = string.format
local sub = string.sub

local function serialize(object, level)
	level = level or 0

	local res = {}
	local typ = type(object)
	local pad = string.rep("\t", level + 1)

	if typ == "number" then
		insert(res, object)
	elseif typ == "boolean" then
		insert(res, tostring(object))
	elseif typ == "string" then
		insert(res, format("%q", object))
	elseif typ == "table" then
		insert(res, "{\n")

		for k,v in pairs(object) do
			local fmt

			if type(k) == "number" then
				fmt = '%s[%s] = '
			else
				fmt = '%s["%s"] = '
			end

			insert(res, format(fmt, pad, k))
			insert(res, serialize(v, level + 1))
			insert(res, ", \n")
		end

		insert(res, format("%s}", sub(pad, 2)))
	else
		error("cannot serialize a " .. typ)
	end

	return concat(res)
end

return serialize
