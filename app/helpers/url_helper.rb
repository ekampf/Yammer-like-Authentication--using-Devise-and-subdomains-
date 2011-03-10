module UrlHelper
  def with_account(account_subdomain)
    account_subdomain = (account_subdomain || "")
    account_subdomain += "." unless account_subdomain.empty?
    [account_subdomain, request.domain, request.port_string].join
  end

  def url_for(options = nil)
    if options.kind_of?(Hash) && options.has_key?(:account_subdomain)
      options[:host] = with_account(options.delete(:account_subdomain))
    end
    super
  end
  
  def set_mailer_url_options
    ActionMailer::Base.default_url_options[:host] = with_account(request.subdomains.first)
  end
end
