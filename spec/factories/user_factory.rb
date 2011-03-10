Factory.define :user do |u|
  u.name { Factory.next(:name) }
  u.email { Factory.next(:email) }
  u.password "123123"
  
  u.association :account, :factory => :account
end

Factory.sequence :name do |n|
  Faker::Name.name
end

Factory.sequence :email do |n|
  Faker::Internet.email
end