# storyseller-rails-template

Rails application template for bootstrapping new Storyseller apps.

Every app created from this template starts with:

- PostgreSQL as the database
- Action Cable left out
- `AGENTS.md` with our coding guidelines, read by Claude Code, Codex and other agents
- Minitest for unit and integration tests, and Cucumber for acceptance tests

## Create an app

Requires Ruby, Rails and git. Replace `myapp` with your app's name:

```bash
rails new myapp -d postgresql --skip-action-cable -m https://raw.githubusercontent.com/storyseller/storyseller-rails-template/develop/template.rb
```

Add any other `rails new` options you need, for example `--css=tailwind`.

## Working on the template

To try local changes, point `-m` at your checkout instead of the URL:

```bash
rails new myapp -d postgresql --skip-action-cable -m path/to/storyseller-rails-template/template.rb
```

- `template.rb` – the steps `rails new` runs to set up the app
- `files/` – files copied into the new app
