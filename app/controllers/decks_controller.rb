class DecksController < ApplicationController
  before_action :authenticate!, except: [:show, :index]

  def new
    @deck = Deck.new
    render :new
  end

  def create
    @deck = current_user.decks.new(title: params[:title])
    if @deck.save
      flash[:notice] = "Deck has been created."
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @deck = Deck.find(params[:id])
    render :show
  end

  def index
    @decks = User.find(params[:user_id]).decks
    render :index
  end

  def all_decks
    @decks = Deck.all
    render :index
  end
end
