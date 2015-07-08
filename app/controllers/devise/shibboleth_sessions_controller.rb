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
    # Can't fully log out from Shibboleth until the browser is closed.
    super
  end

  def misconfiguration
    # Handles issues with misconfiguration (such as environment variables missing)
  end

end
