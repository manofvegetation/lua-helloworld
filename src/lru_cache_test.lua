--
-- Created by IntelliJ IDEA.
-- User: lipeng
-- Date: 2021/8/31
-- Time: 14:19
-- To change this template use File | Settings | File Templates.
--

local lrucache = require "resty.lrucache"
local c = lrucache.new(200)
if not c then
    return error("failed to create the cache: " .. (err or "unknow"))
end

c:set('dog', 32)
ngx.say('dog: ', c:get('dog'))

