# storyseller-rails-template

Rails application template for bootstrapping new Storyseller apps.

## Usage

Requires [OrbStack](https://orbstack.dev) (or any Docker runtime). Ruby does not
need to be installed on your Mac.

From the folder where the new app should live:

```bash
~/Projects/storyseller-rails-template/bin/new-app myapp --database=postgresql
```

Any extra options are passed to `rails new`. The script generates the app in a
`ruby:3.4` container, then makes the first git commit on your Mac so your own git
setup (including commit signing) is used.

If Ruby and Rails are installed locally you can also run:

```bash
rails new myapp -m ~/Projects/storyseller-rails-template/template.rb
```

## Layout

- `template.rb` – the steps `rails new` runs to set up the app
- `files/` – files copied into the new app
- `bin/new-app` – runs `rails new` with this template inside a container
