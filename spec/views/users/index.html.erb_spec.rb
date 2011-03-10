require 'spec_helper'

describe "users/index.html.erb" do
  before(:each) do
    assign(:users, [Factory(:user), Factory(:user), Factory(:user), Factory(:user)])
  end

  it "renders a list of users" do
    render
  end
end
