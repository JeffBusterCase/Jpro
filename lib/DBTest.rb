require 'net/http'

site = "http://localhost/dgm_database.yml"

response = Net::HTTP.get_response(URI.parse(site))
$stdout.puts response.body
sleep 30
