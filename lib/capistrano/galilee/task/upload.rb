namespace :uploads do
    desc 'Upload to do'
    task :configuration do
        on roles(:all) do
            origin_file = "path/to/src_file"
            if origin_file && File.exists?(origin_file)
                ext = File.extname(origin_file)
                relative_path = "path/to/dest_file" + ext
                destination_file = "#{release_path}/" + relative_path
                execute "mkdir -p #{File.dirname(destination_file)}"

                upload! origin_file, destination_file
            end
        end
    end
end