--
-- Created by IntelliJ IDEA.
-- User: lipeng
-- Date: 2021/8/31
-- Time: 14:51
-- To change this template use File | Settings | File Templates.
--

local red = redis:new()

function set_to_cache(key, value, exptime)
    if not exptime then
        exptime = 0
    end
    local cache_ngx
end

function get_from_cache(key)
    local cache_ngx = ngx.shared.cache_ngx
    local value=cache_ngx:get(key)
    if not value then
        value = get_from_redis(key)
        set_to_cache(key, value)
    end
    return value
end

function get_from_redis