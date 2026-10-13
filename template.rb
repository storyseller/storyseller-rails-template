# Rails application template for Storyseller apps.
#
# Usage:
#   rails new myapp -d postgresql --skip-action-cable \
#     -m https://raw.githubusercontent.com/storyseller/storyseller-rails-template/develop/template.rb

require "tmpdir"

TEMPLATE_REPOSITORY = "https://github.com/storyseller/storyseller-rails-template.git"

# When run from a URL, Rails downloads only this file, not the files/ folder.
# In that case we clone the repository into a temporary folder and copy from there.
# When run from a local checkout, we copy straight from the checkout.
def template_root
  @template_root ||= __FILE__.start_with?("http") ? clone_template_repository : __dir__
end

# The branch comes from the URL, e.g. ".../storyseller-rails-template/develop/template.rb".
def clone_template_repository
  branch = __FILE__[%r{storyseller-rails-template/(.+)/template\.rb}, 1]
  folder = Dir.mktmpdir("storyseller-rails-template-")
  at_exit { FileUtils.remove_entry(folder) }

  run "git clone --quiet --depth 1 --branch #{branch} #{TEMPLATE_REPOSITORY} #{folder}",
    abort_on_failure: true
  folder
end

# Lets `template` and `copy_file` find the files/ folder.
# `super` keeps Rails' own paths, which its generators still need after this runs.
def source_paths
  [template_root] + super
end

# Agent instructions. Claude Code, Codex and other agents all read AGENTS.md.
template "files/AGENTS.md.tt", "AGENTS.md"

# Cucumber for behaviour-driven acceptance tests.
gem_group :test do
  gem "cucumber-rails", require: false
  gem "database_cleaner-active_record"
end

after_bundle do
  generate "cucumber:install"
end
