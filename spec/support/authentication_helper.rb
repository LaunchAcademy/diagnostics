module AuthenticationHelper
  def sign_in(user)
    mock_omni_auth_for(user)
    visit root_path
    click_on "Sign in"
  end

  def mock_omni_auth_for(user)
    mock_options = {
      provider: user.provider,
      uid: user.uid,
      info: {
        name: user.name,
        email: user.email,
        image: user.image
      }
    }
    OmniAuth.config.add_mock(user.provider.to_sym, mock_options)
  end
end
