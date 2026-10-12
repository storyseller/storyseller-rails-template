# Rails application template for Storyseller apps.
#
# Usage:
#   bin/new-app myapp                       (runs inside OrbStack, no local Ruby needed)
#   rails new myapp -m path/to/template.rb  (if Ruby and Rails are installed locally)

# Lets `template` and `copy_file` find the files/ folder next to this script.
# `super` keeps Rails' own paths, which its generators still need after this runs.
def source_paths
  [__dir__] + super
end
