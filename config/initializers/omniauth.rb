Rails.application.config.middleware.use OmniAuth::Builder do
  provider :linkedin, "0g6bdi39wkev", "4PTap4tYgiYcv5Y6", :scope => 'r_network'
end