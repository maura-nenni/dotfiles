require "nvchad.options"
-- choix de l'interpréteur python
local function system(command)
  local file = assert(io.popen(command, 'r'))
  local output = file:read('*all'):gsub("%s+", "")
  file:close()
  return output
end

vim.g.loaded_python3_provider = 1
if vim.fn.executable("python3") > 0 then
  vim.g.python3_host_prog = system("which python3")
end

-- ruler à 120 caractères
vim.opt.colorcolumn = "120"

-- nombre relatif par rapport à la ligne actuelle
vim.wo.relativenumber = true

-- pour obsidian 
vim.opt.conceallevel = 1

-- native spell check .... le dico existe plus
-- vim.g.loaded_spellfile_plugin = 0
-- vim.opt.spell = true
-- vim.opt.spelllang = "fr"
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
