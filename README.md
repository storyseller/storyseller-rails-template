# storyseller-rails-template

Rails application template for bootstrapping new Storyseller apps.

Every app created from this template starts with:

- PostgreSQL as the database
- Action Cable left out
- `AGENTS.md` with our coding guidelines, and `CLAUDE.md` linked to it
- Minitest for unit and integration tests, and Cucumber for acceptance tests

## Usage

### 1. Get the template

```bash
git clone git@github.com:storyseller/storyseller-rails-template.git ~/Projects/storyseller-rails-template
```

### 2. Create an app

Requires Docker. Ruby does not need to be installed.

From the folder where the new app should live:

```bash
cd ~/Projects
~/Projects/storyseller-rails-template/bin/new-app myapp
```

This creates `~/Projects/myapp` with its first git commit already made.

### 3. Pass extra `rails new` options (optional)

Anything after the app name is passed to `rails new`. For example:

```bash
# Use SQLite instead of PostgreSQL
~/Projects/storyseller-rails-template/bin/new-app myapp --database=sqlite3

# Use Tailwind CSS
~/Projects/storyseller-rails-template/bin/new-app myapp --css=tailwind
```

### Without Docker

If Ruby and Rails are installed locally:

```bash
rails new myapp --database=postgresql --skip-action-cable -m ~/Projects/storyseller-rails-template/template.rb
```

## How it works

`bin/new-app` runs `rails new` with this template inside a `ruby:3.4` container,
then makes the first git commit on your machine so your own git setup (including
commit signing) is used.

- `template.rb` – the steps `rails new` runs to set up the app
- `files/` – files copied into the new app
- `bin/new-app` – runs `rails new` with this template inside a container
