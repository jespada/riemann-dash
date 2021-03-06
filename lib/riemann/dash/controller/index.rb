class Riemann::Dash::App
  get '/' do
    erb :index, :layout => false
  end

  get '/config', :provides => 'json' do
    content_type "application/json"
    Riemann::Dash::BrowserConfig.read config
  end

  post '/config' do
    # Read update
    request.body.rewind
    Riemann::Dash::BrowserConfig.update config, request.body.read

    # Return current config
    content_type "application/json"
    Riemann::Dash::BrowserConfig.read config
  end
end
