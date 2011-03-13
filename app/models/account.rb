class Account < ActiveRecord::Base
  has_many :users
  
  # Validations
  validates_presence_of :name
  validates_presence_of :slug
  
  validates_format_of :slug, :with => /^[A-Za-z0-9-]+$/, :message => 'The account subdomain can only contain alphanumeric characters and dashes.', :allow_blank => true
  validates_uniqueness_of :slug, :case_sensitive => false
  
  # Reserve several domains for system use
  validates_exclusion_of :slug, :in => %w( support blog www billing help api res asset assets storage ), :message => "The name <strong>{{value}}</strong> is reserved and unavailable."

  before_validation :downcase_slug
  
  def self.find_or_create_by_slug(slug)
    accnt = Account.find_by_slug(slug)
    if accnt.nil? then
      accnt = Account.create!({:name => slug, :slug => slug})
    end
    
    accnt
  end
  

  protected
    def downcase_slug
      self.slug.downcase! if attribute_present?("slug")
    end
end
