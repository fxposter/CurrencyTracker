module ApplicationHelper
  
  def check_all_tag
    check_box_tag '', '1', false, :class => 'check_all', :id => ''
  end
  
  def check_tag(country_id, value)
    check_box_tag 'country_ids[]', country_id, value, :class => 'check', :id => "country_#{country_id}"
  end
  
  def formatted_date(date)  
    date.to_formatted_s(:rfc822) if date
  end
end
