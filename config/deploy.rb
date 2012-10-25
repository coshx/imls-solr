require 'bundler/capistrano'
require 'capistrano_colors'

set :repository,  "git@github.com:coshx/imls-solr.git"
set :branch, fetch(:branch, "master")
set :deploy_to, "/opt/solr"
set :use_sudo, false
set :keep_releases, 3
set :scm, :git
set :user, :solr

default_run_options[:pty]   = true
default_run_options[:shell] = "/bin/bash -l"

ssh_options[:forward_agent] = true

set :deploy_via, :remote_cache

set :domain, "128.143.8.227"

role :app, domain

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :finalize_update do ; end
  
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} /etc/init.d/jetty restart"
  end
end
