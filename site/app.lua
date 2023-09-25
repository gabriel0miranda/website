local lapis = require("lapis")
local config = require("lapis.config").get()
local app = lapis.Application()
local directory = "/usr/local/openresty/site/"

app:enable("etlua")
app.layout = require "views.layout"

app:get("/", function(self)
    self.page_title = "Magus"
    local popen, i = io.popen, 0
    self.posts = {}
    local pfile = popen('ls "'..directory..'/views/posts" | grep -v / | cut -d"." -f1')
    for filename in pfile:lines() do
        i = i+1
        self.posts[i] = filename
    end
    pfile:close()
    return { render = "index"}
end)

app:match("statics", "/static/:image", function(self) 
    self.page_title = "Magus"
    return {self.params.image}
end)

app:match("posts", "/posts/:post", function(self) 
    self.page_title = "Magus"
    self.gatos = {"Abraham", "Ob Nixilis", "Lutgarden", "Padre Agostinho"}
    return {render = "posts"}
end)

return app
