return function()
	require("mappy")({
		version = "stable",
	})

	local module = require("mappy"):new()
end
