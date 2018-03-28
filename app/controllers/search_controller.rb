class SearchController < ApplicationController

  def index
    @search_results = AltFuelByZip.new(params[:q])
  end

end
