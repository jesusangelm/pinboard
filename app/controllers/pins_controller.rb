class PinsController < ApplicationController
  before_action :search_pin, only: [:show, :edit, :update, :destroy, :upvote]
  before_action:authenticate_user!, except: [:index, :show]

  def index
    @pins = Pin.all.order("created_at DESC")
  end

  def new
    @pin = current_user.pins.build
  end

  def show
  end

  def edit
    
  end

  def create
    @pin = current_user.pins.build(pin_params)

    if @pin.save
      redirect_to @pin, notice: "Pin creado."
    else
      render "new"
    end
  end

  def update
    if @pin.update(pin_params)
      redirect_to @pin, notice: "Pin actualizado"
    else
      redirect_to "edit"
    end
  end

  def destroy
    @pin.destroy
    redirect_to root_path
  end

  def upvote
    @pin.upvote_by current_user
    redirect_to :back
  end

  private

  def search_pin
    @pin = Pin.find(params[:id])
  end

  def pin_params
    params.require(:pin).permit(:title, :description, :image)
  end
end
