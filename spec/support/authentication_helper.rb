module AuthenticationHelper
  def sign_in(user)
    mock_omniauth_for(user)
    visit root_path
    click_on "Sign in"
  end

  def mock_omniauth_for(user)
    mock_options = {
      provider: user.provider,
      uid: user.uid,
      info: {
        first_name: user.first_name,
        last_name: user.last_name,
        email: user.email,
        image: user.image
      }
    }
    OmniAuth.config.add_mock(user.provider.to_sym, mock_options)
  end
end
