class CargosController < ApplicationController
  def new
    @cargo = Cargo.new
  end

  def create
    @cargo = Cargo.new(cargo_params)
    if @cargo.save
      redirect_to @cargo, notice: "Расчёт успешно выполнен!"
    else
      flash.now[:alert] = @cargo.errors.full_messages.first
      render :new
    end
  end

  def index
    @cargos = Cargo.order('created_at DESC')
  end

  def show
    @cargo = Cargo.find(params[:id])
    
    respond_to do |format|
      format.html
      format.json
    end
  end

  private

  def cargo_params
    params.require(:cargo).permit(:length, :width, :height, :total_volume, :total_weight, :departure_city_id, :delivery_city_id)
  end
end