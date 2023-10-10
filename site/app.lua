local lapis = require("lapis")
local config = require("lapis.config").get()
local app = lapis.Application()
local directory = "/usr/local/openresty/site/"

app:enable("etlua")
app.layout = require "views.layout"

app:get("/", function(self)
    self.page_title = "A Torre"
    local popen, i = io.popen, 0
    self.lugares = {}
    local pfile = popen('ls "'..directory..'/views/lugares" | grep -v / | cut -d"." -f1')
    for filename in pfile:lines() do
        i = i+1
        self.lugares[i] = filename
    end
    pfile:close()
    return { render = "index"}
end)

app:match("statics", "/static/:image", function(self) 
    self.page_title = "A Torre"
    return {self.params.image}
end)

app:match("lugares", "/lugares/:lugar", function(self) 
    self.page_title = "A Torre"
    self.gatos = {"Abraham", "Ob Nixilis", "Lutgarden", "Padre Agostinho"}
    return {render = "lugares"}
end)

return app
