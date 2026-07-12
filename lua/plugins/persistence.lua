return {
	"folke/persistence.nvim",
	event = "BufReadPre",
	opts = {},
	keys = {
		-- Restore the session for the current directory
		{
			"qs",
			function()
				require("persistence").load()
			end,
			desc = "Restore Session",
		},
		-- Select a session to load
		{
			"qS",
			function()
				require("persistence").select()
			end,
			desc = "Select Session",
		},
		-- Restore the last session
		{
			"ql",
			function()
				require("persistence").load({ last = true })
			end,
			desc = "Restore Last Session",
		},
		-- Stop Persistence from saving the session on exit
		{
			"qd",
			function()
				require("persistence").stop()
			end,
			desc = "Don't Save Current Session",
		},
	},
}
