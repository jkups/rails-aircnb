if Rails.env === 'production'
  Rails.application.config.session_store :cookie_store, key: '_air-cnb', domain: 'aircnb.herokuapp.com', same_site: :none, secure: :true
else
  Rails.application.config.session_store :cookie_store, key: '_air-cnb'
end
