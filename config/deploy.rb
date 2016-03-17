lock '3.4.0'

set :repo_url, 'https://github.com/UbikZ/rss-export.git'
# Default => set :deploy_to, "/var/www/#{fetch(:application)}"

# Select Tag / Branch
def tag_branch_target
  tags = `git ls-remote --tags #{fetch(:repo_url)} | grep -o 'refs/tags/[0-9]*\.[0-9]*\.[0-9]*$' | cut -d / -f 3`.split("\n")
  tag_prompt = "last tags available are #{tags.reverse[(0..5)] or let empty to take default 'master'}"
  ask :branch_or_tag, tag_prompt
  tag = fetch(:branch_or_tag)
  tag
end

ask_tag = ENV['branch']
set :branch, ask_tag.to_s.empty? ? proc { tag_branch_target } : ask_tag
# End Select Tag / Branch

set :linked_dirs, fetch(:linked_dirs, []).push('app/data/logs', 'app/data/cache')

# Default setting
set :scm, :git
set :format, :pretty
set :log_level, :debug
set :pty, true

# Default value for keep_releases is 5
set :keep_releases, 3

# Composer install module
set :composer_install_flags, '--no-dev --no-interaction --optimize-autoloader'

# Workflow
after "composer:install", "bower:prune"
after "bower:prune", "bower:install"
#after "bower:install", "upload:configuration"