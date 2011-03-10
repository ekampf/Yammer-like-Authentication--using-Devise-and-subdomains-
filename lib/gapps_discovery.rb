require 'open-uri'

class GoogleAppsDiscovery
  def self.is_google_apps?(domain)
    begin
      data = open("https://www.google.com/accounts/o8/.well-known/host-meta?hd=#{domain}").read
      return true
    rescue Exception => e
      return false
    end
  end
end