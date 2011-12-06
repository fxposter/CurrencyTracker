class VisitsController < ApplicationController
  def edit
  end

  def update
    if params[:visited] == "1"
      current_user.visited_countries << country unless current_user.visited_countries.include?(country)
    else
      current_user.visited_countries.delete(country)
    end
    redirect_to country, :notice => 'Visit was successfully updated.'
  end
  
  def bulk_update
    countries = Country.find(params[:country_ids])
    current_user.visited_countries += countries
    if request.xhr?
      head :ok
    else
      redirect_to :back
    end
  end
  
  private
    def country
      @country ||= Country.find(params[:country_id])
    end
    helper_method :country
end
