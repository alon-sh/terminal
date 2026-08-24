return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",

  config = function()
    require("nvim-treesitter").setup()

    require("nvim-treesitter").install({
      "javascript",
      "python",
      "typescript",
      "cpp",
      "cmake",
      "bash",
      "java",
      "c",
      "lua",
    })

    vim.api.nvim_create_autocmd("FileType", {
      pattern = {
        "javascript",
        "python",
        "typescript",
        "cpp",
        "cmake",
        "bash",
        "java",
        "c",
        "lua",
      },
      callback = function()
        vim.treesitter.start()
      end,
    })
  end,
}
