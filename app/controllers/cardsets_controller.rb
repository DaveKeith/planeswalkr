class CardsetsController < ApplicationController
  before_action :administrate!, except: [:show]

  def new
    render :new
  end

  def create
    file = params[:cardset]
    begin
      data = JSON.parse(file.read)
    rescue JSON::ParserError => e
      flash[:notice] = "That JSON file is all fucked up."
      redirect_to root_path
    end
    ActiveRecord::Base.transaction do
      @set = CardSet.new(name: data["name"],
                         set_type: data["type"],
                         code: data["code"],
                         release_date: DateTime.parse(data["releaseDate"]),
                         block: data["block"],
                         image_dir: params[:image_dir])
      @cards = data["cards"].map do |card|
        Card.import_from_json(card)
      end
      @set.cards = @cards
      @set.save
    end
    if @set.persisted?
      flash[:notice] = "New Set Import #{@set.name} was successful."
    else
      set_errors = @set.errors.full_messages.uniq.join(", ")
      card_errors = @set.cards.flat_map { |x| x.errors.full_messages }.uniq
      flash[:notice] = "Failed to import. Set errors include '#{set_errors}' and card errors included '#{card_errors}'."
    end
    redirect_to root_path
  end

  def index
    @cardsets = CardSet.all
    render :index
  end

  def show
    @cardset = CardSet.find_by!(code: params[:id])
    @cards = @cardset.cards.page(params[:page]).per(15)
    render :show
  end
end
