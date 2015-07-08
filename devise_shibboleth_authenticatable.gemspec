lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'devise_shibboleth_authenticatable/version'

Gem::Specification.new do |s|
  s.name = "devise_shibboleth_authenticatable"
  s.version = DeviseShibbolethAuthenticatable::VERSION

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["James Gregory", "Brittany Martin", "Joe George"]
  s.date = "2015-07-08"
  s.description = "Shibboleth authentication support for Devise"
  s.email = "james.gregory@epigenesys.org.uk"
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "app/controllers/devise/shibboleth_sessions_controller.rb",
    "devise_shibboleth_authenticatable.gemspec",
    "lib/devise_shibboleth_authenticatable.rb",
    "lib/devise_shibboleth_authenticatable/exception.rb",
    "lib/devise_shibboleth_authenticatable/logger.rb",
    "lib/devise_shibboleth_authenticatable/model.rb",
    "lib/devise_shibboleth_authenticatable/routes.rb",
    "lib/devise_shibboleth_authenticatable/schema.rb",
    "lib/devise_shibboleth_authenticatable/strategy.rb",
    "lib/devise_shibboleth_authenticatable/version.rb",
    "lib/generators/devise_shibboleth_authenticatable/install_generator.rb",
    "lib/generators/devise_shibboleth_authenticatable/templates/shibboleth.yml",
    "rails/init.rb"
  ]
  s.homepage = "http://github.com/epigenesys/devise_shibboleth_authenticatable"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.15"
  s.summary = "Shibboleth authentication support for Devise"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>)
      s.add_development_dependency(%q<shoulda>, [">= 0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.6.4"])
      s.add_development_dependency(%q<simplecov>, [">= 0"])
      s.add_runtime_dependency(%q<devise>, ["> 3.4.0"])
    else
      s.add_dependency(%q<bundler>)
      s.add_dependency(%q<shoulda>, [">= 0"])
      s.add_dependency(%q<jeweler>, ["~> 1.6.4"])
      s.add_dependency(%q<simplecov>, [">= 0"])
      s.add_dependency(%q<devise>, ["> 3.4.0"])
    end
  else
    s.add_dependency(%q<bundler>)
    s.add_dependency(%q<shoulda>, [">= 0"])
    s.add_dependency(%q<jeweler>, ["~> 1.6.4"])
    s.add_dependency(%q<simplecov>, [">= 0"])
    s.add_dependency(%q<devise>, ["> 3.4.0"])
  end
end
