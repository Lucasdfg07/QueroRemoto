class HomesController < ApplicationController
  def index
  	if params[:query].present?
  		@jobs = CrawlerFather.new.call(params[:query])
  	end	
  end
end
