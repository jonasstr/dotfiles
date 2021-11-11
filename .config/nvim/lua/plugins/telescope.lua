
require('telescope').setup {
  defaults = {
    -- sort_mru = true,
    path_display = { "truncate" }
  }
}

-- Cyan Telescope borders
vim.cmd [[highlight TelescopeResultsBorder guifg=#56a5e5]]
vim.cmd [[highlight TelescopePreviewBorder guifg=#56a5e5]]
vim.cmd [[highlight TelescopePromptBorder guifg=#56a5e5]]

local map = require('../utils').map

map('n', '<leader>ff', '<cmd>lua require("plugins.telescope").find_files()<cr>')
map('n', '<leader>fi', '<cmd>lua require("plugins.telescope").find_inacon()<cr>')
map('n', '<leader>fu', '<cmd>lua require("plugins.telescope").find_old_inacon()<cr>')
map('n', '<leader>fp', '<cmd>lua require("plugins.telescope").project_search()<cr>')

-- Search in vim plugin files
map('n', '<leader>fv', '<cmd>lua require("plugins.telescope").find_plugins()<cr>')
map('n', '<leader>fc', '<cmd>lua require("plugins.telescope").find_config()<cr>')
-- map('n', '<leader>vg', '<cmd>lua require("plugins.telescope").grep_plugins()<cr>')

-- Find old
map('n', '<leader>fo', '<cmd>Telescope frecency<cr>')
-- Requires ripgrep to be installed (sudo apt install ripgrep)
map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
-- nno <leader>fo <cmd>Telescope oldfiles<cr>

map('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
map('n', '<leader>h', '<cmd>Telescope help_tags<cr>')
map('n', '<leader>s', '<cmd>Telescope colorscheme<cr>')
-- List keybindings
map('n', '<leader>b', '<cmd>Telescope keymaps<cr>')
-- List projects (project.nvim)
map('n', '<leader>P', '<cmd>Telescope projects<cr>')

local env = vim.env
local builtin = require('telescope.builtin')

local M = {}
function M.find_files()
  builtin.find_files {
    cwd = '~',
    hidden = true
  }
end

function M.project_search()
  builtin.find_files {
    previewer = false,
    prompt_title = 'Project Search',
    layout_strategy = 'vertical',
    cwd = require('lspconfig/util').root_pattern '.git'(vim.fn.expand "%:p"),
  }
end

function M.find_inacon()
  builtin.find_files {
    prompt_title = 'Find Inacon Files',
    search_dirs = { env.INACON_DIR .. "/Kurse", env.INACON_DIR .. "/Automation" }
  }
end

function M.find_old_inacon()
  builtin.oldfiles {
    prompt_title = 'Find Old Inacon Files',
    search_dirs = { env.INACON_DIR .. "/Kurse", env.INACON_DIR .. "/Automation" }
  }
end

function M.find_plugins()
  builtin.find_files {
    prompt_title = 'Find Vim Plugins',
    search_dirs = { vim.fn.stdpath('data') }
  }
end

function M.find_config()
  builtin.find_files {
    prompt_title = 'Find Config Files',
    search_dirs = { vim.fn.stdpath('config') },
    file_ignore_patterns = { 'haskell%-language%-server', 'hls' }
  }
end

-- function M.grep_plugins()
--   builtin.live_grep {
--     prompt_title = "Grep Vim Plugins",
--     search_dirs = { vim.fn.stdpath('data') }
--   }
-- end
return M