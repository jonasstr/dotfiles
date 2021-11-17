local function has_any_words_before()
  if vim.api.nvim_buf_get_option(0, 'buftype') == 'prompt' then
    return false
  end
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
end

local function press(key)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), 'n', true)
end

local cmp = require('cmp')
local cur_snippet_engine = vim.g['snippet_engine']

local luasnip
if cur_snippet_engine == 'luasnip' then
  luasnip = require('luasnip')
end

local function expand_for(snippet_engine, args)
  if snippet_engine == 'luasnip' then
    luasnip.lsp_expand(args.body)
  elseif snippet_engine == 'ultisnips' then
    vim.fn["UltiSnips#Anon"](args.body)
  end
end

local function tab_for(snippet_engine, fallback)
  if snippet_engine == 'luasnip' then
    if luasnip.expand_or_jumpable() then
      luasnip.expand_or_jump()
    elseif has_any_words_before() then
      cmp.complete()
     else
      fallback()
    end
  elseif snippet_engine == 'ultisnips' then
    if cmp.get_selected_entry() == nil and vim.fn['UltiSnips#CanExpandSnippet']() == 1 then
      press('<C-R>=UltiSnips#ExpandSnippet()<CR>')
    elseif vim.fn['UltiSnips#CanJumpForwards']() == 1 then
      press('<ESC>:call UltiSnips#JumpForwards()<CR>')
    elseif has_any_words_before() then
      press('<Tab>')
    else
      fallback()
    end
  end
end

local function shift_tab_for(snippet_engine, fallback)
  if snippet_engine == 'luasnip' then
    if luasnip.jumpable(-1) then
      luasnip.jump(-1)
    else
      fallback()
    end
  elseif snippet_engine == 'ultisnips' then
    if vim.fn['UltiSnips#CanJumpBackwards']() == 1 then
      press('<ESC>:call UltiSnips#JumpBackwards()<CR>')
    else
      fallback()
    end
  end
end

cmp.setup {
  snippet = {
    expand = function(args)
      expand_for(cur_snippet_engine, args)
    end,
  },
  sources = {
    { name = 'nvim_lua' },
    { name = 'nvim_lsp' },
    -- { name = 'vsnip' },
    { name = 'path' },
    { name = cur_snippet_engine, priority = 10 },
    { name = 'buffer', keyword_length = 3 },
  },
  experimental = {
    ghost_text = true
  },
  mapping = {
    -- mostly keep defaults except use <C-f> instead <C-y>
    -- and overload tab keys for snippet plugins
    ['<C-f>'] = cmp.mapping(cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    }, { 'i', 'c' }),
    ['<Tab>'] = cmp.mapping(function(fallback)
      tab_for(cur_snippet_engine, fallback)
    end, { 'i', 's' }),
    ['<Shift-Tab>'] = cmp.mapping(function(fallback)
      shift_tab_for(cur_snippet_engine, fallback)
    end, { 'i', 's' }),
  },
  sorting = {
    comparators = {
      cmp.config.compare.offset,
      cmp.config.compare.exact,
      cmp.config.compare.score,
      require 'cmp-under-comparator'.under,
      cmp.config.compare.kind,
      cmp.config.compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
    },
  }
}
