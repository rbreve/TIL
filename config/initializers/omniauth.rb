Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'rTBi88Sv1Evk7TNnZLo1mA', 'JmB3xTd39Ol2nMNfCt8wDupo2NLpQxsAiNCQGtlPks'
  provider :facebook, '2360963080', '600bb31520797c52e097f6345dd97c33'
end