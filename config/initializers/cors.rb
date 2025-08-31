Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'ugandawildlifeadventures.com', 'localhost:4140', '192.168.1.4:3000'

    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head],
      credentials: true
  end
end
