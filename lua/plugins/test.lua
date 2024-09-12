-- Work with Highlighted Text
local function get_selected_text(start_line, end_line)
    local lines = vim.fn.getline(start_line, end_line)

    if #lines > 0 then
        -- Get the start position and ensure it's inclusive
        local start_pos = vim.fn.getpos("'<")[3]
        lines[1] = string.sub(lines[1], start_pos)
    end

    if #lines > 1 then
        -- Get the end position and ensure it's exclusive
        local end_pos = vim.fn.getpos("'>")[3] - 1
        lines[#lines] = string.sub(lines[#lines], 1, end_pos)
    elseif #lines == 1 then
        -- For a single line, use the correct start and end positions
        local start_pos = vim.fn.getpos("'<")[3]
        local end_pos = vim.fn.getpos("'>")[3] - 1
        lines[1] = string.sub(lines[1], start_pos, end_pos)
    end

    -- Join the lines with newline characters
    if type(lines) ~= "table" then return "" end
    return table.concat(lines, "\n")
end

vim.api.nvim_create_user_command("RS", function(opts)
  local selected_text = get_selected_text(opts.line1, opts.line2)
  print(selected_text)
  local stripped_text = selected_text:gsub(" +%| +", "|")
  print(stripped_text)
  local final_text = stripped_text:gsub("|", " ")
  vim.fn.setreg("+", final_text)
  print(final_text)
end, { range = true })  -- Enable range for the command
