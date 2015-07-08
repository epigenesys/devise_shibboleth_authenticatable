class Devise::ShibbolethSessionsController < Devise::SessionsController
  unless Rails.version =~/^4/
    unloadable
  end

  def new
    # Redirect to the callback handler (which should be protected by Shibboleth via Apache/IIS/etc.)
    return redirect_to action: 'callback'
  end

  def callback
    return redirect_to action: 'misconfiguration', message: :session_missing if !request.env['Shib-Session-ID']

    redirect_to after_sign_in_path_for(warden.authenticate!(scope: resource_name))
  end

  def destroy
    if signed_in?(resource_name)
      sign_out(resource_name)
    else
      reset_session
    end

    redirect_to(::Devise.shib_logout_url(request.url))
  end

  def misconfiguration
    # Handles issues with misconfiguration (such as environment variables missing)
  end

  def unregistered
    # Handles the case where a user isn't registered (and shibboleth_create_user is set to false)
  end

end
