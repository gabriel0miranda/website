-- config.lua
local config = require("lapis.config")

config("development", {
  greeting = "Hello world",
  port = 8080
})