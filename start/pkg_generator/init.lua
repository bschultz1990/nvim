local function read_json(path)
  local file = io.open(path, 'r')
  if not file then error("Could not open file: " .. path) end
  local content = file:read("*a")
  file:close()
  return vim.fn.json_decode(content)
end

local function write_json(path, data)
  local file = io.open(path, 'w')
  if not file then error("Could not write to file: " .. path) end
  file:write(vim.fn.json_encode(data))
  file:close()
end

local function merge_snippets (base, work)
  for _, snippet in ipairs(work.contributes.snippets or {}) do
    table.insert(base.contributes.snippets, snippet)
  end
  return base
end

-- MAIN --

local base_json = read_json(vim.fn.stdpath('config') .. "/start/pkg_generator/package.base.json")
local output_file = vim.fn.stdpath('config') .. "/snippets/package.json"

if vim.fn.getenv("WORK_COMPUTER") == "1" then
  print("WORK COMPUTER")
  local work_json = read_json(vim.fn.stdpath('config') .. "/start/pkg_generator/package.work.json")
  local merged = merge_snippets(base_json, work_json)
  write_json(output_file, merged)
else
  write_json(output_file, base_json)
end

print("✅ package.json generated")
