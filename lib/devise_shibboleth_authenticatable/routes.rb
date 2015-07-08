ActionDispatch::Routing::Mapper.class_eval do
  protected

  def devise_shibboleth_authenticatable(mapping, controllers)
    resource :session, :only => [], :controller => controllers[:shibboleth_sessions], :path => "" do
      sign_out_via = (Devise.respond_to?(:sign_out_via) && Devise.sign_out_via) || [:get, :post]

      get   :new,               path: mapping.path_names[:sign_in],   as: :new
      match :destroy,           path: mapping.path_names[:sign_out],  as: :destroy,         via: sign_out_via

      get   :callback,          path: '/shibboleth/callback',         as: :callback
      get   :misconfiguration,  path: '/shibboleth/misconfiguration', as: :misconfiguration
      get   :unregistered,                                            as: :unregistered
    end
  end
end
