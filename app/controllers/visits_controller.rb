class VisitsController < ApplicationController
  def edit
  end

  def update
    if params[:visited] == "1"
      current_user.visited_countries << country
    else
      current_user.visited_countries.delete(country)
    end
    redirect_to country, :notice => 'Visit was successfully updated.'
  end
  
  private
    def country
      @country ||= Country.find(params[:country_id])
    end
    helper_method :country
end
