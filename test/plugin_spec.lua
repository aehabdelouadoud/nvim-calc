-- plugin_spec.lua - Tests for MyPlugin

local myplugin = require("myplugin")
local eq = assert.are.same

describe("MyPlugin Calculator", function()
    it("evaluates basic expressions correctly", function()
        local result = myplugin.calculate_expression("10 + 20 / l(10)")
        eq(result, "16.6615")
    end)

    it("handles complex expressions", function()
        local result = myplugin.calculate_expression("(5 * 2) + sqrt(25)")
        eq(result, "15")
    end)

    it("returns error for invalid input", function()
        local result = myplugin.calculate_expression("invalid + input")
        eq(result, "Error")
    end)
end)
