# if ENV["BT_ENVIRONMENT"].nil?
#   require 'logger'
#   logger.info "The Braintree environment variable is not set. Payment processing unavailable."
#   return
# end

Braintree::Configuration.environment = ENV["BT_ENVIRONMENT"].to_sym unless ENV['BT_ENVIRONMENT'].nil?
Braintree::Configuration.merchant_id = ENV["BT_MERCHANT_ID"]
Braintree::Configuration.public_key = ENV["BT_PUBLIC_KEY"]
Braintree::Configuration.private_key = ENV["BT_PRIVATE_KEY"]