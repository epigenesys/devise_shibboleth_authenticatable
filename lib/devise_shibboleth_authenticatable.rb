# encoding: utf-8
require 'devise'

require 'devise_shibboleth_authenticatable/exception'
require 'devise_shibboleth_authenticatable/logger'
require 'devise_shibboleth_authenticatable/schema'
require 'devise_shibboleth_authenticatable/routes'
require 'devise_shibboleth_authenticatable/version'

begin
  Rails::Engine
rescue
else
  module DeviseShibbolethAuthenticatable
    class Engine < Rails::Engine
    end
  end
end

module Devise
  # Allow logging
  mattr_accessor :shibboleth_logger
  @@shibboleth_logger = false

  # Add valid users to database
  mattr_accessor :shibboleth_create_user
  @@shibboleth_create_user = false

  # If necessary, overwrite the logout URL
  mattr_accessor :shibboleth_logout_url
  @@shibboleth_logout_url = "/Shibboleth.sso/Logout"

  # Store the return URL (after being logged out)
  mattr_accessor :shibboleth_return_url
  @@shibboleth_return_url = "/"

  # shibboleth_config is deprecated and no longer used
  mattr_accessor :shibboleth_config

  private

    def self.shib_logout_url(base_url)
      u = URI.parse(base_url)
      u.path = self.shibboleth_logout_url
      u.query = "return=#{self.shibboleth_return_url}"
      u.to_s
    end

    # Based on cas_action_url from devise_cas_authenticatable
    # https://github.com/nbudin/devise_cas_authenticatable/tree/26b2d82a11ee66a4d8dbe9c23b04bb9901065f8d/lib/devise_cas_authenticatable.rb#L113
    def self.action_url(base_url, mapping, action)
      u = URI.parse(base_url)
      u.query = nil
      u.path = if mapping.respond_to?(:fullpath)
        if ENV['RAILS_RELATIVE_URL_ROOT']
          ENV['RAILS_RELATIVE_URL_ROOT'] + mapping.fullpath
        else
          mapping.fullpath
        end
      else
        if ENV['RAILS_RELATIVE_URL_ROOT']
          ENV['RAILS_RELATIVE_URL_ROOT'] + mapping.raw_path
        else
          mapping.raw_path
        end
      end
      u.path << "/" unless u.path =~ /\/$/
      u.path << action
      u.to_s
    end

end

# Add shibboleth_authenticatable strategy to defaults.
#
Devise.add_module(:shibboleth_authenticatable,
                  :route => :shibboleth_authenticatable,
                  :strategy   => true,
                  :controller => :shibboleth_sessions,
                  :model  => 'devise_shibboleth_authenticatable/model')
