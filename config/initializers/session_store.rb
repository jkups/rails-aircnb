if Rails.env === 'production'
  Rails.application.config.session_store :cookie_store, key: '_air-cnb', domain: 'air-bnb-replication.herokuapp.com'
else
  Rails.application.config.session_store :cookie_store, key: '_air-cnb'
end
