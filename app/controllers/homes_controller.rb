class HomesController < ApplicationController
	def index
		if params["/homes"].present?
			if params["/homes"][:query].blank?
				redirect_to root_path
			else
				@jobs = CrawlerFather.new.call(params["/homes"][:query])
			end
		end	
	end
end
