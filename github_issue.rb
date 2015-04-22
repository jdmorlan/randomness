require 'octokit'

client = Octokit::Client.new(:login => 'jdmorlan', :password => 'DanRocks2010')


repo = client.repository('jdmorlan/dynamo')

languages = Octokit.languages(repo.full_name)

puts languages.inspect
