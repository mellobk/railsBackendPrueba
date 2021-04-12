
      # All asset requests should be to rails prefixed assets paths
      # serverd from the asset pipeline (e.g.: "/assets/*" by default)
  
        # Allow any request headers to be sent in the asset request
        # https://developer.mozilla.org/en-US/docs/Web/HTTP/Access_control_CORS#Access-Control-Allow-Headers

        # All asset fetches should be via GET
        # Support OPTIONS for pre-flight requests
        # https://developer.mozilla.org/en-US/docs/Web/HTTP/Access_control_CORS#Preflighted_requests

    Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '*'
    resource '*', headers: :any, methods: [:get, :post, :patch, :put]
  end
end