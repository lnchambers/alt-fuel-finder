class SearchController < ApplicationController

  def index
    @search_results = StationsByZip.new(params[:q]).stations
  end

end
