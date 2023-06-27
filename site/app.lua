local lapis = require("lapis")
local config = require("lapis.config").get()
local app = lapis.Application()

app:enable("etlua")

app:get("/", function(self)
  return { render = "index"}
end)

return app
