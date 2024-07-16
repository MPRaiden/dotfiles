return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    opts = {
      ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'vim', 'vimdoc' },
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { 'ruby' },
      },
      indent = { enable = true, disable = { 'ruby' } },
    },
    config = function(_, opts)
      -- Configure Treesitter, prefer git for installations
      require 'nvim-treesitter.install' -- there used to be ".prefer_git = true" here but whatever reason causes treesitter errors for me while for everyone else it fixes the same error (see here https:-- github.com/nvim-treesitter/nvim-treesitter/issues/3232) / TODO: If any more issues arrise from this look into installing https://aur.archlinux.org/packages/openssh-askpass as a potetial fix so prefer_git = true can be put back in
      require('nvim-treesitter.configs').setup(opts)
    end,
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    config = function()
      require('treesitter-context').setup {
        enable = false, -- Enable this plugin (Can be enabled/disabled later via commands)
        max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
        trim_scope = 'outer', -- Which context lines should be discarded if `max_lines` is exceeded. Choices: 'inner', 'outer'
        mode = 'cursor', -- Line used to calculate context. Choices: 'cursor', 'topline'
        separator = nil, -- Separator between context and content. Should be a string like "─" or any valid sequence.
        zindex = 20, -- The Z-index of the context window
      }
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
