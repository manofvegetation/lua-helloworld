--
-- Created by IntelliJ IDEA.
-- User: lipeng
-- Date: 2021/8/31
-- Time: 10:54
-- To change this template use File | Settings | File Templates.
--
local redis = require "resty.redis"
local red = redis:new()

red:set_timeout(1000)

local ok, err= red:connect('192.168.11.96', 6379)
if not ok then
    ngx.say("failed to connect: ", err)
    return
end

ok, err = red:set('dog', 'an animal')
if not ok then
    ngx.say('failed to set dog: ', err)
    return
end

ngx.say('set result: ', ok)

local ok, err = red:set_keepalive(10000, 100)
if not ok then
    ngx.say('failed to set keepalive: ', err)
    return
end