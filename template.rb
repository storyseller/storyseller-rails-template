# Rails application template for Storyseller apps.
#
# Usage:
#   bin/new-app myapp                       (runs inside Docker, no local Ruby needed)
#   rails new myapp -m path/to/template.rb  (if Ruby and Rails are installed locally)

# Lets `template` and `copy_file` find the files/ folder next to this script.
# `super` keeps Rails' own paths, which its generators still need after this runs.
def source_paths
  [__dir__] + super
end

# Agent instructions. CLAUDE.md points at AGENTS.md so every agent reads the same file.
template "files/AGENTS.md.tt", "AGENTS.md"
create_link "CLAUDE.md", "AGENTS.md"

# Cucumber for behaviour-driven acceptance tests.
gem_group :test do
  gem "cucumber-rails", require: false
  gem "database_cleaner-active_record"
end

after_bundle do
  generate "cucumber:install"
end
