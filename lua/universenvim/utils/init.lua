local core_utils = require("universenvim.utils.core")
local lsp_utils = require("universenvim.utils.lsp")
local formatter_utils = require("universenvim.utils.formatter")
local setup_utils = require("universenvim.utils.setup")
local mini_utils = require("universenvim.utils.mini")

local utils = core_utils.merge(core_utils, lsp_utils, formatter_utils, setup_utils, mini_utils)

return utils
