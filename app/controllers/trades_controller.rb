class TradesController < ApplicationController
  before_action :set_trade, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
   @trades = Trade.all.order("created_at DESC").paginate(:page => params[:page],:per_page => 10)
  end

  def show
  end

  def new
    @trade = current_user.trades.build
  end

  def edit
  end

  def create
    @trade = current_user.trades.build(trade_params)
    if @trade.save
      redirect_to @trade, notice: 'Trade was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @trade.update(trade_params)
      redirect_to @trade, notice: 'Trade was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @trade.destroy
    redirect_to trades_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trade
      @trade = Trade.find(params[:id])
    end

    def correct_user
      @trade = current_user.trades.find_by(id: params[:id])
      redirect_to trades_path, notice: "Not authorized to edit this trade" if @trades
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trade_params
      params.require(:trade).permit(:description, :image, :email, :price, :location)
    end
end