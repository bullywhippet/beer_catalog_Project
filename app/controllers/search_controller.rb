class SearchController < ApplicationController
  def index
    @query = "%#{params[:q]}%"
    @found_beer = Beer.where('name LIKE ?', @query)
  end
end
