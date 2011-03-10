Rails.application.config.middleware.use OmniAuth::Builder do
end

#require 'openid/store/filesystem'
#Rails.application.config.middleware.use OmniAuth::Strategies::GoogleApps, OpenID::Store::Filesystem.new('/tmp'), :name => 'gapps', :domain => 'pulse.com'