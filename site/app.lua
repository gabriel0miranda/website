local lapis = require("lapis")
local config = require("lapis.config").get()
local app = lapis.Application()
local directory = "/usr/local/openresty/site/"

app:enable("etlua")
app.layout = require "views.layout"

app:get("/", function(self)
  self.page_title = "Magus"
  local i, popen = 0, io.popen
  self.posts = {}
  local pfile = popen('ls -a "'..directory..'/views/posts" | grep -v / | cut -d"." -f1')
  for filename in pfile:lines() do
    i = i + 1
    self.posts[i] = filename
  end
  pfile:close()
  return { render = "index"}
end)

app:match("/static/:image", function(self) 
    return {self.params.image}
end)

app:match("/posts/:post", function(self) 
    return {render = "posts"}
end)

return app
