puts " "
puts " ###################################################################### "
puts " # "
puts " # Capistrano -> Staging"
puts " # "
puts " ###################################################################### "
puts " "

set :application, 'test.capistrano'

server 'ubikz.com',
  user: 'www-data',
  ssh_options: {
    forward_agent: true,
  }