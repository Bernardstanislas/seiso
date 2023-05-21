-- change some telescope options and a keymap to browse plugin files
return {
	"nvim-telescope/telescope.nvim",
	keys = {
    -- add a keymap to browse plugin files
    -- stylua: ignore
    {
      "<leader>fp",
      function() require("telescope").extensions.projects.projects({}) end,
      desc = "Find projects",
    },
	},
	-- change some options
	opts = {
		defaults = {
			layout_strategy = "horizontal",
			layout_config = { prompt_position = "top" },
			sorting_strategy = "ascending",
			winblend = 0,
		},
	},
}
