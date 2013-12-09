# str2js

Utility to convert a string into a Javascript assignment. Mostly useful to "compile" arbitrary files into JavaScript variables.

### str2js(obj, key, str)

Returns a string in the form `(obj || (obj = {}))["key"] = "str";`, where `key` and `str` are escaped versions of the input arguments.
