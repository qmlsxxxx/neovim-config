require('telescope').setup {
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
    }
  },
  pickers = {
	  find_files = { theme = "ivy", layout_config = { height = 30 } },
	  live_grep = { theme = "ivy", layout_config = { height = 30 } },
	  buffers = { theme = "ivy", layout_config = { height = 30 } },
	  bookmarks = { theme = "ivy", layout_config = { height = 30 } }
  }
}
