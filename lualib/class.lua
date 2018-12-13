-- a minimal class implementation
-- 一个精简版的类实现
function class(cls_name)
    local cls = { }
    cls.__index = cls
    cls.__name = cls_name
    cls.__call = function (cls, ...)
        if cls[cls.__name] then
            return cls[cls.__name](cls, ...)
        end
        return nil
    end
    cls.new = function (c, ...)
        if cls ~= c then
            print("[class.lua] Please use ':' to index (new) method :)")
            return
        end
        c.ctor(c, ...)
        return setmetatable({}, c)
    end
    return cls
end

return class