require 'test_helper'

class CountryTest < ActiveSupport::TestCase
  test_validates_presence_of :name, :code
  
  test "should not create duplicate country" do
    country = countries(:one)
    new_country = nil
    assert_no_difference('Country.count') do
      new_country = Country.create(country.attributes)
    end

    assert !new_country.errors[:code].empty?
  end  

end