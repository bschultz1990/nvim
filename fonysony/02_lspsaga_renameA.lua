local M = {}

local variableOne = "I'm variable one from _renameA.lua!"
function M.renamed ()
  print(variableOne)
end

return M

