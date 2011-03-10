require "spec_helper"

describe UsersController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/users" }.should route_to(:controller => "users", :action => "index")
    end

    it "recognizes and generates #show" do
      { :get => "/users/1" }.should route_to(:controller => "users", :action => "show", :id => "1")
    end

  end
end
