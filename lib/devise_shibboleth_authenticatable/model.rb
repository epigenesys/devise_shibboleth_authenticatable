require 'devise_shibboleth_authenticatable/strategy'

module Devise
  module Models
    module ShibbolethAuthenticatable
      extend ActiveSupport::Concern

      module ClassMethods
        def authenticate_with_shibboleth(env)
          auth_key = self.authentication_keys.first
          auth_key_value = (self.case_insensitive_keys || []).include?(auth_key) ? env['eppn'].downcase : env['eppn']

          resource = where(auth_key => auth_key_value).first

          if resource.nil?
            if Devise.shibboleth_create_user
              logger.info("Creating user(#{auth_key_value}).")
              resource = new
              resource.update_shib_info(env)
              resource.save
            else
              logger.info("User(#{auth_key_value}) not found.  Not configured to create the user.")
              return nil
            end
          end

          resource
        end
      end

      module InstanceMethods
        def update_shib_info(env)
        end
      end
    end
  end
end
