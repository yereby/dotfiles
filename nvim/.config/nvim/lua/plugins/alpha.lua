return {
	"goolord/alpha-nvim",
  lazy = false,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.startify")

		dashboard.section.header.val = {
			[[                                                                       ]],
			[[                                                                       ]],
			[[                                                                     ]],
			[[       ████ ██████           █████      ██                     ]],
			[[      ███████████             █████                             ]],
			[[      █████████ ███████████████████ ███   ███████████   ]],
			[[     █████████  ███    █████████████ █████ ██████████████   ]],
			[[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
			[[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
			[[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
			[[                                                                       ]],
			[[                                                                       ]],
			[[                                                                       ]],
		}

		-- 		_Gopts = {
		-- 			position = "center",
		-- 			hl = "Type",
		-- 			-- wrap = "overflow";
		-- 		}
		--
		-- 		local function footer()
		-- 			return "Haskell can suck mo' nads"
		-- 		end
		--
		-- 		dashboard.section.footer.val = footer()
		--
		-- 		dashboard.opts.opts.noautocmd = true
		alpha.setup(dashboard.opts)
	end,
}
