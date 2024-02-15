local Utils = require("universenvim.utils")
local constants = require("universenvim.config.constants")
local setup = require("universenvim.config.setup")

require("universenvim.config.autocommands")
require("universenvim.config.keymaps")
require("universenvim.config.options")

local defaults = Utils.merge(constants, setup);

return defaults
