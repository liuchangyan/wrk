function read_file(path)
  local file, errorMessage = io.open(path, "rb")
  if not file then
      error("Could not read the file:" .. errorMessage .. "\n")
  end

  local content = file:read "*all"
  file:close()
  return content
end

local Boundary = "----WebKitFormBoundaryePkpFF7tjBAqx29L"
local BodyBoundary = "--" .. Boundary
local LastBoundary = "--" .. Boundary .. "--"
local CRLF = "\r\n"
local FileBody = read_file("/home/changyanliu/teresa/liuchangyan/wrk/request-dir/test1.txt")
local Filename = "test1.txt"
local ContentDisposition = 'Content-Disposition: form-data; name="files[]"; filename="' .. Filename .. '"'
local ContentType = 'Content-Type: image/jpeg'

wrk.method = "POST"
wrk.headers["Content-Type"] = "multipart/form-data; boundary=" .. Boundary
wrk.body = BodyBoundary .. CRLF .. ContentDisposition .. CRLF .. ContentType .. CRLF .. CRLF .. FileBody .. CRLF .. LastBoundary
