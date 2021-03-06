class Country < ActiveRecord::Base
  set_primary_key :code
  attr_accessible :name, :code

  validates_presence_of :name
  validates_presence_of :code
  validates_uniqueness_of :code, :allow_blank => true

  has_many :currencies

  accepts_nested_attributes_for :currencies, :allow_destroy => true
  
  def to_s
    name
  end
end