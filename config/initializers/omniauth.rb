Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'rTBi88Sv1Evk7TNnZLo1mA', 'JmB3xTd39Ol2nMNfCt8wDupo2NLpQxsAiNCQGtlPks'
  provider :facebook, '2218065242', '46a11fbdf053ee18c83d05edca71b57f'
end