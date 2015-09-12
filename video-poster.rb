#!/usr/bin/env ruby

require 'net/http'
require 'json'

@host = 'localhost'
#@port = '80'
@port = '3000'

@path = '/urls.json'

def post(payload)
  req = Net::HTTP::Post.new(@path, initheader = {'Content-Type' =>'application/json'})
  req.body = payload
  response = Net::HTTP.new(@host, @port).start {|http| http.request(req) }
  puts "Response #{response.code} #{response.message}: #{response.body}"
end

file = File.read('test.json')
data_ary = JSON.parse(file)
count = 0
data_ary.each do |payload|
  post(payload.to_json)
  count += 1
end

puts "\nTotal posted #{count}"
