Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'rTBi88Sv1Evk7TNnZLo1mA', 'JmB3xTd39Ol2nMNfCt8wDupo2NLpQxsAiNCQGtlPks'
  provider :facebook, '2360963080', 'dbe630145fcf49eda3f0fde151016424'
end