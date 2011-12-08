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
  
  def to_s
    email
  end
end
