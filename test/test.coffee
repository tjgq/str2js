str2js = require '../index'
expect = require('chai').expect


tests =
    1:
        str: ""
        obj: 'a'
        key: 'b'
        result: '(a ||= {})["b"] = "";'
    2:
        str: "\\"
        obj: 'a'
        key: 'b'
        result: '(a ||= {})["b"] = "\\\\";'
    3:
        str: "abc\nxyz"
        obj: 'a'
        key: 'b'
        result: '(a ||= {})["b"] = "abc\\nxyz";'
    4:
        str: "abc\r\nxyz"
        obj: 'a'
        key: 'b'
        result: '(a ||= {})["b"] = "abc\\r\\nxyz";'
    5:
        str: "abc"
        obj: 'a'
        key: 'x"y'
        result: '(a ||= {})["x\\\"y"] = \"abc\";'
    6:
        str: "C:\\Windows\\System"
        obj: 'a'
        key: 'b'
        result: '(a ||= {})["b"] = "C:\\\\Windows\\\\System";'


describe 'str2js', ->
    for name, test of tests
        do (name, test) ->
            it name, ->
                expect(str2js(test.obj, test.key, test.str)).to.equal(test.result)
