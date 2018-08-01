# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{subscribed_to}
  s.version = "0.3.7"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["whtt-eric"]
  s.date = %q{2011-05-20}
  s.description = %q{Abstract layer for managing mailing list subscriptions}
  s.email = %q{eric@wehaventthetime.com}
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    ".rspec",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "app/controllers/subscribed_to/mail_chimp_web_hooks_controller.rb",
    "config/routes.rb",
    "lib/active_record_extensions.rb",
    "lib/generators/subscribed_to/USAGE",
    "lib/generators/subscribed_to/install_generator.rb",
    "lib/generators/subscribed_to/templates/migration.rb",
    "lib/generators/subscribed_to/templates/subscribed_to.rb",
    "lib/subscribed_to.rb",
    "lib/subscribed_to/engine.rb",
    "lib/subscribed_to/mail_chimp.rb",
    "lib/subscribed_to/mail_chimp/config.rb",
    "lib/subscribed_to/mail_chimp/web_hook.rb",
    "lib/subscribed_to/version.rb",
    "spec/app/controllers/subscribed_to/mail_chimp_web_hooks_spec.rb",
    "spec/dummy/Rakefile",
    "spec/dummy/app/controllers/application_controller.rb",
    "spec/dummy/app/helpers/application_helper.rb",
    "spec/dummy/app/models/user.rb",
    "spec/dummy/app/views/layouts/application.html.erb",
    "spec/dummy/config.ru",
    "spec/dummy/config/application.rb",
    "spec/dummy/config/boot.rb",
    "spec/dummy/config/database.yml",
    "spec/dummy/config/environment.rb",
    "spec/dummy/config/environments/development.rb",
    "spec/dummy/config/environments/production.rb",
    "spec/dummy/config/environments/test.rb",
    "spec/dummy/config/initializers/backtrace_silencers.rb",
    "spec/dummy/config/initializers/inflections.rb",
    "spec/dummy/config/initializers/mime_types.rb",
    "spec/dummy/config/initializers/secret_token.rb",
    "spec/dummy/config/initializers/session_store.rb",
    "spec/dummy/config/initializers/subscribed_to.rb",
    "spec/dummy/config/locales/en.yml",
    "spec/dummy/config/routes.rb",
    "spec/dummy/db/migrate/1_create_users.rb",
    "spec/dummy/db/schema.rb",
    "spec/dummy/public/404.html",
    "spec/dummy/public/422.html",
    "spec/dummy/public/500.html",
    "spec/dummy/public/favicon.ico",
    "spec/dummy/public/javascripts/application.js",
    "spec/dummy/public/javascripts/controls.js",
    "spec/dummy/public/javascripts/dragdrop.js",
    "spec/dummy/public/javascripts/effects.js",
    "spec/dummy/public/javascripts/prototype.js",
    "spec/dummy/public/javascripts/rails.js",
    "spec/dummy/public/stylesheets/.gitkeep",
    "spec/dummy/script/rails",
    "spec/factories/users.rb",
    "spec/lib/generators/install_generator_spec.rb",
    "spec/lib/subscribed_to/mail_chimp/config_spec.rb",
    "spec/lib/subscribed_to/mail_chimp/web_hook_spec.rb",
    "spec/lib/subscribed_to/mail_chimp_spec.rb",
    "spec/lib/subscribed_to_spec.rb",
    "spec/spec_helper.rb",
    "subscribed_to.gemspec"
  ]
  s.homepage = %q{http://github.com/whtt-eric/subscribed_to}
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{Abstract layer for managing mailing list subscriptions}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activerecord>, [">= 0"])
      s.add_runtime_dependency(%q<hominid>, [">= 3.0.2"])
      s.add_development_dependency(%q<sqlite3-ruby>, [">= 0"])
      s.add_development_dependency(%q<database_cleaner>, [">= 0"])
      s.add_development_dependency(%q<factory_girl_rails>, ["= 1.0.1"])
      s.add_development_dependency(%q<mocha>, ["= 0.9.12"])
      s.add_development_dependency(%q<rspec-rails>, ["= 2.5.0"])
      s.add_development_dependency(%q<generator_spec>, [">= 0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.6.0"])
      s.add_development_dependency(%q<simplecov>, [">= 0.4.0"])
      s.add_development_dependency(%q<hanna>, [">= 0"])
    else
      s.add_dependency(%q<activerecord>, [">= 0"])
      s.add_dependency(%q<hominid>, [">= 3.0.2"])
      s.add_dependency(%q<sqlite3-ruby>, [">= 0"])
      s.add_dependency(%q<database_cleaner>, [">= 0"])
      s.add_dependency(%q<factory_girl_rails>, ["= 1.0.1"])
      s.add_dependency(%q<mocha>, ["= 0.9.12"])
      s.add_dependency(%q<rspec-rails>, ["= 2.5.0"])
      s.add_dependency(%q<generator_spec>, [">= 0"])
      s.add_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.6.0"])
      s.add_dependency(%q<simplecov>, [">= 0.4.0"])
      s.add_dependency(%q<hanna>, [">= 0"])
    end
  else
    s.add_dependency(%q<activerecord>, [">= 0"])
    s.add_dependency(%q<hominid>, [">= 3.0.2"])
    s.add_dependency(%q<sqlite3-ruby>, [">= 0"])
    s.add_dependency(%q<database_cleaner>, [">= 0"])
    s.add_dependency(%q<factory_girl_rails>, ["= 1.0.1"])
    s.add_dependency(%q<mocha>, ["= 0.9.12"])
    s.add_dependency(%q<rspec-rails>, ["= 2.5.0"])
    s.add_dependency(%q<generator_spec>, [">= 0"])
    s.add_dependency(%q<bundler>, ["~> 1.0.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.6.0"])
    s.add_dependency(%q<simplecov>, [">= 0.4.0"])
    s.add_dependency(%q<hanna>, [">= 0"])
  end
end

