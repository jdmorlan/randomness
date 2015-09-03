require 'octokit'

client = Octokit::Client.new(:login => 'jdmorlan', :password => '*********')


repo = client.repository('jdmorlan/dynamo')

languages = Octokit.languages(repo.full_name)

puts languages.inspect
