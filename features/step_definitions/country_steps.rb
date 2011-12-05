Given /the following countries exist:/ do |countries|
  Country.destroy_all
  countries.hashes.each do |country_hash|
    visited = country_hash.delete('visited')
    country = Country.create!(country_hash)
    if visited == "true"
      @current_user.visited_countries << country
    end
  end
end

Then /^I should see the following table:$/ do |expected_table|
  document = Nokogiri::HTML(page.body)
  rows = document.css('section>table>tr').collect { |row| row.xpath('.//th|td').collect {|cell| cell.text } }

  expected_table.diff!(rows)
end
