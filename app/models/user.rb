class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  
  has_and_belongs_to_many :visited_countries, :join_table => 'visits', :class_name => 'Country', :association_foreign_key => 'country_code'
  
  def visited?(country)
    visited_countries.include?(country)
  end
  
  def visited_countries_count
    visited_countries.count
  end
  
  def not_visited_countries_count
    Country.count - visited_countries_count
  end
  
  def collected_currencies_count
    Currency.where(:country_id => visited_country_ids).count
  end
  
  def not_collected_currencies_count
    Currency.count - collected_currencies_count
  end
end
