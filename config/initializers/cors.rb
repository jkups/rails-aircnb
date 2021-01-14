Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    if Rails.env === 'production'
      origins 'staceyrea.github.io'
    else
      origins 'localhost:3001'
    end

     resource '*',
     :headers => :any,
     :methods => [:get, :post, :put, :patch, :delete, :options, :head],
     credentials: true
   end
end
