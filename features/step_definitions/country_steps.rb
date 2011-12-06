Given /the following countries exist:/ do |countries|
  Country.destroy_all
  Country.create!(countries.hashes)
end

Given /^I visited some countries:$/ do |countries|
  @current_user.visited_country_ids = countries.hashes.map { |c| c['code'] }
end

Then /^I should see the following table:$/ do |expected_table|
  document = Nokogiri::HTML(page.body)
  rows = document.css('section table tr').collect { |row| row.xpath('.//th|td').collect {|cell| cell.text } }

  expected_table.diff!(rows)
end
