require "bundler/capistrano"

set :default_environment, {
    'PATH' => "$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH"
}

server "106.186.30.85", :web, :app, :db, primary: true

#cat ~/.ssh/id_rsa.pub | ssh deployer@106.186.30.85'cat >>

set :application, "just4magic"
set :user, "deployer"
set :deploy_to, "/home/#{user}/apps/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, false
set :bundle_flags, ''

set :scm, "git"
set :repository, "git@github.com:cqcn1991/magicf4l.git"
set :branch, "master"

#set :local_repository, "F:/Sites/shuffle/.git"
#set :scm, :none
#set :repository, "."
#set :deploy_via, :copy

default_run_options[:pty] = true
ssh_options[:forward_agent] = false

after "deploy", "deploy:cleanup" # keep only the last 5 releases

namespace :deploy do
      %w[start stop restart].each do |command|
        desc "#{command} unicorn server"
        task command, roles: :app, except: {no_release: true} do
        run "chmod +x /etc/init.d/unicorn_#{application}"
        run "/etc/init.d/unicorn_#{application} #{command}"
        end
      end

  task :setup_config, roles: :app do
    sudo "ln -nfs #{current_path}/config/nginx.conf /etc/nginx/sites-enabled/#{application}"
    sudo "ln -nfs #{current_path}/config/unicorn_init.sh /etc/init.d/unicorn_#{application}"
    run "mkdir -p #{shared_path}/config"
    put File.read("config/database.example.yml"), "#{shared_path}/config/database.yml"
    puts "Now edit the config files in #{shared_path}."
  end
  after "deploy:setup", "deploy:setup_config"

  task :symlink_config, roles: :app do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end
  after "deploy:finalize_update", "deploy:symlink_config"

    desc "Make sure local git is in sync with remote."
    task :check_revision, roles: :web do
      unless `git rev-parse HEAD` == `git rev-parse origin/master`
        puts "WARNING: HEAD is not the same as origin/master"
        puts "Run `git push` to sync changes."
        exit
      end
    end
    before "deploy", "deploy:check_revision"

  namespace :db do
    desc "Populates the Production Database"
    task :seed do
      puts "\n\n=== Populating the Production Database! ===\n\n"
      run "cd #{current_path}; rake db:seed RAILS_ENV=production"
    end
  end

  desc "tail production log files"
  task :tail_logs, :roles => :app do
    trap("INT") { puts 'Interupted'; exit 0; }
    run "tail -f #{shared_path}/log/production.log" do |channel, stream, data|
      puts  # for an extra line break before the host name
      puts "#{channel[:host]}: #{data}"
      break if stream == :err
    end
  end


end