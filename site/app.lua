local lapis = require("lapis")
local config = require("lapis.config").get()
local app = lapis.Application()

app:enable("etlua")
app.layout = require "views.layout"

app:get("/", function(self)
  self.page_title = "Magus"
  return { render = "index"}
end)

return app
