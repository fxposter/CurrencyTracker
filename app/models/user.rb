class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  
  has_many :visits
  has_many :visited_countries, :through => :visits, :source => :country
  
  def visited?(country)
    visit_into(country).present?
  end
  
  def visit_date(country)
     visit_into(country).try(:created_at).try(:to_date)
  end
  
  def visit_into(country)
    visits.detect { |v| v.country_code == country.id }
  end
  
  def collected?(currency)
    visited?(currency.country)
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
