class PinsController < ApplicationController
  before_action :search_pin, only: [:show, :edit, :update, :destroy]

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

  private

  def search_pin
    @pin = Pin.find(params[:id])
  end

  def pin_params
    params.require(:pin).permit(:title, :description, :image)
  end
end
