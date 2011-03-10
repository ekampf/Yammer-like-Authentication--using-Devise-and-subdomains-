require "spec_helper"
require 'gapps_discovery'

describe GoogleAppsDiscovery do
  it "return True for Google Apps domains (ekampf.com)" do
    GoogleAppsDiscovery.is_google_apps?("ekampf.com").should == true
  end

  it "return True for Google Apps domains (fiddme.com)" do
    GoogleAppsDiscovery.is_google_apps?("fiddme.com").should == true
  end

  it "return False for non Google Apps domains (cnn.com)" do
    GoogleAppsDiscovery.is_google_apps?("cnn.com").should == false
  end

  it "return False for non Google Apps domains (pulseom.com)" do
    GoogleAppsDiscovery.is_google_apps?("pulseom.com").should == false
  end
end
