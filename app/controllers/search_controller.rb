class SearchController < ApplicationController
	def card_search
    # Card.where(name: params[:name]) ## SELECT FROM * WHERE name = "whatever";
    # Card.where("name ILIKE ?", "whatever") ## SELECT FROM * WHERE name "%whatever%";
    @cards = Card.where("name ILIKE ?", "%#{params[:name]}%")
		render :card_search
	end
end
