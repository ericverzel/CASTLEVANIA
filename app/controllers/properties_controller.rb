class PropertiesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @properties = Property.all
  end

  def show
    @property = Property.find(params[:id])
  end

  def new
    @property = Property.new
    authorize @property
  end

  def create
    @property = Property.new(property_params)
    @property.user_id = current_user
    authorize @property

    if @property.save
      redirect_to property_path(@property), notice: "Un Château à loué a été créé !"
    else
      render :new
    end
  end

  def edit
  end
  def update
  end
  def destroy
  end

  private

  def property_params
    params.require(:property).permit(:name, :location, :price)
  end
end
