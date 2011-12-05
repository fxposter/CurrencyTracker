class Currency < ActiveRecord::Base
  set_primary_key :code
  attr_accessible :name, :code, :country_id

  validates_presence_of :name
  validates_presence_of :code
  validates_uniqueness_of :code, :allow_blank => true

  belongs_to :country

  def self.collected
    joins(:country).where(:countries => { :visited => true })
  end

  def self.not_collected
    joins('LEFT JOIN "countries" ON "countries"."code" = "currencies"."country_id"').where('"countries"."code" IS NULL OR "countries"."visited" = \'f\'')
  end

  def collected?
    country.nil? ? false : country.visited?
  end
end