namespace :bower do
    desc 'Run bower install'
    task :install do
        on roles(:all) do
            execute "sh -c 'cd #{release_path} && bower install --config.interactive=false'"
        end
    end
    task :prune do
        on roles(:all) do
            execute "sh -c 'cd #{release_path} && bower prune'"
        end
    end
end