request = function()
    local headers = {}
    headers["Content-Type"] = "application/json"
    local body = [[{ "abc": "123", "xyz": { "animal": "cat", "color": "red" } }]]
    return wrk.format('POST', nil, headers, body)
end
