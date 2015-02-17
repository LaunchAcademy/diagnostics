launch_pass_sites = {
  test: 'http://localhost:3001/',
  development: 'http://localhost:3001/',
  staging: 'https://launch-pass-staging.herokuapp.com',
  production: 'https://launchpass.launchacademy.com'
}

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :launch_pass, ENV['LAUNCH_PASS_KEY'], ENV['LAUNCH_PASS_SECRET'],
    client_options: {
      site: launch_pass_sites[Rails.env.to_sym]
    }
end
