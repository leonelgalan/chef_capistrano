# config valid only for current version of Capistrano
lock '3.3.5'

set :user, 'deploy'
set :application, 'chef_capistrano'
# set :repo_url, 'git@github.com:leonelgalan/chef_capistrano.git'

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/home/#{ fetch :user }/www/#{ fetch :application }"

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :info

# Default value for :pty is false
# set :pty, true

set :rbenv_type, :system
set :rbenv_ruby, '2.1.5'
set :rbenv_custom_path, '/usr/local/rbenv'
# set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
# set :rbenv_map_bins, %w{rake gem bundle ruby rails}

# Default value for :linked_files is []
set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')

# Default value for linked_dirs is []
set :linked_dirs, fetch(:linked_dirs, []).push('bin', 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

# Default value for default_env is {}

# Default value for keep_releases is 5
# set :keep_releases, 5

before 'deploy:check:linked_files', 'config:push'

namespace :deploy do
  task :restart do
    invoke 'unicorn:restart'
  end

  after :publishing, :restart
end
