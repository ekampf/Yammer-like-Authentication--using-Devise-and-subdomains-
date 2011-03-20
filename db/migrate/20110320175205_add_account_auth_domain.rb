class AddAccountAuthDomain < ActiveRecord::Migration
  def self.up
    add_column :accounts, :auth_domain, :string
  end

  def self.down
    remove_column :accounts, :auth_domain, :string
  end
end
