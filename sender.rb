require 'rubygems'
require 'httparty'
url = 'http://api.scvsoft.com/challenge-accepted/e0f4b7103bb86b9e'
response = HTTParty.post(url, query: { token: '6f682c2b7df54bfb5128472112f2226e', type: 'RUBY', code: File.read('prob5.rb')})
puts response.body, response.code, response.message, response.headers.inspect