return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = { 'BufReadPre', 'BufNewFile' }, -- load the plugin only when opening a buffer for an already existing file or for a new one
    opts = {
      ensure_installed = {
        'bash',
        'diff',
        'html',
        'lua',
        'luadoc',
        'markdown',
        'vim',
        'vimdoc',
        'go',
        'javascript',
        'python',
        'yaml',
        'typescript',
        'dockerfile',
        'gitignore',
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<C-space>',
          node_incremental = '<C-space>',
          scope_incremental = false,
          node_decremental = '<bs>',
        },
      },
      auto_install = true,
      highlight = {
        enable = true,
      },
      indent = { enable = true },
    },
    config = function(_, opts)
      -- Configure Treesitter, prefer git for installations
      require 'nvim-treesitter.install' -- there used to be ".prefer_git = true" here but whatever reason causes treesitter errors for me while for everyone else it fixes the same error (see here https:-- github.com/nvim-treesitter/nvim-treesitter/issues/3236) / TODO: If any more issues arrise from this look into installing https://aur.archlinux.org/packages/openssh-askpass as a potetial fix so prefer_git = true can be put back in
      require('nvim-treesitter.configs').setup(opts)
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
