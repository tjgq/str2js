replaceList = [ [ /\\/g, '\\\\' ],
                [ /\"/g, '\\"'  ],
                [ /\n/g, '\\n'  ],
                [ /\r/g, '\\r'  ] ]

escape = (s) ->
    s = s.replace(x, y) for [x, y] in replaceList
    return s

str2js = (obj, key, str) ->
    "(#{obj} || (#{obj} = {}))[\"#{escape(key)}\"] = \"#{escape(str)}\";"

module.exports = str2js
