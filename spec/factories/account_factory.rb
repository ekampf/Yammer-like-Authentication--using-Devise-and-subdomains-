Factory.define :account do |a|
  a.name { Factory.next(:company_name) }
  a.slug { Factory.next(:slugs) }
end

Factory.sequence :company_name do |n|
  "Test Co. #{n}"
end

Factory.sequence :slugs do |n|
  "test#{n}"
end