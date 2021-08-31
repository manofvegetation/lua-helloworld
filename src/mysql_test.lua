--
-- Created by IntelliJ IDEA.
-- User: lipeng
-- Date: 2021/8/31
-- Time: 10:40
-- To change this template use File | Settings | File Templates.
--

local mysql = require "resty.mysql"
local db, err = mysql:new()
if not db then
    ngx.say('failed to instantiate mysql: ', err)
end

db:set_timeout(1000)

local ok, err, errno, sqlstate = db:connect{
    host = '127.0.0.1',
    port = 3306,
    database = 'ngx_text',
    user = 'ngx_test',
    password = 'ngx_test',
    max_package_size = 1024 * 1024
}

if not ok then
    ngx.say('failed to connect: ', err, ": " , errno, ' ', sqlstate)
    return
end

ngx.say('connected to mysql.')


res, err, errno, sqlstate =
    db:query("create table cats "
             .. "(id serial primary key, "
             .. "name varchar(5))")

if not res then
    ngx.say("bad result: ", err, ": ", errno, ": ", sqlstate, ".")
    return
end

ngx.say("table cats created.")

res, err, errno, sqlstate =
    db:query("insert into cats (name) " .. "values (\'Bob\')")

if not res then
    ngx.say('bad result: ', err, ': ', errno, ': ', sqlstate, '.')
    return
end