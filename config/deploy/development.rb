server 'localhost', user: fetch(:user), roles: %w{web app db}

port = `vagrant ssh-config | grep Port | grep -oE '[^ ]+$'`.strip

set :ssh_options, {
  forward_agent: true,
  port: port
}
