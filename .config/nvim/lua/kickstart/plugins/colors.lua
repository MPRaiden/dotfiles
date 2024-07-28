return {
  --'folke/tokyonight.nvim',
  'rose-pine/neovim',
  priority = 1000,
  config = function()
    local transparent = true -- set to true if you would like to enable transparency

    require('rose-pine').setup {
      -- Uncomment the following if you are using tokyonight
      -- variant = 'moon', -- Variant options are main, moon, dawn
      -- style = 'night', -- the theme comes in three styles: `storm`, `moon`, a darker variant `night`, and `day`
      transparent = transparent,
      styles = {
        sidebars = transparent and 'transparent' or 'dark',
        floats = transparent and 'transparent' or 'dark',
        italic = false,
      },
    }

    -- Apply the colorscheme. Uncomment the one you are using.
    -- vim.cmd 'colorscheme tokyonight'
    vim.cmd 'colorscheme rose-pine' -- change between rose-pine alternatives here
    -- vim.cmd 'highlight Normal guibg=NONE ctermbg=NONE' -- uncomment for transparency
  end,
}
