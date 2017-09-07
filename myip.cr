require "http/client"

IP_FILE    = File.expand_path("~/.ip.txt")
IP_ADDRESS = "https://bot.whatismyipaddress.com"

last_ip = "none"

last_ip = File.file?(IP_FILE) ? File.read(IP_FILE) : "none"
if last_ip == ""
  last_ip = "none"
end

response = HTTP::Client.get(IP_ADDRESS)
if response.status_code == 200 && response.body != last_ip
  puts "IP has changed from #{last_ip} to #{response.body}"
  File.write(IP_FILE, response.body)
end
