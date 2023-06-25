---@type ChadrcConfig 
local M = {}

--- theme principal
M.ui = {theme = 'catppuccin'}

--- pour charger les mappings
M.mappings = require "custom.mappings"

--- plugins perso
M.plugins = "custom.plugins"

return M

