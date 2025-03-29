local M = {}

-- Function to evaluate an expression using bc
local function evaluate_expression(expression)
    local handle = io.popen("echo '" .. expression .. "' | bc -l")
    if handle then
        local result = handle:read("*a")
        handle:close()
        return result:gsub("\n", "") -- Remove newline from result
    end
    return "Error"
end

-- Function to replace selection with the result
function M.calculate()
    -- Get visual selection
    local start_row, start_col, end_row, end_col = unpack(vim.fn.getpos("'<")), unpack(vim.fn.getpos("'>"))
    start_row, start_col = start_row - 1, start_col - 1
    end_row, end_col = end_row - 1, end_col

    local lines = vim.api.nvim_buf_get_text(0, start_row, start_col, end_row, end_col, {})
    local expression = table.concat(lines, " ")

    -- Evaluate the expression
    local result = evaluate_expression(expression)

    -- Replace or append result next to expression
    vim.api.nvim_buf_set_text(0, start_row, start_col, end_row, end_col, {expression .. " = " .. result})
end

-- Create a user command
vim.api.nvim_create_user_command("Calc", M.calculate, {range = true})

return M

